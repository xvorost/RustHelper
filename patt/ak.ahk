#NoEnv
SendMode Input

~Home::Suspend
~End::ExitApp
~Ins::Reload

LCtrl & ~LButton::
    Loop 8

    If GetKeyState("LButton", "LCtrl") {
        Sleep, 6
        mouseXY(-2,3)
    }
    else
        break
    Loop 8
    If GetKeyState("LButton", "LCtrl") {
        Sleep, 6
        mouseXY(0.7,3)
    }
    else
        break
    Loop 8
    If GetKeyState("LButton", "LCtrl") {
        Sleep, 6
        mouseXY(-3,2)
    }
    else
        break
    Loop 8
    If GetKeyState("LButton", "LCtrl") {
        Sleep, 6
        mouseXY(-3,3)
    }
    else
        break
    Loop 8
    If GetKeyState("LButton", "LCtrl") {
        Sleep, 6
        mouseXY(0,2)
    }
    else
        break
    Loop 8
    If GetKeyState("LButton", "LCtrl") {
        Sleep, 6
        mouseXY(1,2)
    }
    else
        break
    Loop 8
    If GetKeyState("LButton", "LCtrl") {
        Sleep, 6
        mouseXY(1.5,1.5)
    }
    else
        break
    Loop 8
    If GetKeyState("LButton", "LCtrl") {
        Sleep, 6
        mouseXY(2,1)
    }
    else
        break
    Loop 8
    If GetKeyState("LButton", "LCtrl") {
        Sleep, 6
        mouseXY(3,1)
    }
    else
        break
    Loop 8
    If GetKeyState("LButton", "LCtrl") {
        Sleep, 6
        mouseXY(2,0)
    }
    else
        break
    Loop 8
    If GetKeyState("LButton", "LCtrl") {
        Sleep, 6
        mouseXY(3,1)
    }
    else
        break
    Loop 8
    If GetKeyState("LButton", "LCtrl") {
        Sleep, 6
        mouseXY(2,1)
    }
    else
        break
    Loop 8
    If GetKeyState("LButton", "LCtrl") {
        Sleep, 6
        mouseXY(1,1)
    }
    else
        break
    Loop 8
    If GetKeyState("LButton", "LCtrl") {
        Sleep, 6
        mouseXY(1,1)
    }
    else
        break
    Loop 8
    If GetKeyState("LButton", "LCtrl") {
        Sleep, 6
        mouseXY(0,1.5)
    }
    else
        break
    Loop 8
    If GetKeyState("LButton", "LCtrl") {
        Sleep, 6
        mouseXY(-1.8,2.5)
    }
    else
        break
    Loop 8
    If GetKeyState("LButton", "LCtrl") {
        Sleep, 6
        mouseXY(-1.8,2.5)
    }
    else
        break
    Loop 8
    If GetKeyState("LButton", "LCtrl") {
        Sleep, 6
        mouseXY(-2,2.5)
    }
    else
        break
    Loop 8
    If GetKeyState("LButton", "LCtrl") {
        Sleep, 6
        mouseXY(-2,2)
    }
    else
        break
    Loop 8
    If GetKeyState("LButton", "LCtrl") {
        Sleep, 6
        mouseXY(-4,1.2)
    }
    else
        break
    Loop 8
    If GetKeyState("LButton", "LCtrl") {
        Sleep, 6
        mouseXY(-3,1.5)
    }
    else
        break
    Loop 8
    If GetKeyState("LButton", "LCtrl") {
        Sleep, 6
        mouseXY(-2,1)
    }
    else
        break
    Loop 8
    If GetKeyState("LButton", "LCtrl") {
        Sleep, 6
        mouseXY(-1,1)
    }
    else
        break
        Loop 8
    If GetKeyState("LButton", "LCtrl") {
        Sleep, 6
        mouseXY(-2,0)
    }
    else
        break
        Loop 8
    If GetKeyState("LButton", "LCtrl") {
        Sleep, 6
        mouseXY(-2,0)
    }
    else
        break
        Loop 8
    If GetKeyState("LButton", "LCtrl") {
        Sleep, 6
        mouseXY(1,2)
    }
    else
        break
        Loop 8
    If GetKeyState("LButton", "LCtrl") {
        Sleep, 6
        mouseXY(1,3)
    }
    else
        break
        Loop 8
    If GetKeyState("LButton", "LCtrl") {
        Sleep, 6
        mouseXY(3,1)
    }
    else
        break
        Loop 8
    If GetKeyState("LButton", "LCtrl") {
        Sleep, 6
        mouseXY(5,2)
    }
    else
        break

    mouseXY(x,y)
    {
        DllCall("mouse_event",int,1,int,x,int,y,uint,0,uint,0)
    }