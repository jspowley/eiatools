# eiatools (development version)

## 0.0.0.0001

Removed library() calls from eia_map.R. Packages don't use library. Instead they specify the function and namespace... i.e. package::function()

Removed API key, for standard practice don't include personal identifying information, since it will remain in the git change log history forever. We will republish to a fresh repo when the package is ready to publish.

Moved ROxygen skeleton to beside the function. Makes malfunction R files possible.

Notes:

library() not necessary in package development

Refrain from including API keys and other credentials explicitly.

In a little bit I'll be moving testing code such as the test on eia_map to testthat scripts. Ideally, function .R files and testing .R files should be entirely separate.

When working on a file and one of us has pushed changes after the other persons pull request, use:
  git stash to stash any local changes
  git pull --rebase to attempt a local merge
  git pull if that fails
  git stash apply to apply stashed changes
  git commit -m "message here"
  git push
  
git stash is your friend here. You may also need to do git add . depending on your changes.

## 0.0.0.0002

Licensing changed to proprietary on future changes. We will reship the github repo from a clean slate when we're done, to remove previous records of API keys and prior licensing. We will discuss opening the license up further when we're considering final applications.

Cleaned up eia_map to be more general.

Moved testing function to tests folder. Run all tests with testthat::test().

**Notes To Discuss On Next Call:**
+ Timing of work completion / orginzation (naming conventions, folders, strcuture of code, division of work, road map, documentation).
+ Discuss temporary API key usuage.
+ Discuss data storage requirment inside package. Should we store series_ids for now to meet requirement? Could improve speed marginally as well for ShinyApp.
+ Discuss vision for eia_map - what columns are important, ideally achieving a final clean consistent map across all series.

## 0.0.0.0003

Integrated new branch to repo, named main1.

Added Python integration using reticulate::py_to_r for .xls files from eia Weekly Status Reports. 


