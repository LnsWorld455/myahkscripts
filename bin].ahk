#singleinstance, force
Menu, Tray, Icon, C:\Windows\system32\shell32.dll,4 ;Set custom Script icon
global Count := 329, Shell := 4, Image := 0, File := "shell32.dll", Height := A_ScreenHeight - 170 ;Define constants


;This is For The Icon Of This Script
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Ignore This
;137, 465
;246, 363
;426, 221
;260, 233
;736, 128
;747, 245
;729ACC

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


#r::
MouseGetPos, xpos, ypos 
MouseClickDrag, left, 94, 301, xpos, ypos 
return


#j::
MouseGetPos, xpos, ypos 
MouseClickDrag, left, 246, 363, xpos, ypos 
return




#i::
MouseGetPos, xpos, ypos 
MouseClickDrag, left, 426, 221, xpos, ypos 
return


#k::
MouseGetPos, xpos, ypos 
MouseClickDrag, left, 260, 233, xpos, ypos 
return





#c::
MouseGetPos, xpos, ypos
;MsgBox, The cursor is at X%xpos% Y%ypos%.
MouseClickDrag, left, 426, 353, xpos, ypos 
return


^f4::
Send ^!+1^!+l
Send {enter}
return


;*****Audio Maker Script*****
#y::
mousegetpos, xpos, ypos
MouseClick, left, xpos, ypos
Send ^!+a
sleep 200
MouseClick, left, 137, 225
sleep 200
Mouseclick, left, 137, 250
sleep 150
Send {enter}
tooltip, Done
Sleep 500
tooltip, 
return


#n::
mousegetpos, xpos, ypos
MouseClick, left, xpos, ypos
Send ^!+a
sleep 200
MouseClick, left, 114, 225
sleep 200
Mouseclick, left, 113, 247
sleep 150
Send {enter}
tooltip, Done
Sleep 500
tooltip, 
return



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Ignore This
;578, 359
;82, 442
;258, 443
;257, 393
;436, 51
;583, 55

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
^1::
MouseGetPos, xpos, ypos 
MouseClickDrag, left, 578, 359, xpos, ypos 
return


^2::
MouseGetPos, xpos, ypos 
MouseClickDrag, left, 82, 442, xpos, ypos 
return


^3::
MouseGetPos, xpos, ypos 
MouseClickDrag, left, 258, 443, xpos, ypos 
return


^!+i::
MouseGetPos, xpos, ypos 
MouseClick, left, 436, 51
Mousemove, xpos, ypos
return


^!+q::
MouseGetPos, xpos, ypos 
MouseClick, left, 583, 55
Mousemove, xpos, ypos
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;*****Transform Icon Clicker MOD!*****
~^4::
Send ^p
mousemove, 1585, 263
MouseGetPos, xpos, ypos 
MouseClick, left, 57, 136
Mouseclick, left, xpos, ypos
tooltip, You Hit ^4 For Transform Icon Clicker MOD!!!.
Sleep 500
tooltip, 
Send ^p
Send {lbutton down}
		Send {^ down}
		Send {+ up}
return


;******Titler Closer Mod!******
#ifwinactive ahk_class DroverLord - Window Class
^5::
setmousedelay 0
Mousemove, 1911, 12
Mouseclick, left, 1911, 12
return
;1682, 59
;1771, 59 


;******Go Back Bins Mod!******
#ifwinactive ahk_exe Adobe Premiere Pro 2018.exe
^6::
mousegetpos, xpos, ypos
setmousedelay 0
Mousemove, 16, 84
Mouseclick, left, 16, 84
tooltip, ^6 Go Back Bins Mod!!!
Sleep 500
tooltip, 
Mousemove, xpos, ypos
return
;1682, 59
;1771, 59 

;16, 84


;******FUNCTION FOR DIRECTLY APPLYING A PRESET EFFECT TO A CLIP!******
; preset() is my most used, and most useful AHK scriptS for Premiere Pro!
preset(item)
{
BlockInput, SendAndMouse
BlockInput On
SetKeyDelay, 0
MouseGetPos, xpos, ypos
;msgbox, The cursor is at X%xpos% Y%ypos%.
;tooltip, The cursor is at X%xpos% Y%ypos%.
;sleep 500
;tooltip, 
Send ^!+7
Send ^b
Sendinput, %item%
sleep 5
MouseClickDrag, left, 736, 128, xpos, ypos 
Sleep 200
BlockInput Off
}




;;;;;;ALL OF MY ASIGNMENTS;;;;;;
#ifwinactive ahk_exe Adobe Premiere Pro 2018.exe

#x::
preset("BOWSER COOL")
return


#o::
preset("Crop Right")
return


^F7::
preset("Transform")
return


^/::
preset("SCREEN GAME COLOR 2")
return


#=::
preset("High Voice")
return


#f::
preset("Pop Effect")
return


^m::
preset("Horizontal Flip")
return


^u::
preset("Vertical Flip")
return


^F8::
preset("Directional Blur")
return


^F10::
preset("Crop Left")
return


^F11::
preset("Crop")
return


^F12::
preset("SAD")
return


^F3::
preset("Fill Frame")
return


;*****Binj Functions Done!*****;


#IfWinActive ahk_exe Adobe Premiere Pro 2018.exe
;note to self, move this to premiere_functions already
;this is NOT suposed to stop the video playing when you use it, but now it does for some reason....
F7::
keywait, F7
;tooltip, |
send, b ;This is my Premiere shortcut for the RAZOR tool. You can use another shortcut if you like, but you have to use that shortcut here.
send, {shift down} ;makes the blade tool affect all (unlocked) tracks
keywait, F7 ;waits for the key to go UP.
;tooltip, was released
send, {lbutton} ;makes a CUT
send, {shift up}
sleep 10
send, v ;This is my Premiere shortcut for the SELECTION tool. again, you can use whatever shortcut you like.
return



;******FUNCTION FOR DIRECTLY APPLYING A TRANSITION TO A CLIP!******
; transition()
transition(name)
{
BlockInput, Sendandmouse
blockinput on
SetKeyDelay, 0
MouseGetPos, xpos, ypos
;msgbox, The cursor is at X%xpos% Y%ypos%.
;tooltip, The cursor is at X%xpos% Y%ypos%.
;sleep 500
;tooltip, 
Send ^!+7
Send ^b
Sendinput, %name%
sleep 5
MouseClickDrag, left, 792, 249, xpos, ypos 
Sleep 200
blockinput off
return
}
;792, 249
;;;;;;ALL OF MY ASIGNMENTS;;;;;;

^7::
transition("Dip To Black")
return


^8::
transition("Dip To White")
return


^9::
transition("Cross Dissolve")
return


^0::
CoordMode Pixel  ; Interprets the coordinates below as relative to the screen rather than the active window.
ImageSearch, FoundX, FoundY, 35, 220, xpos, ypos, *C:\Users\LNS\Downloads\MY AHK SCRIPTS\f.png
if (ErrorLevel = 2)
    MsgBox Could not conduct the search.
else if (ErrorLevel = 1)
    MsgBox Icon could not be found on the screen.
else
    MsgBox The icon was found at %FoundX%x%FoundY%.
;C:\Users\LNS\Downloads\MY AHK SCRIPTS
mouseclick, left, xpos, ypos
return
