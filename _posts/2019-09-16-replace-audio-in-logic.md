---
layout: post
title:  "Replacing/Relinking Audio Files in Logic"
date:   2019-09-16 8:09:53
categories: [logic]
---

#### Use Cases

Round tripping audio edits between workstations. Renaming the file helps with version control.

#### Method

This is like "Relinking Files" in video editing.

5. Find the original file in the `Audio Files` folder
2. Zip it up
3. Delete it
4. Close the Project (because the file is already loaded in RAM)
5. Reopen the Project
6. A warning will appear saying the file is missing ![]({% asset relinking-files-logic-1.png @path %})
7. Select **Locate**
8. Choose the new file ![]({% asset relinking-files-logic-2.png @path %})
9. A confirmation window will appear saying the file is changed ![]({% asset relinking-files-logic-3.png @path %})

#### Links

* <https://www.logicprohelp.com/forum/viewtopic.php?t=71041>

