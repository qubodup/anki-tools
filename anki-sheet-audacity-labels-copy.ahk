#Requires AutoHotkey v2.0
; ------------------------------------------------------------
; Script: Quick copy from sheet and paste to Audacity labels
; Keys:
;   1 -> AltTab, Right, Copy, Back, Bold, Paste, Tab, Space
;   2 -> AltTab, Down/Left, Copy, Back, Bold, Paste, Tab, Space
; Delay: 0.1 seconds (100 ms) between steps
; ------------------------------------------------------------

delay := 100  ; delay in milliseconds

; --- Hotkey 1 ---
1::
{
    Send("!{Tab}")       ; Alt + Tab
    Sleep(delay)

    Send("{Right}")      ; Move right
    Sleep(delay)

    Send("^c")           ; Copy
    Sleep(delay)

    Send("!{Tab}")       ; Return to previous window
    Sleep(delay)

    Send("^b")           ; Toggle bold
    Sleep(delay)

    Send("^v")           ; Paste
    Sleep(delay)

    Send("{Tab}")        ; Deselect
    Sleep(delay)

    Send("{Space}")      ; Playback
}

; --- Hotkey 2 ---
2::
{
    Send("!{Tab}")       ; Alt + Tab
    Sleep(delay)

    Send("{Down}")       ; Move down
    Sleep(delay)

    Send("{Left}")       ; Move down
    Sleep(delay)

    Send("^c")           ; Copy
    Sleep(delay)

    Send("!{Tab}")       ; Return to previous window
    Sleep(delay)

    Send("^b")           ; Toggle bold
    Sleep(delay)

    Send("^v")           ; Paste
    Sleep(delay)

    Send("{Tab}")        ; Deselect
    Sleep(delay)

    Send("{Space}")      ; Playback
}