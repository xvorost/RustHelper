#NoEnv
SendMode Input

Home::Suspend
Ins::Reload

~RButton & ~LButton::
    if GetKeyState("LButton", "p") {
        ;2 (19) 1
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(-25,52)
            sleep, 100
        } else return
        ;3 (18) 2
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(-10,50)
            sleep, 100
        } else return
        ;4 (17) 3
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(0,50)
            sleep, 100
        } else return
        ;5 (16) 4
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(18,48)
            sleep, 100
        } else return
        ;6 (15) 5
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(20,42)
            sleep, 100
        } else return
        ;7 (14) 6
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(23,42)
            sleep, 100
        } else return
        ;8 (13) 7
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(8,30)
            sleep, 100
        } else return
        ;9 (12) 8
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(-10,24)
            sleep, 100
        } else return
        ;10 (11) 9
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(-20,26)
            sleep, 100
        } else return
        ;11 (10) 10
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(-16,16)
            sleep, 100
        } else return
        ;12 (9) 11
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(-16,16)
            sleep, 100
        } else return
        ;13 (8) 12
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(0,16)
            sleep, 100
        } else return
        ;14 (7) 13
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(8,20)
            sleep, 100
        } else return
        ;15 (6) 14
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(8,16)
            sleep, 100
        } else return
        ;16 (5) 15
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(25,20)
            sleep, 100
        } else return
        ;17 (4) 16
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(25,14)
            sleep, 100
        } else return
        ;18 (3) 17
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(0,0)
            sleep, 100
        } else return
        ;19 (2) 18
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(-6,0)
            sleep, 100
        } else return
        ;20 (1) 19
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(-7,0)
            sleep, 100
        } else return
    }

    mouseXY(x,y)
    {
        DllCall("mouse_event",int,1,int,x,int,y,uint,0,uint,0)
    }