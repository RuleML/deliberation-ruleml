# dc:rights [ 'Copyright 2015 RuleML Inc. -- Licensed under the RuleML Specification License, Version 1.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://ruleml.org/licensing/RSL1.0-RuleML. Disclaimer: THIS SPECIFICATION IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, ..., EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. See the License for the specifics governing permissions and limitations under the License.' ]
This directory contains build scripts for Deliberation RuleML
There are two top-level build scripts:
* build_myng.sh : this builds the generated RNC and XSD locally and tests it against local test suites
* build_web.sh : (under development) this builds the generated RNC and XSD from the cloud and tests it against cloud-stored test suites. 

Instructions that follow apply to Unix/Linux/Mac Platforms as well as Linus on WSL(Windows Sybsystem for Linux)
For WSL users there is a special section at the end.

Prerequisite:
1.  Oxygen XML is required to execute the bash scripts that apply test and create artifacts. All developers are expected to execute these scripts before a pull request. Oxygen versions up to 20.1 should work.

Preliminaries:
0.  If directories <Dir> for 1. don't exist yet, create them with mkdir -p <Dir>
1.  Create a symbolic links from the relaxng/modules directory to relaxng/drivers/modules. From the repository home directory:
    For Unix/Mac systems:
    $ cd ./relaxng/drivers
    $ ln -s ../modules/ modules
    
    $ cd ../drivers4simp
    $ ln -s ../modules/ modules

    $ cd ../drivers4xsd
    $ ln -s ../modules/ modules 
    
    $ cd ../drivers4xsd_normal
    $ ln -s ../modules/ modules
    
    $ cd ../drivers4xsd_normal_min
    $ ln -s ../modules/ modules
   
    $ cd ../drivers4xsd_min
    $ ln -s ../modules/ modules

2.  Ensure that GIT is installed.
3.  Ensure that JAXB is installed.
4.  Ensure that PHP is installed.
5.  Ensure that curl is installed.
6.  Ensure that xmllint (in the library: libxml2-utils) is installed.


Procedure:
1. run build_myng.sh. The script should exit with code 0.
  - The script may be run directly from a terminal.
    $ ./build_myng.sh
  - alternately, the script may be run from an external tool from oXygen.
2. After successful execution of build_myng.sh, 
  - commit the results
  - @@@ push to Github
  - wait for synchronization on the RuleML server, or manually update with gitupdate.sh on the server
3. run build_web.sh. The script should exit with code 0.
  - This script performs some tests of the RuleML installation on HawkHost, however these tests are not as extensive as those performed by the build_myng.sh script.
4. After successful execution of build_web.sh, 
  - commit the results
  - push to Github
  - wait for synchronization on the RuleML server, or manually update with gitupdate.sh on the server @@@
5. run build_xsd2doc.sh in order to update the schemadocs.
  - Before the schemadocs are updated, all changes should have been committed and pushed into the personal fork.

These scripts call incremental build scripts which can be manually activated for partial builds.
See the top-level build scripts for details.

(Optional)
If you are creating a new bash script, the permissions of that file must be modified in order to make sure it is executable.
The following steps should be followed:
1.  Open the terminal
2.  Navigate to the path of the new script on the machine:
    $ cd /path/to/clone/deliberation/bash/
3.  Enter the following command:
    $ chmod a+x scriptname.sh
The script should now be executable.

If you use oXygen for editing your files, "External tools" can be made to facilitate the process of running the scripts.
Creating an external tool (oXygen v. 19 or 20):
1.  Within oXygen, locate "Tools" from the top-bar menu.
2.  Navigate to Tools->External Tools->Configure
3.  Click on "New" located at the bottom right of the screen.
4.  Give the tool a name and a description of your preference.
5.  Enter "${cfd}" without the quotes as "Working Directory"
6.  
    6a. (Unix/Linux/Mac) Enter "./${cfne}" without the quotes in the "Command Line" text field.
    6b. (Windows) Enter 'bash -c "./${cfne}"' without the single quotes in the "Command Line" text field.
7.  Keep the rest of the defaults.

Now that this is done, you can easily run the bash scripts of the project by following these steps :
1.  Have the desired script open and in focus in oXygen.
2.  Navigate to Tools->External Tools
3.  Click on the tool you just created.

A command  prompt should now appear within the oXygen console displaying the progress of the script.

WSL specific instructions:

I] Steps to change flattenSchems.sh, xmlGenerator.sh and schemaDocumentation.sh

1. Change sh to bash in "#!bin/   /"

2. Make changes by removing the patch of
	# Resolve the location of the oxygen installation.
	# This includes resolving any symlinks.
	and
	# Absolutize dir
	
  a. Removing the original code that creates the variable $OXYGEN_HOME 
    
  b. Change $Oxygen_Home to OXYGEN_HOME="/mnt/c/Program Files/Oxygen XML Editor 20"

3. Change every line in Classpath to update the latest version number, but dont change the  sequence of the line.Break the Classpath temporarily into separate lines
  example: 
  '$OXYGEN_HOME/lib/guava-19.0.jar' becomes '$OX_HOME/lib/guava-23.0.jar'

4. Change in last section

"${OXYGEN_JAVA}" \
 -Xmx256m\
 -XX:SoftRefLRUPolicyMSPerMB=10\
 -cp "$CP"\
 ro.sync.xml.generator.XMLInstanceGenerator "$@"
 
 to
 
java -Xmx256m -XX:SoftRefLRUPolicyMSPerMB=10 -cp "$CP" ro.sync.xml.generator.XMLInstanceGenerator "$@" 
Note: the above line should be in single line and shouldnt be splitted anywhere, else it gives \r error

II] Soft Links

Validation error caused by soft links (symlinks) from WSL in Oxygen XML Editor

Error description: 
System ID: C:\Users\rcsb12345\git\deliberation-ruleml\relaxng\drivers4simp\datalog_normal.rnc

Main validation file: C:\Users\rcsb12345\git\deliberation-ruleml\relaxng\drivers4simp\datalog_normal.rnc

Engine name: Jing

Severity: error

Description: FileNotFoundException - C:\Users\rcsb12345\git\deliberation-ruleml\relaxng\drivers4simp\modules\performative_expansion_module.rnc (The file cannot be accessed by the system)

Reference document: README.txt in bash/ describes soft links "$ ln -s ../modules/ modules" in subfolders of relaxng/.

Note: rnc files in any subfolder of relaxng\ which contains drivers(i.e., folders such as drivers\, drivers4xsd\, ...) fail on validation (from within the Windows-based oXygen, while working fine within the WSL-based scripts). This is due to incomplete sharing of files between the WSL and Windows systems (when using symlinks in WSL).

Caution: If user tries to open modules file in any subfolders of relaxng, they get an error message of "Cannot open specified file, the specified file does not exist: C:\Users\xyz_name\git\deliberation-ruleml\relaxng\drivers4simp\modules". The ('passive') file seen by Windows having name "modules" is actually a symlink created (and 'actively' usable) within WSL.
