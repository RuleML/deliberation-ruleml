deliberation-ruleml
===================
 
 This repository contains:
* schemas in Relax NG and XSD for Deliberation RuleML Version 1.03
* XSLT stylesheets to normalize Deliberation RuleML Version 1.03
* schemas for the MYNG 1.03 modular design pattern
* example RuleML 1.03 files
* PHP scripts for MYNG 1.03
* NVDL scripts for MYNG 1.03
* bash scripts for building the RuleML 1.03 release
 
Prerequisites
-------------
1. To contribute to this repository, You must have the following installed on your system : 
    1.1 Git, See ([7])
    1.2 JAXB, See ([9])
    1.3 PHP, See ([10])
    1.4 curl, See ([11])
    1.5 xmllint, See ([12])   
        
2. To run the bash scripts to build the RuleML release, you must create your own "path_config.sh" script in the bash directory.
	2.1. First, Navigate to the "bash" directory of from the root of this repository
	2.2. Find the file with name "path_config_template.sh"
	2.3. Copy this file and rename it to "path_config.sh"
	2.4. Open "path_config.sh" in a text editor
	2.5. Change the following variables accordingly
		- PLATFORM : 	Enter the OS of your current machine.
						e.g. "Mac" for MacOS, "Linux" for Linux machines
		- OXY_VERSION : Enter the version number of your oXygen XML editor.
						e.g. "18"
	    - OXY_HOME : 	Enter the installation location of oXygen on your machine.
						e.g. "C:/Program Files/Oxygen XML Editor 18/"
                           
3.  To run bash scripts to build the RuleML release, you must create your own "FILENAME-config.xml" files from the "FILENAME-config_template.xml" files under /bash/settings/ 
    3.1  Find the first "FILENAME-config_template.xml"
    3.2  Copy this file and rename it to "FILENAME-config.xml"
    3.3  Open "FILENAME-config.xml" in a text editor   
    3.4  Change the following fields
         -  For schemaSystemID, the path to the installation of the repository on your machine must be put in, while keeping the path of the xsd file.
            Text in lowercase remains unchanged.
            e.g.
            file:/home/dylan/Documents/GitHub/deliberation/xsd/naffologeq_compact.xsd
            >>
            file:/PATH/TO/CLONE/xsd/naffologeq_compact.xsd
    
         -  For outputFolder, the path to the installation of the repository on your machine must be put in, while keeping the path of the xsd file.
            Text in lowercase remains unchanged.
            e.g.
            /home/dylan/Documents/GitHub/deliberation/test/compact-test-suites
            >>
            /PATH/TO/CLONE/test/compact-test-suites
    3.5  Repeat for every file ending in "-config.xml" 
       

Training
--------
1. See the RuleML Github Demos at http://wiki.ruleml.org/index.php/Github_Demo .

Recommended Workflow
====================

Initialization
--------------
1. Fork to create a public repo in your own Github account. 
I'll use my account (greenTara) for the examples. 
You should replace "greenTara" with your Github user name.

2. Clone the central repo to your local computer using the read-only URL.([1])

    $ cd path/to/directory/of/Git/repositories  
    $ git clone git://github.com/RuleML/deliberation-ruleml.git

3. Enter the local repository

    $ cd deliberation-ruleml
4. Add your forked repository as a read-write remote.([2])

    $ git remote add myFork https://github.com/greenTara/deliberation-ruleml.git

5. Other configuration steps, such as providing your name and email so your commits can be identified
   should be performed at this point, if they haven't been done already.

    $ git config --global user.name "Tara Athan"
    
    $ git config --global user.email "taraathan AT gmail.com"
    
    $ git config --global push.default simple

Branching to Resolve Issues
---------------------------
1. Switch the branch for the appropriate version, if necessary.

    $ git checkout 1.03

2. Update your 1.03 branch from the ruleml remote.([2])
    
    $ git pull
    
    There should be no conflicts from this pull, because you have been following the
    workflow described here and doing all your development in temporary branches.
    
3. Select an issue from the issue tracker ([8]) to work on, or create a new issue.

4. Create and switch to a new branch in your local repo, with name, say, issue45.([3])

    $ git checkout -b issue45 

5. Modify your local clone:  
  a) Make your changes in your usual working environment (plain text editor, eclipse, oXygen, ...), and test your modifications  
  b) Optional: If you add or delete files or folders, use  

    $ git add -A

  c) Commit frequently, using messages that are helpful to you,([4], [6])  

    $ git commit -a
    
  d) Repeat a-c, or continue to the next step.
    
6. When your fix is finished (or far enough along that you want some review), 
  update your repository (again) from the RuleML repo online.([2])
  
  a) Fetch from the central RuleML repository:
  
    $ git pull
    
7. Push your commits to a new branch in your remote fork.([2])

    $ git push myFork issue45
    
8. Login to your Github account  and perform the following:  
  a) verify that everything got uploaded OK  
  b) submit a pull request to RuleML/deliberation-ruleml from your Github account. 
     If the RuleML repo already has a branch for issue45, submit your pull-request to that branch,
     otherwise submit to the 1.03 branch.

9. The RuleML maintainer and/or other developers will make comments on your pull-request if 
anything needs to be changed.
You can push new commits to your issue45 branch and they will automatically be added to the pull-request.
If your submission is accepted, the RuleML/issue45 branch will be merged with RuleML/1.03, or possibly a later version.
It will then be propagated to all forks when Step #2 or Step #6 is 
executed by any user.

[1]:http://git-scm.com/book/en/Git-Basics-Getting-a-Git-Repository
[2]:http://git-scm.com/book/en/Git-Basics-Working-with-Remotes
[3]:http://git-scm.com/book/en/Git-Branching-Basic-Branching-and-Merging
[4]:http://git-scm.com/book/en/Git-Basics-Recording-Changes-to-the-Repository
[5]:http://git-scm.com/book/en/Git-Branching-Rebasing
[6]:http://git-scm.com/book/en/Getting-Started-Git-Basics
[7]:http://git-scm.com/downloads
[8]:https://github.com/RuleML/issues-ruleml
[9]:https://github.com/javaee/jaxb-v2
[10]:http://php.net/manual/en/install.php
[11]:https://curl.haxx.se/
[12]:http://xmlsoft.org/xmllint.html

