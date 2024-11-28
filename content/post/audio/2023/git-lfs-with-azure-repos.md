---
title:  "Azure Git LFS failed to push refs Fix"
date:   2023-05-14
categories: [audio]
tags: [logic]
---

## TL;DR

If you see `error: failed to push some refs to 'https://dev.azure.com/...'` use the following workaround and try again.

`git config http.version HTTP/1.1`

Last tested with git version 2.32.0 and git-lfs version 2.13.3 on Mac OS X 10.14.6 Mojave.

## Explanation

Azure Dev Repos is a wonderful place to version control Logic projects, because it has unlimited storage and support LFS.[^1]

A particularly large project (20 GB, largest file 225 MB) was failing to push to the server. I've seen two variations of this error: either an HTTP 413 or an HTTP 503 error while pushing a project. To add salt to the wound, it was happening in the final 1%.

```
$ git push --set-upstream origin master
Uploading LFS objects:  99% (678/686), 18 GB | 2.0 MB/s, done.
Fatal error: Server error: https://username@dev.azure.com/my-logic-project/info/lfs/objects/1181a8d96cf25bb980a9d59130420a12d50a9b08905135217d7ac77fda10a14f from HTTP 503
Fatal error: Server error: https://username@dev.azure.com/my-logic-project/info/lfs/objects/73bcb141b8ec7287ede335c42cc1e4a668220aa55bd878c7e5a2c1d9f57fba42 from HTTP 503
LFS: Client error: https://username@dev.azure.com/my-logic-project/info/lfs/objects/a36859394739a5c5e076d21169373d2d5719a903e75630678697beb669a58a2d from HTTP 413
error: failed to push some refs to 'https://dev.azure.com/my-logic-project'
```

Apparently this is a known problem, specific to Azure Dev Repos only.[^2] The workaround is to downgrade the HTTP protocol used by Git so that the large files go through.

```
$ git push --set-upstream origin master
Uploading LFS objects: 100% (686/686), 20 GB | 2.6 MB/s, done.                  
Enumerating objects: 805, done.
Counting objects: 100% (805/805), done.
Delta compression using up to 8 threads
Compressing objects: 100% (794/794), done.
Writing objects: 100% (803/803), 5.74 MiB | 1.82 MiB/s, done.
Total 803 (delta 31), reused 0 (delta 0), pack-reused 0
remote: Analyzing objects... (803/803) (2601 ms)
remote: Storing packfile... done (182 ms)
remote: Storing index... done (40 ms)
To https://dev.azure.com/my-logic-project
   5d884b1..3b9e73d  master -> master
Branch 'master' set up to track remote branch 'master' from 'origin'.
$ 
```

I would recommend issuing the command without the `-g` flag, so that the `http.version` override is local to the git project only. If needed, revert changes using `git config --unset http.version`.

## References

[^1]: That's why I made this: <https://github.com/NaanProphet/git-logic-init>
[^2]: Apparently a lot of Azure devs live with this workaround <https://developercommunity.visualstudio.com/t/git-lfs-push-got-413-error/867488>