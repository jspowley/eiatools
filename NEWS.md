# eiatools (development version)

## 0.0.0.0001

Removed library() calls from eia_map.R. Packages don't use library. Instead they specify the function and namespace... i.e. package::function()

Removed API key, for standard practice don't include personal identifying information, since it will remain in the git change log history forever. We will republish to a fresh repo when the package is ready to publish.

Moved ROxygen skeleton to beside the function. Makes malfunction R files possible.

Notes:

library() not necessary in package development

Refrain from including API keys and other credentials explicitly.

In a little bit I'll be moving testing code such as the test on eia_map to testthat scripts. Ideally, function .R files and testing .R files should be entirely separate.
