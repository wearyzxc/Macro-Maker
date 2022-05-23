#NoTrayIcon
stdin  := FileOpen("*", "r `n")
SetKeyDelay, -1
SetMouseDelay, -1
Loop {
    query := RTrim(stdin.ReadLine(), "`n")
    If (query == "{f23}" || query == "{f24}") {
        SendLevel, 1
        Send, %query%
        SendLevel, 0
    } Else If WinActive("ahk_pid 7432") {
        Send, %query%
    }
}
