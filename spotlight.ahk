; spotlight.ahk — macOS Spotlight-style launcher shortcut for Windows.
;
; Alt+C opens the Start menu (as if the Win key were tapped), so you can
; immediately type to search and launch apps/files. Alt sits where Cmd does
; on a Mac keyboard layout, so this approximates Cmd+Space muscle memory.
;
; Requires AutoHotkey v2. To run at login, drop a shortcut to this file in
; shell:startup.

#Requires AutoHotkey v2.0
#SingleInstance Force

; Release Alt with a tap of the unassigned vkE8 key instead of letting a bare Alt
; up-stroke reach the foreground app (which would focus its menu bar).
A_MenuMaskKey := "vkE8"

; No "~" prefix, so the original Alt+C is swallowed and never reaches the app.
; Ctrl+Esc is the OS-level "open Start" command: unlike sending {LWin}, it
; can't combine with the still-held Alt into some other Win+Alt shortcut.
!c::Send "^{Esc}"
