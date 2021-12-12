;source: https://www.autohotkey.com/boards/viewtopic.php?f=6&t=3966
#SingleInstance,Force
#MaxHotkeysPerInterval 200
global Edit1,settings:=[]


Subtitle_or_Tooltip := "Subtitle"

;update (20210827): added dimTrans & maxChar
set =
(
h=80
w=300
x=20
y=955
font=Verdana
fontColor=0xFFFFFF
background=0x000000
trans=120
dimTrans=90
maxChar=35
)


ToolTipFont("s12", "")

for a,b in StrSplit(set,"`n") {
	info:=StrSplit(b,"="),settings[info.1]:=info.2
}

keylist:=[]
for a,b in {Shift:"P",Alt:"P",Ctrl:"P",CapsLock:"T",LWin:"P",RWin:"P"}
	keylist[a]:=b
Gui()
startup()d
return

hotkey:
now:=A_TickCount
if (now-lasttime>400)
	line:="",lasttext:=""
WinSet, Transparent, % settings.trans, ahk_id %hwnd% ;update (20210827)
SetTimer, Dimmer, 1000 ;update (20210827): added dimmer
lasttime:=now,state:=[],text:=SubStr(A_ThisHotkey,3)
if A_ThisHotkey contains control,alt,shift,win
	return
for a,b in keylist
	state[a]:=GetKeyState(a,b)
for a,b in state{
	if (a="CapsLock")
		Continue
	Else if (InStr(a,"win")&&b )
		addtoline.="Win+"
	Else if (b&&(a!="shift"))
		addtoline.=a "+"
	Else if (a="shift"&&b&&(StrLen(text)>1||state.alt||state.Ctrl))
		addtoline.=a "+"
}
if (addtoline)
	text:=addtoline text,addtoline:=""
if (text="space"){
	line.=" "
	goto displaytext
}
if (text=lasttext&&StrLen(text)>1)
	count++
Else
	count:=1
if (count=2){
	line.="(" count ")"
}Else if(StrLen(text)=1){
	if ((state.CapsLock&&!state.Shift)||(!state.capslock&&state.shift))
		StringUpper,text,text
	line.=text
}Else if(StrLen(text)>1)
line.=" " text " "
if (count>2){
	line:=SubStr(line,1,InStr(line,"(",0,0,1)-1)
	line.="(" count ")"
}
displaytext:
lasttext:=text

If (StrLen(line) > settings.maxChar) ;update (20210827): set max char in display gui
    line := text

If (Subtitle_Or_Tooltip = "Subtitle") {
	ControlSetText,Edit1,%line%, ahk_id %hwnd%
	WinSet, AlwaysOntop, On, ahk_id %hwnd%
} else {
	tooltip % line
    Gui, Destroy
}
return
Gui(){
	global hwnd
	Gui,+hwndhwnd +AlwaysOnTop +Resize
	Gui,Margin,0,0
	Gui,Font, s22, % settings.font
	Gui,+hwndhwnd +AlwaysOnTop -Caption -Resize +ToolWindow +E0x20
	Gui,Add,Edit,w800 R4s +0x1 -0x200000 hwndHED -E0x200
	CtlColor_Edit(HED, settings.background, settings.fontColor)
	if (settings.x)
		for a,b in StrSplit("xywh")
			pos.=b settings[b] " "
	Gui,Show,%pos% NA,OSD
	WinSet, Transparent, % settings.trans, ahk_id %hwnd%
	OnExit,GuiEscape
}
convert_hotkey(key){
	StringUpper,key,key
	for a,b in [{Shift:"+"},{Ctrl:"^"},{Alt:"!"}]
		for c,d in b
			key:=RegExReplace(key,"\" d,c "+")
	return key	
}
startup(){
	startup:
	SetFormat,Integer,hex
	start:=0
	Loop,227
		if ((key:=GetKeyName("vk" start++))!="")
			Hotkey,~*%key%,Hotkey,On
	for a,b in StrSplit("Up,Down,Left,Right,End,Home,PgUp,PgDn,Insert,NumpadEnter,#,^,!,+",",")
		Hotkey,~*%b%,Hotkey,On
	SetFormat,Integer,dec
	for a,b in StrSplit("!@#$%^&*()_+:<>{}|?~" Chr(34))
		Hotkey,~+%b%,hotkey,On
	Hotkey,~*Delete,Hotkey,On
	return
}

exit(){
	GuiClose:
	GuiEscape:
	ExitApp
}
guisize(){
	GuiSize:
	settings.w:=A_GuiWidth,settings.h:=A_GuiHeight
	GuiControl,move,Edit1,w%A_GuiWidth% h%A_GuiHeight%
	return
}

;update (20210827): added dimmer
Dimmer:
WinSet, Transparent, % settings.dimTrans, ahk_id %hwnd%
SetTimer, Dimmer, Off
return

;source: https://www.autohotkey.com/boards/viewtopic.php?t=40218 ======================================================================================================================
; WM_CTLCOLOREDIT = 0x0133 <- msdn.microsoft.com/en-us/library/windows/desktop/bb761691(v=vs.85).aspx
; An edit control that is not read-only or disabled sends the WM_CTLCOLOREDIT message to its parent window
; when the control is about to be drawn.
; ======================================================================================================================
CtlColor_Edit(Param1, Param2 := "", Param3 := "") {
   Static Init := OnMessage(0x0133, "CtlColor_Edit")
   Static DCBrush := DllCall("Gdi32.dll\GetStockObject", "UInt", 18, "UPtr") ; DC_BRUSH = 18
   Static Controls := []
   ; If Param1 contains a valid window handle, the function has been called by the user ---------------------------------
   ; Param1 = HWND, Param2 = BackgroundColor, Param3 = TextColor
   If DllCall("IsWindow", "Ptr", Param1, "UInt") {
      Controls.Delete(Param1)
      If (Param2 <> "") {
         Controls[Param1, "BkColor"] := CtlColor_BGR(Param2)
         If (Param3 <> "")
            Controls[Param1, "TxColor"] := CtlColor_BGR(Param3)
      }
   }
   ; Function has been called as message handler -----------------------------------------------------------------------
   ; Param1 (wParam) = HDC, Param2 (lParam) = HWND
   Else If (((BC := Controls[Param2, "BkColor"]) . (TC := Controls[Param2, "TxColor"])) <> "") {
      If (TC <> "")
         DllCall("SetTextColor", "Ptr", Param1, "UInt", TC)
      DllCall("SetBkColor", "Ptr", Param1, "UInt", BC)
      DllCall("SetDCBrushColor", "Ptr", Param1, "UInt", BC)
      Return DCBrush
   }
}
; ======================================================================================================================
; Color values must be passed as BGR to GDI functions, this function does the conversion from RGB
; ======================================================================================================================
CtlColor_BGR(RGB) {
   Static HTML := {AQUA: 0xFFFF00, BLACK: 0x000000, BLUE: 0xFF0000, FUCHSIA: 0xFF00FF, GRAY: 0x808080, GREEN: 0x008000
                 , LIME: 0x00FF00, MAROON: 0x000080, NAVY: 0x800000, OLIVE: 0x008080, PURPLE: 0x800080, RED: 0x0000FF
                 , SILVER: 0xC0C0C0, TEAL: 0x808000, WHITE: 0xFFFFFF, YELLOW: 0x00FFFF}
   Return (HTML.HasKey(RGB) ? HTML[RGB] : ((RGB >> 16) & 0x0000FF) + (RGB & 0x00FF00) + ((RGB & 0x0000FF) << 16))
}


ToolTipFont(Options := "", Name := "", hwnd := "") {
    static hfont := 0
    if (hwnd = "")
        hfont := Options="Default" ? 0 : _TTG("Font", Options, Name), _TTHook()
    else
        DllCall("SendMessage", "ptr", hwnd, "uint", 0x30, "ptr", hfont, "ptr", 0)
}
 
ToolTipColor(Background := "", Text := "", hwnd := "") {
    static bc := "", tc := ""
    if (hwnd = "") {
        if (Background != "")
            bc := Background="Default" ? "" : _TTG("Color", Background)
        if (Text != "")
            tc := Text="Default" ? "" : _TTG("Color", Text)
        _TTHook()
    }
    else {
        VarSetCapacity(empty, 2, 0)
        DllCall("UxTheme.dll\SetWindowTheme", "ptr", hwnd, "ptr", 0
            , "ptr", (bc != "" && tc != "") ? &empty : 0)
        if (bc != "")
            DllCall("SendMessage", "ptr", hwnd, "uint", 1043, "ptr", bc, "ptr", 0)
        if (tc != "")
            DllCall("SendMessage", "ptr", hwnd, "uint", 1044, "ptr", tc, "ptr", 0)
    }
}
 
_TTHook() {
    static hook := 0
    if !hook
        hook := DllCall("SetWindowsHookExW", "int", 4
            , "ptr", RegisterCallback("_TTWndProc"), "ptr", 0
            , "uint", DllCall("GetCurrentThreadId"), "ptr")
}
 
_TTWndProc(nCode, _wp, _lp) {
    Critical 999
   ;lParam  := NumGet(_lp+0*A_PtrSize)
   ;wParam  := NumGet(_lp+1*A_PtrSize)
    uMsg    := NumGet(_lp+2*A_PtrSize, "uint")
    hwnd    := NumGet(_lp+3*A_PtrSize)
    if (nCode >= 0 && (uMsg = 1081 || uMsg = 1036)) {
        _hack_ = ahk_id %hwnd%
        WinGetClass wclass, %_hack_%
        if (wclass = "tooltips_class32") {
            ToolTipColor(,, hwnd)
            ToolTipFont(,, hwnd)
        }
    }
    return DllCall("CallNextHookEx", "ptr", 0, "int", nCode, "ptr", _wp, "ptr", _lp, "ptr")
}
 
_TTG(Cmd, Arg1, Arg2 := "") {
    static htext := 0, hgui := 0
    if !htext {
        Gui _TTG: Add, Text, +hwndhtext
        Gui _TTG: +hwndhgui +0x40000000
    }
    Gui _TTG: %Cmd%, %Arg1%, %Arg2%
    if (Cmd = "Font") {
        GuiControl _TTG: Font, %htext%
        SendMessage 0x31, 0, 0,, ahk_id %htext%
        return ErrorLevel
    }
    if (Cmd = "Color") {
        hdc := DllCall("GetDC", "ptr", htext, "ptr")
        SendMessage 0x138, hdc, htext,, ahk_id %hgui%
        clr := DllCall("GetBkColor", "ptr", hdc, "uint")
        DllCall("ReleaseDC", "ptr", htext, "ptr", hdc)
        return clr
    }
}


