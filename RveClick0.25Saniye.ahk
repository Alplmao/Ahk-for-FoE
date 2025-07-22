#Persistent
#MaxThreadsPerHotkey 2

; Global flag for loop control
running := false

; Toggle loop on/off with Ctrl + z
^z::
running := !running
if (running) {
    SetTimer, DoAction, 250
    SoundBeep, 1000, 150  ; Higher tone = ON
    TrayTip, Script Active, Loop is ON, 1
} else {
    SetTimer, DoAction, Off
    SoundBeep, 400, 150   ; Lower tone = OFF
    TrayTip, Script Paused, Loop is OFF, 1
}
return

; Loop action
DoAction:
if (running) {
    Send, r
    Click
}
return
