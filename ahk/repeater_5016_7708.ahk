#ErrorStdOut
#NoTrayIcon
#MaxHotkeysPerInterval 99999999999999999999
#HotkeyInterval 0

Enabled := true
$~f23::Enabled := false
$~f24::Enabled := true
f1::Enabled := !Enabled

$~+g::
$~1::
$~+4::
$~+1::
$~+3::
$~+c::
$~x::
$~+r::
$~2::
$~4::
$~+2::
$~+e::
$~r::
$~b::
    If (WinActive("ahk_pid 7708") && Enabled) {
        Hotkey := StrReplace(A_ThisHotkey, "$")
        Hotkey := StrReplace(Hotkey, "~")
        IsShiftHotkey := 0
        IsCtrlHotkey := 0
        IsAltHotkey := 0
        Hotkey := StrReplace(Hotkey, "+", "", IsShiftHotkey)
        Hotkey := StrReplace(Hotkey, "^", "", IsCtrlHotkey)
        Hotkey := StrReplace(Hotkey, "!", "", IsAltHotkey)
        Modifiers := ""
        If (IsShiftHotkey > 0) {
            Modifiers = %Modifiers%+
        }
        If (IsCtrlHotkey > 0) {
            Modifiers = %Modifiers%^
        }
        If (IsAltHotkey > 0) {
            Modifiers = %Modifiers%!
        }
        While GetKeyState(Hotkey, "P") {
            Send, %Modifiers%{%Hotkey%}
            Sleep, 0
        }
    }
    Return
