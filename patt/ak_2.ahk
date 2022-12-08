#NoEnv
SendMode Input

Home::Suspend
Ins::Reload

~RButton & ~LButton::
    if GetKeyState("LButton", "p") {
        ;2 (29) 1
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(-17,25)
            sleep, 120
        } else return
        ;3 (28) 2
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(3,23)
            sleep, 120
        } else return
        ;4 (27) 3
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(-27,19)
            sleep, 120
        } else return
        ;5 (26) 4
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(-23,19)
            sleep, 120
        } else return
        ;6 (25) 5
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(2,16)
            sleep, 120
        } else return
        ;7 (24) 6
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(5,14)
            sleep, 120
        } else return
        ;8 (23) 7
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(14,12)
            sleep, 115
        } else return
        ;9 (22) 8
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(19,10)
            sleep, 100
        } else return
        ;10 (21) 9
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(21,6)
            sleep, 120
        } else return
        ;11 (20) 10
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(21,6)
            sleep, 100
        } else return
        ;12 (19) 11
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(20,4)
            sleep, 120
        } else return
        ;13 (18) 12
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(14,10)
            sleep, 100
        } else return
        ;14 (17) 13
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(9,14)
            sleep, 120
        } else return
        ;15 (16) 14
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(-1,12)
            sleep, 100
        } else return
        ;16 (15) 15
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(-5,15)
            sleep, 120
        } else return
        ;17 (14) 16
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(-12,16)
            sleep, 100
        } else return
        ;18 (13) 17
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(-18,16)
            sleep, 120
        } else return
        ;19 (12) 18
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(-20,16)
            sleep, 100
        } else return
        ;20 (11) 19
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(-22,11)
            sleep, 120
        } else return
        ;21 (10) 20
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(-20,6)
            sleep, 100
        } else return
        ;22 (9) 21
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(-24,7)
            sleep, 120
        } else return
        ;23 (8) 22
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(-20,1)
            sleep, 100
        } else return
        ;24 (7) 23
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(-14,12)
            sleep, 120
        } else return
        ;25 (6) 24
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(-3,8)
            sleep, 100
        } else return
        ;26 (5) 25
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(6,12)
            sleep, 120
        } else return
        ;27 (4) 26
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(16,13)
            sleep, 100
        } else return
        ;28 (3) 27
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(22,14)
            sleep, 120
        } else return
        ;29 (2) 28
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(24,14)
            sleep, 100
        } else return
        ;30 (1) 29
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(24,14)
        } else return
    }

    mouseXY(x,y)
    {
        DllCall("mouse_event",int,1,int,x,int,y,uint,0,uint,0)
    }