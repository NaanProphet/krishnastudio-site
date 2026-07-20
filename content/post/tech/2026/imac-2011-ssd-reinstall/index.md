---
title: 2011 iMac Reinstall - Part 1
description: Uh oh, the SSD died
date: 2026-07-19
categories: [tech]
tags: [mac]
---

## Kaput

The SSD in my 2011 iMac finally died. It was a 256 GB Samsung 840 PRO, almost 10 years old and limping along with [Trim Enabler](https://cindori.com/trimenabler). Left it unplugged for about two months when moving things, and I think that killed it. I suspect the NAND chips lost all voltage.

![](<IMG_0494 2026-04-01 at 6.03 AM.jpg>)

Anyway, purchased an OWC SSD to bring ultimate stability to this museum-worthy machine. So light!!

![](<IMG_0491.jpg>)
![](<IMG_0492.jpg>)
![](<IMG_0493.jpg>)

## How to Reinstall Mojave...

Since I already patched the iMac's BIOS and the GPU vBIOS [last time](/post/tech/2023/imac-2011-upgrade), I can skip those steps and just reinstall Mojave.

Claude (Opus 4.6) thinks I can use a vanilla Mojave bootable drive since the GPU was already made Kepler-compatible, but that's false. The Mojave installer blocks iMac 12,2 without the patcher.

### OCLP says no?!

OCLP is now at version 2.4.1 (Sep 1, 2025) whereas I last used 0.6.7 (Jun 2, 2023). The README says Mojave is not supported and to use the old dosdude Mojave Patcher. 🤔 Was that always the case? Seems like it. But then how did I get it working before? Going to try OCLP 2.4.1 anyway[^3].

Since I have another Mac, I can use OCLP there to create the bootable installer. Just need to set the target Host Model to iMac 12,2 and use the default settings.

To make the bootable image, I am using an external HDD because it's 10x faster than those old flash drives and better suited for these kind of files anyway. As I've seen one OCLP dialog say, "Flashing is an intensive process that can trigger hardware faults not normally seen."

Roadbump: looks like OCLP keeps failing during validation. Looking for `SharedSupport.dmg` but it's not present in the Mojave bootable drive. At first I thought my installer file was corrupt and I re-downloaded the installer DMG from Apple[^1] but that failed too. The older OCLP 0.6.7 fails for the same reason too.

![](<Screen Shot 2026-04-01 at 5.29.27 AM.png>)

### Hello again, dosdude!

Need to use the old dosdude [Mojave Patcher](https://dosdude1.com/mojave/) to create the bootable installer image. However, going to stop short of applying dosdude's old antiquated patches (the `macOS Post Install`) and use OCLP instead for that! A little mix and match.

![](<Screen Shot 2026-04-01 at 6.06.53 AM.png>)
![](<Screen Shot 2026-04-01 at 6.07.21 AM.png>)
![](<Screen Shot 2026-04-01 at 6.10.38 AM.png>)

Since I haven't opened up the iMac yet, I'll both boot the installer externally and write to the SSD externally too. I formatted the SSD with APFS (just regular APFS[^2]) with GUID partitioning.

## Writing OCLP to the New SSD

There are some additional caveats here because I am externally booting from the new SSD.

The 2011 iMac only has USB 2.0 ports built in. I use a Kanex KTU10 Thunderbolt adapter for USB 3.0 and eSATA. However, I cannot access the OCLP boot picker directly from the Thunderbolt adapter! Thus, until I open up the iMac and put the SSD inside, I need to bootstrap using a spare USB drive:

1. Flash the OCLP EFI partition (`Build and Install OpenCore`) on a cheap USB drive to provide the initial bootstrap. Be sure to first go to OCLP Settings and change from Host Model to iMac 12,2
2. Bootstrap from the cheap USB drive (by holding down Option) and then select the external SSD to finish booting up
3. Once inside macOS, use OCLP again to flash the EFI on the actual external SSD that has Mojave installed. This is important because it will autodetect machine-specific settings (like my modded GPU!)
4. Once the SSD is installed inside the iMac, then the surrogate USB drive can be dropped.

**Stock iMac 12,2 OCLP Settings**

These are used for the surrogate USB drive. OCLP running from another Mac.

![](<oclp-A-1 Screen Shot 2026-04-02 at 3.52.11 AM.png>)
![](<oclp-A-2 Screen Shot 2026-04-02 at 3.52.13 AM.png>)
![](<oclp-A-3 Screen Shot 2026-04-02 at 3.52.15 AM.png>)
![](<oclp-A-4 Screen Shot 2026-04-02 at 3.52.17 AM.png>)
![](<oclp-A-5 Screen Shot 2026-04-02 at 3.52.19 AM.png>)
![](<oclp-A-6 Screen Shot 2026-04-02 at 3.52.21 AM.png>)
![](<oclp-A-7 Screen Shot 2026-04-02 at 3.52.23 AM.png>)
![](<oclp-A-8 Screen Shot 2026-04-02 at 3.52.58 AM.png>)
![](<oclp-A-9 Screen Shot 2026-04-02 at 3.53.08 AM.png>)

**My iMac 12,2 OCLP Settings**

These are used to write the new SSD. OCLP running on the actual iMac after initial boot using `Host Model`.

![](<oclp-B-1 Screen Shot 2026-04-02 at 6.03.54 AM.png>)
![](<oclp-B-2 Screen Shot 2026-04-02 at 6.03.56 AM.png>)
![](<oclp-B-3 Screen Shot 2026-04-02 at 6.03.59 AM.png>)
![](<oclp-B-4 Screen Shot 2026-04-02 at 6.04.01 AM.png>)
![](<oclp-B-5 Screen Shot 2026-04-02 at 6.04.05 AM.png>)
![](<oclp-B-6 Screen Shot 2026-04-02 at 6.04.18 AM.png>)
![](<oclp-B-7 Screen Shot 2026-04-02 at 6.04.24 AM.png>)
![](<oclp-B-8 Screen Shot 2026-04-02 at 6.04.27 AM.png>)

Note that I temporarily spoofed the Model to `iMac 13,1` so that I could get the final Mojave update!!

![](<oclp-B-9 Screen Shot 2026-04-02 at 6.15.46 AM.png>)
![](<oclp-B-10 Screen Shot 2026-04-02 at 6.15.52 AM.png>)
![](<oclp-B-11 Screen Shot 2026-04-02 at 6.35.18 AM.png>)
![](<oclp-B-12 Screen Shot 2026-04-02 at 6.35.33 AM.png>)

Catalina no thank you! After getting the final update, I removed the spoofing and it now reads as `iMac 12,2` again.

![](<oclp-B-13 Screen Shot 2026-04-02 at 6.56.28 AM.png>)
![](<oclp-B-14 Screen Shot 2026-04-02 at 6.56.34 AM.png>)

## Final State

Can boot great externally! Wi-Fi worked out of the box! Time to now install software.

## Footnotes

[^1]: Pretty cool that Apple provides all the download links for previous macOS versions! https://support.apple.com/en-us/102662
[^2]: https://discussions.apple.com/thread/255134598?sortBy=rank
[^3]: Unlike version 0.6.7, OCLP 2.4.1 installs two files via pkg: `/Library/Application Support/Dortania/OpenCore-Patcher.app` and `/Library/PrivilegedHelperTools/com.dortania.opencore-legacy-patcher.privileged-helper`