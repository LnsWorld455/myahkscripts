#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Size := 50, Color := "Red" ; settings

CoordMode, mouse, screen
Gui, -Caption +ToolWindow +AlwaysOnTop +LastFound
Gui, Color, %Color%
GuiHwnd := WinExist()
DetectHiddenWindows, On
WinSet, Transparent, 60, ahk_id %GuiHwnd%
WinSet, Region, % "0-0 W" Size " H" Size " E", ahk_id %GuiHwnd% ; An ellipse instead of a rectangle.
WinSet, ExStyle, +0x20, ahk_id %GuiHwnd% ; set click through style
Gui, Show, w%Size% h%Size% hide
Return

; ~LButton::
; MouseGetPos, MouseX, MouseY
; posX := Round(MouseX - Size/2), posY := Round(MouseY - Size/2)
; Gui, Show, x%posX% y%posY% NA
; Return


~*$LButton::
 {
   While Getkeystate("LButton","P")
    {
	  MouseGetPos, MouseX, MouseY
	  posX := Round(MouseX - Size/2), posY := Round(MouseY - Size/2)
	  Gui, Show, x%posX% y%posY% NA
      ; count++
      ; tooltip, %count%
      sleep, 25
    }
   count := 0
   tooltip
   Gui, Hide
 }
return


; still to do
; make right click, middle, and scroll work.
; want to use ( next to the cursor for left click
; ) for right click
;^ for scroll up
;v for scroll down