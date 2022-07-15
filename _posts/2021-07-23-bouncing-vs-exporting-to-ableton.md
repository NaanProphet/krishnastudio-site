---
layout: post
title:  "Bouncing vs. Exporting From Logic to Ableton"
date:   2021-07-23 09:34:00
categories: [logic]
---

#### TL;DR

Use Export for stems. If `Bypass Effect Plug-ins` is unchecked, it will use effects.

#### Explanation

There are tons of articles on this already, but I forgot the difference.

The use case is a Logic Pro X project with a bunch of tracks, and I want to export stems/submixes to Ableton so that we can perform them live.

Here is the cheatsheet:

* Use `Export > Tracks as Audio Files... ⌘E` for an individual file/track
* Use `Export > All Tracks as Audio Files... ⇧⌘E` for a single file for a whole group of tracks
* Double check if any Volume Automation "mixing" is present in the track (press `A` to toggle the Automation view). Select `Include Volume/Pan Automation` if desired
* Double check the `Range` settings and use `Export Cycle Range Only` if desired
* Specify a custom prefix for stem filenames for good housekeeping
