#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#ifwinactive ahk_exe Adobe Premiere Pro 2018.exe
^numpad8::
#ifwinactive DroverLord - Window Class55
Send ^!+1uu^!+o
;tooltip, Set To Frame Size
;sleep 500
;tooltip,
return
#IfWinNotActive DroverLord - Window Class55
Send ^!+1u ;set ^!+1 set it to Timeline in premiere pro
Send u^!+o ;set ^!+o to Set to frame size in premiere pro
;tooltip, Set To Frame Size
;sleep 500
;tooltip,
return