; My Instant VFX Script!
;;;;******My Assignments;;;;******
; Numpad0:: Scale
; Numpad1:: Rotation
; Numpad2:: Anchor Point Horizontal
; Numpad3:: Anchor Point Vertical
; Numpad4:: Opacity


numpad0::
coordmode, pixel, Window
coordmode, mouse, Window
coordmode, Caret, Window
Mousegetpos, mousextimeline, mouseytimeline
Send ^!+7
Send ^!+1
Mousemove, mousextimeline, mouseytimeline
Send \
mouseclick, left, mousextimeline, mouseytimeline
Send ^!+3
While (GetKeyState("numpad0", "P")) {
        Mousemove, 247, 180
		Send {lbutton down}
		tooltip, Numpad 0 Was Pressed
		sleep 1000
		tooltip, 
    }
	

MouseGetPos, xpos, ypos
;304, 197
sleep 1000
Mousemove, xpos, ypos
Send ^p
return


numpad1::
coordmode, pixel, Window
coordmode, mouse, Window
coordmode, Caret, Window
Mousegetpos, mousextimeline, mouseytimeline
Send ^!+7
Send ^!+1
Mousemove, mousextimeline, mouseytimeline
Send \
mouseclick, left, mousextimeline, mouseytimeline
Send ^!+3
While (GetKeyState("numpad1", "P")) {
        Mousemove, 243, 243
		Send {lbutton down}
		tooltip, Numpad 1 Was Pressed
		sleep 1000
		tooltip, 
    }
	

MouseGetPos, xpos, ypos
;304, 197
sleep 1000
Mousemove, xpos, ypos
Send ^p
return


;247, 262
;295
;254, 347
numpad2::
coordmode, pixel, Window
coordmode, mouse, Window
coordmode, Caret, Window
Mousegetpos, mousextimeline, mouseytimeline
Send ^!+7
Send ^!+1
Mousemove, mousextimeline, mouseytimeline
Send \
mouseclick, left, mousextimeline, mouseytimeline
Send ^!+3
While (GetKeyState("numpad2", "P")) {
        Mousemove, 244, 264
		Send {lbutton down}
		tooltip, Numpad 2 Was Pressed
		sleep 1000
		tooltip, 
    }
	

MouseGetPos, xpos, ypos
;304, 197
sleep 1000
Mousemove, xpos, ypos
Send ^p
return



numpad3::
coordmode, pixel, Window
coordmode, mouse, Window
coordmode, Caret, Window
Mousegetpos, mousextimeline, mouseytimeline
Send ^!+7
Send ^!+1
Mousemove, mousextimeline, mouseytimeline
Send \
mouseclick, left, mousextimeline, mouseytimeline
Send ^!+3
While (GetKeyState("numpad3", "P")) {
        Mousemove, 295, 264
		Send {lbutton down}
		tooltip, Numpad 3 Was Pressed
		sleep 1000
		tooltip, 
    }
	

MouseGetPos, xpos, ypos
;304, 197
sleep 1000
Mousemove, xpos, ypos
Send ^p
return


numpad4::
coordmode, pixel, Window
coordmode, mouse, Window
coordmode, Caret, Window
Mousegetpos, mousextimeline, mouseytimeline
Send ^!+7
Send ^!+1
Mousemove, mousextimeline, mouseytimeline
Send \
mouseclick, left, mousextimeline, mouseytimeline
Send ^!+3
While (GetKeyState("numpad4", "P")) {
        Mousemove, 255, 350
		Send {lbutton down}
		tooltip, Numpad 4 Was Pressed
		sleep 1000
		tooltip, 
    }
	

MouseGetPos, xpos, ypos
;304, 197
sleep 1000
Mousemove, xpos, ypos
Send ^p
return


F6::
Reload
Soundbeep, 1000, 500
return

