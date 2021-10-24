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
;Sleep, 500
}
