#Ifwinactive ahk_exe Adobe Premiere Pro.exe
#Include C:\Users\LNS\Downloads\MY AHK SCRIPTS\key\hi.ahk
Menu, Tray, Icon, C:\Windows\system32\shell32.dll,273
PunchINOUT(Punchnumber)
{
if (Punchnumber = "125"){
	Setkeydelay, 0
	mousegetpos, xpos, ypos
	Mousegetpos, mousextimeline, mouseytimeline
	Send ^+a
	Sleep 5
	Send ^+a
	Send ^!+7
	Send ^!+1
	Mousemove, mousextimeline, mouseytimeline
	Send \
	mouseclick, left, mousextimeline, mouseytimeline
	Sleep 5
	Send ^!+f
	; Sleep 15
	Send ^!+3
	; Sleep 15
	Click()
	Mouseclick, left, 252, 164
	; Sleep 5
	Send 960
	; Sleep 15
	Mouseclick, left, 303, 163
	; Sleep 5
	Send 540
	; Sleep 15
	Mouseclick, left, 254, 186
	; Sleep 50
	Send 125
	Send {enter}
	Click()
	Mousemove, xpos, ypos
	return	
}
 
 
 if (Punchnumber = "200"){
	Setkeydelay, 0
	mousegetpos, xpos, ypos
	Mousegetpos, mousextimeline, mouseytimeline
	Send ^+a
	Sleep 5
	Send ^+a
	Send ^!+7
	Send ^!+1
	Mousemove, mousextimeline, mouseytimeline
	Send \
	mouseclick, left, mousextimeline, mouseytimeline
	Sleep 5
	Send ^!+r
	; Sleep 15
	Send ^!+3
	; Sleep 15
	Click()
	Mouseclick, left, 252, 164
	; Sleep 5
	Send 1532
	; Sleep 15
	Mouseclick, left, 303, 163
	; Sleep 5
	Send 217
	; Sleep 15
	Mouseclick, left, 254, 186
	; Sleep 50
	Send 200
	Send {enter}
	Click()
	Mousemove, xpos, ypos
	return	
}

if (Punchnumber = "300"){
	Setkeydelay, 0
	mousegetpos, xpos, ypos
	Mousegetpos, mousextimeline, mouseytimeline
	Send ^+a
	Sleep 5
	Send ^+a
	Send ^!+7
	Send ^!+1
	Mousemove, mousextimeline, mouseytimeline
	Send \
	mouseclick, left, mousextimeline, mouseytimeline
	Sleep 5
	Send ^!+r
	; Sleep 15
	Send ^!+3
	; Sleep 15
	Click()
	Mouseclick, left, 252, 164
	; Sleep 5
	Send 2304
	; Sleep 15
	Mouseclick, left, 303, 163
	; Sleep 5
	Send -207
	; Sleep 15
	Mouseclick, left, 254, 186
	; Sleep 50
	Send 300
	Send {enter}
	Click()
	Mousemove, xpos, ypos
	return	
}
}


^numpad7::
PunchINOUT("125")
return

^numpad8::
PunchINOUT("200")
return

^numpad9::
PunchINOUT("300")
return


; 254, 186 Scale
; 252, 164 Xpos
; 303, 163 Ypos