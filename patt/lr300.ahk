#NoEnv
SendMode Input

Home::Suspend
Ins::Reload

~RButton & ~LButton::
    Loop 1 ;2 (29)
    If GetKeyState("LButton", "p") {
        Sleep, 6
        mouseXY(-1.15,12)
        sleep, 100
    } else Break
    Loop 1 ;3 (28)
    If GetKeyState("LButton", "p") {
        Sleep, 6
        mouseXY(-4,14)
        sleep, 100
    } else Break
    Loop 1 ;4 (27)
    If GetKeyState("LButton", "p") {
        Sleep, 6
        mouseXY(-6,17)
        sleep, 100
    } else Break
    Loop 1 ;5 (26)
    If GetKeyState("LButton", "p") {
        Sleep, 6
        mouseXY(-6,17)
        sleep, 100
    } else Break
    Loop 1 ;6 (25)
    If GetKeyState("LButton", "p") {
        Sleep, 6
        mouseXY(-8,18)
        sleep, 100
    } else Break
    Loop 1 ;7 (24)
    If GetKeyState("LButton", "p") {
        Sleep, 6
        mouseXY(-5,2)
        sleep, 100
    } else Break
    Loop 1 ;8 (23)
    If GetKeyState("LButton", "p") {
        Sleep, 6
        mouseXY(-4,10)
        sleep, 100
    } else Break
    Loop 1 ;9 (22)
    If GetKeyState("LButton", "p") {
        Sleep, 6
        mouseXY(0,5)
        sleep, 100
    } else Break
    Loop 1 ;10 (21)
    If GetKeyState("LButton", "p") {
        Sleep, 6
        mouseXY(0,7)
        sleep, 100
    } else Break
    Loop 1 ;11 (20)
    If GetKeyState("LButton", "p") {
        Sleep, 6
        mouseXY(7,5)
        sleep, 100
    } else Break
    Loop 1 ;12 (19)
    If GetKeyState("LButton", "p") {
        Sleep, 6
        mouseXY(12,5)
        sleep, 100
    } else Break
    Loop 1 ;13 (18)
    If GetKeyState("LButton", "p") {
        Sleep, 6
        mouseXY(10,5)
        sleep, 100
    } else Break
    Loop 1 ;14 (17)
    If GetKeyState("LButton", "p") {
        Sleep, 6
        mouseXY(4,1)
        sleep, 100
    } else Break
    Loop 1 ;15 (16)
    If GetKeyState("LButton", "p") {
        Sleep, 6
        mouseXY(3,2)
        sleep, 100
    } else Break
    Loop 1 ;16 (15)
    If GetKeyState("LButton", "p") {
        Sleep, 6
        mouseXY(-4,3)
        sleep, 100
    } else Break
    Loop 1 ;17 (14)
    If GetKeyState("LButton", "p") {
        Sleep, 6
        mouseXY(-7,3)
        sleep, 100
    } else Break
    Loop 1 ;18 (13)
    If GetKeyState("LButton", "p") {
        Sleep, 6
        mouseXY(-4,0)
        sleep, 100
    } else Break
    Loop 1 ;19 (12)
    If GetKeyState("LButton", "p") {
        Sleep, 6
        mouseXY(-7,1)
        sleep, 100
    } else Break
    Loop 1 ;20 (11)
    If GetKeyState("LButton", "p") {
        Sleep, 6
        mouseXY(-6,2)
        sleep, 100
    } else Break
    Loop 1 ;21 (10)
    If GetKeyState("LButton", "p") {
        Sleep, 6
        mouseXY(-9,2)
        sleep, 100
    } else Break
    Loop 1 ;22 (9)
    If GetKeyState("LButton", "p") {
        Sleep, 6
        mouseXY(-12,4)
        sleep, 100
    } else Break
    Loop 1 ;23 (8)
    If GetKeyState("LButton", "p") {
        Sleep, 6
        mouseXY(-5,0)
        sleep, 100
    } else Break
    Loop 1 ;24 (7)
    If GetKeyState("LButton", "p") {
        Sleep, 6
        mouseXY(-12,0)
        sleep, 100
    } else Break
    Loop 1 ;25 (6)
    If GetKeyState("LButton", "p") {
        Sleep, 6
        mouseXY(-1,0)
        sleep, 100
    } else Break
    Loop 1 ;26 (5)
    If GetKeyState("LButton", "p") {
        Sleep, 6
        mouseXY(4,5)
        sleep, 100
    } else Break
    Loop 1 ;27 (4)
    If GetKeyState("LButton", "p") {
        Sleep, 6
        mouseXY(9,0)
        sleep, 100
    } else Break
    Loop 1 ;28 (3)
    If GetKeyState("LButton", "p") {
        Sleep, 6
        mouseXY(18,4)
        sleep, 100
    } else Break
    Loop 1 ;29 (2)
    If GetKeyState("LButton", "p") {
        Sleep, 6
        mouseXY(22,0)
        sleep, 100
    } else Break
    Loop 1 ;30 (1)
    If GetKeyState("LButton", "p") {
        Sleep, 6
        mouseXY(20,2)
        sleep, 100
    } else Break

    mouseXY(x,y)
    {
        DllCall("mouse_event",int,1,int,x,int,y,uint,0,uint,0)
    }