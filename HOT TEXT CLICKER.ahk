#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Hot text Clicker
#ifwinactive ahk_exe Adobe Premiere Pro 2018.exe
^v::
Mouseclick, left, 274, 182
return		
    
^n::
mouseclick, left, 273, 246
return	

^c::
Mouseclick, left, 262, 270
return

^q::
Mouseclick, left, 326, 270
return

^w::
Mouseclick, left, 247, 352
return

