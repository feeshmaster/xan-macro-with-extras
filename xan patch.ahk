; dont steal i will dmca
; watermark 1
#SingleInstance Force
#NoEnv
setkeydelay, -1
setmousedelay, -1
setbatchlines, -1
SetTitleMatchMode 2
CoordMode, Tooltip, Relative
CoordMode, Pixel, Relative
CoordMode, Mouse, Relative

;   GUI CREATION ------------------------------------------------------------------------------------------;

Gui, Font, cWhite s10 q5, Segoe UI
Gui +hWndhMain
Gui, Color, 000000
hWnd := WinExist()
Edit := WebPic(WB1, "https://imgur.com/snRdH60", "w9999 h9999 cFFFFFF")
Gui, Add, Edit, % " x" 0 " y" 235 - 2 " w" 500 " h" 2
Gui, Add, Edit, % " x" 0 " y" 1 " w" 2 " h" 235 - 2
Gui, Add, Edit, % " x" 500 - 2 " y" 1 " w" 2 " h" 235 - 2
Gui, Add, Tab, x10 y10 w480 h30 vTabSection, Main|Webhook|Configurations|Credits

Gui, Tab, Main
Gui, Add, GroupBox, x10 y50 w270 h140, Shaking
Gui, Add, CheckBox, x20 y80 vautoshakeenabled, AutoShake
Gui, Add, DropDownList, x20 y107 w180 vautoshake, Click|Navigation
Gui, Add, Text, x20 y140, Navigation Key:
Gui, Add, Edit, x120 y137 w80 vnavigationkey cBlack
Gui, Add, Text, x150 y80, Shake failsafe:
Gui, Add, Edit, x240 y80 w20 h20 vshakefailsafe cBlack
Gui, Add, GroupBox, x290 y50 w200 h125, Options
Gui, Add, CheckBox, x300 y70 vautocamera, Auto Enable Camera Mode
Gui, Add, CheckBox, x300 y90 vautolookdown, Auto Look Down Camera
Gui, Add, CheckBox, x300 y110 vautoblur, Auto Blur Camera
Gui, Add, CheckBox, x300 y130 vzoomcamera, Auto Zoom In Camera
Gui, Add, CheckBox, x300 y150 vautographics, Auto Lower Graphics

Gui, Tab, Credits
Gui, Add, GroupBox, x10 y45 w460 h151, Credits
Gui, Add, Text, x20 y65, Developed by Hu6 | Ares | Lunar`nOriginal macro by AsphaltCake | Fisch V11`nMacro changes by Lunarosity`nGUI by Ares and Lunarosity | GUI inspired by 0x3b5`nFurther Minigame Improvements by Hu6`nConfig by Hu6 Partly Inspired by Texture`nShoutout NotWizzy     Thanks to MrPenguin and SkateF for webhook help

Gui, Tab, Webhook
Gui, Add, GroupBox, x10 y50 w480 h120, Webhook Settings
Gui, Add, Text, x20 y75, Webhook link:
Gui, Add, Edit, x170 y76 w100 h20 vwebhooklinkinput cBlack,
Gui Add, Text, x20 y100 h40, More settings are actually coming dont worry :3 -Lunar

Gui, Tab, Configurations
Gui Add, Text,x4 y45 w140 h40, StableRightDivision:
Gui Add, Edit,x4 y60 w140 h25 vsrightd cBlack, 1.19

Gui Add, Text, x4 y100 w140 h40,  StableRightMultiplier:
Gui Add, Edit,x4 y120 w140 h25 vsrightm cBlack, 2.232
Gui Add, Text,x350 y45 w140 h40, StableLeftDivision:
Gui Add, Edit,x350 y60 w140 h25 vsleftd cBlack, 1.256
Gui Add, Text,x350 y100 w140 h40, StableLeftMultiplier:
Gui Add, Edit,x350 y120 w140 h25 vsleftm cBlack, 1.894
Gui Add, Text,x175 y45 w140 h40, Bar Size:
Gui Add, Edit,x175 y60 w140 h25 vbarsize cBlack, 332 
Gui Add, Text,x175 y100 w140 h40, WhiteBarColorTolerance:
Gui Add, Edit,x175 y120 w140 h25 vwbtol cBlack, 13
Gui, Tab
Gui, Add, Button, gSaveSettings x10 h25 y200, Save settings
Gui, Add, Button, gLoadSettings x105 h25 y200, Load settings
Gui, Add, Button, gLoadMacro x202 h25 y200, Launch macro
Gui, Add, Link,x440 h25 y203, <a href="https://github.com/Hu6Cuh">GitHub</a>
;this is the patch for the dropdown and extra
Gui, Add, DropDownList, vdropDown gselectItem x307 h100 w75 y200
Gui, Add, Button, gLoadConfigFromFile x385 h25 w45 y200, Load
selectedConfig := A_ScriptDir . "\configs\" . "default" . ".ini"
Loop, configs\*.ini {
    StringTrimRight, fileName, A_LoopFileName, 4
    GuiControl,, dropDown, %fileName%
}

;end
Gui, Show, w500 h235, Xan



EnableBlur(hMain)
;extra: load settings on-load
If (FileExist(A_ScriptDir . "\Settings.ini")) {
    Goto, LoadSettings
}
return

;   SETTINGS ----------------------------------------------------------------------------------------------;

;extras
selectItem:
    Gui, Submit, NoHide
    selectedConfig := A_ScriptDir . "\configs\" . dropDown . ".ini"
    return

LoadConfigFromFile:
    ;IniRead, iniautoshakeenabled, %selectedConfig%, Settings, auto-shake-enabled, 0
    ;IniRead, iniautoshake, %selectedConfig%, Settings, auto-shake, 0
    ;IniRead, iniautocamera, %selectedConfig%, Settings, auto-enable-camera, 0
    ;IniRead, iniautolookdown, %selectedConfig%, Settings, auto-look-down, 0
    ;IniRead, iniautoblur, %selectedConfig%, Settings, auto-blur, 0
    ;IniRead, inizoomcamera, %selectedConfig%, Settings, auto-zoom-camera, 0
    ;IniRead, iniautographics, %selectedConfig%, Settings, auto-graphics, 0
    ;IniRead, ininavigationkey, %selectedConfig%, Settings, nav-key,
    ;IniRead, inishakefailsafe, %selectedConfig%, Settings, shake-failsafe, 15
    IniRead, inisrightm, %selectedConfig%, Settings, Stable-Right
    IniRead, inisrightd, %selectedConfig%, Settings, Stable-RightD
    IniRead, inisleftm, %selectedConfig%, Settings, Stable-Left
    IniRead, inisleftd, %selectedConfig%, Settings, Stable-LeftD
    IniRead, inibarsize, %selectedConfig%, Settings, Bar-Size
    IniRead, iniwbtol, %selectedConfig%, Settings, White-Tolerance
    ;IniRead, iniwebhooklinkinput, %selectedConfig%, Settings, Webhook-Link, text

    ;------------

    ;GuiControl,, autoshakeenabled, %iniautoshakeenabled%
    ;GuiControl,, autoshake, %iniautoshake%
    ;GuiControl,, autocamera, %iniautocamera%
    ;GuiControl,, autolookdown, %iniautolookdown%
    ;GuiControl,, autoblur, %iniautoblur%
    ;GuiControl,, zoomcamera, %inizoomcamera%
    ;GuiControl,, autographics, %iniautographics%
    ;GuiControl,, navigationkey, %ininavigationkey%
    ;GuiControl,, shakefailsafe, %inishakefailsafe%
    GuiControl,, srightm, %inisrightm%
    GuiControl,, srightd, %inisrightd%
    GuiControl,, sleftm, %inisleftm%
    GuiControl,, sleftd, %inisleftd%
    GuiControl,, barsize, %inibarsize%
    GuiControl,, wbtol, %iniwbtol%
    ;GuiControl,, webhooklinkinput, %iniwebhooklinkinput%
    MsgBox, 64, settings loaded, your settings have been loaded from %selectedConfig%.
    return
;extras
SaveSettings:
    Gui, Submit, NoHide
    IniWrite, %autoshakeenabled%, Settings.ini, Settings, auto-shake-enabled
    IniWrite, %autoshake%, Settings.ini, Settings, auto-shake
    IniWrite, %autocamera%, Settings.ini, Settings, auto-enable-camera
    IniWrite, %autolookdown%, Settings.ini, Settings, auto-look-down
    IniWrite, %autoblur%, Settings.ini, Settings, auto-blur
    IniWrite, %zoomcamera%, Settings.ini, Settings, auto-zoom-camera
    IniWrite, %autographics%, Settings.ini, Settings, auto-graphics
    IniWrite, %navigationkey%, Settings.ini, Settings, nav-key
    IniWrite, %shakefailsafe%, Settings.ini, Settings, shake-failsafe
    IniWrite, %srightm%, Settings.ini, Settings, Stable-Right
	IniWrite, %srightd%, Settings.ini, Settings, Stable-RightD
	IniWrite, %sleftm%, Settings.ini, Settings, Stable-Left
	IniWrite, %sleftd%, Settings.ini, Settings, Stable-LeftD
	IniWrite, %barsize%, Settings.ini, Settings, Bar-Size
	IniWrite, %wbtol%, Settings.ini, Settings, White-Tolerance
	IniWrite, %webhooklinkinput%, Settings.ini, Settings, Webhook-Link
	
	MsgBox, 64, settings saved, your settings have been saved to the .ini file.
    return

LoadSettings:
    IniRead, iniautoshakeenabled, Settings.ini, Settings, auto-shake-enabled, 0
    IniRead, iniautoshake, Settings.ini, Settings, auto-shake, 0
    IniRead, iniautocamera, Settings.ini, Settings, auto-enable-camera, 0
    IniRead, iniautolookdown, Settings.ini, Settings, auto-look-down, 0
    IniRead, iniautoblur, Settings.ini, Settings, auto-blur, 0
    IniRead, inizoomcamera, Settings.ini, Settings, auto-zoom-camera, 0
    IniRead, iniautographics, Settings.ini, Settings, auto-graphics, 0
    IniRead, ininavigationkey, Settings.ini, Settings, nav-key,
    IniRead, inishakefailsafe, Settings.ini, Settings, shake-failsafe, 15
	IniRead, inisrightm, Settings.ini, Settings, Stable-Right
	IniRead, inisrightd, Settings.ini, Settings, Stable-RightD
	IniRead, inisleftm, Settings.ini, Settings, Stable-Left
	IniRead, inisleftd, Settings.ini, Settings, Stable-LeftD
	IniRead, inibarsize, Settings.ini, Settings, Bar-Size
	IniRead, iniwbtol, Settings.ini, Settings, White-Tolerance
	IniRead, iniwebhooklinkinput, Settings.ini, Settings, Webhook-Link, text

	;------------

	GuiControl,, autoshakeenabled, %iniautoshakeenabled%
	GuiControl,, autoshake, %iniautoshake%
	GuiControl,, autocamera, %iniautocamera%
	GuiControl,, autolookdown, %iniautolookdown%
	GuiControl,, autoblur, %iniautoblur%
	GuiControl,, zoomcamera, %inizoomcamera%
	GuiControl,, autographics, %iniautographics%
	GuiControl,, navigationkey, %ininavigationkey%
	GuiControl,, shakefailsafe, %inishakefailsafe%
	GuiControl,, srightm, %inisrightm%
	GuiControl,, srightd, %inisrightd%
	GuiControl,, sleftm, %inisleftm%
	GuiControl,, sleftd, %inisleftd%
	GuiControl,, barsize, %inibarsize%
	GuiControl,, wbtol, %iniwbtol%
	GuiControl,, webhooklinkinput, %iniwebhooklinkinput%
	MsgBox, 64, settings loaded, your settings have been loaded from the .ini file.
	return

GuiClose:
Exitapp
	
LoadMacro:
	Gui, Hide
	IniRead, iniautoshakeenabled, Settings.ini, Settings, auto-shake-enabled, 0
    IniRead, iniautoshake, Settings.ini, Settings, auto-shake, 0
    IniRead, iniautocamera, Settings.ini, Settings, auto-enable-camera, 0
    IniRead, iniautolookdown, Settings.ini, Settings, auto-look-down, 0
    IniRead, iniautoblur, Settings.ini, Settings, auto-blur, 0
    IniRead, inizoomcamera, Settings.ini, Settings, auto-zoom-camera, 0
    IniRead, iniautographics, Settings.ini, Settings, auto-graphics, 0
    IniRead, ininavigationkey, Settings.ini, Settings, nav-key,
    IniRead, inishakefailsafe, Settings.ini, Settings, shake-failsafe, 15
	IniRead, inisrightm, Settings.ini, Settings, Stable-Right
	IniRead, inisrightd, Settings.ini, Settings, Stable-RightD
	IniRead, inisleftm, Settings.ini, Settings, Stable-Left
	IniRead, inisleftd, Settings.ini, Settings, Stable-LeftD
	IniRead, inibarsize, Settings.ini, Settings, Bar-Size
	IniRead, iniwbtol, Settings.ini, Settings, White-Tolerance
	IniRead, iniwebhooklinkinput, Settings.ini, Settings, Webhook-Link
	GuiHidden := true	

    sleep 1
    AutoBlurDelay := 50
    AutoZoomDelay := 50
    AutoCameraDelay := 50
    AutoLookDelay := 200
    AutoGraphicsDelay := 50

    if (iniautoshakeenabled > 0) {
        AutoShake := true
        ShakeMode := iniautoshake
    }
    else {
        AutoShake := false
        ShakeMode := "Disabled"
    }
    if (inizoomcamera > 0) {
        AutoZoomInCamera := true
    }
    else {
        AutoZoomInCamera := false
    }
    if (iniautocamera > 0) {
        AutoEnableCameraMode := true
    }
    else {
        AutoEnableCameraMode := false
    }
    if (iniautolookdown > 0) {
        AutoLookDownCamera := true
    }
    else {
        AutoLookDownCamera := false
    }
    if (iniautoblur > 0) {
        AutoBlurCamera := true
    }
    else {
        AutoBlurCamera := false
    }
    if (iniautographics > 0) {
        AutoLowerGraphics := true
    }
    else {
        AutoLowerGraphics := false
    }
    ; -----Settings--------------
    RestartDelay := 800
    HoldRodCastDuration := 600
    WaitForBobberDelay := 300
    NavigationKey := ininavigationkey
    ClickShakeSecondClickTime := 2
    FishBarColorTolerance := 0
    ClickShakeFailsafe := inishakefailsafe
    ClickShakeColorTolerance := 1
    RepeatBypassCounter := 10
    NavigationShakeFailsafe := inishakefailsafe
    NavigationSpamDelay := 0.2
    ManualBarSize := inibarsize
    BarCalculationFailsafe := 10
    BarSizeCalculationColorTolerance := 15
    WhiteBarColorTolerance := iniwbtol
    ArrowColorTolerance := 7
    StabilizerLoop := 40
    SideBarRatio := 0.8
    StableRightMultiplier := inisrightm
    StableRightDivision := inisrightd
    StableLeftMultiplier := inisleftm
    StableLeftDivision := inisleftd
    UnstableRightMultiplier := Difference/StableRightDivision
    UnstableRightDivision := 1.57
    UnstableLeftMultiplier := Difference/StableRightDivision
    UnstableLeftDivision := 1.55
    RightAnkleBreakMultiplier := 0.136
    LeftAnkleBreakMultiplier := 0.4
	WebhookURL := iniwebhooklinkinput
    if (AutoLowerGraphics != true and AutoLowerGraphics != false)
    {
        msgbox, AutoLowerGraphics must be set to true or false! (check your spelling)
        exitapp
    }
    if (AutoEnableCameraMode != true and AutoEnableCameraMode != false)
    {
        msgbox, AutoEnableCameraMode must be set to true or false! (check your spelling)
        exitapp
    }
    if (AutoZoomInCamera != true and AutoZoomInCamera != false)
    {
        msgbox, AutoZoomInCamera must be set to true or false! (check your spelling)
        exitapp
    }
    if (AutoLookDownCamera != true and AutoLookDownCamera != false)
    {
        msgbox, AutoLookDownCamera must be set to true or false! (check your spelling)
        exitapp
    }
    if (AutoBlurCamera != true and AutoBlurCamera != false)
    {
        msgbox, AutoBlurCamera must be set to true or false! (check your spelling)
        exitapp
    }
    if (ShakeMode != "Navigation" and ShakeMode != "Click" and AutoShake == true)
    {
        msgbox, ShakeMode must be set to "Click" or "Navigation"!
        exitapp
    }
    WinActivate, Roblox
    if WinActive("Roblox")
    {
        WinMaximize, Roblox
    }
    else
    {
        msgbox,  no roblox bruh | discord.gg/xanmacro
        exitapp
    }
    send {lbutton up}
    send {rbutton up}
    send {shift up}

;----------------------------------------------------------------------------------------------------------;

Calculations:
    WinGetActiveStats, Title, WindowWidth, WindowHeight, WindowLeft, WindowTop
    CameraCheckLeft := WindowWidth/2.8444
    CameraCheckRight := WindowWidth/1.5421
    CameraCheckTop := WindowHeight/1.28
    CameraCheckBottom := WindowHeight
    ClickShakeLeft := WindowWidth/4.6545
    ClickShakeRight := WindowWidth/1.2736
    ClickShakeTop := WindowHeight/14.08
    ClickShakeBottom := WindowHeight/1.3409
    FishBarLeft := WindowWidth/3.3160
    FishBarRight := WindowWidth/1.4317
	FishBarTop := WindowHeight/1.201
	FishBarBottom := WindowHeight/1.15
    FishBarTooltipHeight := WindowHeight/1.0626
	ProgressBarLeft := WindowWidth/2.53
    ProgressBarRight := WindowWidth/1.61
	ProgressBarTop := WindowHeight/1.13
	ProgressBarBottom := WindowHeight/1.08
    ResolutionScaling := 2560/WindowWidth
    LookDownX := WindowWidth/2
    LookDownY := WindowHeight/4
    runtimeS := -1
    runtimeM := 0
    runtimeH := 0
	TotalCaught := 0
	TotalLost := 0
	LastTime := 0
    TooltipX := WindowWidth/20
    Tooltip1 := (WindowHeight/2)-(20*9)
    Tooltip2 := (WindowHeight/2)-(20*8)
    Tooltip3 := (WindowHeight/2)-(20*7)
    Tooltip4 := (WindowHeight/2)-(20*6)
    Tooltip5 := (WindowHeight/2)-(20*5)
    Tooltip6 := (WindowHeight/2)-(20*4)
    Tooltip7 := (WindowHeight/2)-(20*3)
    Tooltip8 := (WindowHeight/2)-(20*2)
    Tooltip9 := (WindowHeight/2)-(20*1)
    Tooltip10 := (WindowHeight/2)
    Tooltip11 := (WindowHeight/2)+(20*1)
    Tooltip12 := (WindowHeight/2)+(20*2)
    Tooltip13 := (WindowHeight/2)+(20*3)
    Tooltip14 := (WindowHeight/2)+(20*4)
    Tooltip15 := (WindowHeight/2)+(20*5)
    Tooltip16 := (WindowHeight/2)+(20*6)
    Tooltip17 := (WindowHeight/2)+(20*7)
    Tooltip18 := (WindowHeight/2)+(20*8)
    Tooltip19 := (WindowHeight/2)+(20*9)
    Tooltip20 := (WindowHeight/2)+(20*10)
    if (AutoLowerGraphics == true) {
        tooltip, AutoLowerGraphics: true, %TooltipX%, %Tooltip8%, 8
    }
    else {
        tooltip, AutoLowerGraphics: false, %TooltipX%, %Tooltip8%, 8
    }
    if (AutoEnableCameraMode == true) {
        tooltip, AutoEnableCameraMode: true, %TooltipX%, %Tooltip9%, 9
    }
    else {
        tooltip, AutoEnableCameraMode: false, %TooltipX%, %Tooltip9%, 9
    }
    if (AutoZoomInCamera == true) {
        tooltip, AutoZoomInCamera: true, %TooltipX%, %Tooltip10%, 10
    }
    else {
        tooltip, AutoZoomInCamera: false, %TooltipX%, %Tooltip10%, 10
    }
    if (AutoLookDownCamera == true) {
        tooltip, AutoLookDownCamera: true, %TooltipX%, %Tooltip11%, 11
    }
    else {
        tooltip, AutoLookDownCamera: false, %TooltipX%, %Tooltip11%, 11
    }
    if (AutoBlurCamera == true) {
        tooltip, AutoBlurCamera: true, %TooltipX%, %Tooltip12%, 12
    }
    else {
        tooltip, AutoBlurCamera: false, %TooltipX%, %Tooltip12%, 12
    }
    tooltip, Press "P" to Start, %TooltipX%, %Tooltip4%, 4
    tooltip, Press "O" to Reload, %TooltipX%, %Tooltip5%, 5
    tooltip, Press "M" to Exit, %TooltipX%, %Tooltip6%, 6
    if (NavigationKey != "") {
        tooltip, Navigation Key: "%NavigationKey%", %TooltipX%, %Tooltip14%, 14
    }
    else {
        msgbox, Please set a Navigation Key for certain settings to work
        reload
    }
    tooltip, Shake Mode: %ShakeMode%, %TooltipX%, %Tooltip16%, 16

;   RUNTIME -----------------------------------------------------------------------------------------------;

runtime:
    runtimeS++
    if (runtimeS >= 60)
    {
        runtimeS := 0
        runtimeM++
    }
    if (runtimeM >= 60)
    {
        runtimeM := 0
        runtimeH++
    }
    if WinActive("Roblox")
    {
        tooltip, Runtime: %runtimeH%h %runtimeM%m %runtimeS%s, %TooltipX%, %Tooltip2%, 2
    }
    else
    {
        exitapp
    }
return

;   KEYBINDS ----------------------------------------------------------------------------------------------;
$o::
if (GuiHidden) { 
	Reload
}
else {
	If GetKeyState("CapsLock", "T") {
        send {O}
    }
    else {
        send {o}
    }
	return
}

$m::
if (GuiHidden) {
	ExitApp
}
else {
	If GetKeyState("CapsLock", "T") {
        send {M}
    }
    else {
        send {m}
    }
	return
}

;   LOGIC -------------------------------------------------------------------------------------------------;
$p::
if (GuiHidden) {
} else {
	If GetKeyState("CapsLock", "T") {
        send {P}
    }
    else {
        send {p}
    }
	return
}
    gosub, Calculations
    settimer, runtime, 1000
    tooltip, Press "O" to Reload, %TooltipX%, %Tooltip4%, 4
    tooltip, Press "M" to Exit, %TooltipX%, %Tooltip5%, 5
    tooltip, , , , 6
    tooltip, , , , 10
    tooltip, , , , 11
    tooltip, , , , 12
    tooltip, , , , 14
    tooltip, , , , 16
    tooltip, Current Task: AutoLowerGraphics, %TooltipX%, %Tooltip7%, 7
    tooltip, F10 Count: 0/20, %TooltipX%, %Tooltip9%, 9
    f10counter := 0
    if (AutoLowerGraphics == true)
    {
        send {shift}
        tooltip, Action: Press Shift, %TooltipX%, %Tooltip8%, 8
        sleep %AutoGraphicsDelay%
        send {shift down}
        tooltip, Action: Hold Shift, %TooltipX%, %Tooltip8%, 8
        sleep %AutoGraphicsDelay%
        loop, 20
        {
            f10counter++
            tooltip, F10 Count: %f10counter%/20, %TooltipX%, %Tooltip9%, 9
            send {f10}
            tooltip, Action: Press F10, %TooltipX%, %Tooltip8%, 8
            sleep %AutoGraphicsDelay%
        }
        send {shift up}
        tooltip, Action: Release Shift, %TooltipX%, %Tooltip8%, 8
        sleep %AutoGraphicsDelay%
    }
    tooltip, Current Task: AutoZoomInCamera, %TooltipX%, %Tooltip7%, 7
    tooltip, Scroll In: 0/20, %TooltipX%, %Tooltip9%, 9
    tooltip, Scroll Out: 0/1, %TooltipX%, %Tooltip10%, 10
    scrollcounter := 0
    if (AutoZoomInCamera == true)
    {
        sleep %AutoZoomDelay%
        loop, 20
        {
            scrollcounter++
            tooltip, Scroll In: %scrollcounter%/20, %TooltipX%, %Tooltip9%, 9
            send {wheelup}
            tooltip, Action: Scroll In, %TooltipX%, %Tooltip8%, 8
            sleep %AutoZoomDelay%
        }
        send {wheeldown}
        tooltip, Scroll Out: 1/1, %TooltipX%, %Tooltip10%, 10
        tooltip, Action: Scroll Out, %TooltipX%, %Tooltip8%, 8
        AutoZoomDelay := AutoZoomDelay*5
        sleep %AutoZoomDelay%
    }
    tooltip, , , , 10
    tooltip, Current Task: AutoEnableCameraMode, %TooltipX%, %Tooltip7%, 7
    tooltip, Right Count: 0/10, %TooltipX%, %Tooltip9%, 9
    rightcounter := 0
    if (AutoEnableCameraMode == true)
    {
        PixelSearch, , , CameraCheckLeft, CameraCheckTop, CameraCheckRight, CameraCheckBottom, 0xFFFFFF, 0, Fast
        if (ErrorLevel == 0)
        {
            sleep %AutoCameraDelay%
            send {2}
            tooltip, Action: Press 2, %TooltipX%, %Tooltip8%, 8
            sleep %AutoCameraDelay%
            send {1}
            tooltip, Action: Press 1, %TooltipX%, %Tooltip8%, 8
            sleep %AutoCameraDelay%
            send {%NavigationKey%}
            tooltip, Action: Press %NavigationKey%, %TooltipX%, %Tooltip8%, 8
            sleep %AutoCameraDelay%
            loop, 10
            {
                rightcounter++
                tooltip, Right Count: %rightcounter%/10, %TooltipX%, %Tooltip9%, 9
                send {right}
                tooltip, Action: Press Right, %TooltipX%, %Tooltip8%, 8
                sleep %AutoCameraDelay%
            }
            send {enter}
            tooltip, Action: Press Enter, %TooltipX%, %Tooltip8%, 8
            sleep %AutoCameraDelay%
        }
    }

;   MACRO RESTART -----------------------------------------------------------------------------------------;

RestartMacro:
    tooltip, , , , 9
    tooltip, Current Task: AutoLookDownCamera, %TooltipX%, %Tooltip7%, 7
    if (AutoLookDownCamera == true) {
        send {rbutton up}
        sleep %AutoLookDelay%
        mousemove, LookDownX, LookDownY
        tooltip, Action: Position Mouse, %TooltipX%, %Tooltip8%, 8
        sleep %AutoLookDelay%
        send {rbutton down}
        tooltip, Action: Hold Right Click, %TooltipX%, %Tooltip8%, 8
        sleep %AutoLookDelay%
        DllCall("mouse_event", "UInt", 0x01, "UInt", 0, "UInt", 10000)
        tooltip, Action: Move Mouse Down, %TooltipX%, %Tooltip8%, 8
        sleep %AutoLookDelay%
        send {rbutton up}
        tooltip, Action: Release Right Click, %TooltipX%, %Tooltip8%, 8
        sleep %AutoLookDelay%
        mousemove, LookDownX, LookDownY
        tooltip, Action: Position Mouse, %TooltipX%, %Tooltip8%, 8
        sleep %AutoLookDelay%
    }
    tooltip, Current Task: AutoBlurCamera, %TooltipX%, %Tooltip7%, 7
    if (AutoBlurCamera == true) {
        sleep %AutoBlurDelay%
        send {m}
        tooltip, Action: Press M, %TooltipX%, %Tooltip8%, 8
        sleep %AutoBlurDelay%
    }
    tooltip, Current Task: Casting Rod, %TooltipX%, %Tooltip7%, 7
    send {lbutton down}
    sleep %HoldRodCastDuration%
    tooltip, Action: Casting For %HoldRodCastDuration%ms, %TooltipX%, %Tooltip8%, 8
    send {lbutton up}
    tooltip, Action: Waiting For Bobber (%WaitForBobberDelay%ms), %TooltipX%, %Tooltip8%, 8
    sleep %WaitForBobberDelay%
    if (AutoShake == false ) {
        tooltip, Searching for minigame | False, %TooltipX%, %Tooltip7%, 7
        tooltip, Action: Waiting for minigame to appear, %TooltipX%, %Tooltip8%, 8
        noshakefunc:
        PixelSearch, BarX, , FishBarLeft, FishBarTop, FishBarRight, FishBarBottom, 0xFFFFFF, %BarSizeCalculationColorTolerance%, Fast
        if (ErrorLevel == 0) {
            tooltip, Searching for minigame | True, %TooltipX%, %Tooltip7%, 7
            settimer, BarCalculationFailsafe, off
            if (ManualBarSize != 0) {
                WhiteBarSize := ManualBarSize
                goto BarMinigameSingle
            }
            WhiteBarSize := (FishBarRight - (BarX - FishBarLeft)) - BarX
            goto BarMinigameSingle
        }
        sleep 50
        goto noshakefunc
    }
    else if (AutoShake != true or false) {
        msgbox, 0, AutoShake, Autoshake must be either true or false. Check for any potential spelling errors.
    }
    if (ShakeMode == "Click") {
        goto ClickShakeMode
    }
    else if (ShakeMode == "Navigation") {
        goto NavigationShakeMode
    }

;   CLICK SHAKE ------------------------------------------------------------------------------------------;

ClickShakeFailsafe:
    ClickFailsafeCount++
    tooltip, Failsafe: %ClickFailsafeCount%/%ClickShakeFailsafe%, %TooltipX%, %Tooltip14%, 14
    if (ClickFailsafeCount >= ClickShakeFailsafe)
    {
        settimer, ClickShakeFailsafe, off
        ForceReset := true
    }
    return

ClickShakeMode:
    tooltip, Current Task: Shaking, %TooltipX%, %Tooltip7%, 7
    tooltip, Click X: None, %TooltipX%, %Tooltip8%, 8
    tooltip, Click Y: None, %TooltipX%, %Tooltip9%, 9
    tooltip, Click Count: 0, %TooltipX%, %Tooltip11%, 11
    tooltip, Bypass Count: 0/%RepeatBypassCounter%, %TooltipX%, %Tooltip12%, 12
    tooltip, Failsafe: 0/%ClickShakeFailsafe%, %TooltipX%, %Tooltip14%, 14
    ClickFailsafeCount := 0
    ClickCount := 0
    MemoryX := 0
    MemoryY := 0
    ForceReset := false
    settimer, ClickShakeFailsafe, 1000

ClickShakeModeRedo:
    if (ForceReset == true) {
        tooltip, , , , 11
        tooltip, , , , 12
        tooltip, , , , 14
        goto RestartMacro
    }
    PixelSearch, , , FishBarLeft, FishBarTop, FishBarRight, FishBarBottom, 0x5B4B43, %FishBarColorTolerance%, Fast
    if (ErrorLevel == 0) {
        settimer, ClickShakeFailsafe, off
        tooltip, , , , 8
        tooltip, , , , 9
        tooltip, , , , 11
        tooltip, , , , 12
        tooltip, , , , 14
        goto BarMinigame
    }
    else {
        PixelSearch, ClickX, ClickY, ClickShakeLeft, ClickShakeTop, ClickShakeRight, ClickShakeBottom, 0xFFFFFF, %ClickShakeColorTolerance%, Fast
        if (!ErrorLevel && (ClickX != MemoryX || ClickY != MemoryY)) {
            tooltip, Click X: %ClickX%, %TooltipX%, %Tooltip8%, 8
            tooltip, Click Y: %ClickY%, %TooltipX%, %Tooltip9%, 9
            loop, 2 {
                click, %ClickX%, %ClickY%
                ClickCount++
                sleep %ClickShakeSecondClickTime%
            }
            tooltip, Click Count: %ClickCount%, %TooltipX%, %Tooltip11%, 11
            MemoryX := ClickX
            MemoryY := ClickY
            goto ClickShakeModeRedo
        }
        else {
            sleep 1
            goto ClickShakeModeRedo
        }
    }

;   NAVIGATION SHAKE --------------------------------------------------------------------------------------;

NavigationShakeFailsafe:
    NavigationFailsafeCount++
    tooltip, Failsafe: %NavigationFailsafeCount%/%NavigationShakeFailsafe%, %TooltipX%, %Tooltip10%, 10
    if (NavigationFailsafeCount >= NavigationShakeFailsafe)
    {
        settimer, NavigationShakeFailsafe, off
        ForceReset := true
    }
    return

NavigationShakeMode:
    tooltip, Current Task: Shaking, %TooltipX%, %Tooltip7%, 7
    tooltip, Attempt Count: 0, %TooltipX%, %Tooltip8%, 8
    tooltip, Failsafe: 0/%NavigationShakeFailsafe%, %TooltipX%, %Tooltip10%, 10
    NavigationFailsafeCount := 0
    NavigationCounter := 0
    ForceReset := false
    settimer, NavigationShakeFailsafe, 1000
    send {%NavigationKey%}

NavigationShakeModeRedo:
    if (ForceReset == true)
    {
        tooltip, , , , 10
        goto RestartMacro
    }
    sleep %NavigationSpamDelay%
    PixelSearch, , , FishBarLeft, FishBarTop, FishBarRight, FishBarBottom, 0x5B4B43, %FishBarColorTolerance%, Fast
    if (ErrorLevel == 0)
    {
        settimer, NavigationShakeFailsafe, off
        goto BarMinigame
    }
    else
    {
        NavigationCounter++
        tooltip, Attempt Count: %NavigationCounter%, %TooltipX%, %Tooltip8%, 8
        sleep 1
        send {s}
        loop, 2
        {
            sleep 1
            send {enter}
        }
        goto NavigationShakeModeRedo
    }

;   BAR MINIGAME ------------------------------------------------------------------------------------------;

CheckForFail:
PixelSearch, ProgressBarX,, ProgressBarRight, ProgressBarTop, ProgressBarLeft, ProgressBarBottom, 0xFFFFFF, 1, Fast
if !ErrorLevel {
	ProgressBarSize := (ProgressBarX - ProgressBarLeft)
    if (ProgressBarSize < 5) {
		TotalLost++
    	if (WebhookURL != "") {
			SendDiscordMessage("Failed", "Failed to catch fish")	
		}
		sleep %RestartDelay%
		sleep 200
		goto RestartMacro
	}
}
return

BarCalculationFailsafe:
    BarCalcFailsafeCounter++
    tooltip, Failsafe: %BarCalcFailsafeCounter%/%BarCalculationFailsafe%, %TooltipX%, %Tooltip10%, 10
    if (BarCalcFailsafeCounter >= BarCalculationFailsafe)
    {
        settimer, BarCalculationFailsafe, off
        ForceReset := true
    }
    return

BarMinigame:
    tooltip, Current Task: Calculating Bar Size, %TooltipX%, %Tooltip7%, 7
    tooltip, Bar Size: Not Found, %TooltipX%, %Tooltip8%, 8
    tooltip, Failsafe: 0/%BarCalculationFailsafe%, %TooltipX%, %Tooltip10%, 10
    ForceReset := false
    BarCalcFailsafeCounter := 0
    settimer, BarCalculationFailsafe, 1000

BarMinigameRedo:
    if (ForceReset == true)
    {
        tooltip, , , , 10
        goto RestartMacro
    }
    PixelSearch, BarX, , FishBarLeft, FishBarTop, FishBarRight, FishBarBottom, 0xFFFFFF, %BarSizeCalculationColorTolerance%, Fast
    if (ErrorLevel == 0) {
        settimer, BarCalculationFailsafe, off
        if (ManualBarSize != 0) {
            WhiteBarSize := ManualBarSize
            goto BarMinigameSingle
        }
        WhiteBarSize := (FishBarRight - (BarX - FishBarLeft)) - BarX
        sleep 50
        goto BarMinigameSingle
    }
    sleep 1
    goto BarMinigameRedo

BarMinigameSingle:
    tooltip, Current Task: Playing Bar Minigame, %TooltipX%, %Tooltip7%, 7
    tooltip, Bar Size: %WhiteBarSize%, %TooltipX%, %Tooltip8%, 8
    tooltip, Direction: None, %TooltipX%, %Tooltip10%, 10
    tooltip, Forward Delay: None, %TooltipX%, %Tooltip11%, 11
    tooltip, Counter Delay: None, %TooltipX%, %Tooltip12%, 12
    tooltip, Ankle Delay: None, %TooltipX%, %Tooltip13%, 13
    tooltip, Side Delay: None, %TooltipX%, %Tooltip14%, 14
    HalfBarSize := WhiteBarSize/2
    SideDelay := 0
    AnkleBreakDelay := 0
    DirectionalToggle := "Disabled"
    AtLeastFindWhiteBar := false
    MaxLeftToggle := false
    MaxRightToggle := false
    MaxLeftBar := FishBarLeft+WhiteBarSize*SideBarRatio
    MaxRightBar := FishBarRight-WhiteBarSize*SideBarRatio
    tooltip, |, %MaxLeftBar%, %FishBarTooltipHeight%, 18
    tooltip, |, %MaxRightBar%, %FishBarTooltipHeight%, 17
	
	settimer, CheckForFail, 10

BarMinigame2:
    sleep 1
    PixelSearch, FishX, , FishBarLeft, FishBarTop, FishBarRight, FishBarBottom, 0x5B4B43, %FishBarColorTolerance%, Fast
    if (ErrorLevel == 0)
    {
        tooltip, ., %FishX%, %FishBarTooltipHeight%, 20
        if (FishX < MaxLeftBar)
        {
            if (MaxLeftToggle == false)
            {
                tooltip, <, %MaxLeftBar%, %FishBarTooltipHeight%, 19
                tooltip, Direction: Max Left, %TooltipX%, %Tooltip10%, 10
                tooltip, Forward Delay: Infinite, %TooltipX%, %Tooltip11%, 11
                tooltip, Counter Delay: None, %TooltipX%, %Tooltip12%, 12
                tooltip, Ankle Delay: 0, %TooltipX%, %Tooltip13%, 13
                DirectionalToggle := "Right"
                MaxLeftToggle := true
                send {lbutton up}
                sleep 1
                send {lbutton up}
                sleep %SideDelay%
                AnkleBreakDelay := 0
                SideDelay := 0
                tooltip, Side Delay: 0, %TooltipX%, %Tooltip15%, 15
            }
            goto BarMinigame2
        }
        else if (FishX > MaxRightBar)
        {
            if (MaxRightToggle == false)
            {
                tooltip, >, %MaxRightBar%, %FishBarTooltipHeight%, 19
                tooltip, Direction: Max Right, %TooltipX%, %Tooltip10%, 10
                tooltip, Forward Delay: Infinite, %TooltipX%, %Tooltip11%, 11
                tooltip, Counter Delay: None, %TooltipX%, %Tooltip12%, 12
                tooltip, Ankle Delay: 0, %TooltipX%, %Tooltip13%, 13
                DirectionalToggle := "Left"
                MaxRightToggle := true
                send {lbutton down}
                sleep 1
                send {lbutton down}
                sleep %SideDelay%
                AnkleBreakDelay := 0
                SideDelay := 0
                tooltip, Side Delay: 0, %TooltipX%, %Tooltip15%, 15
            }
            goto BarMinigame2
        }
        MaxLeftToggle := false
        MaxRightToggle := false
        PixelSearch, BarX, , FishBarLeft, FishBarTop, FishBarRight, FishBarBottom, 0xFFFFFF, %WhiteBarColorTolerance%, Fast
        if (ErrorLevel == 0)
        {
            AtLeastFindWhiteBar := true
            BarX := BarX+(WhiteBarSize/2)
            if (BarX > FishX)
            {
                tooltip, <, %BarX%, %FishBarTooltipHeight%, 19
                tooltip, Direction: <, %TooltipX%, %Tooltip10%, 10
                Difference := (BarX-FishX)*ResolutionScaling*StableLeftMultiplier
                CounterDifference := Difference/StableLeftDivision
                tooltip, Forward Delay: %Difference%, %TooltipX%, %Tooltip11%, 11
                tooltip, Counter Delay: %CounterDifference%, %TooltipX%, %Tooltip12%, 12
                send {lbutton up}
                if (DirectionalToggle == "Right")
                {
                    tooltip, Ankle Delay: 0, %TooltipX%, %Tooltip13%, 13
                    sleep %AnkleBreakDelay%
                    AnkleBreakDelay := 0
                }
                else
                {
                    AnkleBreakDelay := AnkleBreakDelay+(Difference-CounterDifference)*LeftAnkleBreakMultiplier
                    SideDelay := AnkleBreakDelay/LeftAnkleBreakMultiplier*4.5
                    tooltip, Ankle Delay: %AnkleBreakDelay%, %TooltipX%, %Tooltip13%, 13
                    tooltip, Side Delay: %SideDelay%, %TooltipX%, %Tooltip15%, 15
                }
                sleep %Difference%
                PixelSearch, FishX, , FishBarLeft, FishBarTop, FishBarRight, FishBarBottom, 0x5B4B43, %FishBarColorTolerance%, Fast
                {
                    if (FishX < MaxLeftBar)
                        goto BarMinigame2
                }
                send {lbutton down}
                sleep %CounterDifference%
                loop, %StabilizerLoop%
                {
                    send {lbutton down}
                    send {lbutton up}
                }
                DirectionalToggle := "Left"
            }
            else
            {
                tooltip, >, %BarX%, %FishBarTooltipHeight%, 19
                tooltip, Direction: >, %TooltipX%, %Tooltip10%, 10
                Difference := (FishX-BarX)*ResolutionScaling*StableRightMultiplier
                CounterDifference := Difference/StableRightDivision
                tooltip, Forward Delay: %Difference%, %TooltipX%, %Tooltip11%, 11
                tooltip, Counter Delay: %CounterDifference%, %TooltipX%, %Tooltip12%, 12
                send {lbutton down}
                if (DirectionalToggle == "Left")
                {
                    tooltip, Ankle Delay: 0, %TooltipX%, %Tooltip13%, 13
                    sleep %AnkleBreakDelay%
                    AnkleBreakDelay := 0
                }
                else
                {
                    AnkleBreakDelay := AnkleBreakDelay+(Difference-CounterDifference)*RightAnkleBreakMultiplier
                    SideDelay := AnkleBreakDelay/RightAnkleBreakMultiplier*4.5
                    tooltip, Ankle Delay: %AnkleBreakDelay%, %TooltipX%, %Tooltip13%, 13
                    tooltip, Side Delay: %SideDelay%, %TooltipX%, %Tooltip15%, 15
                }
                sleep %Difference%
                PixelSearch, FishX, , FishBarLeft, FishBarTop, FishBarRight, FishBarBottom, 0x5B4B43, %FishBarColorTolerance%, Fast
                {
                    if (FishX > MaxRightBar)
                        goto BarMinigame2
                }
                send {lbutton up}
                sleep %CounterDifference%
                loop, %StabilizerLoop%
                {
                    send {lbutton down}
                    send {lbutton up}
                }
                DirectionalToggle := "Right"
            }
        }
        else
        {
            if (AtLeastFindWhiteBar == false)
            {
                send {lbutton down}
                send {lbutton up}
                goto BarMinigame2
            }
            PixelSearch, ArrowX, , FishBarLeft, FishBarTop, FishBarRight, FishBarBottom, 0x878584, %ArrowColorTolerance%, Fast
            if (ArrowX > FishX)
            {
                tooltip, <, %ArrowX%, %FishBarTooltipHeight%, 19
                tooltip, Direction: <<<, %TooltipX%, %Tooltip10%, 10
                Difference := HalfBarSize*UnstableLeftMultiplier
                CounterDifference := Difference/UnstableLeftDivision
                tooltip, Forward Delay: %Difference%, %TooltipX%, %Tooltip11%, 11
                tooltip, Counter Delay: %CounterDifference%, %TooltipX%, %Tooltip12%, 12
                send {lbutton up}
                if (DirectionalToggle == "Right")
                {
                    tooltip, Ankle Delay: 0, %TooltipX%, %Tooltip13%, 13
                    sleep %AnkleBreakDelay%
                    AnkleBreakDelay := 0
                }
                else
                {
                    AnkleBreakDelay := AnkleBreakDelay+(Difference-CounterDifference)*LeftAnkleBreakMultiplier
                    SideDelay := AnkleBreakDelay/LeftAnkleBreakMultiplier*4.5
                    tooltip, Ankle Delay: %AnkleBreakDelay%, %TooltipX%, %Tooltip13%, 13
                    tooltip, Side Delay: %SideDelay%, %TooltipX%, %Tooltip15%, 15
                }
                sleep %Difference%
                PixelSearch, FishX, , FishBarLeft, FishBarTop, FishBarRight, FishBarBottom, 0x5B4B43, %FishBarColorTolerance%, Fast
                {
                    if (FishX < MaxLeftBar)
                        goto BarMinigame2
                }
                send {lbutton down}
                sleep %CounterDifference%
                loop, %StabilizerLoop%
                {
                    send {lbutton down}
                    send {lbutton up}
                }
                DirectionalToggle := "Left"
            }
            else
            {
                tooltip, >, %ArrowX%, %FishBarTooltipHeight%, 19
                tooltip, Direction: >>>, %TooltipX%, %Tooltip10%, 10
                Difference := HalfBarSize*UnstableRightMultiplier
                CounterDifference := Difference/UnstableRightDivision
                tooltip, Forward Delay: %Difference%, %TooltipX%, %Tooltip11%, 11
                tooltip, Counter Delay: %CounterDifference%, %TooltipX%, %Tooltip12%, 12
                send {lbutton down}
                if (DirectionalToggle == "Left")
                {
                    tooltip, Ankle Delay: 0, %TooltipX%, %Tooltip13%, 13
                    sleep %AnkleBreakDelay%
                    AnkleBreakDelay := 0
                }
                else
                {
                    AnkleBreakDelay := AnkleBreakDelay+(Difference-CounterDifference)*RightAnkleBreakMultiplier
                    SideDelay := AnkleBreakDelay/RightAnkleBreakMultiplier*4.5
                    tooltip, Ankle Delay: %AnkleBreakDelay%, %TooltipX%, %Tooltip13%, 13
                    tooltip, Side Delay: %SideDelay%, %TooltipX%, %Tooltip15%, 15
                }
                sleep %Difference%
                PixelSearch, FishX, , FishBarLeft, FishBarTop, FishBarRight, FishBarBottom, 0x5B4B43, %FishBarColorTolerance%, Fast
                {
                    if (FishX > MaxRightBar)
                        goto BarMinigame2
                }
                send {lbutton up}
                sleep %CounterDifference%
                loop, %StabilizerLoop%
                {
                    send {lbutton down}
                    send {lbutton up}
                }
                DirectionalToggle := "Right"
            }
        }
        goto BarMinigame2
    }
    else
    {
		send {lbutton up}
		send {rbutton up}
		send {shift up}
        tooltip, , , , 10
        tooltip, , , , 11
        tooltip, , , , 12
        tooltip, , , , 13
        tooltip, , , , 15
        tooltip, , , , 17
        tooltip, , , , 18
        tooltip, , , , 19
        tooltip, , , , 20
		settimer, CheckForFail, Off
		TotalCaught++
		if (WebhookURL != "") {
			SendDiscordMessage("caught", "Successfully caught fish")
		}
        sleep %RestartDelay%
        goto RestartMacro
    }

;   FUNCTIONS ---------------------------------------------------------------------------------------------;

EnableBlur(hWnd)
{
    WCA_ACCENT_POLICY := 19
    ACCENT_DISABLED := 0,
    ACCENT_ENABLE_GRADIENT := 1,
    ACCENT_ENABLE_TRANSPARENTGRADIENT := 2
    ACCENT_ENABLE_BLURBEHIND := 3
    ACCENT_INVALID_STATE := 4
    accentStructSize := VarSetCapacity(AccentPolicy, 4*4, 0)
    NumPut(ACCENT_ENABLE_BLURBEHIND, AccentPolicy, 0, "UInt")
    padding := A_PtrSize == 8 ? 4 : 0
    VarSetCapacity(WindowCompositionAttributeData, 4 + padding + A_PtrSize + 4 + padding)
    NumPut(WCA_ACCENT_POLICY, WindowCompositionAttributeData, 0, "UInt")
    NumPut(&AccentPolicy, WindowCompositionAttributeData, 4 + padding, "Ptr")
    NumPut(accentStructSize, WindowCompositionAttributeData, 4 + padding + A_PtrSize, "UInt")
    DllCall("SetWindowCompositionAttribute", "Ptr", hWnd, "Ptr", &WindowCompositionAttributeData)
}

WebPic(WB, Website, Options := "") {
    RegExMatch(Options, "i)w\K\d+", W), (W = "") ? W := 50 :
    RegExMatch(Options, "i)h\K\d+", H), (H = "") ? H := 50 :
    RegExMatch(Options, "i)c\K\d+", C), (C = "") ? C := "EEEEEE" :
    WB.Silent := True
    HTML_Page :=
	(RTRIM
	"<!DOCTYPE html>
		<html>
			<head>
				<style>
					body {
						background-color: #" C ";
					}
					img {
						top: 0px;
						left: 0px;
					}
				</style>
			</head>
			<body>
				<img src=""" Website """ alt=""Picture"" style=""width:" W "px;height:" H "px;"" />
			</body>
		</html>"
)
    While (WB.Busy)
        Sleep 10
    WB.Navigate("about:" HTML_Page)
    Return HTML_Page
}

SendDiscordMessage(type, text) {
	global TotalCaught, TotalLost, WebhookURL, runtimeH, runtimeM, runtimeS, LastTime
	TotalFish := TotalCaught + TotalLost
	Time := (runtimeH * 3600) + (runtimeM * 60) + runtimeS -1
	CurrentReelTime := (Max(Time - LastTime, 0) > 1) ? Max(Time - LastTime, 0) : 0
	LastTime := Time
	SuccessRate := (TotalFish > 0) ? Round((TotalCaught / TotalFish) * 100, 0) : 0

	fields := 
	(Join
	[
		{ "name": "Success Rate", "value": SuccessRate "% Success rate", "inline": true },
        { "name": "Fish " type, "value": "Took " CurrentReelTime " seconds", "inline": true },
        { "name": "Runtime", "value": runtimeH "h " runtimeM "m " runtimeS "s", "inline": true }
	]
	)
	

    fieldJSON := ""
    for index, field in fields {
        fieldJSON .= "{""id"": 0, ""name"": """ field.name """, ""value"": """ field.value """, ""inline"": true},"
    }
    fieldJSON := RTrim(fieldJSON, ",")

	authorJSON := "{""name"": ""Xan V2"", ""icon_url"": ""https://i.imgur.com/TQaUdJz.png""}"


	embedJSON := "
	(
	{
		""id"": 0,
		""title"": ""Xan Notification"",
		""description"": """ text """,
		""color"": 14172498,
		""fields"": [" fieldJSON "],
		""author"": " authorJSON "
	}
	)"

	postdata := "
	(
	{
		""content"": """",
		""tts"": false,
		""embeds"": [" embedJSON "],
		""components"": [],
		""actions"": {},
		""username"": ""Xan V2"",
		""avatar_url"": ""https://i.imgur.com/TQaUdJz.png""
	}
	)"

	try {
		WebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
	} catch {
		MsgBox, 16, Error, WinHttp.WinHttpRequest.5.1 is not available on this system.
		ExitApp
	}
	WebRequest.Open("POST", WebhookURL, false)
	WebRequest.SetRequestHeader("Content-Type", "application/json")
	
	try {
		WebRequest.Send(postdata)
	} catch {
		MsgBox, 16, Error, Failed to send webhook. Please check the webhook URL and try again.
	}
}


;watermark3
