#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

~End::ExitApp
~Ins::Reload
~Home::Suspend

~$*LButton::
    while (GetKeyState("LButton", "p")) {
        checkThompson:
            If GetKeyState("LButton", "p") {
                send, {LButton Down}
                Sleep, 6
                mouseXY(-7,16)
                send, {LButton Up}
                sleep, 260
                goto checkThompson
            }
        }

        mouseXY(x,y)
        {
            DllCall("mouse_event",int,1,int,x,int,y,uint,0,uint,0)
        }