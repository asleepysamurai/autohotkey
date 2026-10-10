; spotlight.ahk — macOS Spotlight-style launcher shortcut for Windows.
;
; Alt+Space opens the Start menu, as if the Win key were tapped,
; so you can immediately type to search and launch apps/files. Alt sits where
; Cmd does on a Mac keyboard layout, so Alt+Space ≈ Cmd+Space.
;
; Requires AutoHotkey v2. Launched at login via a shortcut in shell:startup.

#Requires AutoHotkey v2.0
#SingleInstance Force

; Release Alt with a tap of the unassigned vkE8 key instead of letting a bare
; Alt up-stroke reach the foreground app (which would focus its menu bar).
A_MenuMaskKey := "vkE8"

; No "~" prefix, so the native combo is swallowed: Alt+Space never opens the
; window's system menu.
!Space:: {
    ; Start won't open while Alt is still physically down (the OS sees the
    ; combo as Ctrl+Alt+Esc / dismisses Start on Alt re-press), so wait for it.
    KeyWait "Alt"
    ; Ctrl+Esc is the OS-level "open Start" command; unlike sending {LWin}, it
    ; can't fold into some other Win+<key> shortcut.
    Send "^{Esc}"
}
