#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Hold CapsLock is Control
*CapsLock::
    Send {Blind}{Ctrl Down}
    cDown := A_TickCount
Return

; Tap CapsLock is Escape
*CapsLock up::
    ; Modify the threshold time (in milliseconds) as necessary
    If ((A_TickCount-cDown) < 150)
        Send {Blind}{Ctrl Up}{Esc}
    Else
        Send {Blind}{Ctrl Up}
Return

; Right Alt + F12 is real CapsLock
ralt & F12::
  GetKeyState, capstate, Capslock, T
  if capstate = U
  {
    SetCapsLockState, on
  } else {
    SetCapsLockState, off
  }
return   

; Navigation keys on home row
ralt & h::
    Send {Left}
Return
ralt & j::
    Send {Down}
Return
ralt & k::
    Send {Up}
Return
ralt & l::
    Send {Right}
Return
ralt & u::
    Send {Home}
Return
ralt & i::
    Send {PgUp}
Return
ralt & o::
    Send {PgDn}
Return
ralt & p::
    Send {End}
Return