# GitExtensions 

$Global:GitExtensionsSettings = new-object PSObject -Property @{
  GitExtensionsPath = "c:\Program Files (x86)\GitExtensions\GitExtensions.exe"
}

function gitext {
   if($args) {
    if($args[0] -eq "help") {
      # Replace the built-in help behaviour with just a list of commands
      $gitExtensionsCommands
      return    
    }

    $newArgs = @()
    $newArgs += $args[0]
    
    $cmd = $args[0]
    
    if($args.length -gt 1) {
      $args[1..$args.length] | % { $newArgs += $_ }
    }
      
    & $Global:GitExtensionsSettings.GitExtensionsPath $newArgs
  }
}

$gitExtensionsCommands = @(
"blame",
"filehistory",
"fileeditor",
"mergetool",
"mergeconflicts",
"gitbash" ,
"gitignore",
"remotes",
"browse",
"cleanup",
"add",
"addfiles",
"apply",
"applypatch",
"branch",
"checkout",
"checkoutbranch",
"checkoutrevision",
"init",
"clone",
"commit",
"formatpatch",
"pull",
"push",
"settings",
"searchfile",
"viewdiff",
"rebase",
"merge",
"cherry",
"revert",
"tag",
"about",
"stash",
"synchronize",
"openrepo"
) | sort
