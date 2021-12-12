#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;;;; SCRIPT TO ALWAYS OPEN THE MOST RECENTLY SAVED OR AUTOSAVED FILE OF A GIVEN FILETYPE, IN ANY GIVEN FOLDER (AND ALL SUBFOLDERS.);;;;
;;script partially obtained from https://autohotkey.com/board/topic/57475-open-most-recent-file-date-created-in-a-folder/
openlatestfile(directory, filetype)
{
if directory = 1
	{
	FileRead, SavedExplorerAddress, C:\AHK\2nd-keyboard\Taran's_Windows_Mods\SavedExplorerAddress.txt
	;msgbox, current directory is`n%directory%
	directory = %SavedExplorerAddress%
	;msgbox, new directory is`n%directory%
	}
;filetype := """" . filetype . """" ;this ADDS quotation marks around a string in case you need that.
StringReplace, directory,directory,", , All ;" ; this REMOVES the quotation marks around the a string if they are present.

;Keyshower(directory,"openlatestfile")
if IsFunc("Keyshower") {
	Func := Func("Keyshower")
	RetVal := Func.Call(directory,"openlatestfile") 
}

;I need some method of excluding ~$ files, since those clutter everything up (MS Word .docx ...)

;msgbox, directory is %directory%`n and filetype is %filetype%
Loop, Files,%directory%\*%filetype%, FR
{

If (A_LoopFileTimeModified>Rec)
  {
  IfNotInString, A_LoopFileFullPath, ~$
	FPath=%A_LoopFileFullPath%
  Rec=%A_LoopFileTimeModified%
  }
}
;try to get this to work with an ENTER press from thne stream deck...
MsgBox, 3,, Select YES to open the latest %filetype% at Fpath:`n`n%Fpath%
IfMsgBox, Yes
	{
	Run %Fpath%
	}

; ; USING THE SCRIPT
}
; end of openlatestfile()

; OpenLatest File Done!

!n::
examplePath = "H:\ALL Project LNS\Mario Kart Video 2020 or 2021\Project\2015"
openlatestfile(examplePath, ".prproj") ;<--- notice how i INCLUDE the period in the parameters. IDK if it might be better to add the period later.
return