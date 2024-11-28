---
title:  "Subtracting Audio Files with FFmpeg"
date:   2023-09-04
categories: [audio]
tags: [logic]
---

## TL;DR

Command line magic to the rescue!

```
ffmpeg -i input0.wav -i input1.wav \
  -filter_complex \
  "[1]    aeval  = -val(0) | -val(1)                     [a]; \
   [0][a] amerge = inputs=2,pan=stereo|c0<c0+c2|c1<c1+c3 [b]" \
  -map "[b]" -c:a pcm_s16le output.wav
```

## Explanation

Sometimes when working on mixes I forget what has changed between versions. I keep notes, but they can be subtle or hard to verify.

The above FFmpeg command[^1] outputs the differences between two files. It works on both WAV and AIF input files. I haven't tried too many variations[^2], but it's working for stereo 16-bit 44.1k and 48k files just fine.

Note the command outputs the differences in BOTH input files to the output. For example if something was nudged over by 1 beat, you'll hear the original start and the new one start 1 beat later over each other. It's still helpful in drawing attention to what has changed though. 

## References

[^1]: Thanks to Stack Exchange, upvote the OP if you can! <https://video.stackexchange.com/questions/36396/can-ffmpeg-perform-audio-phase-subtraction/36398#36398?newreg=4755d58e081b4fd28871c887fd04a4c8>
[^2]: More output formats can be specified from this list <https://trac.ffmpeg.org/wiki/audio%20types>