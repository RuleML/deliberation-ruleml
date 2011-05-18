<?php
class Zipper extends ZipArchive { 
    
public function addDir($path) { 
    print 'adding ' . $path . '<br>'; 
    $this->addEmptyDir($path); 
    $nodes = glob($path . '/*'); 
    foreach ($nodes as $node) { 
        print $node . '<br>'; 
        if (is_dir($node)) { 
            $this->addDir($node); 
        } else if (is_file($node))  { 
            $this->addFile($node); 
        } 
    } 
} 
    
} // class Zipper 
$zip = new Zipper();
$zipname = "ruleml0-91_normal.zip";

if ($zip->open($zipname, ZIPARCHIVE::CREATE)!==TRUE) {
    exit("cannot open <$zipname>\n");
}
$zip->addFromString("README.txt", "Downloaded from http://www.ruleml.org");
addNormalRNCSchema("bindatagroundfact", $zip);
addNormalRNCSchema("bindatagroundlog", $zip);
addNormalRNCSchema("bindatalog", $zip);
addNormalRNCSchema("datalog", $zip);
addNormalRNCSchema("dishornlog", $zip);
addNormalRNCSchema("folog", $zip);
addNormalRNCSchema("fologeq", $zip);
addNormalRNCSchema("hornlog", $zip);
addNormalRNCSchema("hornlogeq", $zip);
addNormalRNCSchema("nafdatalog", $zip);
addNormalRNCSchema("naffolog", $zip);
addNormalRNCSchema("naffologeq", $zip);
addNormalRNCSchema("nafhornlog", $zip);
addNormalRNCSchema("nafnegdatalog", $zip);
addNormalRNCSchema("negdatalog", $zip);
$zip->addDir("modules");
echo "numfiles: " . $zip->numFiles . "<br/>\n";
echo "status:" . $zip->status . "<br/>\n";
$zip->close();

function addNormalRNCSchema($langname, $zip){
$path = "relaxng/" . $langname . "_normal.rnc";
$url = "http://www.ruleml.org/0.91/" . $path;
$output = file_get_contents($url);
$zip->addFromString($path, $output);
}


?>