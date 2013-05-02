set "str1=%1"
set str2=%2
set "str4=%str2%%str1%"
set str5=xsv_outcome.xsl
set "str6=%str2%%str5%"
cmd.exe /C "C:\Program Files\Oxygen XML Editor 12\xmlGenerator.bat" %str1% -verbose 
cmd.exe /C ""C:\Program Files\Oxygen XML Editor 12\XSV\xsv.exe" -o "errfile.xml"  "%str4%_instance1.xml""
setlocal enableextensions 
for /f "tokens=*" %%a in ( 
'cmd.exe /C ""C:\Program Files\Oxygen XML Editor 12\msxsl.exe" errfile.xml %str6%"
' 
) do ( 
set outcome=%%a 
) 
echo/%%outcome%%=%outcome% 
endlocal 