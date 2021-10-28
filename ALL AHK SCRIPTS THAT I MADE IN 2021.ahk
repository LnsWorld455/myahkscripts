#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#ifwinactive ahk_exe Adobe Premiere Pro 2018.exe
;;DELETE SINGLE CLIP AT CURSOR
^numpad7::
prFocus("timeline") ;This will bring focus to the timeline. ; you can't just send ^+!3 because it'll change the sequence if you alkready have the timeline in focus. You have to go to the effect controls first. That is what this function does.
send, ^!d ;ctrl alt d is my Premiere shortcut for DESELECT. This shortcut only works if the timeline is in focus, which is why we did that on the previous line!! And you need to deselect all the timeline clips becuase otherwise, those clips will also get deleted later. I think.
send, v ;This is my Premiere shortcut for the SELECTION tool.
send, {alt down}
send, {lbutton}
send, {alt up}
send, c ;I have C assigned to "CLEAR" in Premiere's shortcuts panel.
return

prFocus(LNS)
{

}



#ifwinactive ahk_exe Adobe Premiere Pro 2018.exe
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


#ifwinactive ahk_exe Adobe Premiere Pro 2018.exe
^numpad8::
#ifwinactive DroverLord - Window Class55
Send ^!+1uu^!+o
tooltip, Set To Frame Size
sleep 500
tooltip,
return
#IfWinNotActive DroverLord - Window Class55
Send ^!+1u
Send u^!+o
tooltip, Set To Frame Size
sleep 500
tooltip,
; return

#ifwinactive ahk_exe Adobe Premiere Pro 2018.exe
F6::
Send ^!+1
return


#ifwinactive ahk_exe Adobe Premiere Pro 2018.exe
F5::
Send ll
return

