---
title:  "Cannot Find Battery Libraries Over and Over"
date:   2019-09-17
categories: [audio]
tags: [logic, plugins]
---



## Problem

This message keeps coming, even though the Battery 4 plugin and library is installed and I point it to the folder.

![battery loading prompt in logic](battery-loading-1.png)

## Solution

Turns out the dialog will appear for each plugin *instance* in the project.

First make sure the libraries can be loaded.

1. Open the standalone **Battery 4** app (in `/Applications`)
2. Have it scan your library files (e.g. `/Users/Shared/Battery 4 Factory Library`)
3. There's now a bunch of kits visible. Close the application. 
![kits loaded in battery standalone application](battery-loading-2.png)

Then select `Apply to other Battery Instances` **first** and use `Point to Folder`. It will automatically apply the same settings.

![battery recursive settings](battery-loading-3.gif)

Once the project is saved, the settings will persist.
