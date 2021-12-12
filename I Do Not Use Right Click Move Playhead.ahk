; I Do Not Use This Anymore Use PREMIERE_MOD_Right_click_timeline_to_move_playhead.ahk
Menu, Tray, Icon, C:\Windows\system32\shell32.dll,101 ;Set custom Script icon
global Count := 329, Shell := 4, Image := 0, File := "shell32.dll", Height := A_ScreenHeight - 170 ;Define constants
;The Above It Jus For The Icon Of This Script!

#ifwinactive ahk_exe Adobe Premiere Pro 2018.exe
rbutton::
While (GetKeyState("rbutton", "P")) {
        mousegetpos, xpos, ypos
		Send \
	}
	return



^Rbutton::
Send \u
;tooltip, You just right click
;sleep 500
;tooltip, 
return
if (color = effects)
tooltip,%color% Not Expected
return
if (color = effects)
Send {alt}
timeline1 = 252525
timeline3 = C5C5C5
effects = 232323


^+Rbutton::
Send \uc
;tooltip, You just right click
;sleep 500
;tooltip, 
return
if (color = effects)
tooltip,%color% Not Expected
return
if (color = effects)
Send {alt}
timeline1 = 252525
timeline3 = C5C5C5
effects = 232323



+Rbutton::
Send \
Send b
send, {shift up} ;makes the blade tool affect all (unlocked) tracks
keywait, mbutton
send, {lbutton} ;makes a CUT
send, {shift up}
sleep 10
send, v 
return
return
if (color = effects)
Send {alt}
timeline1 = 252525
timeline3 = C5C5C5
effects = 232323






#ifwinactive  ahk_exe Adobe Premiere Pro 2018.exe
if (color = timeline1)||(color = timeline2)
mbutton::
Send b
send, {shift up} ;makes the blade tool affect all (unlocked) tracks
keywait, mbutton
send, {lbutton} ;makes a CUT
send, {shift up}
sleep 10
send, v 
return


^mbutton::
Send b
send, {shift down} ;makes the blade tool affect all (unlocked) tracks
keywait, mbutton
send, {lbutton} ;makes a CUT
send, {shift up}
sleep 10
send, v 
return
if (color = effects)
tooltip,%color% Not Expected
return


^+mbutton::
;;msgbox,,,you pressed F9,0.6
While GetKeyState("Numpadsub", "p")
{
SendInput, {WheelDown}
Sleep, 10 ; Add a delay if you want to increase the interval between keystokes.
}
return




#ifwinactive ahk_exe chrome.exe
mbutton::
Send {space}
return




#ifwinactive ahk_exe Zoom.exe
mbutton::
Send !a
return
^mbutton::
Send !v
return


;Color generator teller script
^F1::
MouseGetPos, xpos, ypos
PixelGetColor, color, %xpos%, %ypos%
MsgBox The color at the current cursor position is %color%.
return




Numpadsub::
While GetKeyState("Numpadsub", "p")
{
SendInput, {WheelDown}
Sleep, 10 ; Add a delay if you want to increase the interval between keystokes.
}
return

Numpadadd::
While GetKeyState("Numpadadd", "p")
{
SendInput, {WheelUp}
Sleep, 10 ; Add a delay if you want to increase the interval between keystokes.
}
return




