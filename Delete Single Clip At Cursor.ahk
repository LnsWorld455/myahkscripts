Menu, Tray, Icon, C:\Windows\system32\imageres.dll,219 ;Set custom Script icon
global Count := 329, Shell := 4, Image := 0, File := "shell32.dll", Height := A_ScreenHeight - 170 ;Define constants



#IfWinActive ahk_exe Adobe Premiere Pro 2018.exe
;;DELETE SINGLE CLIP AT CURSOR
^numpad7::
prFocus("timeline") ;This will bring focus to the timeline. ; you can't just send ^+!3 because it'll change the sequence if you alkready have the timeline in focus. You have to go to the effect controls first. That is what this function does.
send, ^!d ;ctrl alt d is my Premiere shortcut for DESELECT. This shortcut only works if the timeline is in focus, which is why we did that on the previous line!! And you need to deselect all the timeline clips becuase otherwise, those clips will also get deleted later. I think.
send, v ;This is my Premiere shortcut for the SELECTION tool.
send, {alt down}
send, {lbutton}
send, {alt up}
send, c ;I have C assigned to "CLEAR" in Premiere's shortcuts panel.
;tooltip, It already deleted the clip
;sleep 500
;tooltip, 
return

prFocus(LNS)
{

}