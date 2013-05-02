for %%X in (*.xsd) do (
java -jar "C:\Program Files\RelaxNGTools\rngconv-20060319\rngconv.jar" %%X > ../temp/%%X_rngconv.rng
java -jar "C:\Program Files\RelaxNGTools\jing-20091111\bin\jing.jar"  -s ../temp/%%X_rngconv.rng > ../temp/%%X_flatten.rng
java -jar "C:\Program Files\RelaxNGTools\trang-20091111\trang.jar" ../temp/%%X_flatten.rng ../rngconv/%%X.rnc
)