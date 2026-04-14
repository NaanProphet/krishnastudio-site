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

Variations:

- for output as an `.aiff` file, use `pcm_s16be` instead
- for multichannel audio diffs[^3], use `aeval = -val(0):c=same`

## Background

Sometimes I want to diff two audio files when working on mixes, because I forget what has changed between versions. I keep notes, but they can be subtle or hard to verify.

The above FFmpeg command[^1] outputs the differences between two files. It works on both WAV and AIF input files. I haven't tried too many variations[^2], but it's working for stereo 16-bit 44.1k and 48k files just fine.

Note the command outputs the diff in BOTH input files to the output. So if something was nudged over by 1 beat, you'll hear the original start and the new one start over each other. That is still helpful in drawing attention to what has changed.[^4]

## Explanation (from Claude Sonnet 4.6)

**Inputs:**
- **`-i input0.wav`** and **`-i input1.wav`** — the two input files, indexed as `[0]` and `[1]`

**Filter chain:**
- **`[1]`** — applies the following filter to input 1
- **`aeval`** — evaluates a math expression on each audio sample
- **`-val(0)`** — negates the value of the left channel
- **`-val(1)`** — negates the value of the right channel
- **`|`** — separates the expressions for each channel
- **`[a]`** — labels the phase-inverted output stream as `a`
- **`[0][a]`** — feeds input 0 and the inverted stream into the next filter
- **`amerge=inputs=2`** — merges the two stereo streams into a single 4-channel stream
- **`pan=stereo`** — remixes that 4-channel stream back down to stereo
- **`c0<c0+c2`** — new left channel = original left + inverted left
- **`c1<c1+c3`** — new right channel = original right + inverted right
- **`[b]`** — labels the final output stream as `b`

**Output:**
- **`-map "[b]"`** — tells FFmpeg to use stream `b` as the output
- **`-c:a pcm_s16le`** — encodes as uncompressed 16-bit PCM, little-endian audio (for WAV)
- **`output.wav`** — the output file

**Multichannel variation:**

- **`val(0)`** — refers to whatever the current channel is rather than specifically the left channel and 
- **`c=same`** — tells FFmpeg to preserve the input's channel layout in the output, rather than having to explicitly enumerate each channel with `|`


## References

[^1]: Thanks to Stack Exchange, upvote the OP if you can! <https://video.stackexchange.com/questions/36396/can-ffmpeg-perform-audio-phase-subtraction/36398#36398?newreg=4755d58e081b4fd28871c887fd04a4c8>
[^2]: More output formats can be specified from this list <https://trac.ffmpeg.org/wiki/audio%20types>
[^3]: <https://superuser.com/questions/1066644/ffmpeg-audio-phase-reversal>
[^4]: If the precise sample offset is known, add `adelay` (adds silence at beginning) or `apad` (add silence at end) in the `filter_complex` chain