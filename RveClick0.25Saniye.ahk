#Persistent
#MaxThreadsPerHotkey 2
#SingleInstance Force

runningZ := false
runningX := false

; Toggle loop on/off with Z
z::
if (!runningZ) {
    ; Turn off X loop
    runningX := false
    SetTimer, DoActionOther, Off

    ; Turn on Z loop
    runningZ := true
    SetTimer, DoAction, 250
    SoundBeep, 1200, 150
    TrayTip, Z Loop, Left Click Loop ON, 1
} else {
    ; Turn off Z loop
    runningZ := false
    SetTimer, DoAction, Off
    SoundBeep, 600, 150
    TrayTip, Z Loop, Left Click Loop OFF, 1
}
return

; Toggle loop on/off with X
x::
if (!runningX) {
    ; Turn off Z loop
    runningZ := false
    SetTimer, DoAction, Off

    ; Turn on X loop
    runningX := true
    SetTimer, DoActionOther, 250
    SoundBeep, 1000, 150
    TrayTip, X Loop, R+Click Loop ON, 1
} else {
    ; Turn off X loop
    runningX := false
    SetTimer, DoActionOther, Off
    SoundBeep, 500, 150
    TrayTip, X Loop, R+Click Loop OFF, 1
}
return

DoAction:
if (runningZ)
    Click
return

DoActionOther:
if (runningX) {
    Send, r
    Click
}
return
