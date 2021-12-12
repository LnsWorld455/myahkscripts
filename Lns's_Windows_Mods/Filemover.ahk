;My Filemover.ahk Script
#singleinstance, force
filemover(where)
{
InputBox, Filename, Enter File Directory, Enter File Directory,
; msgbox, %Filename% is where to move TEST!
; tooltip, %Filename% is where to move TEST!
Sleep 15
Msgbox, 4, Filemover, Are You Sure You Want To Move %Filename% To %where%
IfNotExist, %Filename%
{
Msgbox, File Does Not Exist
return
}

IfExist, %Filename%
{
Ifmsgbox, Yes
{
Filemove, %Filename%, %where%
}
}
Sleep 500
Msgbox, 4, Filemover, Do You Want To Show %where%
IfNotExist, %where%
{
Msgbox, This Folder Does Not Exist
return
}

IfExist, %where%
{
Ifmsgbox, Yes
{
Run, %where%
return
}
}
}




F4::
filemover("C:\Users\LNS\Downloads\Template Folder\The Christmas party but actualy it's a pranks")
