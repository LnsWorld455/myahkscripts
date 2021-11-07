#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;*******************************************************
; Want a clear path for learning AutoHotkey; Take a look at our AutoHotkey Udemy courses.  They're structured in a way to make learning AHK EASY
; Right now you can  get a coupon code here: https://the-Automator.com/Learn
;*******************************************************

#SingleInstance,Force   ;~ Adapted from Cerberus    https://www.autohotkey.com/boards/viewtopic.php?p=319004#p319698  
Menu, Tray, Icon, C:\Windows\system32\shell32.dll,236 ;Set custom Script icon
global Count := 329, Shell := 1, Image := 0, File := "shell32.dll", Height := A_ScreenHeight - 170 ;Define constants
CreateGui:
Gui, Destroy
Gui, -MinimizeBox -MaximizeBox
Gui, Add,Radio,vShell32  gRadioClick Checked%Shell% Check,shell32.dll
Gui, Add,Radio,vImageRes gRadioClick Checked%Image% ,imageres.dll
Gui, Add,ListView,h%Height% w180 gListClick,Icon &amp; Number
ImageListID := IL_Create(Count)
LV_SetImageList(ImageListID)
loop, % Count
  IL_Add(ImageListID,File,A_Index) 
loop, % Count
  LV_Add("Icon" A_Index,A_Index)
LV_ModifyCol("Hdr")  ; Auto-adjust the column widths.
Gui Show
return

RadioClick:
	Gui, Submit
	Count := (Shell32 ? 329 : 412)
	File := (Shell32 ? "shell32.dll" : "imageres.dll")
	Shell := Shell32 ? 1 : 0
	Image := Shell32 ? 0 : 1
	gosub, CreateGui
return

ListClick(){
  If (A_GuiEvent = "DoubleClick"){
    Clipboard := "Menu, Tray, Icon, " A_WinDir "\system32\" File "," A_EventInfo " `;Set custom Script icon`n"
    MsgBox,,Your Clipboard now has, % clipboard
}}

Escape::
GuiClose:
ExitApp




;Script For Just Add The Icon
;Menu, Tray, Icon, C:\Windows\system32\shell32.dll,209 ;Set custom Script icon


