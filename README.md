deliberation-ruleml
===================
 
 This repository contains:
* schemas in Relax NG and XSD for Deliberation RuleML Version 1.0
* XSLT stylesheets to upgrade from Deliberation RuleML Version 0.91 to 1.0
* XSLT stylesheets to normalize Deliberation RuleML Version 1.0
* schemas for the MYNG modular design pattern
* example RuleML files
* RuleML glossary
* PHP scripts for MYNG
* NVDL scripts for MYNG
 
Recommended Workflow
====================

Initialization
--------------
1. Fork to create a public repo in your own Github account. 
I'll use my account (greenTara) for the examples. 
You should replace "greenTara" with your Github user name.

2. Clone the central repo to your local computer.([1])

    $ git clone https://github.com/RuleML/deliberation-ruleml.git

3. Add your forked repository as a read-only remote.([2])

    $ git remote add myFork git://github.com/greenTara/deliberation-ruleml.git

Branching to Resolve Issues
---------------------------
1. Switch to your master branch, if necessary.

    $ git checkout master

2. Update your master branch from the ruleml remote.([2])
    
    $ git pull
    
    There should be no conflicts from this pull, because you have been following the
    workflow described here and doing all your development in temporary branches.
    
3. Select an issue from the issue tracker to work on, or create a new issue.

4. Create and switch to a new branch in your local repo, with name, say, Issue#45.([3])

    $ git checkout -b Issue#45 

5. Modify your local clone:  
  a) Make your changes in your usual working environment (plain text eclipse, oXygen, ...), and test your modifications  
  b) Optional: If you add or delete files or folders, use  

    $ git add -A

  c) Commit frequently, using messages that are helpful to you,([4], [6])  

    $ git commit -a
    
  d) Repeat a-c, or continue to the next step.
    
   

6. When your fix is finished (or far enough along that you want some review), 
  update your repository from the central repo online.([2]) 

    $ git fetch
    
7. Use rebase to reorder your commits to occur on top of everybody else's. 
   The -i option allows you to interactively clean up your commits and "squash" them together.([5])

    $ git rebase -i
    
8. Push your commits to a new branch in your remote fork.([2])

    $ git push myFork Issue#45
    
9. Login to your Github account to verify that everything got uploaded OK, then
submit a pull request to RuleML/deliberation-ruleml from your Github account.
If the RuleML repo already has a branch for Issue#45, submit your pull-request to that branch,
otherwise submit to master.

10. The RuleML maintainer and/or other developers will make comments on your pull-request if 
anything needs to be changed.
You can push new commits to your Issue#45 branch and they will automatically be added to the pull-request.
If your submission is accepted, the RuleML/Issue#45 branch will be merged with RuleML/master.
It will then be propagated on the master branch to all forks when Step #2 or Step #6 is 
executed by any user.

[1]:http://git-scm.com/book/en/Git-Basics-Getting-a-Git-Repository
[2]:http://git-scm.com/book/en/Git-Basics-Working-with-Remotes
[3]:http://git-scm.com/book/en/Git-Branching-Basic-Branching-and-Merging
[4]:http://git-scm.com/book/en/Git-Basics-Recording-Changes-to-the-Repository
[5]:http://git-scm.com/book/en/Git-Branching-Rebasing
[6]:http://git-scm.com/book/en/Getting-Started-Git-Basics

