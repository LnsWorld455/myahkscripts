#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


;BEGIN INSTANT APPLICATION SWITCHER SCRIPTS;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


#IfWinActive


windowSaver()
{
WinGet, lolexe, ProcessName, A
WinGetClass, lolclass, A ; "A" refers to the currently active window
global savedCLASS = "ahk_class "lolclass
global savedEXE = lolexe ;is this the way to do it? IDK.
;msgbox, %savedCLASS%
;msgbox, %savedEXE%
}

;SHIFT + macro key G14


global savedCLASS = "ahk_class Notepad++"
global savedEXE = "notepad++.exe"

switchToSavedApp(savedCLASS)
{
;msgbox,,, savedCLASS is %savedCLASS%,0.5
;msgbox,,, savedexe is %savedEXE%,0.5
if savedCLASS = ahk_class Notepad++
	{
	;msgbox,,, is notepad++,0.5
	if WinActive("ahk_class Notepad++")
		{
		sleep 5
		Send ^{tab}
		}
	}
;msgbox,,,got to here,0.5
windowSwitcher(savedCLASS, savedEXE)
}





back(){
;; if WinActive("ahk_class MozillaWindowClass")
;tooltip, baaaack
if WinActive("ahk_exe firefox.exe")
	Send ^+{tab}
if WinActive("ahk_class Chrome_WidgetWin_1")
	Send ^+{tab}
if WinActive("ahk_class Notepad++")
	Send ^+{tab}
if WinActive("ahk_exe Adobe Premiere Pro.exe")
	Send ^!+b ;ctrl alt shift B  is my shortcut in premiere for "go back"(in bins)(the project panel)
if WinActive("ahk_exe explorer.exe")
	Send !{left} ;alt left is the explorer shortcut to go "back" or "down" one folder level.
if WinActive("ahk_class OpusApp")
	sendinput, {F2} ;"go to previous comment" in Word.
}

;macro key 16 on my logitech G15 keyboard. It will activate firefox,, and if firefox is already activated, it will go to the next window in firefox.

switchToFirefox(){
sendinput, {SC0E8} ;scan code of an unassigned key. Do I NEED this?
IfWinNotExist, ahk_class MozillaWindowClass
	Run, firefox.exe
if WinActive("ahk_exe firefox.exe")
	{
	WinGetClass, class, A
	if (class = "Mozillawindowclass1")
		msgbox, this is a notification
	}
if WinActive("ahk_exe firefox.exe")
	Send ^{tab}
else
	{
	;WinRestore ahk_exe firefox.exe
	WinActivatebottom ahk_exe firefox.exe
	;sometimes winactivate is not enough. the window is brought to the foreground, but not put into FOCUS.
	;the below code should fix that.
	WinGet, hWnd, ID, ahk_class MozillaWindowClass
	DllCall("SetForegroundWindow", UInt, hWnd) 
	}
}


#IfWinActive
;Press SHIFT and macro key 16, and it'll switch between different WINDOWS of firefox.

switchToOtherFirefoxWindow(){
;sendinput, {SC0E8} ;scan code of an unassigned key
Process, Exist, firefox.exe
;msgbox errorLevel `n%errorLevel%
	If errorLevel = 0
		Run, firefox.exe
	else
	{
	GroupAdd, taranfirefoxes, ahk_class MozillaWindowClass
	if WinActive("ahk_class MozillaWindowClass")
		GroupActivate, taranfirefoxes, r
	else
		WinActivate ahk_class MozillaWindowClass
	}
}



; This is a script that will always go to The last explorer window you had open.
; If explorer is already active, it will go to the NEXT last Explorer window you had open.
; CTRL Numpad2 is pressed with a single button stoke from my logitech G15 keyboard -- Macro key 17. 

F10::
switchToExplorer(){
IfWinNotExist, ahk_class CabinetWClass
	Run, explorer.exe
GroupAdd, taranexplorers, ahk_class CabinetWClass
if WinActive("ahk_exe explorer.exe")
	GroupActivate, taranexplorers, r
else
	WinActivate ahk_class CabinetWClass ;you have to use WinActivatebottom if you didn't create a window group.
}

; ;trying to activate these windows in reverse order from the above. it does not work.
; ^+F2::
; IfWinNotExist, ahk_class CabinetWClass
	; Run, explorer.exe
; GroupAdd, taranexplorers, ahk_class CabinetWClass
; if WinActive("ahk_exe explorer.exe")
	; GroupActivate, taranexplorers ;but NOT most recent.
; else
	; WinActivatebottom ahk_class CabinetWClass ;you have to use WinActivatebottom if you didn't create a window group.
; Return

;closes all explorer windows :/
;^!F2 -- for searchability

closeAllExplorers()
{
WinClose,ahk_group taranexplorers
}


F2::
switchToPremiere()


switchToPremiere(){
IfWinNotExist, ahk_class Premiere Pro
	{
	;Run, Adobe Premiere Pro.exe
	;Adobe Premiere Pro CC 2015
	; Run, C:\Users\LNS\Desktop\Adobe Premiere Pro CC 2018\Adobe Premiere Pro 2018.exe ;if you have more than one version instlaled, you'll have to specify exactly which one you want to open.
	Run, Adobe Premiere Pro.exe
	}
if WinActive("ahk_class Premiere Pro")
	{
	IfWinNotExist, ahk_exe notepad++.exe
		{
		Run, notepad++.exe
		sleep 200
		}
	WinActivate ahk_exe notepad++.exe ;so I have this here as a workaround to a bug. Sometimes Premeire becomes unresponsive to keyboard input. (especially after timeline scrolling, especially with a playing video.) Switching to any other application and back will solve this problem. So I just hit the premiere button again, in those cases.g
	sleep 10
	WinActivate ahk_class Premiere Pro
	}
else
	WinActivate ahk_class Premiere Pro
}

F11::
switchToWord()
{
Process, Exist, WINWORD.EXE
;msgbox errorLevel `n%errorLevel%
	If errorLevel = 0
		Run, WINWORD.EXE
	else
	{
	IfWinExist, Microsoft Office Word, OK ;checks to see if the annoying "do you want to continue searching from the beginning of the document" dialouge box is present.
		sendinput, {escape}
	else if WinActive("ahk_class OpusApp")
		sendinput, {F3} ;set to "go to next comment" in Word.
	else
		WinActivate ahk_class OpusApp
	}
}
return

switchWordWindow()
{
; Process, Exist, WINWORD.EXE
; ;msgbox errorLevel `n%errorLevel%
	; If errorLevel = 0
		; Run, WINWORD.EXE
	; else
	; {
	GroupAdd, taranwords, ahk_class OpusApp
	if WinActive("ahk_class OpusApp")
		GroupActivate, taranwords, r
	else
		WinActivate ahk_class OpusApp
	; }
}


F12::
switchToChrome()
{
IfWinNotExist, ahk_exe chrome.exe
	Send #5
if WinActive("ahk_exe chrome.exe")
	Sendinput ^{tab}
else
	WinActivate ahk_exe chrome.exe
}



#IfWinActive
windowSwitcher(theClass, theEXE)
{
;msgbox,,, switching to `nsavedCLASS = %theClass% `nsavedEXE = %theEXE%, 0.5
IfWinNotExist, %theClass%
	Run, % theEXE
if not WinActive(theClass)
	WinActivate %theClass%
}


sortExplorerByName(){
IfWinActive, ahk_class CabinetWClass
	{
	;Send,{LCtrl down}{NumpadAdd}{LCtrl up} ;expand name field
	send {alt}vo{enter} ;sort by name
	;tippy2("sort Explorer by name")

	}

}

sortExplorerByDate(){
IfWinActive, ahk_class CabinetWClass
	{
	;Send,{LCtrl down}{NumpadAdd}{LCtrl up} ;expand name field
	send {alt}vo{down}{enter} ;sort by date modified, but it functions as a toggle...
	;tippy2("sort Explorer by date")

	}

}






;---------------------

ExplorerViewChange_Window(explorerHwnd)
{
;https://autohotkey.com/boards/viewtopic.php?t=28304
	if (!explorerHwnd)
		return
	;msgbox,,, % explorerHwnd, 0.5
	Windows := ComObjCreate("Shell.Application").Windows
	for window in Windows
		if (window.hWnd == explorerHwnd)
			sFolder := window.Document
			
	;sFolder.ShellView := 1
	sFolder.CurrentViewMode := 4 ; Details
	;tooltip % sFolder.CurrentViewMode
	;sFolder.SORTCOLUMNS := PKEY_ItemNameDisplay, SORT_DESCENDING, bsssssss
}

;;;must look through that thread to find the direct "sort by name, sort by date" thingies.

ExplorerViewChange_List(explorerHwnd)
{
	if (!explorerHwnd)
		return
	;msgbox,,, % explorerHwnd, 0.5
	Windows := ComObjCreate("Shell.Application").Windows
	for window in Windows
		if (window.hWnd == explorerHwnd)
			sFolder := window.Document
	if (sFolder.CurrentViewMode == 8)
		sFolder.CurrentViewMode := 6 ; Tiles
	else if (sFolder.CurrentViewMode == 6)
		sFolder.CurrentViewMode := 4 ; Details
	else if (sFolder.CurrentViewMode == 4)
		sFolder.CurrentViewMode := 3 ; List
	else if (sFolder.CurrentViewMode == 3) {
		sFolder.CurrentViewMode := 2 ; Small icons
		sFolder.IconSize := 16 ; Actually make the icons small...
	} else if (sFolder.CurrentViewMode == 2) {
		sFolder.CurrentViewMode := 1 ; Icons
		sFolder.IconSize := 48 ; Medium icon size
	} else if (sFolder.CurrentViewMode == 1) {
		if (sFolder.IconSize == 256)
			sFolder.CurrentViewMode := 8 ; Go back to content view
		else if (sFolder.IconSize == 48)
			sFolder.IconSize := 96 ; Large icons
		else
			sFolder.IconSize := 256 ; Extra large icons
	}
	ObjRelease(Windows)
	tooltip % sFolder.CurrentViewMode
}



ExplorerViewChange_ICONS(explorerHwnd)
{

	if (!explorerHwnd)
	{
		tooltip, exiting.
		sleep 100
		return
	}
	;msgbox,,, % explorerHwnd, 0.5
	Windows := ComObjCreate("Shell.Application").Windows
	for window in Windows
		if (window.hWnd == explorerHwnd)
			sFolder := window.Document
	if (sFolder.CurrentViewMode >= 2) {
		sFolder.CurrentViewMode := 1 ; icons
		sFolder.IconSize := 256 ; make the icons big...
		;tooltip, large 1
	} else if (sFolder.CurrentViewMode == 1) {
		if (sFolder.IconSize == 48){
			sFolder.IconSize := 256
			;tooltip, large
			}
		else if (sFolder.IconSize == 256){
			sFolder.IconSize := 96
			;tooltip, you are now at medium icons
			}
		else if (sFolder.IconSize == 96) {
			sFolder.IconSize := 48 ; smallish icons
			;tooltip, you are now at smallish icons
			}
		else {
			sFolder.CurrentViewMode := 1
			sFolder.IconSize := 256
			;tooltip, reset
		}
	}
	;tooltip % sFolder.IconSize
	;tooltip, %explorerHwnd%
	;sleep 100
	;tooltip, % sFolder.CurrentViewMode
}


; ExplorerViewChange_ICONS(explorerHwnd)
; {

	; if (!explorerHwnd)
	; {
		; tooltip, exiting.
		; sleep 100
		; return
	; }
	; ;msgbox,,, % explorerHwnd, 0.5
	; Windows := ComObjCreate("Shell.Application").Windows
	; for window in Windows
		; if (window.hWnd == explorerHwnd)
			; sFolder := window.Document
	; if (sFolder.CurrentViewMode >= 2) {
		; sFolder.CurrentViewMode := 1 ; Small icons
		; sFolder.IconSize := 48 ; Actually make the icons small...
	; } else if (sFolder.CurrentViewMode == 1) {
		; if (sFolder.IconSize == 256){
			; sFolder.CurrentViewMode := 2 ; Go back to small icons
			; sFolder.IconSize := 48
			; }
		; else if (sFolder.IconSize == 48)
			; sFolder.IconSize := 96 ; Large icons
		; else
			; sFolder.IconSize := 256 ; Extra large icons
	; }
	; ;tooltip % sFolder.IconSize
	; ;tooltip, %explorerHwnd%
	; ;sleep 100
	; ;tooltip, % sFolder.CurrentViewMode
; }



; ; ;testing the script here...
; ; #If (exphWnd := WinActive("ahk_class CabinetWClass"))
; ; ^+::
; ; ^=::
; ; tooltip, waaaaaaaaat
; ; ExplorerViewChange_Window(exphWnd)
; ; return
; ; #If









;;;;;;;scripts from this guy;;;;;;;;;;;;;;;;
;https://github.com/asvas/AsVas_AutoHotkey_Scripts/blob/master/ahk_Scripts.ahk
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;not CURRENTLY used anywhere...;;;;


; x::F_Switch("firefox.exe","ahk_class MozillaWindowClass","firefoxgroup","C:\Program Files (x86)\Mozilla Firefox\firefox.exe")
; +x::F_Run("firefox.exe","C:\Program Files (x86)\Mozilla Firefox\firefox.exe")
; c::F_Switch("chrome.exe","ahk_class Chrome_WidgetWin_1","chromegroup")
; +c::F_Run("chrome.exe")
;
; w::F_Switch("WINWORD.EXE","ahk_class OpusApp","wordgroup") ;,"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Word 2016.lnk")
; +w::F_Run("WINWORD.EXE") ;,"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Word 2016.lnk")


;Function for hiding/Showing the intercept.exe window
F9::
F_Intercept_visibility()
{
IfWinActive ahk_exe intercept.exe
	WinHide ahk_exe intercept.exe
else
	WinShow ahk_exe intercept.exe
return
}

;---------------------------------------------------------------------------------
;Function for running intercept.exe
F_Intercept_run()
{
Run, intercept.exe
Sleep 250
WinActivate ahk_exe intercept.exe
send y
WinHide ahk_exe intercept.exe
return
}

;---------------------------------------------------------------------------------
;Run Function - Running specific executable
F_Run(Target,TPath = 0)
{
if TPath = 0 
	Run, %Target%
else
	Run, %TPath% ;Command for running target if conditions are satisfied
}

;---------------------------------------------------------------------------------
;Switch Function - Switching between different instances of the same executable or running it if missing
F_Switch(Target,TClass,TGroup,TPath = 0)
{
IfWinExist, ahk_exe %Target% ;Checking state of existence
	{
	GroupAdd, %TGroup%, %TClass% ;Definition of the group (grouping all instance of this class) (Not the perfect spot as make fo unnecessary reapeats of the command with every cycle, however the only easy option to keep the group up to date with the introduction of new instances)
	ifWinActive %TClass% ;Status check for active window if belong to the same instance of the "Target"
		{
		GroupActivate, %TGroup%, r ;If the condition is met cycle between targets belonging to the group
		}
	else
		WinActivate %TClass% ;you have to use WinActivatebottom if you didn't create a window group.
	}
else
	{
	if TPath = 0 
		Run, %Target%
	else
		Run, %TPath% ;Command for running target if conditions are satisfied
	}
Return
}
;;;;;;scripts from another guy END;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;END OF FUNCTIONS;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; insert::

; return

;;; https://autohotkey.com/board/topic/34696-explorer-post-message-sort-by-modified-size-name-etc/
; pgup::
; tooltip, sort by name?
; PostMessage, 0x111, 30210,,, ahk_class CabinetWClass ; Name
; return

; pgdn::
; PostMessage, 0x111, 28715,,, ahk_class CabinetWClass ; List
; ;PostMessage, 0x111, 30213,,, ahk_class CabinetWClass ; Date modified
; return
