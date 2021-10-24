#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


numpad0::
run, C:\Users\LNS\Downloads\Template Folder\Template Folder\Graphics
return

numpad1::
run, C:\Users\LNS\Downloads\Template Folder
return

numpad2::
run, C:\Users\LNS\Downloads
return

numpad3::
run, C:\Users\LNS\Downloads\Screenshot
return

numpad4::
run, C:\Users\LNS\Downloads\All Projects LNS
return

numpad5::
run, C:\Users\LNS\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
return

numpad6::
Send #6
return

numpad7::
Send #3
sleep 200
Send y
sleep 1000
Send #3
return

numpad8::
Run, notepad++.exe
		sleep 200

		


numpad9::
IfWinNotExist, ahk_exe ShareX.exe
	Run, ShareX.exe
if WinActive("ahk_exe ShareX.exe")
	Sendinput ^{printscreen}
else
	WinActivate ahk_exe ShareX.exe


F1::
Send u^!+d
return

F6::
Send ^k
return

F5::
switchToAudacity()
{
; Audacity
; ahk_class wxWindowNR
; ahk_exe audacity.exe
; ahk_pid 80600
IfWinNotExist, ahk_exe audacity.exe
	{
	Run, C:\Program Files (x86)\Audacity\audacity.exe
	}
else
	{
	WinActivate ahk_exe audacity.exe
	}
}

F4::
Send ^o
return