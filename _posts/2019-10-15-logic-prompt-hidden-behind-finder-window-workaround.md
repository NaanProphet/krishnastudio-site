---
layout: post
title:  "Logic Prompt Hidden Behind Finder Window Workaround"
date:   2019-10-15 12:45:02
categories: [logic]
---

Extension of [Replacing/Relinking Audio Files in Logic]({% post_url 2019-09-16-replace-audio-in-logic %})

#### Problem

Sometimes, if I replace/relink an audio file during launch, the project seems to hang without loading.

![]({% asset relinking-files-logic-hidden-prompt-1.png @path %})

![]({% asset relinking-files-logic-hidden-prompt-2.png @path %})

What is actually happening is there is another dialog prompt (for another missing file) but it is hidden behind the Finder prompt!

#### Workaround (Ratchet)

Move the Finder dialog *off to the side* selecting a file with `Open`. That way, the dialog will appear in the usual place and you can still see it. Press `Use` to continue.

![]({% asset relinking-files-logic-hidden-prompt-3.png @path %})

If you have multiple files that need relinking, be careful to move the dialogs away in a consistent manner—otherwise it may look like this!

![]({% asset relinking-files-logic-hidden-prompt-4.png @path %})
