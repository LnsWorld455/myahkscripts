numpad0::
coordmode, pixel, Window
coordmode, mouse, Window
coordmode, Caret, Window
Mousegetpos, mousextimeline, mouseytimeline ;Get The Position Of The Mouse
Send ^+a ;Set CONTROL SHIFT A To Deselect All
Sleep 5 ;Sleep For 5 milliseconds Not 5 Seconds!
Send ^+a ;Set CONTROL SHIFT A To Deselect All
Send ^!+7 ;Set CONTROL ALT SHIFT 7 To Effects
Send ^!+1 ;Set CONTROL ALT SHIFT 1 To Timeline
Mousemove, mousextimeline, mouseytimeline ;Move The Mouse To The Mouse Position
Send \ ;Set \ To MOVE PLAYHEAD TO CURSOR
mouseclick, left, mousextimeline, mouseytimeline ;Left Click At Mouse Position
Send ^!+3 ;Set CONTROL ALT SHIFT 3 To Effect Controls
        Mousemove, 247, 180 ;You Need To Change The X And Y Cordinates Of The Text In The Effect Controls Panel Using Window Spy
		Send {lbutton down} ;Send Left Click Down
		tooltip, Numpad 0 Was Pressed ;A Tooltip
		Sleep 450 ;Sleep For 450 milliseconds Not 450 Seconds!
		tooltip,  ;A Tooltip
    return


numpad1::
coordmode, pixel, Window
coordmode, mouse, Window
coordmode, Caret, Window
Mousegetpos, mousextimeline, mouseytimeline ;Get The Position Of The Mouse
Send ^+a ;Set CONTROL SHIFT A To Deselect All
Sleep 5 ;Sleep For 5 milliseconds Not 5 Seconds!
Send ^+a ;Set CONTROL SHIFT A To Deselect All
Send ^!+7 ;Set CONTROL ALT SHIFT 7 To Effects
Send ^!+1 ;Set CONTROL ALT SHIFT 1 To Timeline
Mousemove, mousextimeline, mouseytimeline ;Move The Mouse To The Mouse Position
Send \ ;Set \ To MOVE PLAYHEAD TO CURSOR
mouseclick, left, mousextimeline, mouseytimeline ;Left Click At Mouse Position
Send ^!+3 ;Set CONTROL ALT SHIFT 3 To Effect Controls
        Mousemove, 243, 243 ;You Need To Change The X And Y Cordinates Of The Text In The Effect Controls Panel Using Window Spy
		Send {lbutton down} ;Send Left Click Down
		tooltip, Numpad 1 Was Pressed ;A Tooltip
		Sleep 450 ;Sleep For 450 milliseconds Not 450 Seconds!
		tooltip,  ;A Tooltip
    return


numpad2::
coordmode, pixel, Window
coordmode, mouse, Window
coordmode, Caret, Window
Mousegetpos, mousextimeline, mouseytimeline ;Get The Position Of The Mouse
Send ^+a ;Set CONTROL SHIFT A To Deselect All
Sleep 5 ;Sleep For 5 milliseconds Not 5 Seconds!
Send ^+a ;Set CONTROL SHIFT A To Deselect All
Send ^!+7 ;Set CONTROL ALT SHIFT 7 To Effects
Send ^!+1 ;Set CONTROL ALT SHIFT 1 To Timeline
Mousemove, mousextimeline, mouseytimeline ;Move The Mouse To The Mouse Position
Send \ ;Set \ To MOVE PLAYHEAD TO CURSOR
mouseclick, left, mousextimeline, mouseytimeline ;Left Click At Mouse Position
Send ^!+3 ;Set CONTROL ALT SHIFT 3 To Effect Controls
        Mousemove, 244, 264 ;You Need To Change The X And Y Cordinates Of The Text In The Effect Controls Panel Using Window Spy
		Send {lbutton down} ;Send Left Click Down
		tooltip, Numpad 2 Was Pressed ;A Tooltip
		Sleep 450 ;Sleep For 450 milliseconds Not 450 Seconds!
		tooltip,  ;A Tooltip
    return
	
	
numpad3::
coordmode, pixel, Window
coordmode, mouse, Window
coordmode, Caret, Window
Mousegetpos, mousextimeline, mouseytimeline ;Get The Position Of The Mouse
Send ^+a ;Set CONTROL SHIFT A To Deselect All
Sleep 5 ;Sleep For 5 milliseconds Not 5 Seconds!
Send ^+a ;Set CONTROL SHIFT A To Deselect All
Send ^!+7 ;Set CONTROL ALT SHIFT 7 To Effects
Send ^!+1 ;Set CONTROL ALT SHIFT 1 To Timeline
Mousemove, mousextimeline, mouseytimeline ;Move The Mouse To The Mouse Position
Send \ ;Set \ To MOVE PLAYHEAD TO CURSOR
mouseclick, left, mousextimeline, mouseytimeline ;Left Click At Mouse Position
Send ^!+3 ;Set CONTROL ALT SHIFT 3 To Effect Controls
        Mousemove, 295, 264 ;You Need To Change The X And Y Cordinates Of The Text In The Effect Controls Panel Using Window Spy
		Send {lbutton down} ;Send Left Click Down
		tooltip, Numpad 3 Was Pressed ;A Tooltip
		Sleep 450 ;Sleep For 450 milliseconds Not 450 Seconds!
		tooltip,  ;A Tooltip
    return
	
	
numpad4::
coordmode, pixel, Window
coordmode, mouse, Window
coordmode, Caret, Window
Mousegetpos, mousextimeline, mouseytimeline ;Get The Position Of The Mouse
Send ^+a ;Set CONTROL SHIFT A To Deselect All
Sleep 5 ;Sleep For 5 milliseconds Not 5 Seconds!
Send ^+a ;Set CONTROL SHIFT A To Deselect All
Send ^!+7 ;Set CONTROL ALT SHIFT 7 To Effects
Send ^!+1 ;Set CONTROL ALT SHIFT 1 To Timeline
Mousemove, mousextimeline, mouseytimeline ;Move The Mouse To The Mouse Position
Send \ ;Set \ To MOVE PLAYHEAD TO CURSOR
mouseclick, left, mousextimeline, mouseytimeline ;Left Click At Mouse Position
Send ^!+3 ;Set CONTROL ALT SHIFT 3 To Effect Controls
        Mousemove, 255, 350 ;You Need To Change The X And Y Cordinates Of The Text In The Effect Controls Panel Using Window Spy
		Send {lbutton down} ;Send Left Click Down
		tooltip, Numpad 4 Was Pressed ;A Tooltip
		Sleep 450 ;Sleep For 450 milliseconds Not 450 Seconds!
		tooltip,  ;A Tooltip
	return
	
; Ignore This
; 243, 243
; 244, 264
; 295, 264
; 255, 350


; Mouseclick, 247, 180
; Mouseclick, 243, 243
; Mouseclick, 244, 264
; Mouseclick, 295, 264
; Mouseclick, 255, 350