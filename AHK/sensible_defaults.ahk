launchOrSwitchOutlook()
{
  IfWinExist ahk_class rctrl_renwnd32
  {
    WinActivate, ahk_class rctrl_renwnd32
  }
  Else
  {
    Run "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE"
  }
}

launchOrSwitchSumatraPDF()
{
  IfWinExist ahk_class SUMATRA_PDF_FRAME
  {
    WinActivate, ahk_class SUMATRA_PDF_FRAME
  }
  Else
  {
    Run "C:\Users\Areg\AppData\Local\SumatraPDF\SumatraPDF.exe"
  }
}

launchOrSwitchVisualStudio()
{
  IfWinExist ahk_exe devenv.exe
  {
    WinActivate, ahk_exe devenv.exe
  }
  Else
  {
    Run "C:\Program Files (x86)\Microsoft Visual Studio\2019\Preview\Common7\IDE\devenv.exe"
  }
}
launchOrSwitchGvim()
{
  IfWinExist ahk_class Vim
  {
    WinActivate, ahk_class Vim
  }
  Else
  {
    Run "C:\tools\vim\vim82\gvim.exe"
  }
  Return
}
launchOrSwitchWterminal()
{
  IfWinExist ahk_class CASCADIA_HOSTING_WINDOW_CLASS
  {
    WinActivate, ahk_class CASCADIA_HOSTING_WINDOW_CLASS
  }
  Else
  {
    Run "C:\Program Files\WindowsApps\Microsoft.WindowsTerminal_1.11.3471.0_x64__8wekyb3d8bbwe\WindowsTerminal.exe"
  }
}
launchOrSwitchFirefox()
{
  IfWinExist ahk_class MozillaWindowClass
  {
    WinActivate, ahk_class MozillaWindowClass
  }
  Else
  {
    Run "C:\Program Files\Mozilla Firefox\firefox.exe"
  }
  Return
}
+F4::launchOrSwitchOutlook()
+F5::launchOrSwitchFirefox()
+F6::launchOrSwitchSumatraPDF()
+F7::launchOrSwitchVisualStudio()
+F8::launchOrSwitchGvim()
+F9::launchOrSwitchWterminal()
; ^[::Esc ; This key combination seems to be mapped onto the Windows key in Win11 in spite of anything you say, do, or want to believe
; ա, բ, գ, դ, ե, զ, է, ը, թ, ժ, ի, լ, խ, ծ, կ, հ, ձ, ղ, ճ, մ, յ, ն, շ, ո, չ, պ, ջ, ռ, ս, վ, տ, ր, ց, ւ, փ, ք
::..::
    Input, KeyCode, L3
    Send {U+0%KeyCode%}
    return
::h1::
    Send {U+0561}}
    return
::h2::
    Send {U+0562}
    return
::h3::
    Send {U+0563}
    return
::h4::
    Send {U+0564}
    return
::h5::
    Send {U+0565}
    return
::h6::
    Send {U+0566}
    return
::h7::
    Send {U+0567}
    return
::h8::
    Send {U+0568}
    return
::h9::
    Send {U+0569}
    return
::h10::
    Send {U+056a}
    return
::h11::
    Send {U+056b}
    return
::h12::
    Send {U+056c}
    return
::h13::
    Send {U+056d}
    return
::h14::
    Send {U+056e}
    return
::h15::
    Send {U+056f}
    return
::h16::
    Send {U+0570}
    return
::h17::
    Send {U+0571}
    return
::h18::
    Send {U+0572}
    return
::h19::
    Send {U+0573}
    return
::h20::
    Send {U+0574}
    return
::h21::
    Send {U+0575}
    return
::h22::
    Send {U+0576}
    return
::h23::
    Send {U+0577}
    return
::h24::
    Send {U+0578}
    return
::h25::
    Send {U+0579}
    return
::h26::
    Send {U+057a}
    return
::h27::
    Send {U+057b}
    return
::h28::
    Send {U+057c}
    return
::h29::
    Send {U+057d}
    return
::h30::
    Send {U+057e}
    return
::h31::
    Send {U+057f}
    return
::h32::
    Send {U+0580}
    return
::h33::
    Send {U+0581}
    return
::h34::
    Send {U+0582}
    return
::h35::
    Send {U+0583}
    return
::h36::
    Send {U+0584}
    return
; Uppercase Armenian letters
::hh1::
    Send {U+0531}
    return
::hh2::
    Send {U+0532}
    return
::hh3::
    Send {U+0533}
    return
::hh4::
    Send {U+0534}
    return
::hh5::
    Send {U+0535}
    return
::hh6::
    Send {U+0536}
    return
::hh7::
    Send {U+0537}
    return
::hh8::
    Send {U+0538}
    return
::hh9::
    Send {U+0539}
    return
::hh10::
    Send {U+053a}
    return
::hh11::
    Send {U+053b}
    return
::hh12::
    Send {U+053c}
    return
::hh13::
    Send {U+053d}
    return
::hh14::
    Send {U+053e}
    return
::hh15::
    Send {U+053f}
    return
::hh16::
    Send {U+0540}
    return
::hh17::
    Send {U+0541}
    return
::hh18::
    Send {U+0542}
    return
::hh19::
    Send {U+0543}
    return
::hh20::
    Send {U+0544}
    return
::hh21::
    Send {U+0545}
    return
::hh22::
    Send {U+0546}
    return
::hh23::
    Send {U+0547}
    return
::hh24::
    Send {U+0548}
    return
::hh25::
    Send {U+0549}
    return
::hh26::
    Send {U+054a}
    return
::hh27::
    Send {U+054b}
    return
::hh28::
    Send {U+054c}
    return
::hh29::
    Send {U+054d}
    return
::hh30::
    Send {U+054e}
    return
::hh31::
    Send {U+054f}
    return
::hh32::
    Send {U+0550}
    return
::hh33::
    Send {U+0551}
    return
::hh34::
    Send {U+0552}
    return
::hh35::
    Send {U+0553}
    return
::hh36::
    Send {U+0554}
    return
; farsi script
::ff01::
    Send {U+0621}
    return
::ff02::
    Send {U+0623}
    return
::ff03::
    Send {U+0626}
    return
::ff04::
    Send {U+0624}
    return
::ff1::
    Send {U+0627}
    return
::ff2::
    Send {U+0628}
    return
::ff3::
    Send {U+067E}
    return
::ff4::
    Send {U+062A}
    return
::ff5::
    Send {U+062B}
    return
::ff6::
    Send {U+062C}
    return
::ff7::
    Send {U+0686}
    return
::ff8::
    Send {U+062D}
    return
::ff9::
    Send {U+062E}
    return
::ff10::
    Send {U+062F}
    return
::ff11::
    Send {U+0630}
    return
::ff12::
    Send {U+0631}
    return
::ff13::
    Send {U+0632}
    return
::ff14::
    Send {U+0698}
    return
::ff15::
    Send {U+0633}
    return
::ff16::
    Send {U+0634}
    return
::ff17::
    Send {U+0635}
    return
::ff18::
    Send {U+0636}
::ff19::
    Send {U+0637}
    return
::ff20::
    Send {U+0638}
    return
::ff21::
    Send {U+0639}
    return
::ff22::
    Send {U+063A}
    return
::ff23::
    Send {U+0641}
    return
::ff24::
    Send {U+0642}
    return
::ff25::
    Send {U+06A9}
    return
::ff26::
    Send {U+06AF}
    return
::ff27::
    Send {U+0644}
    return
::ff28::
    Send {U+0645}
    return
::ff29::
    Send {U+0646}
    return
::ff30::
    Send {U+0648}
    return
::ff31::
    Send {U+0647}
    return
::ff32::
    Send {U+06CC}
    return
::ttt1::
     Send {U+0041} ; A
     return
; 
; 2
; 3
; 4
; 5
; 6
; 7
; 8
; 9
; 10
; 11
; 12
; 13
; 14
; 15
; 16
; 17
; 18
; 19
; 20
; 21
; 22
; 23
; 24
; 25
; 26
; 27
; 28
; 29
;     Send{U+0042} ; B
;     Send{U+0043} ; C
;     Send{U+00C7} ; Ç
;     Send{U+0044} ; D
;     Send{U+0045} ; E
;     Send{U+0046} ; F
;     Send{U+0047} ; G
;     Send{U+011E} ; Ğ
;     Send{U+0048} ; H
;     Send{U+0130} ; İ
;     Send{U+0049} ; I
;     Send{U+004A} ; J
;     Send{U+004B} ; K
;     Send{U+004C} ; L
;     Send{U+004D} ; M
;     Send{U+004E} ; N
;     Send{U+004F} ; O
;     Send{U+00D6} ; Ö
;     Send{U+0050} ; P
;     Send{U+0052} ; R
;     Send{U+0053} ; S
;     Send{U+015E} ; Ş
;     Send{U+0054} ; T
;     Send{U+0055} ; U
;     Send{U+00DC} ; Ü
;     Send{U+0056} ; V
;     Send{U+0059} ; Y
;     Send{U+005A} ; Z
;     Send{U+0061} ; a
;     Send{U+0062} ; b
;     Send{U+0063} ; c
;     Send{U+00E7} ; ç
;     Send{U+0064} ; d
;     Send{U+0065} ; e
;     Send{U+0066} ; f
;     Send{U+0067} ; g
;     Send{U+011F} ; ğ
;     Send{U+0068} ; h
;     Send{U+0131} ; ı
;     Send{U+0069} ; i
;     Send{U+006A} ; j
;     Send{U+006B} ; k
;     Send{U+006C} ; l
;     Send{U+006D} ; m
;     Send{U+006E} ; n
;     Send{U+006F} ; o
;     Send{U+00F6} ; ö
;     Send{U+0070} ; p
;     Send{U+0072} ; r
;     Send{U+0073} ; s
;     Send{U+015F} ; ş
;     Send{U+0074} ; t
;     Send{U+0075} ; u
;     Send{U+00FC} ; ü
;     Send{U+0076} ; v
;     Send{U+0079} ; y
;     Send{U+007A} ; z
