#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#ifwinactive  ahk_exe Adobe Premiere Pro 2018.exe
if (color = timeline1)||(color = timeline2)
Rbutton::
Send \
tooltip, You just right click %timeline3%
sleep 500
tooltip, 
return
if (color = effects)
tooltip,%color% Not Expected
return
timeline1 = 202020
timeline2 = 232323
timeline3 = C5C5C5
effects = 1D1D1D