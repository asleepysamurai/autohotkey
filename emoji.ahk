; emoji.ahk — macOS-style emoji picker shortcut for Windows.
;
; Alt+Shift+Space opens the Windows emoji panel (the one Win+; / Win+. opens)
; at the text cursor, similar to Ctrl+Cmd+Space on a Mac.
;
; Requires AutoHotkey v2. Launched at login via a shortcut in shell:startup.

#Requires AutoHotkey v2.0
#SingleInstance Force

; Release Alt with a tap of the unassigned vkE8 key instead of letting a bare
; Alt up-stroke reach the foreground app (which would focus its menu bar).
A_MenuMaskKey := "vkE8"

!+Space:: {
    ; Fire on Space release (Alt/Shift may still be held). Send lifts the held
    ; modifiers around "#." so the OS sees a clean Win+., and A_MenuMaskKey
    ; keeps the later Alt release from focusing the app's menu bar.
    KeyWait "Space"
    ; Win+. opens the same panel as Win+; and doesn't depend on where ";"
    ; sits on the keyboard layout.
    Send "#."
}
