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
else if Fileexist(DirectoryName = " ") {
	MsgBox,, Hotkeys OFF, Entry field blank
	return
	}
else{
	MsgBox,, Hotkeys OFF, Unrecognized Or Entry field blank
	return
	}
	
;name all of your folder name on ^numpad1-6 if you have more or less than 6 just copy paste and add your folder name after %DirectoryName%/


^numpad1::
if FileExist(DirectoryName "/ALL FOOTAGE")
		run, %DirectoryName%/ALL FOOTAGE	
	
^numpad2:: 
if FileExist(DirectoryName "/Delivery")
		run, %DirectoryName%/Delivery
	
^numpad3:: 
if FileExist(DirectoryName "/Extra videos")
		run, %DirectoryName%/Extra videos
	
^numpad4:: 
if FileExist(DirectoryName "/Graphics")
		run, %DirectoryName%/Graphics
	
^numpad5:: 
if FileExist(DirectoryName "/L-Roll")
		run, %DirectoryName%/L-Roll
	
^numpad6:: 
if FileExist(DirectoryName "/Project")
		run, %DirectoryName%/Project