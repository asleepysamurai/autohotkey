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
    ; Fire on Space release, even if Alt is still held.
    KeyWait "Space"
    ; Start won't open while Alt is logically down (the OS sees Ctrl+Alt+Esc),
    ; and a plain Send would re-press Alt afterwards, dismissing Start. So
    ; release Alt ourselves under {Blind} (no restore), tapping vkE8 first so
    ; the bare Alt up doesn't focus the app's menu bar. Ctrl+Esc is the
    ; OS-level "open Start" command; unlike {LWin}, it can't fold into some
    ; other Win+<key> shortcut.
    Send "{Blind}{vkE8}{Alt up}^{Esc}"
}
