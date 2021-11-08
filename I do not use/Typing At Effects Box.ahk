Menu, Tray, Icon, C:\Windows\system32\shell32.dll,134 ;Set custom Script icon
global Count := 329, Shell := 4, Image := 0, File := "shell32.dll", Height := A_ScreenHeight - 170 ;Define constants



#singleinstance, force
#ifwinactive ahk_exe Adobe Premiere Pro 2018.exe
;you have to paste this i have some premade ones that i used at the very bottom just change the text ultra key or anything
effectsPanelType(item := "lol")
{
;THIS IS A VERY SIMPLE FUNCTION FOR JUST TYPING STUFF INTO THE SEARCH BAR
;but it doesn't apply them to the clips, unlike preset()

;MODSL() ;this is probably no longer needed, but IDK for sure.

;prFocus("effects") ;reliably brings focus to the effects panel. This is an alternative to the next line.
Sendinput, ^+!7 ;CTRL SHIFT ALT 7 -- set in premiere to "effects" panel
sleep 20
Sendinput, ^b ;CTRL B --set in premiere to "select find box." Makes a windows noise if you do it again.
;sleep 20
Sendinput, +{backspace} ;shift backspace deletes any text that may be present. It is much less dangerous than sending "delete" or "backspace" alone.
Sleep, 10
Sendinput, %item%
;now this next part re-selects the field in case you want to type anything different
;sleep 10
Sendinput, ^!b ;ctrl alt B is ALSO select find box, but doesn't have the annoying windows sound. I may wish to change this to something else, as ALT is inherently dangerous if it becomes stuck.
}

F2::
effectsPanelType(item := "Dip To White")
return

F3::
effectsPanelType(item := "Ultra Key")
return