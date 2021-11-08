;*******************************************************
; Want a clear path for learning AutoHotkey; Take a look at our AutoHotkey Udemy courses.  They're structured in a way to make learning AHK EASY
; Right now you can  get a coupon code here: https://the-Automator.com/Learn
;*******************************************************

#SingleInstance,Force   ;~ Adapted from Cerberus    https://www.autohotkey.com/boards/viewtopic.php?p=319004#p319698  
Menu, Tray, Icon, C:\Windows\system32\shell32.dll,209 ;Set custom Script icon
global Count := 329, Shell := 4, Image := 0, File := "shell32.dll", Height := A_ScreenHeight - 170 ;Define constants


#ifwinactive ahk_exe Adobe Premiere Pro 2018.exe
#t::
Send ^p
mousegetpos, xpos, ypos
While (GetKeyState("t", "P")) {
        Mousemove, 274, 182
		Send {lbutton down}
		Send {^ down}
		Send {+ up}
		tooltip, #t Was Pressed
		sleep 1000
		tooltip, 
    }
	

MouseGetPos, xpos, ypos
;304, 197
sleep 1000
Mousemove, xpos, ypos
Send ^p
return

#ifwinactive ahk_exe Adobe Premiere Pro 2018.exe
#b::
Send ^p
While (GetKeyState("b", "P")) {
        Mousemove, 273, 246
		Send {lbutton down}
		Send {^ down}
		Send {+ up}
		tooltip, #b Was Pressed
		sleep 1000
		tooltip, 
	}
	
MouseGetPos, xpos, ypos
sleep 1000
MouseMove, xpos, ypos
Send ^p
return

#ifwinactive ahk_exe Adobe Premiere Pro 2018.exe
#w::
Send ^p
While (GetKeyState("w", "P")) {
        Mousemove, 262, 270
		Send {lbutton down}
		Send {^ down}
		Send {+ up}
		tooltip, #w Was Pressed
		sleep 1000
		tooltip, 
	}
	
MouseGetPos, xpos, ypos
sleep 1000
MouseMove, xpos, ypos
Send ^p
return

#ifwinactive ahk_exe Adobe Premiere Pro 2018.exe
#d::
Send ^p
While (GetKeyState("d", "P")) {
        Mousemove, 326, 270
		Send {lbutton down}
		Send {^ down}
		Send {+ up}
		tooltip, #d Was Pressed
		sleep 1000
		tooltip, 
	}
	
MouseGetPos, xpos, ypos
sleep 1000
MouseMove, xpos, ypos
Send ^p
return

#ifwinactive ahk_exe Adobe Premiere Pro 2018.exe
#m::
Send ^p
While (GetKeyState("m", "P")) {
        Mousemove, 247, 352
		Send {lbutton down}
		Send {^ down}
		Send {+ up}
		tooltip, #m Was Pressed
		sleep 1000
		tooltip, 		
	}
	
MouseGetPos, xpos, ypos
sleep 1000
MouseMove, xpos, ypos
Send ^p
return
