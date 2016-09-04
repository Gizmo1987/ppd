@echo off
setlocal enabledelayedexpansion
set total=0
cls
for %%i in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do (
  set DRIVE=%%i:\
  if exist !DRIVE! (
    call :lookup !DRIVE!
  )
)
echo Total of files potentially encrypted files: %total%
pause
goto :eof

:lookup
set drive=%1
set subtotal=0
echo Scanning %drive%
for /r %drive% %%i in (*.m4u *.m3u *.mid *.wma *.flv *.3g2 *.mkv *.3gp *.mp4 *.mov *.avi *.asf *.mpeg *.vob *.mpg *.wmv *.fla *.swf *.wav *.mp3 *.qcow2 *.vdi *.vmdk *.vmx *.gpg *.aes *.ARC *.PAQ *.tar.bz2 *.tbk *.bak *.tar *.tgz *.rar *.zip *.djv *.djvu *.svg *.bmp *.png *.gif *.raw *.cgm *.jpeg *.jpg *.tif *.tiff *.NEF *.psd *.cmd *.bat *.class *.jar *.java *.asp *.brd *.sch *.dch *.dip *.vbs *.asm *.pas *.cpp *.php *.ldf *.mdf *.ibd *.MYI *.MYD *.frm *.odb *.dbf *.mdb *.sql *.SQLITEDB *.SQLITE3 *.asc *.lay6 *.lay *.ms11 *.sldm *.sldx *.ppsm *.ppsx *.ppam *.docb *.mml *.sxm *.otg *.odg *.uop *.potx *.potm *.pptx *.pptm *.std *.sxd *.pot *.pps *.sti *.sxi *.otp *.odp *.wb2 *.123 *.wks *.wk1 *.xltx *.xltm *.xlsx *.xlsm *.xlsb *.slk *.xlw *.xlt *.xlm *.xlc *.dif *.stc *.sxc *.ots *.ods *.hwp *.602 *.dotm *.dotx *.docm *.docx *.DOT *.3dm *.max *.3ds *.xml *.txt *.CSV *.uot *.RTF *.pdf *.XLS *.PPT *.stw *.sxw *.ott *.odt *.DOC *.pem *.p12 *.csr *.crt *.key) do (
  echo %%i
  set /a subtotal=subtotal + 1
  set /a total=total + 1
)
echo Detected files: %subtotal%
pause
goto :eof