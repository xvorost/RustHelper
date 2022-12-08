#NoEnv
SendMode Input

~Home::Suspend
~End::ExitApp
~Ins::Reload

~LButton::
patt_ak47 := [[-2, 3, 8], [-3, 5, 8], [-10, 11, 8], [2, -2, 4], [2, -2, 4], [2, -2, 4], [2, -2, 4], [2, -2, 4], [2, -2, 4], [2, -2, 4]]
i := 1
    While (GetKeyState("LButton", "p")) {
        x_AK := patt_ak47[i][1]
        y_AK := patt_ak47[i][2]
        loop_AK := patt_ak47[i][3]
        Loop %loop_AK%
        If GetKeyState("LButton", "p") {
            Sleep, 6
            mouseXY(x_AK,y_AK)
        }
        i := i + 1
    }
return

mouseXY(x,y)
{
    DllCall("mouse_event",int,1,int,x,int,y,uint,0,uint,0)
}