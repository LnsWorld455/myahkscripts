#IfWinActive ahk_class CabinetWClass

^numpad9::
CreateFolder("ALL FOOTAGE")
CreateFolder("Delivery")
CreateFolder("Extra videos")
CreateFolder("Graphics")
CreateFolder("L-Roll")
CreateFolder("Project")

CreateFolder(FolderName) {
Send, ^+n
Send, %FolderName%
Send, {enter}
Sleep, 500 ;delete the first comment sign this (;)if you are using a hard drive on sleep 500
}