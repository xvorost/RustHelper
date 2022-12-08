#NoEnv
SendMode Input

Home::Suspend
Ins::Reload

~RButton & ~LButton::
    if GetKeyState("LButton", "p") {
        ;2 (23) 1
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(-6,13)
            sleep, 90
        } else return
        ;3 (22) 2
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(-4,13)
            sleep, 90
        } else return
        ;4 (21) 3
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(1,12)
            sleep, 90
        } else return
        ;5 (20) 4
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(3,12)
            sleep, 90
        } else return
        ;6 (19) 5
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(4,12)
            sleep, 90
        } else return
        ;7 (18) 6
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(5,12)
            sleep, 90
        } else return
        ;8 (17) 7
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(6,14)
            sleep, 90
        } else return
        ;9 (16) 8
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(0,0)
            sleep, 90
        } else return
        ;10 (15) 9
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(0,7)
            sleep, 90
        } else return
        ;11 (14) 10
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(-5,10)
            sleep, 90
        } else return
        ;12 (13) 11
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(-5,0)
            sleep, 90
        } else return
        ;13 (12) 12
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(-3,7)
            sleep, 90
        } else return
        ;14 (11) 13
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(-5,4)
            sleep, 90
        } else return
        ;15 (10) 14
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(2,2)
            sleep, 90
        } else return
        ;16 (9) 15
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(0,5)
            sleep, 90
        } else return
        ;17 (8) 16
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(7,4)
            sleep, 90
        } else return
        ;18 (7) 17
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(7,6)
            sleep, 90
        } else return
        ;19 (6) 18
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(0,0)
            sleep, 90
        } else return
        ;20 (5) 19
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(0,2)
            sleep, 90
        } else return
        ;21 (4) 20
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(0,2)
            sleep, 90
        } else return
        ;22 (3) 21
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(0,2)
            sleep, 90
        } else return
        ;23 (2) 22
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(-2,2)
            sleep, 90
        } else return
        ;24 (1) 23
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(-2,2)
            sleep, 90
        } else return
    }

    mouseXY(x,y)
    {
        DllCall("mouse_event",int,1,int,x,int,y,uint,0,uint,0)
    }