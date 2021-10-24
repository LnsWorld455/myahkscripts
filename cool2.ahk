Hotkey, ^numpad1, Off
Hotkey, ^numpad2, Off
Hotkey, ^numpad3, Off
Hotkey, ^numpad4, Off
Hotkey, ^numpad5, Off
Hotkey, ^numpad6, Off
return

^numpad0::
InputBox, DirectoryName, Set Active Project Folder, Enter active project folder:,, 300, 130,,,,, %DirectoryName%
if (ErrorLevel = 1) {
	return
	}
else if Fileexist(DirectoryName) {
	MsgBox,, Active Folder Set, Active Folder: %DirectoryName%, 2
	Hotkey, ^numpad1, On
	Hotkey, ^numpad2, On
	Hotkey, ^numpad3, On
	Hotkey, ^numpad4, On
	Hotkey, ^numpad5, On
	Hotkey, ^numpad6, On
	Sleep 2000
	Send, {enter}
	return
	}
else if Fileexist(DirectoryName = "") {
	MsgBox,, Hotkeys OFF, Entry field blank
	return
	}
else{
	MsgBox,, Hotkeys OFF, Unrecognized Or Entry field blank
	return
	}
	
	
^numpad1:: run, %DirectoryName%/ALL FOOTAGE
	
^numpad2:: run, %DirectoryName%/Delivery
	
^numpad3:: run, %DirectoryName%/Extra videos
	
^numpad4:: run, %DirectoryName%/Graphics
	
^numpad5:: run, %DirectoryName%/L-Roll
	
^numpad6:: run, %DirectoryName%/Project
	