#NoEnv
SendMode Input
setworkingdir, %A_ScriptDir%
if not A_IsAdmin {
    Run *RunAs "%A_ScriptFullPath%"
    ExitApp
}

version := "1.0.0"

Weapon_patt := "[Ctrl+F1] AK47 (better) *|[F1] AK47 * (no scope)|[F2] LR-300 *|[F3] S-A Rifle|[F4] M39 (no scope)|[F5] SMG * (no scope)|[F6] MP5A4 *|[F7] Thompson * (no scope)|[F8] M249|[F9] M92 Pistol (no scope)|[F10] Python (no scope)|[F11] S-A Pistol (no scope)|[F12] Revolver"
opsh := "close"
global auth = "done"

if (auth == "done") {
    Gui, Font, s12 q5 c181818,Arial
    Gui, Add, GroupBox, x20 y20 w415 h295 , Rust Helper
    Gui, Add, Checkbox,x35 y55 gCheck1 vRustHelper, Activate [Only Insert]

    Gui, Add, GroupBox, x20 y85 w415 h230, Settings
    Gui, Add, Text, x145 y113, Ingame Sense:
    Gui, Add, Edit, x255 y110 w43 vValueSense gBSense, 1.0
    Gui, Add, Text, x145 y148, Ingame FOV: 90 (only)
    Gui, Add, Text, x35 y180, Mode no-recoil:
    Gui, Add, DropDownList, x35 y205 vVMode gMode, Rapid Fire|Standard (only *)
    Gui, Add, Text, x35 y245, Weapon:
    Gui, Add, DropDownList, x35 y270 vVWeapon gWeapon, %Weapon_patt%
    Gui, Add, Text, x240 y180, Attachment (all weapons):
    Gui, Add, DropDownList, x240 y205 vVAttachment gAttachment Choose1, None|Silencer (no zoom scope)
    Gui, Add, Text, x240 y245, Scope (all weapons):
    Gui, Add, DropDownList, x240 y270 vVScope gScope Choose1, None|8x Zoom Scope|16x Zoom Scope|Holosight|Simple Handmade Sight
    Gui, Font, s9 q5 c181818,Arial
    Gui, Add, Text, x95 y232, (hotkeys Alt + F1...2)^
    Gui, Add, Text, x75 y297, (hotkeys Shift + F1...12)^
    Gui, Add, Text, x260 y232, (hotkeys Num0 + Num1...2)^
    Gui, Add, Text, x260 y297, (hotkeys Num0 + Num3...7)^
    Gui, Font, s12 q5 c181818,Arial

    Gui, Add, GroupBox, x450 y20 w210 h225, Info && Contacts
    Gui, Add, Button, vButton1 gBHwid x515 y75 w80 h30, Telegram
    Gui, Add, Button, vButton2 gDev x515 y110 w80 h30, Developer
    Gui, Add, Button, vButton3 gDiscord x485 y165 w140 h30, Discord server
    Gui, Font, s9 q5 c181818,Arial
    Gui, Add, Text, x520 y140, ^(on VK)
    Gui, Add, Text, x520 y195, ^(dev. discord)
    Gui, Font, s12 q5 c181818,Arial

    Gui, Add, Checkbox,x495 y260 gCheck2 vVSounds Checked, Hotkey sounds

    Gui, Font, s9 q5 c181818,Arial
    Gui, Add, Text, x515 y290, Reload key: End
    Gui, Add, Text, x520 y310, Version: %version%
    Gui, Font, s12 q5 c181818,Arial

    Gui, Add, Button, vButton4 gOpSet x135 y323 w190 h30, Settings for each weapon

    Gui, Font, s9 q5 c181818,Arial
    Gui, Add, GroupBox, x20 y356 w640 h347 , Settings (each weapon)
    ;ak47
    Gui, Add, GroupBox, x35 y370 w185 h80 , AK-47
    Gui, Add, Text, x40 y390, Attachment:
    Gui, Add, DropDownList, x110 y387 w100 vVAttachmentAK gAttachmentAK Choose1, None|Silencer
    Gui, Add, Text, x40 y420, Scope:
    Gui, Add, DropDownList, x110 y417 w100 vVScopeAK gScopeAK Choose1, None|8x Zoom Scope|16x Zoom Scope|Holosight|Simple Sight
    ;lr300
    Gui, Add, GroupBox, x35 y450 w185 h80 , LR-300
    Gui, Add, Text, x40 y470, Attachment:
    Gui, Add, DropDownList, x110 y467 w100 vVAttachmentLR gAttachmentLR Choose1, None|Silencer
    Gui, Add, Text, x40 y500, Scope:
    Gui, Add, DropDownList, x110 y497 w100 vVScopeLR gScopeLR Choose1, None|8x Zoom Scope|16x Zoom Scope|Holosight|Simple Sight
    ;s-a rifle
    Gui, Add, GroupBox, x247 y370 w185 h80 , S-A Rifle
    Gui, Add, Text, x252 y390, Attachment:
    Gui, Add, DropDownList, x322 y387 w100 vVAttachmentSAR gAttachmentSAR Choose1, None|Silencer
    Gui, Add, Text, x252 y420, Scope:
    Gui, Add, DropDownList, x322 y417 w100 vVScopeSAR gScopeSAR Choose1, None|8x Zoom Scope|16x Zoom Scope|Holosight|Simple Sight
    ;m39
    Gui, Add, GroupBox, x247 y450 w185 h80 , M39
    Gui, Add, Text, x252 y470, Attachment:
    Gui, Add, DropDownList, x322 y467 w100 vVAttachmentM39 gAttachmentM39 Choose1, None|Silencer
    Gui, Add, Text, x252 y500, Scope:
    Gui, Add, DropDownList, x322 y497 w100 vVScopeM39 gScopeM39 Choose1, None|8x Zoom Scope|16x Zoom Scope|Holosight|Simple Sight
    ;smg
    Gui, Add, GroupBox, x460 y370 w185 h80 , SMG
    Gui, Add, Text, x465 y390, Attachment:
    Gui, Add, DropDownList, x535 y387 w100 vVAttachmentSMG gAttachmentSMG Choose1, None|Silencer
    Gui, Add, Text, x465 y420, Scope:
    Gui, Add, DropDownList, x535 y417 w100 vVScopeSMG gScopeSMG Choose1, None|8x Zoom Scope|16x Zoom Scope|Holosight|Simple Sight
    ;mp5a4
    Gui, Add, GroupBox, x460 y450 w185 h80 , MP5A4
    Gui, Add, Text, x465 y470, Attachment:
    Gui, Add, DropDownList, x535 y467 w100 vVAttachmentMP5 gAttachmentMP5 Choose1, None|Silencer
    Gui, Add, Text, x465 y500, Scope:
    Gui, Add, DropDownList, x535 y497 w100 vVScopeMP5 gScopeMP5 Choose1, None|8x Zoom Scope|16x Zoom Scope|Holosight|Simple Sight
    ;thompson
    Gui, Add, GroupBox, x35 y530 w185 h80 , Thompson
    Gui, Add, Text, x40 y550, Attachment:
    Gui, Add, DropDownList, x110 y547 w100 vVAttachmentTH gAttachmentTH Choose1, None|Silencer
    Gui, Add, Text, x40 y580, Scope:
    Gui, Add, DropDownList, x110 y577 w100 vVScopeTH gScopeTH Choose1, None|8x Zoom Scope|16x Zoom Scope|Holosight|Simple Sight
    ;m249
    Gui, Add, GroupBox, x35 y610 w185 h80 , M249
    Gui, Add, Text, x40 y630, Attachment:
    Gui, Add, DropDownList, x110 y627 w100 vVAttachmentM249 gAttachmentM249 Choose1, None|Silencer
    Gui, Add, Text, x40 y660, Scope:
    Gui, Add, DropDownList, x110 y657 w100 vVScopeM249 gScopeM249 Choose1, None|8x Zoom Scope|16x Zoom Scope|Holosight|Simple Sight
    ;m92 pistol
    Gui, Add, GroupBox, x247 y530 w185 h80 , M92 Pistol
    Gui, Add, Text, x252 y550, Attachment:
    Gui, Add, DropDownList, x322 y547 w100 vVAttachmentM92 gAttachmentM92 Choose1, None|Silencer
    Gui, Add, Text, x252 y580, Scope:
    Gui, Add, DropDownList, x322 y577 w100 vVScopeM92 gScopeM92 Choose1, None|8x Zoom Scope|16x Zoom Scope|Holosight|Simple Sight
    ;python
    Gui, Add, GroupBox, x247 y610 w185 h80 , Python
    Gui, Add, Text, x252 y630, Attachment:
    Gui, Add, DropDownList, x322 y627 w100 vVAttachmentPyt gAttachmentPyt Choose1, None
    Gui, Add, Text, x252 y660, Scope:
    Gui, Add, DropDownList, x322 y657 w100 vVScopePyt gScopePyt Choose1, None|8x Zoom Scope|16x Zoom Scope|Holosight|Simple Sight
    ;sap
    Gui, Add, GroupBox, x460 y530 w185 h80 , S-A Pistol
    Gui, Add, Text, x465 y550, Attachment:
    Gui, Add, DropDownList, x535 y547 w100 vVAttachmentSAP gAttachmentSAP Choose1, None|Silencer
    Gui, Add, Text, x465 y580, Scope:
    Gui, Add, DropDownList, x535 y577 w100 vVScopeSAP gScopeSAP Choose1, None|8x Zoom Scope|16x Zoom Scope|Holosight|Simple Sight
    ;revolver
    Gui, Add, GroupBox, x460 y610 w185 h80 , Revolver
    Gui, Add, Text, x465 y630, Attachment:
    Gui, Add, DropDownList, x535 y627 w100 vVAttachmentRev gAttachmentRev Choose1, None|Silencer
    Gui, Add, Text, x465 y660, Scope:
    Gui, Add, DropDownList, x535 y657 w100 vVScopeRev gScopeRev Choose1, None

    Gui, Show, w680 h360 y170, Rust Helper by xvorost
    Gui, submit, nohide
    return

    OpSet:
        if (opsh = "close") {
            opsh := "open"
            Gui, Show, w680 h720, Rust Helper by xvorost
        } else if (opsh = "open") {
            opsh := "close"
            Gui, Show, w680 h360, Rust Helper by xvorost
        }
    return

    Check1:
        Gui, submit, nohide
    return

    Check2:
        Gui, submit, nohide
    return

    AttachmentAK:
        Gui, submit, nohide
        GuiControl, Choose, VAttachment, 1
        ValueAttachment := 1
        GuiControl, Choose, VScope, 1
        ValueScope := 1
        If (VAttachmentAK = "None") {
            ValueAttachmentAK := 1
        }
        If (VAttachmentAK = "Silencer") {
            ValueAttachmentAK := 0.8
        }
        if (RustHelper = 1) {
            GuiControl,, RustHelper, 0
            state := false
            sleep, 10
            GuiControl,, RustHelper, 1
            state := true
        }
    return

    AttachmentLR:
        Gui, submit, nohide
        GuiControl, Choose, VAttachment, 1
        ValueAttachment := 1
        GuiControl, Choose, VScope, 1
        ValueScope := 1
        If (VAttachmentLR = "None") {
            ValueAttachmentLR := 1
        }
        If (VAttachmentLR = "Silencer") {
            ValueAttachmentLR := 0.8
        }
        if (RustHelper = 1) {
            GuiControl,, RustHelper, 0
            state := false
            sleep, 10
            GuiControl,, RustHelper, 1
            state := true
        }
    return

    AttachmentSAR:
        Gui, submit, nohide
        GuiControl, Choose, VAttachment, 1
        ValueAttachment := 1
        GuiControl, Choose, VScope, 1
        ValueScope := 1
        If (VAttachmentSAR = "None") {
            ValueAttachmentSAR := 1
        }
        If (VAttachmentSAR = "Silencer") {
            ValueAttachmentSAR := 0.8
        }
        if (RustHelper = 1) {
            GuiControl,, RustHelper, 0
            state := false
            sleep, 10
            GuiControl,, RustHelper, 1
            state := true
        }
    return

    AttachmentSMG:
        Gui, submit, nohide
        GuiControl, Choose, VAttachment, 1
        ValueAttachment := 1
        GuiControl, Choose, VScope, 1
        ValueScope := 1
        If (VAttachmentSMG = "None") {
            ValueAttachmentSMG := 1
        }
        If (VAttachmentAK = "Silencer") {
            ValueAttachmentSMG := 0.8
        }
        if (RustHelper = 1) {
            GuiControl,, RustHelper, 0
            state := false
            sleep, 10
            GuiControl,, RustHelper, 1
            state := true
        }
    return

    AttachmentM39:
        Gui, submit, nohide
        GuiControl, Choose, VAttachment, 1
        ValueAttachment := 1
        GuiControl, Choose, VScope, 1
        ValueScope := 1
        If (VAttachmentM39 = "None") {
            ValueAttachmentM39 := 1
        }
        If (VAttachmentM39 = "Silencer") {
            ValueAttachmentM39 := 0.8
        }
        if (RustHelper = 1) {
            GuiControl,, RustHelper, 0
            state := false
            sleep, 10
            GuiControl,, RustHelper, 1
            state := true
        }
    return

    AttachmentMP5:
        Gui, submit, nohide
        GuiControl, Choose, VAttachment, 1
        ValueAttachment := 1
        GuiControl, Choose, VScope, 1
        ValueScope := 1
        If (VAttachmentMP5 = "None") {
            ValueAttachmentMP5 := 1
        }
        If (VAttachmentMP5 = "Silencer") {
            ValueAttachmentMP5 := 0.8
        }
        if (RustHelper = 1) {
            GuiControl,, RustHelper, 0
            state := false
            sleep, 10
            GuiControl,, RustHelper, 1
            state := true
        }
    return

    AttachmentTH:
        Gui, submit, nohide
        GuiControl, Choose, VAttachment, 1
        ValueAttachment := 1
        GuiControl, Choose, VScope, 1
        ValueScope := 1
        If (VAttachmentTH = "None") {
            ValueAttachmentTH := 1
        }
        If (VAttachmentTH = "Silencer") {
            ValueAttachmentTH := 0.8
        }
        if (RustHelper = 1) {
            GuiControl,, RustHelper, 0
            state := false
            sleep, 10
            GuiControl,, RustHelper, 1
            state := true
        }
    return

    AttachmentM249:
        Gui, submit, nohide
        GuiControl, Choose, VAttachment, 1
        ValueAttachment := 1
        GuiControl, Choose, VScope, 1
        ValueScope := 1
        If (VAttachmentM249 = "None") {
            ValueAttachmentM249 := 1
        }
        If (VAttachmentM249 = "Silencer") {
            ValueAttachmentM249 := 0.8
        }
        if (RustHelper = 1) {
            GuiControl,, RustHelper, 0
            state := false
            sleep, 10
            GuiControl,, RustHelper, 1
            state := true
        }
    return

    AttachmentM92:
        Gui, submit, nohide
        GuiControl, Choose, VAttachment, 1
        ValueAttachment := 1
        GuiControl, Choose, VScope, 1
        ValueScope := 1
        If (VAttachmentM92 = "None") {
            ValueAttachmentM92 := 1
        }
        If (VAttachmentM92 = "Silencer") {
            ValueAttachmentM92 := 0.8
        }
        if (RustHelper = 1) {
            GuiControl,, RustHelper, 0
            state := false
            sleep, 10
            GuiControl,, RustHelper, 1
            state := true
        }
    return

    AttachmentPyt:
        Gui, submit, nohide
        GuiControl, Choose, VAttachment, 1
        ValueAttachment := 1
        GuiControl, Choose, VScope, 1
        ValueScope := 1
        If (VAttachmentPyt = "None") {
            ValueAttachmentPyt := 1
        }
        if (RustHelper = 1) {
            GuiControl,, RustHelper, 0
            state := false
            sleep, 10
            GuiControl,, RustHelper, 1
            state := true
        }
    return

    AttachmentSAP:
        Gui, submit, nohide
        GuiControl, Choose, VAttachment, 1
        ValueAttachment := 1
        GuiControl, Choose, VScope, 1
        ValueScope := 1
        If (VAttachmentSAP = "None") {
            ValueAttachmentSAP := 1
        }
        If (VAttachmentSAP = "Silencer") {
            ValueAttachmentSAP := 0.8
        }
        if (RustHelper = 1) {
            GuiControl,, RustHelper, 0
            state := false
            sleep, 10
            GuiControl,, RustHelper, 1
            state := true
        }
    return

    AttachmentRev:
        Gui, submit, nohide
        GuiControl, Choose, VAttachment, 1
        ValueAttachment := 1
        GuiControl, Choose, VScope, 1
        ValueScope := 1
        If (VAttachmentRev = "None") {
            ValueAttachmentRev := 1
        }
        If (VAttachmentRev = "Silencer") {
            ValueAttachmentRev := 0.8
        }
        if (RustHelper = 1) {
            GuiControl,, RustHelper, 0
            state := false
            sleep, 10
            GuiControl,, RustHelper, 1
            state := true
        }
    return

    Attachment:
        Gui, submit, nohide
        GuiControl, Choose, VAttachmentAK, 1
        GuiControl, Choose, VAttachmentLR, 1
        GuiControl, Choose, VAttachmentSAR, 1
        GuiControl, Choose, VAttachmentM39, 1
        GuiControl, Choose, VAttachmentSMG, 1
        GuiControl, Choose, VAttachmentMP5, 1
        GuiControl, Choose, VAttachmentTH, 1
        GuiControl, Choose, VAttachmentM249, 1
        GuiControl, Choose, VAttachmentM92, 1
        GuiControl, Choose, VAttachmentPyt, 1
        GuiControl, Choose, VAttachmentRev, 1
        ValueAttachmentAK := 1
        ValueAttachmentLR := 1
        ValueAttachmentSAR := 1
        ValueAttachmentM39 := 1
        ValueAttachmentSMG := 1
        ValueAttachmentMP5 := 1
        ValueAttachmentTH := 1
        ValueAttachmentM249 := 1
        ValueAttachmentM92 := 1
        ValueAttachmentPyt := 1
        ValueAttachmentRev := 1
        GuiControl, Choose, VScopeAK, 1
        GuiControl, Choose, VScopeLR, 1
        GuiControl, Choose, VScopeSAR, 1
        GuiControl, Choose, VScopeM39, 1
        GuiControl, Choose, VScopeSMG, 1
        GuiControl, Choose, VScopeMP5, 1
        GuiControl, Choose, VScopeTH, 1
        GuiControl, Choose, VScopeM249, 1
        GuiControl, Choose, VScopeM92, 1
        GuiControl, Choose, VScopePyt, 1
        GuiControl, Choose, VScopeRev, 1
        ValueScopeAK := 1
        ValueScopeLR := 1
        ValueScopeSAR := 1
        ValueScopeM39 := 1
        ValueScopeSMG := 1
        ValueScopeMP5 := 1
        ValueScopeTH := 1
        ValueScopeM249 := 1
        ValueScopeM92 := 1
        ValueScopePyt := 1
        ValueScopeRev := 1
        If (VAttachment = "None") {
            ValueAttachment := 1
        }
        If (VAttachment = "Silencer (no zoom scope)") {
            ValueAttachment := 0.8
        }
        if (RustHelper = 1) {
            GuiControl,, RustHelper, 0
            state := false
            sleep, 10
            GuiControl,, RustHelper, 1
            state := true
        }
    return

    ScopeAK:
        Gui, submit, nohide
        GuiControl, Choose, VScope, 1
        ValueScope := 1
        GuiControl, Choose, VAttachment, 1
        ValueAttachment := 1
        If (VScopeAK = "None") {
            ValueScopeAK := 1
        }
        If (VScopeAK = "8x Zoom Scope") {
            ValueScopeAK := 3.85
        }
        If (VScopeAK = "16x Zoom Scope") {
            ValueScopeAK := 7.7
        }
        If (VScopeAK = "Holosight") {
            ValueScopeAK := 1.2
        }
        If (VScopeAK = "Simple Handmade Sight") {
            ValueScopeAK := 0.8
        }
        if (RustHelper = 1) {
            GuiControl,, RustHelper, 0
            state := false
            sleep, 10
            GuiControl,, RustHelper, 1
            state := true
        }
    return

    ScopeLR:
        Gui, submit, nohide
        GuiControl, Choose, VScope, 1
        ValueScope := 1
        GuiControl, Choose, VAttachment, 1
        ValueAttachment := 1
        If (VScopeLR = "None") {
            ValueScopeLR := 1
        }
        If (VScopeLR = "8x Zoom Scope") {
            ValueScopeLR := 3.85
        }
        If (VScopeLR = "16x Zoom Scope") {
            ValueScopeLR := 7.7
        }
        If (VScopeLR = "Holosight") {
            ValueScopeLR := 1.2
        }
        If (VScopeLR = "Simple Handmade Sight") {
            ValueScopeLR := 0.8
        }
        if (RustHelper = 1) {
            GuiControl,, RustHelper, 0
            state := false
            sleep, 10
            GuiControl,, RustHelper, 1
            state := true
        }
    return

    ScopeSAR:
        Gui, submit, nohide
        GuiControl, Choose, VScope, 1
        ValueScope := 1
        GuiControl, Choose, VAttachment, 1
        ValueAttachment := 1
        If (VScopeSAR = "None") {
            ValueScopeSAR := 1
        }
        If (VScopeSAR = "8x Zoom Scope") {
            ValueScopeSAR := 3.85
        }
        If (VScopeSAR = "16x Zoom Scope") {
            ValueScopeSAR := 7.7
        }
        If (VScopeSAR = "Holosight") {
            ValueScopeSAR := 1.2
        }
        If (VScopeSAR = "Simple Handmade Sight") {
            ValueScopeSAR := 0.8
        }
        if (RustHelper = 1) {
            GuiControl,, RustHelper, 0
            state := false
            sleep, 10
            GuiControl,, RustHelper, 1
            state := true
        }
    return

    ScopeSMG:
        Gui, submit, nohide
        GuiControl, Choose, VScope, 1
        ValueScope := 1
        GuiControl, Choose, VAttachment, 1
        ValueAttachment := 1
        If (VScopeSMG = "None") {
            ValueScopeSMG := 1
        }
        If (VScopeSMG = "8x Zoom Scope") {
            ValueScopeSMG := 3.85
        }
        If (VScopeSMG = "16x Zoom Scope") {
            ValueScopeSMG := 7.7
        }
        If (VScopeSMG = "Holosight") {
            ValueScopeSMG := 1.2
        }
        If (VScopeSMG = "Simple Handmade Sight") {
            ValueScopeSMG := 0.8
        }
        if (RustHelper = 1) {
            GuiControl,, RustHelper, 0
            state := false
            sleep, 10
            GuiControl,, RustHelper, 1
            state := true
        }
    return

    ScopeM39:
        Gui, submit, nohide
        GuiControl, Choose, VScope, 1
        ValueScope := 1
        GuiControl, Choose, VAttachment, 1
        ValueAttachment := 1
        If (VScopeM39 = "None") {
            ValueScopeM39 := 1
        }
        If (VScopeM39 = "8x Zoom Scope") {
            ValueScopeM39 := 3.85
        }
        If (VScopeM39 = "16x Zoom Scope") {
            ValueScopeM39 := 7.7
        }
        If (VScopeM39 = "Holosight") {
            ValueScopeM39 := 1.2
        }
        If (VScopeM39 = "Simple Handmade Sight") {
            ValueScopeM39 := 0.8
        }
        if (RustHelper = 1) {
            GuiControl,, RustHelper, 0
            state := false
            sleep, 10
            GuiControl,, RustHelper, 1
            state := true
        }
    return

    ScopeMP5:
        Gui, submit, nohide
        GuiControl, Choose, VScope, 1
        ValueScope := 1
        GuiControl, Choose, VAttachment, 1
        ValueAttachment := 1
        If (VScopeMP5 = "None") {
            ValueScopeMP5 := 1
        }
        If (VScopeMP5 = "8x Zoom Scope") {
            ValueScopeMP5 := 3.85
        }
        If (VScopeMP5 = "16x Zoom Scope") {
            ValueScopeMP5 := 7.7
        }
        If (VScopeMP5 = "Holosight") {
            ValueScopeMP5 := 1.2
        }
        If (VScopeMP5 = "Simple Handmade Sight") {
            ValueScopeMP5 := 0.8
        }
        if (RustHelper = 1) {
            GuiControl,, RustHelper, 0
            state := false
            sleep, 10
            GuiControl,, RustHelper, 1
            state := true
        }
    return

    ScopeTH:
        Gui, submit, nohide
        GuiControl, Choose, VScope, 1
        ValueScope := 1
        GuiControl, Choose, VAttachment, 1
        ValueAttachment := 1
        If (VScopeTH = "None") {
            ValueScopeTH := 1
        }
        If (VScopeTH = "8x Zoom Scope") {
            ValueScopeTH := 3.85
        }
        If (VScopeTH = "16x Zoom Scope") {
            ValueScopeTH := 7.7
        }
        If (VScopeTH = "Holosight") {
            ValueScopeTH := 1.2
        }
        If (VScopeTH = "Simple Handmade Sight") {
            ValueScopeTH := 0.8
        }
        if (RustHelper = 1) {
            GuiControl,, RustHelper, 0
            state := false
            sleep, 10
            GuiControl,, RustHelper, 1
            state := true
        }
    return

    ScopeM249:
        Gui, submit, nohide
        GuiControl, Choose, VScope, 1
        ValueScope := 1
        GuiControl, Choose, VAttachment, 1
        ValueAttachment := 1
        If (VScopeM249 = "None") {
            ValueScopeM249 := 1
        }
        If (VScopeM249 = "8x Zoom Scope") {
            ValueScopeM249 := 3.85
        }
        If (VScopeM249 = "16x Zoom Scope") {
            ValueScopeM249 := 7.7
        }
        If (VScopeM249 = "Holosight") {
            ValueScopeM249 := 1.2
        }
        If (VScopeM249 = "Simple Handmade Sight") {
            ValueScopeM249 := 0.8
        }
        if (RustHelper = 1) {
            GuiControl,, RustHelper, 0
            state := false
            sleep, 10
            GuiControl,, RustHelper, 1
            state := true
        }
    return

    ScopeM92:
        Gui, submit, nohide
        GuiControl, Choose, VScope, 1
        ValueScope := 1
        GuiControl, Choose, VAttachment, 1
        ValueAttachment := 1
        If (VScopeM92 = "None") {
            ValueScopeM92 := 1
        }
        If (VScopeM92 = "8x Zoom Scope") {
            ValueScopeM92 := 3.85
        }
        If (VScopeM92 = "16x Zoom Scope") {
            ValueScopeM92 := 7.7
        }
        If (VScopeM92 = "Holosight") {
            ValueScopeM92 := 1.2
        }
        If (VScopeM92 = "Simple Handmade Sight") {
            ValueScopeM92 := 0.8
        }
        if (RustHelper = 1) {
            GuiControl,, RustHelper, 0
            state := false
            sleep, 10
            GuiControl,, RustHelper, 1
            state := true
        }
    return

    ScopePyt:
        Gui, submit, nohide
        GuiControl, Choose, VScope, 1
        ValueScope := 1
        GuiControl, Choose, VAttachment, 1
        ValueAttachment := 1
        If (VScopePyt = "None") {
            ValueScopePyt := 1
        }
        If (VScopePyt = "8x Zoom Scope") {
            ValueScopePyt := 3.85
        }
        If (VScopePyt = "16x Zoom Scope") {
            ValueScopePyt := 7.7
        }
        If (VScopePyt = "Holosight") {
            ValueScopePyt := 1.2
        }
        If (VScopePyt = "Simple Handmade Sight") {
            ValueScopePyt := 0.8
        }
        if (RustHelper = 1) {
            GuiControl,, RustHelper, 0
            state := false
            sleep, 10
            GuiControl,, RustHelper, 1
            state := true
        }
    return

    ScopeSAP:
        Gui, submit, nohide
        GuiControl, Choose, VScope, 1
        ValueScope := 1
        GuiControl, Choose, VAttachment, 1
        ValueAttachment := 1
        If (VScopeSAP = "None") {
            ValueScopeSAP := 1
        }
        If (VScopeSAP = "8x Zoom Scope") {
            ValueScopeSAP := 3.85
        }
        If (VScopeSAP = "16x Zoom Scope") {
            ValueScopeSAP := 7.7
        }
        If (VScopeSAP = "Holosight") {
            ValueScopeSAP := 1.2
        }
        If (VScopeSAP = "Simple Handmade Sight") {
            ValueScopeSAP := 0.8
        }
        if (RustHelper = 1) {
            GuiControl,, RustHelper, 0
            state := false
            sleep, 10
            GuiControl,, RustHelper, 1
            state := true
        }
    return

    ScopeRev:
        Gui, submit, nohide
        GuiControl, Choose, VScope, 1
        ValueScope := 1
        GuiControl, Choose, VAttachment, 1
        ValueAttachment := 1
        If (VScopeRev = "None") {
            ValueScopeRev := 1
        }
        if (RustHelper = 1) {
            GuiControl,, RustHelper, 0
            state := false
            sleep, 10
            GuiControl,, RustHelper, 1
            state := true
        }
    return

    Scope:
        Gui, submit, nohide
        GuiControl, Choose, VScopeAK, 1
        GuiControl, Choose, VScopeLR, 1
        GuiControl, Choose, VScopeSAR, 1
        GuiControl, Choose, VScopeM39, 1
        GuiControl, Choose, VScopeSMG, 1
        GuiControl, Choose, VScopeMP5, 1
        GuiControl, Choose, VScopeTH, 1
        GuiControl, Choose, VScopeM249, 1
        GuiControl, Choose, VScopeM92, 1
        GuiControl, Choose, VScopePyt, 1
        GuiControl, Choose, VScopeRev, 1
        ValueScopeAK := 1
        ValueScopeLR := 1
        ValueScopeSAR := 1
        ValueScopeM39 := 1
        ValueScopeSMG := 1
        ValueScopeMP5 := 1
        ValueScopeTH := 1
        ValueScopeM249 := 1
        ValueScopeM92 := 1
        ValueScopePyt := 1
        ValueScopeRev := 1
        GuiControl, Choose, VAttachmentAK, 1
        GuiControl, Choose, VAttachmentLR, 1
        GuiControl, Choose, VAttachmentSAR, 1
        GuiControl, Choose, VAttachmentM39, 1
        GuiControl, Choose, VAttachmentSMG, 1
        GuiControl, Choose, VAttachmentMP5, 1
        GuiControl, Choose, VAttachmentTH, 1
        GuiControl, Choose, VAttachmentM249, 1
        GuiControl, Choose, VAttachmentM92, 1
        GuiControl, Choose, VAttachmentPyt, 1
        GuiControl, Choose, VAttachmentRev, 1
        ValueAttachmentAK := 1
        ValueAttachmentLR := 1
        ValueAttachmentSAR := 1
        ValueAttachmentM39 := 1
        ValueAttachmentSMG := 1
        ValueAttachmentMP5 := 1
        ValueAttachmentTH := 1
        ValueAttachmentM249 := 1
        ValueAttachmentM92 := 1
        ValueAttachmentPyt := 1
        ValueAttachmentRev := 1
        If (VScope = "None") {
            ValueScope := 1
        }
        If (VScope = "8x Zoom Scope") {
            ValueScope := 3.85
        }
        If (VScope = "16x Zoom Scope") {
            ValueScope := 7.7
        }
        If (VScope = "Holosight") {
            ValueScope := 1.2
        }
        If (VScope = "Simple Handmade Sight") {
            ValueScope := 0.8
        }
        if (RustHelper = 1) {
            GuiControl,, RustHelper, 0
            state := false
            sleep, 10
            GuiControl,, RustHelper, 1
            state := true
        }
    return

    BSense:
        Gui, submit, nohide
        if (RustHelper = 1) {
            GuiControl,, RustHelper, 0
            state := false
            sleep, 10
            GuiControl,, RustHelper, 1
            state := true
        }
    return

    BHwid:
        Run, https://t.me/x_vorost
    return

    Dev:
        Run, https://vk.com/x_vorost
    return

    Discord:
        Run, https://discord.gg/9QwzZ8unqv
    return

    Weapon:
        Gui, Submit, NoHide
    Return

    Mode:
        Gui, Submit, NoHide
    Return

    Numpad0 & ~Numpad3::
    GuiControl, Choose, VScope, 1
    ValueScope := 1
    if (VSounds = 1) {
        SoundPlay, Sounds\None.wav
    }
    if (RustHelper = 1) {
        GuiControl,, RustHelper, 0
        state := false
        sleep, 10
        GuiControl,, RustHelper, 1
        state := true
    }
    return

    Numpad0 & ~Numpad4::
    GuiControl, Choose, VScope, 2
    ValueScope := 3.85
    if (VSounds = 1) {
        SoundPlay, Sounds\8xZoom.wav
    }
    if (RustHelper = 1) {
        GuiControl,, RustHelper, 0
        state := false
        sleep, 10
        GuiControl,, RustHelper, 1
        state := true
    }
    return

    Numpad0 & ~Numpad5::
    GuiControl, Choose, VScope, 3
    ValueScope := 7.7
    if (VSounds = 1) {
        SoundPlay, Sounds\16xZoom.wav
    }
    if (RustHelper = 1) {
        GuiControl,, RustHelper, 0
        state := false
        sleep, 10
        GuiControl,, RustHelper, 1
        state := true
    }
    return

    Numpad0 & ~Numpad6::
    GuiControl, Choose, VScope, 4
    ValueScope := 1.187
    if (VSounds = 1) {
        SoundPlay, Sounds\Holosight.wav
    }
    if (RustHelper = 1) {
        GuiControl,, RustHelper, 0
        state := false
        sleep, 10
        GuiControl,, RustHelper, 1
        state := true
    }
    return

    Numpad0 & ~Numpad7::
    GuiControl, Choose, VScope, 5
    ValueScope := 0.8
    if (VSounds = 1) {
        SoundPlay, Sounds\SimpleSight.wav
    }
    if (RustHelper = 1) {
        GuiControl,, RustHelper, 0
        state := false
        sleep, 10
        GuiControl,, RustHelper, 1
        state := true
    }
    return

    Numpad0 & ~Numpad1::
    GuiControl, Choose, VAttachment, 1
    ValueAttachment := 1
    if (VSounds = 1) {
        SoundPlay, Sounds\None.wav
    }
    if (RustHelper = 1) {
        GuiControl,, RustHelper, 0
        state := false
        sleep, 10
        GuiControl,, RustHelper, 1
        state := true
    }
    return

    Numpad0 & ~Numpad2::
    GuiControl, Choose, VAttachment, 2
    ValueAttachment := 0.8
    if (VSounds = 1) {
        SoundPlay, Sounds\Silencer.wav
    }
    if (RustHelper = 1) {
        GuiControl,, RustHelper, 0
        state := false
        sleep, 10
        GuiControl,, RustHelper, 1
        state := true
    }
    return

    Alt & ~F1::
    GuiControl, Choose, VMode, 1
    VMode := "Rapid Fire"
    if (VSounds = 1) {
        SoundPlay, Sounds\RapidFireMode.wav
    }
    return

    Alt & ~F2::
    GuiControl, Choose, VMode, 2
    VMode := "Standard (only *)"
    if (VSounds = 1) {
        SoundPlay, Sounds\StandardMode.wav
    }
    return

    LCtrl & ~F1::
    GuiControl, Choose, VWeapon, 1
    VWeapon := "[F1] AK47 (better) *"
    if (VSounds = 1) {
        SoundPlay, Sounds\AK-47.wav
    }
    return

    Shift & ~F1::
    GuiControl, Choose, VWeapon, 2
    VWeapon := "[F1] AK47 * (no scope)"
    if (VSounds = 1) {
        SoundPlay, Sounds\AK-47.wav
    }
    return

    Shift & ~F2::
    GuiControl, Choose, VWeapon, 3
    VWeapon := "[F2] LR-300 *"
    if (VSounds = 1) {
        SoundPlay, Sounds\LR-300.wav
    }
    return

    Shift & ~F3::
    GuiControl, Choose, VWeapon, 4
    VWeapon := "[F3] S-A Rifle"
    if (VSounds = 1) {
        SoundPlay, Sounds\S-A_Rifle.wav
    }
    return

    Shift & ~F4::
    GuiControl, Choose, VWeapon, 5
    VWeapon := "[F4] M39 (no scope)"
    if (VSounds = 1) {
        SoundPlay, Sounds\M39.wav
    }
    return

    Shift & ~F5::
    GuiControl, Choose, VWeapon, 6
    VWeapon := "[F5] SMG * (no scope)"
    if (VSounds = 1) {
        SoundPlay, Sounds\SMG.wav
    }
    return

    Shift & ~F6::
    GuiControl, Choose, VWeapon, 7
    VWeapon := "[F6] MP5A4 *"
    if (VSounds = 1) {
        SoundPlay, Sounds\MP5.wav
    }
    return

    Shift & ~F7::
    GuiControl, Choose, VWeapon, 8
    VWeapon := "[F7] Thompson * (no scope)"
    if (VSounds = 1) {
        SoundPlay, Sounds\Thompson.wav
    }
    return

    Shift & ~F8::
    GuiControl, Choose, VWeapon, 9
    VWeapon := "[F8] M249"
    if (VSounds = 1) {
        SoundPlay, Sounds\M249.wav
    }
    return

    Shift & ~F9::
    GuiControl, Choose, VWeapon, 10
    VWeapon := "[F9] M92 Pistol (no scope)"
    if (VSounds = 1) {
        SoundPlay, Sounds\M92_Pistol.wav
    }
    return

    Shift & ~F10::
    GuiControl, Choose, VWeapon, 11
    VWeapon := "[F10] Python (no scope)"
    if (VSounds = 1) {
        SoundPlay, Sounds\Python.wav
    }
    return

    Shift & ~F11::
    GuiControl, Choose, VWeapon, 12
    VWeapon := "[F11] S-A Pistol (no scope)"
    if (VSounds = 1) {
        SoundPlay, Sounds\S-A_Pistol.wav
    }
    return

    Shift & ~F12::
    GuiControl, Choose, VWeapon, 13
    VWeapon := "[F12] Revolver"
    if (VSounds = 1) {
        SoundPlay, Sounds\Revolver.wav
    }
    return

    End::
        reload

    ~$*Ins::
        if (auth == "done") {
            Gui, submit, nohide
            state := true
            if (VAttachment = "None") {
                ValueAttachment := 1
            }
            If (VAttachmentAK = "None") {
                ValueAttachmentAK := 1
            }
            If (VAttachmentLR = "None") {
                ValueAttachmentLR := 1
            }
            If (VAttachmentSAR = "None") {
                ValueAttachmentSAR := 1
            }
            If (VAttachmentM39 = "None") {
                ValueAttachmentM39 := 1
            }
            If (VAttachmentSMG = "None") {
                ValueAttachmentSMG := 1
            }
            If (VAttachmentMP5 = "None") {
                ValueAttachmentMP5 := 1
            }
            If (VAttachmentTH = "None") {
                ValueAttachmentTH := 1
            }
            If (VAttachmentM249 = "None") {
                ValueAttachmentM249 := 1
            }
            If (VAttachmentM92 = "None") {
                ValueAttachmentM92 := 1
            }
            If (VAttachmentPyt = "None") {
                ValueAttachmentPyt := 1
            }
            If (VAttachmentRev = "None") {
                ValueAttachmentRev := 1
            }
            if (VScope = "None") {
                ValueScope := 1
            }
            If (VScopeAK = "None") {
                ValueScopeAK := 1
            }
            If (VScopeLR = "None") {
                ValueScopeLR := 1
            }
            If (VScopeSAR = "None") {
                ValueScopeSAR := 1
            }
            If (VScopeM39 = "None") {
                ValueScopeM39 := 1
            }
            If (VScopeSMG = "None") {
                ValueScopeSMG := 1
            }
            If (VScopeMP5 = "None") {
                ValueScopeMP5 := 1
            }
            If (VScopeTH = "None") {
                ValueScopeTH := 1
            }
            If (VScopeM249 = "None") {
                ValueScopeM249 := 1
            }
            If (VScopeM92 = "None") {
                ValueScopeM92 := 1
            }
            If (VScopePyt = "None") {
                ValueScopePyt := 1
            }
            If (VScopeRev = "None") {
                ValueScopeRev := 1
            }
            GuiControl,, RustHelper, 1
            SoundPlay, Sounds\Activated.wav
            return

    #If (state = true)
        {
            ~$*Ins::
                Gui, submit, nohide
                state := false
                GuiControl,, RustHelper, 0
                SoundPlay, Sounds\Deactivated.wav
            return
        }
    }
        return

        GuiClose:
        ExitApp
        return

    }

~RButton & ~LButton::
ifWinActive, ahk_class UnityWndClass
{
    if (RustHelper = 1 || state == true) {
        global ValueAttachment
        if (VMode = "Rapid Fire") {
            if (VWeapon = "[F1] AK47 * (no scope)") {
                while (GetKeyState("LButton", "p")) {
                    checkAK:
                        If GetKeyState("LButton", "p") {
                            send, {LButton Down}
                            Sleep, 6
                            mouseXY(-17/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,25/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                            send, {LButton Up}
                            sleep, 280
                            goto checkAK
                        }
                    }
                }
            if (VWeapon = "[F2] LR-300 *") {
                while (GetKeyState("LButton", "p")) {
                    checkLR:
                        If GetKeyState("LButton", "p") {
                            send, {LButton Down}
                            Sleep, 6
                            mouseXY(-1.15/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR,12/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR)
                            send, {LButton Up}
                            sleep, 250
                            goto checkLR
                        }
                    }
                }
            if (VWeapon = "[F5] SMG * (no scope)") {
                while (GetKeyState("LButton", "p")) {
                    checkSMG:
                        If GetKeyState("LButton", "p") {
                            send, {LButton Down}
                            Sleep, 6
                            mouseXY(-6/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG,13/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG)
                            send, {LButton Up}
                            sleep, 200
                            goto checkSMG
                        }
                    }
                }
            if (VWeapon = "[F6] MP5A4 *") {
                while (GetKeyState("LButton", "p")) {
                    checkMP5:
                        If GetKeyState("LButton", "p") {
                            send, {LButton Down}
                            Sleep, 6
                            mouseXY(0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5,11/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5)
                            send, {LButton Up}
                            sleep, 220
                            goto checkMP5
                        }
                    }
                }
            if (VWeapon = "[F7] Thompson * (no scope)") {
                while (GetKeyState("LButton", "p")) {
                    checkThompson:
                        If GetKeyState("LButton", "p") {
                            send, {LButton Down}
                            Sleep, 6
                            mouseXY(-7/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH,16/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH)
                            send, {LButton Up}
                            sleep, 260
                            goto checkThompson
                        }
                    }
                }
            if (VWeapon = "[F8] M249") {
                while (GetKeyState("LButton", "p")) {
                    checkM249:
                        If GetKeyState("LButton", "p") {
                            send, {LButton Down}
                            Sleep, 6
                            mouseXY(0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentM249*ValueScopeM249,15/ValueSense*ValueAttachment*ValueScope*ValueAttachmentM249*ValueScopeM249)
                            send, {LButton Up}
                            sleep, 180
                            goto checkM249
                        }
                    }
                }
        } else {
            if (VWeapon = "[Ctrl+F1] AK47 (better) *") {
                ;2 (29) 1
                If GetKeyState("LButton", "p") {
                    Sleep, 6
                    mouseXY(-17/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,25/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                    sleep, 120
                } else return
                    ;3 (28) 2
                    If GetKeyState("LButton", "p") {
                        Sleep, 6
                        mouseXY(3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,23/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                        sleep, 120
                    } else return
                        ;4 (27) 3
                        If GetKeyState("LButton", "p") {
                            Sleep, 6
                            mouseXY(-27/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,19/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                            sleep, 120
                        } else return
                            ;5 (26) 4
                            If GetKeyState("LButton", "p") {
                                Sleep, 6
                                mouseXY(-23/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,19/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                                sleep, 120
                            } else return
                                ;6 (25) 5
                                If GetKeyState("LButton", "p") {
                                    Sleep, 6
                                    mouseXY(2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,16/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                                    sleep, 120
                                } else return
                                    ;7 (24) 6
                                    If GetKeyState("LButton", "p") {
                                        Sleep, 6
                                        mouseXY(5/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,14/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                                        sleep, 120
                                    } else return
                                        ;8 (23) 7
                                        If GetKeyState("LButton", "p") {
                                            Sleep, 6
                                            mouseXY(14/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,12/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                                            sleep, 115
                                        } else return
                                            ;9 (22) 8
                                            If GetKeyState("LButton", "p") {
                                                Sleep, 6
                                                mouseXY(19/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,10/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                                                sleep, 100
                                            } else return
                                                ;10 (21) 9
                                                If GetKeyState("LButton", "p") {
                                                    Sleep, 6
                                                    mouseXY(21/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,6/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                                                    sleep, 120
                                                } else return
                                                    ;11 (20) 10
                                                    If GetKeyState("LButton", "p") {
                                                        Sleep, 6
                                                        mouseXY(21/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,6/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                                                        sleep, 100
                                                    } else return
                                                        ;12 (19) 11
                                                        If GetKeyState("LButton", "p") {
                                                            Sleep, 6
                                                            mouseXY(20/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,4/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                                                            sleep, 120
                                                        } else return
                                                            ;13 (18) 12
                                                            If GetKeyState("LButton", "p") {
                                                                Sleep, 6
                                                                mouseXY(14/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,10/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                                                                sleep, 100
                                                            } else return
                                                                ;14 (17) 13
                                                                If GetKeyState("LButton", "p") {
                                                                    Sleep, 6
                                                                    mouseXY(9/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,14/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                                                                    sleep, 120
                                                                } else return
                                                                    ;15 (16) 14
                                                                    If GetKeyState("LButton", "p") {
                                                                        Sleep, 6
                                                                        mouseXY(-1/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,12/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                                                                        sleep, 100
                                                                    } else return
                                                                        ;16 (15) 15
                                                                        If GetKeyState("LButton", "p") {
                                                                            Sleep, 6
                                                                            mouseXY(-5/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,15/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                                                                            sleep, 120
                                                                        } else return
                                                                            ;17 (14) 16
                                                                            If GetKeyState("LButton", "p") {
                                                                                Sleep, 6
                                                                                mouseXY(-12/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,16/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                                                                                sleep, 100
                                                                            } else return
                                                                                ;18 (13) 17
                                                                                If GetKeyState("LButton", "p") {
                                                                                    Sleep, 6
                                                                                    mouseXY(-18/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,16/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                                                                                    sleep, 120
                                                                                } else return
                                                                                    ;19 (12) 18
                                                                                    If GetKeyState("LButton", "p") {
                                                                                        Sleep, 6
                                                                                        mouseXY(-20/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,16/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                                                                                        sleep, 100
                                                                                    } else return
                                                                                        ;20 (11) 19
                                                                                        If GetKeyState("LButton", "p") {
                                                                                            Sleep, 6
                                                                                            mouseXY(-22/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,11/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                                                                                            sleep, 120
                                                                                        } else return
                                                                                            ;21 (10) 20
                                                                                            If GetKeyState("LButton", "p") {
                                                                                                Sleep, 6
                                                                                                mouseXY(-20/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,6/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                                                                                                sleep, 100
                                                                                            } else return
                                                                                                ;22 (9) 21
                                                                                                If GetKeyState("LButton", "p") {
                                                                                                    Sleep, 6
                                                                                                    mouseXY(-24/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,7/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                                                                                                    sleep, 120
                                                                                                } else return
                                                                                                    ;23 (8) 22
                                                                                                    If GetKeyState("LButton", "p") {
                                                                                                        Sleep, 6
                                                                                                        mouseXY(-20/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,1/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                                                                                                        sleep, 100
                                                                                                    } else return
                                                                                                        ;24 (7) 23
                                                                                                        If GetKeyState("LButton", "p") {
                                                                                                            Sleep, 6
                                                                                                            mouseXY(-14/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,12/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                                                                                                            sleep, 120
                                                                                                        } else return
                                                                                                            ;25 (6) 24
                                                                                                            If GetKeyState("LButton", "p") {
                                                                                                                Sleep, 6
                                                                                                                mouseXY(-3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,8/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                                                                                                                sleep, 100
                                                                                                            } else return
                                                                                                                ;26 (5) 25
                                                                                                                If GetKeyState("LButton", "p") {
                                                                                                                    Sleep, 6
                                                                                                                    mouseXY(6/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,12/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                                                                                                                    sleep, 120
                                                                                                                } else return
                                                                                                                    ;27 (4) 26
                                                                                                                    If GetKeyState("LButton", "p") {
                                                                                                                        Sleep, 6
                                                                                                                        mouseXY(16/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,13/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                                                                                                                        sleep, 100
                                                                                                                    } else return
                                                                                                                        ;28 (3) 27
                                                                                                                        If GetKeyState("LButton", "p") {
                                                                                                                            Sleep, 6
                                                                                                                            mouseXY(22/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,14/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                                                                                                                            sleep, 120
                                                                                                                        } else return
                                                                                                                            ;29 (2) 28
                                                                                                                            If GetKeyState("LButton", "p") {
                                                                                                                                Sleep, 6
                                                                                                                                mouseXY(24/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,14/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                                                                                                                                sleep, 100
                                                                                                                            } else return
                                                                                                                                ;30 (1) 29
                                                                                                                                If GetKeyState("LButton", "p") {
                                                                                                                                    Sleep, 6
                                                                                                                                    mouseXY(24/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,14/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                                                                                                                                } else return
                                                                                                                                }
            if (VWeapon = "[F1] AK47 * (no scope)") {
                Loop 8

                    If GetKeyState("LButton", "p") {
                        Sleep, 6
                        mouseXY(-2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                    }
                    else
                        break
                Loop 8
                    If GetKeyState("LButton", "p") {
                        Sleep, 6
                        mouseXY(0.7/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                    }
                    else
                        break
                Loop 8
                    If GetKeyState("LButton", "p") {
                        Sleep, 6
                        mouseXY(-3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                    }
                    else
                        break
                Loop 8
                    If GetKeyState("LButton", "p") {
                        Sleep, 6
                        mouseXY(-3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                    }
                    else
                        break
                Loop 8
                    If GetKeyState("LButton", "p") {
                        Sleep, 6
                        mouseXY(0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                    }
                    else
                        break
                Loop 8
                    If GetKeyState("LButton", "p") {
                        Sleep, 6
                        mouseXY(1/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                    }
                    else
                        break
                Loop 8
                    If GetKeyState("LButton", "p") {
                        Sleep, 6
                        mouseXY(1.5/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,1.5/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                    }
                    else
                        break
                Loop 8
                    If GetKeyState("LButton", "p") {
                        Sleep, 6
                        mouseXY(2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,1/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                    }
                    else
                        break
                Loop 8
                    If GetKeyState("LButton", "p") {
                        Sleep, 6
                        mouseXY(3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,1/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                    }
                    else
                        break
                Loop 8
                    If GetKeyState("LButton", "p") {
                        Sleep, 6
                        mouseXY(2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                    }
                    else
                        break
                Loop 8
                    If GetKeyState("LButton", "p") {
                        Sleep, 6
                        mouseXY(3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,1/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                    }
                    else
                        break
                Loop 8
                    If GetKeyState("LButton", "p") {
                        Sleep, 6
                        mouseXY(2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,1/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                    }
                    else
                        break
                Loop 8
                    If GetKeyState("LButton", "p") {
                        Sleep, 6
                        mouseXY(1/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,1/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                    }
                    else
                        break
                Loop 8
                    If GetKeyState("LButton", "p") {
                        Sleep, 6
                        mouseXY(1/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,1/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                    }
                    else
                        break
                Loop 8
                    If GetKeyState("LButton", "p") {
                        Sleep, 6
                        mouseXY(0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,1.5/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                    }
                    else
                        break
                Loop 8
                    If GetKeyState("LButton", "p") {
                        Sleep, 6
                        mouseXY(-1.8/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,2.5/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                    }
                    else
                        break
                Loop 8
                    If GetKeyState("LButton", "p") {
                        Sleep, 6
                        mouseXY(-1.8/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,2.5/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                    }
                    else
                        break
                Loop 8
                    If GetKeyState("LButton", "p") {
                        Sleep, 6
                        mouseXY(-2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,2.5/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                    }
                    else
                        break
                Loop 8
                    If GetKeyState("LButton", "p") {
                        Sleep, 6
                        mouseXY(-2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                    }
                    else
                        break
                Loop 8
                    If GetKeyState("LButton", "p") {
                        Sleep, 6
                        mouseXY(-4/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,1.2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                    }
                    else
                        break
                Loop 8
                    If GetKeyState("LButton", "p") {
                        Sleep, 6
                        mouseXY(-3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,1.5/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                    }
                    else
                        break
                Loop 8
                    If GetKeyState("LButton", "p") {
                        Sleep, 6
                        mouseXY(-2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,1/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                    }
                    else
                        break
                Loop 8
                    If GetKeyState("LButton", "p") {
                        Sleep, 6
                        mouseXY(-1/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,1/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                    }
                    else
                        break
                Loop 8
                    If GetKeyState("LButton", "p") {
                        Sleep, 6
                        mouseXY(-2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                    }
                    else
                        break
                Loop 8
                    If GetKeyState("LButton", "p") {
                        Sleep, 6
                        mouseXY(-2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                    }
                    else
                        break
                Loop 8
                    If GetKeyState("LButton", "p") {
                        Sleep, 6
                        mouseXY(1/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                    }
                    else
                        break
                Loop 8
                    If GetKeyState("LButton", "p") {
                        Sleep, 6
                        mouseXY(1/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                    }
                    else
                        break
                Loop 8
                    If GetKeyState("LButton", "p") {
                        Sleep, 6
                        mouseXY(3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,1/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                    }
                    else
                        break
                Loop 8
                    If GetKeyState("LButton", "p") {
                        Sleep, 6
                        mouseXY(5/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK,2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentAK*ValueScopeAK)
                    }
                    else
                        break
                }
            if (VWeapon = "[F2] LR-300 *") {
                Loop 1 ;2 (29)
                    If GetKeyState("LButton", "p") {
                        Sleep, 6
                        mouseXY(-1.15/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR,12/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR)
                        sleep, 100
                    } else Break
                        Loop 1 ;3 (28)
                            If GetKeyState("LButton", "p") {
                                Sleep, 6
                                mouseXY(-4/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR,14/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR)
                                sleep, 100
                            } else Break
                                Loop 1 ;4 (27)
                                    If GetKeyState("LButton", "p") {
                                        Sleep, 6
                                        mouseXY(-6/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR,17/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR)
                                        sleep, 100
                                    } else Break
                                        Loop 1 ;5 (26)
                                            If GetKeyState("LButton", "p") {
                                                Sleep, 6
                                                mouseXY(-6/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR,17/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR)
                                                sleep, 100
                                            } else Break
                                                Loop 1 ;6 (25)
                                                    If GetKeyState("LButton", "p") {
                                                        Sleep, 6
                                                        mouseXY(-8/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR,18/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR)
                                                        sleep, 100
                                                    } else Break
                                                        Loop 1 ;7 (24)
                                                            If GetKeyState("LButton", "p") {
                                                                Sleep, 6
                                                                mouseXY(-5/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR,2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR)
                                                                sleep, 100
                                                            } else Break
                                                                Loop 1 ;8 (23)
                                                                    If GetKeyState("LButton", "p") {
                                                                        Sleep, 6
                                                                        mouseXY(-4/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR,10/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR)
                                                                        sleep, 100
                                                                    } else Break
                                                                        Loop 1 ;9 (22)
                                                                            If GetKeyState("LButton", "p") {
                                                                                Sleep, 6
                                                                                mouseXY(0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR,5/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR)
                                                                                sleep, 100
                                                                            } else Break
                                                                                Loop 1 ;10 (21)
                                                                                    If GetKeyState("LButton", "p") {
                                                                                        Sleep, 6
                                                                                        mouseXY(0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR,7/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR)
                                                                                        sleep, 100
                                                                                    } else Break
                                                                                        Loop 1 ;11 (20)
                                                                                            If GetKeyState("LButton", "p") {
                                                                                                Sleep, 6
                                                                                                mouseXY(7/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR,5/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR)
                                                                                                sleep, 100
                                                                                            } else Break
                                                                                                Loop 1 ;12 (19)
                                                                                                    If GetKeyState("LButton", "p") {
                                                                                                        Sleep, 6
                                                                                                        mouseXY(12/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR,5/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR)
                                                                                                        sleep, 100
                                                                                                    } else Break
                                                                                                        Loop 1 ;13 (18)
                                                                                                            If GetKeyState("LButton", "p") {
                                                                                                                Sleep, 6
                                                                                                                mouseXY(10/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR,5/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR)
                                                                                                                sleep, 100
                                                                                                            } else Break
                                                                                                                Loop 1 ;14 (17)
                                                                                                                    If GetKeyState("LButton", "p") {
                                                                                                                        Sleep, 6
                                                                                                                        mouseXY(4/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR,1/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR)
                                                                                                                        sleep, 100
                                                                                                                    } else Break
                                                                                                                        Loop 1 ;15 (16)
                                                                                                                            If GetKeyState("LButton", "p") {
                                                                                                                                Sleep, 6
                                                                                                                                mouseXY(3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR,2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR)
                                                                                                                                sleep, 100
                                                                                                                            } else Break
                                                                                                                                Loop 1 ;16 (15)
                                                                                                                                    If GetKeyState("LButton", "p") {
                                                                                                                                        Sleep, 6
                                                                                                                                        mouseXY(-4/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR,3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR)
                                                                                                                                        sleep, 100
                                                                                                                                    } else Break
                                                                                                                                        Loop 1 ;17 (14)
                                                                                                                                            If GetKeyState("LButton", "p") {
                                                                                                                                                Sleep, 6
                                                                                                                                                mouseXY(-7/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR,3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR)
                                                                                                                                                sleep, 100
                                                                                                                                            } else Break
                                                                                                                                                Loop 1 ;18 (13)
                                                                                                                                                    If GetKeyState("LButton", "p") {
                                                                                                                                                        Sleep, 6
                                                                                                                                                        mouseXY(-4/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR,0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR)
                                                                                                                                                        sleep, 100
                                                                                                                                                    } else Break
                                                                                                                                                        Loop 1 ;19 (12)
                                                                                                                                                            If GetKeyState("LButton", "p") {
                                                                                                                                                                Sleep, 6
                                                                                                                                                                mouseXY(-7/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR,1/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR)
                                                                                                                                                                sleep, 100
                                                                                                                                                            } else Break
                                                                                                                                                                Loop 1 ;20 (11)
                                                                                                                                                                    If GetKeyState("LButton", "p") {
                                                                                                                                                                        Sleep, 6
                                                                                                                                                                        mouseXY(-6/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR,2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR)
                                                                                                                                                                        sleep, 100
                                                                                                                                                                    } else Break
                                                                                                                                                                        Loop 1 ;21 (10)
                                                                                                                                                                            If GetKeyState("LButton", "p") {
                                                                                                                                                                                Sleep, 6
                                                                                                                                                                                mouseXY(-9/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR,2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR)
                                                                                                                                                                                sleep, 100
                                                                                                                                                                            } else Break
                                                                                                                                                                                Loop 1 ;22 (9)
                                                                                                                                                                                    If GetKeyState("LButton", "p") {
                                                                                                                                                                                        Sleep, 6
                                                                                                                                                                                        mouseXY(-12/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR,4/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR)
                                                                                                                                                                                        sleep, 100
                                                                                                                                                                                    } else Break
                                                                                                                                                                                        Loop 1 ;23 (8)
                                                                                                                                                                                            If GetKeyState("LButton", "p") {
                                                                                                                                                                                                Sleep, 6
                                                                                                                                                                                                mouseXY(-5/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR,0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR)
                                                                                                                                                                                                sleep, 100
                                                                                                                                                                                            } else Break
                                                                                                                                                                                                Loop 1 ;24 (7)
                                                                                                                                                                                                    If GetKeyState("LButton", "p") {
                                                                                                                                                                                                        Sleep, 6
                                                                                                                                                                                                        mouseXY(-12/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR,0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR)
                                                                                                                                                                                                        sleep, 100
                                                                                                                                                                                                    } else Break
                                                                                                                                                                                                        Loop 1 ;25 (6)
                                                                                                                                                                                                            If GetKeyState("LButton", "p") {
                                                                                                                                                                                                                Sleep, 6
                                                                                                                                                                                                                mouseXY(-1/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR,0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR)
                                                                                                                                                                                                                sleep, 100
                                                                                                                                                                                                            } else Break
                                                                                                                                                                                                                Loop 1 ;26 (5)
                                                                                                                                                                                                                    If GetKeyState("LButton", "p") {
                                                                                                                                                                                                                        Sleep, 6
                                                                                                                                                                                                                        mouseXY(4/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR,5/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR)
                                                                                                                                                                                                                        sleep, 100
                                                                                                                                                                                                                    } else Break
                                                                                                                                                                                                                        Loop 1 ;27 (4)
                                                                                                                                                                                                                            If GetKeyState("LButton", "p") {
                                                                                                                                                                                                                                Sleep, 6
                                                                                                                                                                                                                                mouseXY(9/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR,0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR)
                                                                                                                                                                                                                                sleep, 100
                                                                                                                                                                                                                            } else Break
                                                                                                                                                                                                                                Loop 1 ;28 (3)
                                                                                                                                                                                                                                    If GetKeyState("LButton", "p") {
                                                                                                                                                                                                                                        Sleep, 6
                                                                                                                                                                                                                                        mouseXY(18/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR,4/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR)
                                                                                                                                                                                                                                        sleep, 100
                                                                                                                                                                                                                                    } else Break
                                                                                                                                                                                                                                        Loop 1 ;29 (2)
                                                                                                                                                                                                                                            If GetKeyState("LButton", "p") {
                                                                                                                                                                                                                                                Sleep, 6
                                                                                                                                                                                                                                                mouseXY(22/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR,0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR)
                                                                                                                                                                                                                                                sleep, 100
                                                                                                                                                                                                                                            } else Break
                                                                                                                                                                                                                                                Loop 1 ;30 (1)
                                                                                                                                                                                                                                                    If GetKeyState("LButton", "p") {
                                                                                                                                                                                                                                                        Sleep, 6
                                                                                                                                                                                                                                                        mouseXY(20/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR,2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentLR*ValueScopeLR)
                                                                                                                                                                                                                                                        sleep, 100
                                                                                                                                                                                                                                                    } else Break
                                                                                                                                                                                                                                                    }
            if (VWeapon = "[F6] MP5A4 *") {
                ;2 (29) 1
                If GetKeyState("LButton", "p") {
                    Sleep, 6
                    mouseXY(0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5,11/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5)
                    sleep, 94
                } else return
                    ;3 (28) 2
                    If GetKeyState("LButton", "p") {
                        Sleep, 6
                        mouseXY(1/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5,13/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5)
                        sleep, 94
                    } else return
                        ;4 (27) 3
                        If GetKeyState("LButton", "p") {
                            Sleep, 6
                            mouseXY(0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5,14/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5)
                            sleep, 94
                        } else return
                            ;5 (26) 4
                            If GetKeyState("LButton", "p") {
                                Sleep, 6
                                mouseXY(4/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5,18/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5)
                                sleep, 94
                            } else return
                                ;6 (25) 5
                                If GetKeyState("LButton", "p") {
                                    Sleep, 6
                                    mouseXY(14/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5,19/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5)
                                    sleep, 94
                                } else return
                                    ;7 (24) 6
                                    If GetKeyState("LButton", "p") {
                                        Sleep, 6
                                        mouseXY(16/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5,12/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5)
                                        sleep, 90
                                    } else return
                                        ;8 (23) 7
                                        If GetKeyState("LButton", "p") {
                                            Sleep, 6
                                            mouseXY(17/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5,6/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5)
                                            sleep, 94
                                        } else return
                                            ;9 (22) 8
                                            If GetKeyState("LButton", "p") {
                                                Sleep, 6
                                                mouseXY(0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5,4/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5)
                                                sleep, 90
                                            } else return
                                                ;10 (21) 9
                                                If GetKeyState("LButton", "p") {
                                                    Sleep, 6
                                                    mouseXY(-14/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5,6/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5)
                                                    sleep, 80
                                                } else return
                                                    ;11 (20) 10
                                                    If GetKeyState("LButton", "p") {
                                                        Sleep, 6
                                                        mouseXY(-16/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5,4/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5)
                                                        sleep, 90
                                                    } else return
                                                        ;12 (19) 11
                                                        If GetKeyState("LButton", "p") {
                                                            Sleep, 6
                                                            mouseXY(-6/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5,2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5)
                                                            sleep, 94
                                                        } else return
                                                            ;13 (18) 12
                                                            If GetKeyState("LButton", "p") {
                                                                Sleep, 6
                                                                mouseXY(0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5,4/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5)
                                                                sleep, 94
                                                            } else return
                                                                ;14 (17) 13
                                                                If GetKeyState("LButton", "p") {
                                                                    Sleep, 6
                                                                    mouseXY(6/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5,0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5)
                                                                    sleep, 80
                                                                } else return
                                                                    ;15 (16) 14
                                                                    If GetKeyState("LButton", "p") {
                                                                        Sleep, 6
                                                                        mouseXY(8/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5,4/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5)
                                                                        sleep, 94
                                                                    } else return
                                                                        ;16 (15) 15
                                                                        If GetKeyState("LButton", "p") {
                                                                            Sleep, 6
                                                                            mouseXY(6/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5,3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5)
                                                                            sleep, 80
                                                                        } else return
                                                                            ;17 (14) 16
                                                                            If GetKeyState("LButton", "p") {
                                                                                Sleep, 6
                                                                                mouseXY(10/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5,1/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5)
                                                                                sleep, 94
                                                                            } else return
                                                                                ;18 (13) 17
                                                                                If GetKeyState("LButton", "p") {
                                                                                    Sleep, 6
                                                                                    mouseXY(8/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5,2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5)
                                                                                    sleep, 80
                                                                                } else return
                                                                                    ;19 (12) 18
                                                                                    If GetKeyState("LButton", "p") {
                                                                                        Sleep, 6
                                                                                        mouseXY(-3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5,0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5)
                                                                                        sleep, 94
                                                                                    } else return
                                                                                        ;20 (11) 19
                                                                                        If GetKeyState("LButton", "p") {
                                                                                            Sleep, 6
                                                                                            mouseXY(0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5,0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5)
                                                                                            sleep, 80
                                                                                        } else return
                                                                                            ;21 (10) 20
                                                                                            If GetKeyState("LButton", "p") {
                                                                                                Sleep, 6
                                                                                                mouseXY(-4/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5,3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5)
                                                                                                sleep, 94
                                                                                            } else return
                                                                                                ;22 (9) 21
                                                                                                If GetKeyState("LButton", "p") {
                                                                                                    Sleep, 6
                                                                                                    mouseXY(-2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5,0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5)
                                                                                                    sleep, 90
                                                                                                } else return
                                                                                                    ;23 (8) 22
                                                                                                    If GetKeyState("LButton", "p") {
                                                                                                        Sleep, 6
                                                                                                        mouseXY(-6/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5,0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5)
                                                                                                        sleep, 80
                                                                                                    } else return
                                                                                                        ;24 (7) 23
                                                                                                        If GetKeyState("LButton", "p") {
                                                                                                            Sleep, 6
                                                                                                            mouseXY(-5/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5,0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5)
                                                                                                            sleep, 80
                                                                                                        } else return
                                                                                                            ;25 (6) 24
                                                                                                            If GetKeyState("LButton", "p") {
                                                                                                                Sleep, 6
                                                                                                                mouseXY(-8/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5,-2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5)
                                                                                                                sleep, 80
                                                                                                            } else return
                                                                                                                ;26 (5) 25
                                                                                                                If GetKeyState("LButton", "p") {
                                                                                                                    Sleep, 6
                                                                                                                    mouseXY(-6/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5,2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5)
                                                                                                                    sleep, 80
                                                                                                                } else return
                                                                                                                    ;27 (4) 26
                                                                                                                    If GetKeyState("LButton", "p") {
                                                                                                                        Sleep, 6
                                                                                                                        mouseXY(-8/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5,0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5)
                                                                                                                        sleep, 80
                                                                                                                    } else return
                                                                                                                        ;28 (3) 27
                                                                                                                        If GetKeyState("LButton", "p") {
                                                                                                                            Sleep, 6
                                                                                                                            mouseXY(-3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5,0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5)
                                                                                                                            sleep, 80
                                                                                                                        } else return
                                                                                                                            ;29 (2) 28
                                                                                                                            If GetKeyState("LButton", "p") {
                                                                                                                                Sleep, 6
                                                                                                                                mouseXY(-2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5,0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5)
                                                                                                                                sleep, 80
                                                                                                                            } else return
                                                                                                                                ;30 (1) 29
                                                                                                                                If GetKeyState("LButton", "p") {
                                                                                                                                    Sleep, 6
                                                                                                                                    mouseXY(-2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5,0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentMP5*ValueScopeMP5)
                                                                                                                                } else return
                                                                                                                                }
            if (VWeapon = "[F7] Thompson * (no scope)") {
                ;2 (19) 1
                If GetKeyState("LButton", "p") {
                    Sleep, 6
                    mouseXY(-25*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH,52*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH)
                    sleep, 100
                } else return
                    ;3 (18) 2
                    If GetKeyState("LButton", "p") {
                        Sleep, 6
                        mouseXY(-10*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH,50*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH)
                        sleep, 100
                    } else return
                        ;4 (17) 3
                        If GetKeyState("LButton", "p") {
                            Sleep, 6
                            mouseXY(0*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH,50*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH)
                            sleep, 100
                        } else return
                            ;5 (16) 4
                            If GetKeyState("LButton", "p") {
                                Sleep, 6
                                mouseXY(18*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH,48*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH)
                                sleep, 100
                            } else return
                                ;6 (15) 5
                                If GetKeyState("LButton", "p") {
                                    Sleep, 6
                                    mouseXY(20*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH,42*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH)
                                    sleep, 100
                                } else return
                                    ;7 (14) 6
                                    If GetKeyState("LButton", "p") {
                                        Sleep, 6
                                        mouseXY(23*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH,42*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH)
                                        sleep, 100
                                    } else return
                                        ;8 (13) 7
                                        If GetKeyState("LButton", "p") {
                                            Sleep, 6
                                            mouseXY(8*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH,30*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH)
                                            sleep, 100
                                        } else return
                                            ;9 (12) 8
                                            If GetKeyState("LButton", "p") {
                                                Sleep, 6
                                                mouseXY(-10*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH,24*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH)
                                                sleep, 100
                                            } else return
                                                ;10 (11) 9
                                                If GetKeyState("LButton", "p") {
                                                    Sleep, 6
                                                    mouseXY(-20*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH,26*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH)
                                                    sleep, 100
                                                } else return
                                                    ;11 (10) 10
                                                    If GetKeyState("LButton", "p") {
                                                        Sleep, 6
                                                        mouseXY(-16*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH,16*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH)
                                                        sleep, 100
                                                    } else return
                                                        ;12 (9) 11
                                                        If GetKeyState("LButton", "p") {
                                                            Sleep, 6
                                                            mouseXY(-16*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH,16*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH)
                                                            sleep, 100
                                                        } else return
                                                            ;13 (8) 12
                                                            If GetKeyState("LButton", "p") {
                                                                Sleep, 6
                                                                mouseXY(0*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH,16*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH)
                                                                sleep, 100
                                                            } else return
                                                                ;14 (7) 13
                                                                If GetKeyState("LButton", "p") {
                                                                    Sleep, 6
                                                                    mouseXY(8*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH,20*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH)
                                                                    sleep, 100
                                                                } else return
                                                                    ;15 (6) 14
                                                                    If GetKeyState("LButton", "p") {
                                                                        Sleep, 6
                                                                        mouseXY(8*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH,16*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH)
                                                                        sleep, 100
                                                                    } else return
                                                                        ;16 (5) 15
                                                                        If GetKeyState("LButton", "p") {
                                                                            Sleep, 6
                                                                            mouseXY(25*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH,20*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH)
                                                                            sleep, 100
                                                                        } else return
                                                                            ;17 (4) 16
                                                                            If GetKeyState("LButton", "p") {
                                                                                Sleep, 6
                                                                                mouseXY(25*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH,14*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH)
                                                                                sleep, 100
                                                                            } else return
                                                                                ;18 (3) 17
                                                                                If GetKeyState("LButton", "p") {
                                                                                    Sleep, 6
                                                                                    mouseXY(0*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH,0*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH)
                                                                                    sleep, 100
                                                                                } else return
                                                                                    ;19 (2) 18
                                                                                    If GetKeyState("LButton", "p") {
                                                                                        Sleep, 6
                                                                                        mouseXY(-6*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH,0*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH)
                                                                                        sleep, 100
                                                                                    } else return
                                                                                        ;20 (1) 19
                                                                                        If GetKeyState("LButton", "p") {
                                                                                            Sleep, 6
                                                                                            mouseXY(-7*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH,0*0.3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentTH*ValueScopeTH)
                                                                                            sleep, 100
                                                                                        } else return
                                                                                        }
            if (VWeapon = "[F5] SMG * (no scope)") {
                ;2 (23) 1
                If GetKeyState("LButton", "p") {
                    Sleep, 6
                    mouseXY(-6/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG,13/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG)
                    sleep, 90
                } else return
                    ;3 (22) 2
                    If GetKeyState("LButton", "p") {
                        Sleep, 6
                        mouseXY(-4/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG,13/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG)
                        sleep, 90
                    } else return
                        ;4 (21) 3
                        If GetKeyState("LButton", "p") {
                            Sleep, 6
                            mouseXY(1/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG,12/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG)
                            sleep, 90
                        } else return
                            ;5 (20) 4
                            If GetKeyState("LButton", "p") {
                                Sleep, 6
                                mouseXY(3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG,12/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG)
                                sleep, 90
                            } else return
                                ;6 (19) 5
                                If GetKeyState("LButton", "p") {
                                    Sleep, 6
                                    mouseXY(4/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG,12/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG)
                                    sleep, 90
                                } else return
                                    ;7 (18) 6
                                    If GetKeyState("LButton", "p") {
                                        Sleep, 6
                                        mouseXY(5/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG,12/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG)
                                        sleep, 90
                                    } else return
                                        ;8 (17) 7
                                        If GetKeyState("LButton", "p") {
                                            Sleep, 6
                                            mouseXY(6/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG,14/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG)
                                            sleep, 90
                                        } else return
                                            ;9 (16) 8
                                            If GetKeyState("LButton", "p") {
                                                Sleep, 6
                                                mouseXY(0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG,0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG)
                                                sleep, 90
                                            } else return
                                                ;10 (15) 9
                                                If GetKeyState("LButton", "p") {
                                                    Sleep, 6
                                                    mouseXY(0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG,7/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG)
                                                    sleep, 90
                                                } else return
                                                    ;11 (14) 10
                                                    If GetKeyState("LButton", "p") {
                                                        Sleep, 6
                                                        mouseXY(-5/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG,10/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG)
                                                        sleep, 90
                                                    } else return
                                                        ;12 (13) 11
                                                        If GetKeyState("LButton", "p") {
                                                            Sleep, 6
                                                            mouseXY(-5/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG,0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG)
                                                            sleep, 90
                                                        } else return
                                                            ;13 (12) 12
                                                            If GetKeyState("LButton", "p") {
                                                                Sleep, 6
                                                                mouseXY(-3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG,7/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG)
                                                                sleep, 90
                                                            } else return
                                                                ;14 (11) 13
                                                                If GetKeyState("LButton", "p") {
                                                                    Sleep, 6
                                                                    mouseXY(-5/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG,4/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG)
                                                                    sleep, 90
                                                                } else return
                                                                    ;15 (10) 14
                                                                    If GetKeyState("LButton", "p") {
                                                                        Sleep, 6
                                                                        mouseXY(2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG,2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG)
                                                                        sleep, 90
                                                                    } else return
                                                                        ;16 (9) 15
                                                                        If GetKeyState("LButton", "p") {
                                                                            Sleep, 6
                                                                            mouseXY(0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG,5/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG)
                                                                            sleep, 90
                                                                        } else return
                                                                            ;17 (8) 16
                                                                            If GetKeyState("LButton", "p") {
                                                                                Sleep, 6
                                                                                mouseXY(7/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG,4/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG)
                                                                                sleep, 90
                                                                            } else return
                                                                                ;18 (7) 17
                                                                                If GetKeyState("LButton", "p") {
                                                                                    Sleep, 6
                                                                                    mouseXY(7/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG,6/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG)
                                                                                    sleep, 90
                                                                                } else return
                                                                                    ;19 (6) 18
                                                                                    If GetKeyState("LButton", "p") {
                                                                                        Sleep, 6
                                                                                        mouseXY(0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG,0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG)
                                                                                        sleep, 90
                                                                                    } else return
                                                                                        ;20 (5) 19
                                                                                        If GetKeyState("LButton", "p") {
                                                                                            Sleep, 6
                                                                                            mouseXY(0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG,2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG)
                                                                                            sleep, 90
                                                                                        } else return
                                                                                            ;21 (4) 20
                                                                                            If GetKeyState("LButton", "p") {
                                                                                                Sleep, 6
                                                                                                mouseXY(0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG,2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG)
                                                                                                sleep, 90
                                                                                            } else return
                                                                                                ;22 (3) 21
                                                                                                If GetKeyState("LButton", "p") {
                                                                                                    Sleep, 6
                                                                                                    mouseXY(0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG,2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG)
                                                                                                    sleep, 90
                                                                                                } else return
                                                                                                    ;23 (2) 22
                                                                                                    If GetKeyState("LButton", "p") {
                                                                                                        Sleep, 6
                                                                                                        mouseXY(-2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG,2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG)
                                                                                                        sleep, 90
                                                                                                    } else return
                                                                                                        ;24 (1) 23
                                                                                                        If GetKeyState("LButton", "p") {
                                                                                                            Sleep, 6
                                                                                                            mouseXY(-2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG,2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSMG*ValueScopeSMG)
                                                                                                            sleep, 90
                                                                                                        } else return
                                                                                                        }
                                                                                                }
                                                                                                if (VWeapon = "[F3] S-A Rifle" && (VMode = "Rapid Fire" || VMode = "Standard (only *)")) {
                                                                                                    while (GetKeyState("LButton", "p")) {
                                                                                                        If GetKeyState("LButton", "p") {
                                                                                                            send, {LButton Down}
                                                                                                            Sleep, 6
                                                                                                            mouseXY(1/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSAR*ValueScopeSAR,20/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSAR*ValueScopeSAR)
                                                                                                            send, {LButton Up}
                                                                                                            sleep, 200
                                                                                                            If GetKeyState("LButton", "p") {
                                                                                                                send, {LButton Down}
                                                                                                                Sleep, 6
                                                                                                                mouseXY(0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSAR*ValueScopeSAR,20/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSAR*ValueScopeSAR)
                                                                                                                send, {LButton Up}
                                                                                                                sleep, 200
                                                                                                            }
                                                                                                            If GetKeyState("LButton", "p") {
                                                                                                                send, {LButton Down}
                                                                                                                Sleep, 6
                                                                                                                mouseXY(1/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSAR*ValueScopeSAR,20/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSAR*ValueScopeSAR)
                                                                                                                send, {LButton Up}
                                                                                                                sleep, 200
                                                                                                            }
                                                                                                            If GetKeyState("LButton", "p") {
                                                                                                                send, {LButton Down}
                                                                                                                Sleep, 6
                                                                                                                mouseXY(0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSAR*ValueScopeSAR,20/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSAR*ValueScopeSAR)
                                                                                                                send, {LButton Up}
                                                                                                                sleep, 200
                                                                                                            }
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                                if (VWeapon = "[F4] M39 (no scope)" && (VMode = "Rapid Fire" || VMode = "Standard (only *)")) {
                                                                                                    while (GetKeyState("LButton", "p")) {
                                                                                                        If GetKeyState("LButton", "p") {
                                                                                                            send, {LButton Down}
                                                                                                            Sleep, 6
                                                                                                            mouseXY(1/ValueSense*ValueAttachment*ValueScope*ValueAttachmentM39*ValueScopeM39,17/ValueSense*ValueAttachment*ValueScope*ValueAttachmentM39*ValueScopeM39)
                                                                                                            send, {LButton Up}
                                                                                                            sleep, 200
                                                                                                            If GetKeyState("LButton", "p") {
                                                                                                                send, {LButton Down}
                                                                                                                Sleep, 6
                                                                                                                mouseXY(0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentM39*ValueScopeM39,17/ValueSense*ValueAttachment*ValueScope*ValueAttachmentM39*ValueScopeM39)
                                                                                                                send, {LButton Up}
                                                                                                                sleep, 200
                                                                                                            }
                                                                                                            If GetKeyState("LButton", "p") {
                                                                                                                send, {LButton Down}
                                                                                                                Sleep, 6
                                                                                                                mouseXY(1/ValueSense*ValueAttachment*ValueScope*ValueAttachmentM39*ValueScopeM39,17/ValueSense*ValueAttachment*ValueScope*ValueAttachmentM39*ValueScopeM39)
                                                                                                                send, {LButton Up}
                                                                                                                sleep, 200
                                                                                                            }
                                                                                                            If GetKeyState("LButton", "p") {
                                                                                                                send, {LButton Down}
                                                                                                                Sleep, 6
                                                                                                                mouseXY(0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentM39*ValueScopeM39,17/ValueSense*ValueAttachment*ValueScope*ValueAttachmentM39*ValueScopeM39)
                                                                                                                send, {LButton Up}
                                                                                                                sleep, 200
                                                                                                            }
                                                                                                            If GetKeyState("LButton", "p") {
                                                                                                                send, {LButton Down}
                                                                                                                Sleep, 6
                                                                                                                mouseXY(0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentM39*ValueScopeM39,16/ValueSense*ValueAttachment*ValueScope*ValueAttachmentM39*ValueScopeM39)
                                                                                                                send, {LButton Up}
                                                                                                                sleep, 200
                                                                                                            }
                                                                                                            If GetKeyState("LButton", "p") {
                                                                                                                send, {LButton Down}
                                                                                                                Sleep, 6
                                                                                                                mouseXY(0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentM39*ValueScopeM39,16/ValueSense*ValueAttachment*ValueScope*ValueAttachmentM39*ValueScopeM39)
                                                                                                                send, {LButton Up}
                                                                                                                sleep, 200
                                                                                                            }
                                                                                                            If GetKeyState("LButton", "p") {
                                                                                                                send, {LButton Down}
                                                                                                                Sleep, 6
                                                                                                                mouseXY(-1/ValueSense*ValueAttachment*ValueScope*ValueAttachmentM39*ValueScopeM39,16/ValueSense*ValueAttachment*ValueScope*ValueAttachmentM39*ValueScopeM39)
                                                                                                                send, {LButton Up}
                                                                                                                sleep, 200
                                                                                                            }
                                                                                                            If GetKeyState("LButton", "p") {
                                                                                                                send, {LButton Down}
                                                                                                                Sleep, 6
                                                                                                                mouseXY(-1/ValueSense*ValueAttachment*ValueScope*ValueAttachmentM39*ValueScopeM39,16/ValueSense*ValueAttachment*ValueScope*ValueAttachmentM39*ValueScopeM39)
                                                                                                                send, {LButton Up}
                                                                                                                sleep, 200
                                                                                                            }
                                                                                                            If GetKeyState("LButton", "p") {
                                                                                                                send, {LButton Down}
                                                                                                                Sleep, 6
                                                                                                                mouseXY(-1/ValueSense*ValueAttachment*ValueScope*ValueAttachmentM39*ValueScopeM39,16/ValueSense*ValueAttachment*ValueScope*ValueAttachmentM39*ValueScopeM39)
                                                                                                                send, {LButton Up}
                                                                                                                sleep, 200
                                                                                                            }
                                                                                                            If GetKeyState("LButton", "p") {
                                                                                                                send, {LButton Down}
                                                                                                                Sleep, 6
                                                                                                                mouseXY(-1/ValueSense*ValueAttachment*ValueScope*ValueAttachmentM39*ValueScopeM39,16/ValueSense*ValueAttachment*ValueScope*ValueAttachmentM39*ValueScopeM39)
                                                                                                                send, {LButton Up}
                                                                                                                sleep, 200
                                                                                                            }
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                                if (VWeapon = "[F9] M92 Pistol (no scope)" && (VMode = "Rapid Fire" || VMode = "Standard (only *)")) {
                                                                                                    while (GetKeyState("LButton", "p")) {
                                                                                                        If GetKeyState("LButton", "p") {
                                                                                                            send, {LButton Down}
                                                                                                            Sleep, 6
                                                                                                            mouseXY(0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentM92*ValueScopeM92,3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentM92*ValueScopeM92)
                                                                                                            send, {LButton Up}
                                                                                                            sleep, 20
                                                                                                            If GetKeyState("LButton", "p") {
                                                                                                                send, {LButton Down}
                                                                                                                Sleep, 6
                                                                                                                mouseXY(0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentM92*ValueScopeM92,3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentM92*ValueScopeM92)
                                                                                                                send, {LButton Up}
                                                                                                                sleep, 20
                                                                                                            }
                                                                                                            If GetKeyState("LButton", "p") {
                                                                                                                send, {LButton Down}
                                                                                                                Sleep, 6
                                                                                                                mouseXY(0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentM92*ValueScopeM92,4/ValueSense*ValueAttachment*ValueScope*ValueAttachmentM92*ValueScopeM92)
                                                                                                                send, {LButton Up}
                                                                                                                sleep, 20
                                                                                                            }
                                                                                                            If GetKeyState("LButton", "p") {
                                                                                                                send, {LButton Down}
                                                                                                                Sleep, 6
                                                                                                                mouseXY(0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentM92*ValueScopeM92,3/ValueSense*ValueAttachment*ValueScope*ValueAttachmentM92*ValueScopeM92)
                                                                                                                send, {LButton Up}
                                                                                                                sleep, 20
                                                                                                            }
                                                                                                            If GetKeyState("LButton", "p") {
                                                                                                                send, {LButton Down}
                                                                                                                Sleep, 6
                                                                                                                mouseXY(0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentM92*ValueScopeM92,2/ValueSense*ValueAttachment*ValueScope*ValueAttachmentM92*ValueScopeM92)
                                                                                                                send, {LButton Up}
                                                                                                                sleep, 20
                                                                                                            }
                                                                                                            If GetKeyState("LButton", "p") {
                                                                                                                send, {LButton Down}
                                                                                                                Sleep, 6
                                                                                                                mouseXY(0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentM92*ValueScopeM92,4/ValueSense*ValueAttachment*ValueScope*ValueAttachmentM92*ValueScopeM92)
                                                                                                                send, {LButton Up}
                                                                                                                sleep, 20
                                                                                                            }
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                                if (VWeapon = "[F10] Python (no scope)" && (VMode = "Rapid Fire" || VMode = "Standard (only *)")) {
                                                                                                    while (GetKeyState("LButton", "p")) {
                                                                                                        checkPython:
                                                                                                            If GetKeyState("LButton", "p") {
                                                                                                                send, {LButton Down}
                                                                                                                Sleep, 6
                                                                                                                mouseXY(0/ValueSense*ValueScope*ValueScopePyt,36/ValueSense*ValueScope*ValueScopePyt)
                                                                                                                send, {LButton Up}
                                                                                                                sleep, 150
                                                                                                                goto checkPython
                                                                                                            }
                                                                                                        }
                                                                                                    }
                                                                                                if (VWeapon = "[F11] S-A Pistol (no scope)" && (VMode = "Rapid Fire" || VMode = "Standard (only *)")) {
                                                                                                    while (GetKeyState("LButton", "p")) {
                                                                                                        checkSAP:
                                                                                                            If GetKeyState("LButton", "p") {
                                                                                                                send, {LButton Down}
                                                                                                                Sleep, 6
                                                                                                                mouseXY(0/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSAP*ValueScopeSAP,18/ValueSense*ValueAttachment*ValueScope*ValueAttachmentSAP*ValueScopeSAP)
                                                                                                                send, {LButton Up}
                                                                                                                sleep, 150
                                                                                                                goto checkSAP
                                                                                                            }
                                                                                                        }
                                                                                                    }
                                                                                                if (VWeapon = "[F12] Revolver" && (VMode = "Rapid Fire" || VMode = "Standard (only *)")) {
                                                                                                    while (GetKeyState("LButton", "p")) {
                                                                                                        checkRevolver:
                                                                                                            If GetKeyState("LButton", "p") {
                                                                                                                send, {LButton Down}
                                                                                                                Sleep, 6
                                                                                                                mouseXY(0/ValueSense*ValueAttachment*ValueAttachmentRev,11/ValueSense*ValueAttachment*ValueAttachmentRev)
                                                                                                                send, {LButton Up}
                                                                                                                sleep, 180
                                                                                                                goto checkRevolver
                                                                                                            }
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                            return

                                                                                            mouseXY(x,y)
                                                                                            {
                                                                                                DllCall("mouse_event",int,1,int,x,int,y,uint,0,uint,0)
                                                                                            }

                                                                                            RETURN
