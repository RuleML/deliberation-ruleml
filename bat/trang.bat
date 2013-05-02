if not exist "..\temp" md "..\temp" 
if not exist "..\xsng" md "..\xsng" 
if not exist "..\simplified" md "..\simplified" 
for %%X in (*.rnc) do (
java -jar "C:\Program Files\RelaxNGTools\jing-20091111\bin\jing.jar" -cs "%%X" > "..\temp\%%~nX.rng" 
java -jar "C:\Program Files\RelaxNGTools\trang-20091111\trang.jar" -o any-process-contents=strict -o any-attribute-process-contents=strict "..\temp\%%~nX.rng" "..\xsng\%%~nX.xsd"
java -jar "C:\Program Files\RelaxNGTools\trang-20091111\trang.jar" "..\temp\%%~nX.rng" "..\simplified\%%X_simplified.rnc"
)