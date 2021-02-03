; B"H

; #NoTrayIcon
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; StoredFocus := WinExist("winTerminal")
; TODO figure out how to change A to somthing like terminal or so.
StoredFocus := WinExist("A")

^`:: ; ctrl + `
DetectHiddenWindows, on
if WinExist("ahk_class CASCADIA_HOSTING_WINDOW_CLASS") 
{
	if WinActive("ahk_class CASCADIA_HOSTING_WINDOW_CLASS")
	{
			WinHide ahk_class CASCADIA_HOSTING_WINDOW_CLASS
			; restore previously focused
			WinActivate ahk_id %StoredFocus%
	}
	else
	{
		; StoredFocus := WinExist("winTerminal")
		StoredFocus := WinExist("A")
		; StoredControlFocus := 
	    WinShow ahk_class CASCADIA_HOSTING_WINDOW_CLASS
	    WinActivate ahk_class CASCADIA_HOSTING_WINDOW_CLASS
	}
}
else 
{
    Run, wt.exe
}


DetectHiddenWindows, off
return