---
title:  "Replacing/Relinking Audio Files in Logic"
date:   2019-09-16
categories: [audio]
tags: [logic]
---

## Use Cases

Round tripping audio edits between workstations. Renaming the file helps with version control.

## Method

This is like "Relinking Files" in video editing.

5. Find the original file in the `Audio Files` folder
2. Zip it up
3. Delete it
4. Close the Project (because the file is already loaded in RAM)
5. Reopen the Project
6. A warning will appear saying the file is missing ![](relinking-files-logic-1.png)
7. Select **Locate**
8. Choose the new file ![](relinking-files-logic-2.png)
9. A confirmation window will appear saying the file is changed ![](relinking-files-logic-3.png)

## Links

* <https://www.logicprohelp.com/forum/viewtopic.php?t=71041>

