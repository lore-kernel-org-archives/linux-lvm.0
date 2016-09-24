Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8O2FXAX027059
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 23 Sep 2016 22:15:33 -0400
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7AE3033884D
	for <linux-lvm@redhat.com>; Sat, 24 Sep 2016 02:15:24 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id l91so60342105qte.3
	for <linux-lvm@redhat.com>; Fri, 23 Sep 2016 19:15:24 -0700 (PDT)
MIME-Version: 1.0
From: Giuliano Procida <giuliano.procida@gmail.com>
Date: Sat, 24 Sep 2016 03:15:02 +0100
Message-ID: <CAE-HYsNGEw1QnVNxMx6DVFnYrBBVBqNkdwKURKDOX5k3RSgHyw@mail.gmail.com>
Subject: [linux-lvm] LVM RAID repair woes (no hot spare)
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Linux hilfy 4.6.0-1-amd64 #1 SMP Debian 4.6.4-1a~test (2016-09-16)
x86_64 GNU/Linux
(essentially stock Debian kernel)

  LVM version:     2.02.164(2) (2016-08-15)
  Library version: 1.02.133 (2016-08-15)
  Driver version:  4.34.0

I have a 5 disk setup. There is one large PV per disk and a single VG.
LVs are mostly raid5 (vg0/home is raid6).

I needed to replace one disk so I researched and tested in a VM
(debian-8.6.0-amd64-netinst.iso) first. Web searching LVM RAID repair
was not too encouraging.

The following recipe worked in the VM:

Shutdown.
Remove one virtual disk.
Add new empty virtual disk.
Boot.
partition
pvcreate, vgextend
3x lvconvert --repair LV
vgreduce --removemissing

I tested this with raid1, raid5 and raid6 LVs spanning all the PVs. It
worked just fine.

I came to do the same with a physical disk change.
Take backups.
Shutdown
Remove one failing disk.
Add new empty disk.
Boot.
partition, pcreate, vgextend

I first repaired the root volume and this worked just fine.

Then I tried to repair the var volume.
I very unfortunately did not keep the error messages.
They included a complaint about "new device injected into existing
array without 'rebuild' parameter specified" and ended with a failure
to lock something.

Various tests showed that /var was still functioning fine (and there
appeared to have been a resync, possibly after I re-ran the command).

It was a bit disturbing to see duplicate symlinks (-> ../dm-$n) in
/dev/mapper, but each duplicate was either a _missing or [inactive]
device. The duplicates are no longer there (at least two reboots after
repairing var and one after repairing home). I thought there might be
some odd state in-kernel after the first repair; this is what prompted
me to try repairing the next LV after a reboot.

The net effect is that I now have RAID volumes in an odd state with
extracted / missing
images and perhaps a rebuild on every boot (I don't want to reboot
unnecessarily right now as /home takes a long time to resync).

I've included some relevant information plus kernel logs below. Please
let me know if more information would be useful or whether this all
belongs in a bug tracker somewhere.

Thanks for any assistance. I really hope I can get this working properly again.

--gp

Excerpt from lvs -a:

  root                     vg0 rwi-aor---  25.00g
              100.00
  [root_rimage_0]          vg0 iwi-aor---   6.25g
  [root_rimage_1]          vg0 iwi-aor---   6.25g
  [root_rimage_2]          vg0 iwi-aor---   6.25g
  [root_rimage_3]          vg0 iwi-aor---   6.25g
  [root_rimage_4]          vg0 iwi-aor---   6.25g
  [root_rmeta_0]           vg0 ewi-aor---   4.00m
  [root_rmeta_1]           vg0 ewi-aor---   4.00m
  [root_rmeta_2]           vg0 ewi-aor---   4.00m
  [root_rmeta_3]           vg0 ewi-aor---   4.00m
  [root_rmeta_4]           vg0 ewi-aor---   4.00m
  var                      vg0 rwi-a-r---  25.00g
              100.00
  var_rimage_0__extracted  vg0 -wi-----p-   6.25g
  [var_rimage_1]           vg0 iwi-aor---   6.25g
  [var_rimage_2]           vg0 iwi-aor---   6.25g
  [var_rimage_3]           vg0 iwi-aor---   6.25g
  [var_rimage_4]           vg0 iwi-aor---   6.25g
  [var_rimage_5]           vg0 iwi-aor---   6.25g
  var_rmeta_0__extracted   vg0 -wi-----p-   4.00m
  [var_rmeta_1]            vg0 ewi-aor---   4.00m
  [var_rmeta_2]            vg0 ewi-aor---   4.00m
  [var_rmeta_3]            vg0 ewi-aor---   4.00m
  [var_rmeta_4]            vg0 ewi-aor---   4.00m
  [var_rmeta_5]            vg0 ewi-aor---   4.00m
  home                     vg0 rwi-aor--- 400.01g
              100.00
  home_rimage_0__extracted vg0 -wi-----p- 133.34g
  [home_rimage_1]          vg0 iwi-aor--- 133.34g
  [home_rimage_2]          vg0 iwi-aor--- 133.34g
  [home_rimage_3]          vg0 iwi-aor--- 133.34g
  [home_rimage_4]          vg0 iwi-aor--- 133.34g
  [home_rimage_5]          vg0 iwi-aor--- 133.34g
  home_rmeta_0__extracted  vg0 -wi-----p-   4.00m
  [home_rmeta_1]           vg0 ewi-aor---   4.00m
  [home_rmeta_2]           vg0 ewi-aor---   4.00m
  [home_rmeta_3]           vg0 ewi-aor---   4.00m
  [home_rmeta_4]           vg0 ewi-aor---   4.00m
  [home_rmeta_5]           vg0 ewi-aor---   4.00m
  photos                   vg0 rwi-aor-p- 600.00g
              100.00
  [photos_rimage_0]        vg0 iwi-a-r-p- 200.00g
  [photos_rimage_1]        vg0 iwi-aor--- 200.00g
  [photos_rimage_2]        vg0 iwi-aor--- 200.00g
  [photos_rimage_3]        vg0 iwi-aor--- 200.00g
  [photos_rimage_4]        vg0 iwi-aor--- 200.00g
  [photos_rmeta_0]         vg0 ewi-a-r-p-   4.00m
  [photos_rmeta_1]         vg0 ewi-aor---   4.00m
  [photos_rmeta_2]         vg0 ewi-aor---   4.00m
  [photos_rmeta_3]         vg0 ewi-aor---   4.00m
  [photos_rmeta_4]         vg0 ewi-aor---   4.00m

Excerpt from ls -l /dev/mapper:

lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-root -> ../dm-10
lrwxrwxrwx 1 root root       7 Sep 24 01:27 vg0-root_rimage_0 -> ../dm-1
lrwxrwxrwx 1 root root       7 Sep 24 01:27 vg0-root_rimage_1 -> ../dm-3
lrwxrwxrwx 1 root root       7 Sep 24 01:27 vg0-root_rimage_2 -> ../dm-5
lrwxrwxrwx 1 root root       7 Sep 24 01:27 vg0-root_rimage_3 -> ../dm-7
lrwxrwxrwx 1 root root       7 Sep 24 01:27 vg0-root_rimage_4 -> ../dm-9
lrwxrwxrwx 1 root root       7 Sep 24 01:27 vg0-root_rmeta_0 -> ../dm-0
lrwxrwxrwx 1 root root       7 Sep 24 01:27 vg0-root_rmeta_1 -> ../dm-2
lrwxrwxrwx 1 root root       7 Sep 24 01:27 vg0-root_rmeta_2 -> ../dm-4
lrwxrwxrwx 1 root root       7 Sep 24 01:27 vg0-root_rmeta_3 -> ../dm-6
lrwxrwxrwx 1 root root       7 Sep 24 01:27 vg0-root_rmeta_4 -> ../dm-8

lrwxrwxrwx 1 root root       8 Sep 24 02:19 vg0-var -> ../dm-21
lrwxrwxrwx 1 root root       8 Sep 24 02:19 vg0-var_rimage_1 -> ../dm-14
lrwxrwxrwx 1 root root       8 Sep 24 02:19 vg0-var_rimage_2 -> ../dm-16
lrwxrwxrwx 1 root root       8 Sep 24 02:19 vg0-var_rimage_3 -> ../dm-18
lrwxrwxrwx 1 root root       8 Sep 24 02:19 vg0-var_rimage_4 -> ../dm-20
lrwxrwxrwx 1 root root       8 Sep 24 02:19 vg0-var_rimage_5 -> ../dm-12
lrwxrwxrwx 1 root root       8 Sep 24 02:19 vg0-var_rmeta_1 -> ../dm-13
lrwxrwxrwx 1 root root       8 Sep 24 02:19 vg0-var_rmeta_2 -> ../dm-15
lrwxrwxrwx 1 root root       8 Sep 24 02:19 vg0-var_rmeta_3 -> ../dm-17
lrwxrwxrwx 1 root root       8 Sep 24 02:19 vg0-var_rmeta_4 -> ../dm-19
lrwxrwxrwx 1 root root       8 Sep 24 02:19 vg0-var_rmeta_5 -> ../dm-11

lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-home -> ../dm-32
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-home_rimage_1 -> ../dm-25
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-home_rimage_2 -> ../dm-27
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-home_rimage_3 -> ../dm-29
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-home_rimage_4 -> ../dm-31
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-home_rimage_5 -> ../dm-23
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-home_rmeta_1 -> ../dm-24
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-home_rmeta_2 -> ../dm-26
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-home_rmeta_3 -> ../dm-28
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-home_rmeta_4 -> ../dm-30
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-home_rmeta_5 -> ../dm-22

lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-photos -> ../dm-45
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-photos_rimage_0 -> ../dm-36
lrwxrwxrwx 1 root root       8 Sep 24 01:27
vg0-photos_rimage_0-missing_0_0 -> ../dm-35
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-photos_rimage_1 -> ../dm-38
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-photos_rimage_2 -> ../dm-40
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-photos_rimage_3 -> ../dm-42
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-photos_rimage_4 -> ../dm-44
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-photos_rmeta_0 -> ../dm-34
lrwxrwxrwx 1 root root       8 Sep 24 01:27
vg0-photos_rmeta_0-missing_0_0 -> ../dm-33
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-photos_rmeta_1 -> ../dm-37
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-photos_rmeta_2 -> ../dm-39
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-photos_rmeta_3 -> ../dm-41
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-photos_rmeta_4 -> ../dm-43

Last kernel logs via dmesg (I have no idea why there is so much mdX
repetition and interleaving).
Besides the boot, I also deactivated and re-activated vg0/var at least
once to see what would happen.

[    0.936544] pci_bus 0000:06: resource 9 [mem 0xf0000000-0xfebfffff window]
[    0.936648] NET: Registered protocol family 2
[    0.936871] TCP established hash table entries: 131072 (order: 8,
1048576 bytes)
[    0.937194] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
[    0.937475] TCP: Hash tables configured (established 131072 bind 65536)
[    0.937553] UDP hash table entries: 8192 (order: 6, 262144 bytes)
[    0.937668] UDP-Lite hash table entries: 8192 (order: 6, 262144 bytes)
[    0.937848] NET: Registered protocol family 1
[    1.995296] pci 0000:01:00.0: Video device with shadowed ROM at
[mem 0x000c0000-0x000dffff]
[    1.995434] PCI: CLS 64 bytes, default 64
[    1.995517] Unpacking initramfs...
[    2.292207] Freeing initrd memory: 22328K (ffff880035454000 -
ffff880036a22000)
[    2.292528] PCI-DMA: Disabling AGP.
[    2.294168] PCI-DMA: aperture base @ c4000000 size 65536 KB
[    2.294200] PCI-DMA: using GART IOMMU.
[    2.294232] PCI-DMA: Reserving 64MB of IOMMU area in the AGP aperture
[    2.297179] LVT offset 1 assigned for vector 0x400
[    2.297223] IBS: LVT offset 1 assigned
[    2.297290] perf: AMD IBS detected (0x0000001f)
[    2.297694] futex hash table entries: 2048 (order: 5, 131072 bytes)
[    2.297767] audit: initializing netlink subsys (disabled)
[    2.297817] audit: type=2000 audit(1474676822.004:1): initialized
[    2.298115] Initialise system trusted keyring
[    2.298280] workingset: timestamp_bits=37 max_order=22 bucket_order=0
[    2.298326] zbud: loaded
[    2.344661] Key type asymmetric registered
[    2.344699] Asymmetric key parser 'x509' registered
[    2.344762] Block layer SCSI generic (bsg) driver version 0.4
loaded (major 251)
[    2.344842] io scheduler noop registered
[    2.344880] io scheduler deadline registered
[    2.344933] io scheduler cfq registered (default)
[    2.345543] pcieport 0000:00:02.0: Signaling PME through PCIe PME interrupt
[    2.345576] pci 0000:01:00.0: Signaling PME through PCIe PME interrupt
[    2.345609] pci 0000:01:00.1: Signaling PME through PCIe PME interrupt
[    2.345642] pcie_pme 0000:00:02.0:pcie01: service driver pcie_pme loaded
[    2.345684] pcieport 0000:00:06.0: Signaling PME through PCIe PME interrupt
[    2.345717] pci 0000:02:00.0: Signaling PME through PCIe PME interrupt
[    2.345750] pcie_pme 0000:00:06.0:pcie01: service driver pcie_pme loaded
[    2.345792] pcieport 0000:00:07.0: Signaling PME through PCIe PME interrupt
[    2.345824] pci 0000:03:00.0: Signaling PME through PCIe PME interrupt
[    2.345857] pcie_pme 0000:00:07.0:pcie01: service driver pcie_pme loaded
[    2.345900] pcieport 0000:00:09.0: Signaling PME through PCIe PME interrupt
[    2.345933] pci 0000:04:00.0: Signaling PME through PCIe PME interrupt
[    2.345966] pcie_pme 0000:00:09.0:pcie01: service driver pcie_pme loaded
[    2.346007] pcieport 0000:00:0a.0: Signaling PME through PCIe PME interrupt
[    2.346040] pci 0000:05:00.0: Signaling PME through PCIe PME interrupt
[    2.346073] pcie_pme 0000:00:0a.0:pcie01: service driver pcie_pme loaded
[    2.346110] pci_hotplug: PCI Hot Plug PCI Core version: 0.5
[    2.346147] pciehp: PCI Express Hot Plug Controller Driver version: 0.4
[    2.346220] GHES: HEST is not enabled!
[    2.346322] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    2.366706] 00:04: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200)
is a 16550A
[    2.367103] Linux agpgart interface v0.103
[    2.367169] AMD IOMMUv2 driver by Joerg Roedel <jroedel@suse.de>
[    2.367201] AMD IOMMUv2 functionality not available on this system
[    2.367528] i8042: PNP: PS/2 Controller [PNP0303:PS2K] at 0x60,0x64 irq 1
[    2.367560] i8042: PNP: PS/2 appears to have AUX port disabled, if
this is incorrect please boot with i8042.nopnp
[    2.367714] serio: i8042 KBD port at 0x60,0x64 irq 1
[    2.367843] mousedev: PS/2 mouse device common for all mice
[    2.367910] rtc_cmos 00:01: RTC can wake from S4
[    2.368036] rtc_cmos 00:01: rtc core: registered rtc_cmos as rtc0
[    2.368086] rtc_cmos 00:01: alarms up to one month, y3k, 114 bytes
nvram, hpet irqs
[    2.368131] ledtrig-cpu: registered to indicate activity on CPUs
[    2.368592] NET: Registered protocol family 10
[    2.368805] mip6: Mobile IPv6
[    2.368837] NET: Registered protocol family 17
[    2.368871] mpls_gso: MPLS GSO support
[    2.369093] microcode: microcode updated early to new patch_level=0x010000c8
[    2.369146] microcode: CPU0: patch_level=0x010000c8
[    2.369184] microcode: CPU1: patch_level=0x010000c8
[    2.369229] microcode: CPU2: patch_level=0x010000c8
[    2.369269] microcode: CPU3: patch_level=0x010000c8
[    2.369334] microcode: Microcode Update Driver: v2.01
<tigran@aivazian.fsnet.co.uk>, Peter Oruba
[    2.369503] registered taskstats version 1
[    2.369547] Loading compiled-in X.509 certificates
[    2.370970] alg: No test for pkcs1pad(rsa,sha256)
(pkcs1pad(rsa-generic,sha256))
[    2.371302] Loaded X.509 cert 'Debian Project: Ben Hutchings:
008a018dca80932630'
[    2.371360] zswap: loaded using pool lzo/zbud
[    2.371746] rtc_cmos 00:01: setting system clock to 2016-09-24
00:27:02 UTC (1474676822)
[    2.371827] PM: Hibernation image not present or could not be loaded.
[    2.372925] Freeing unused kernel memory: 1336K (ffffffff81b12000 -
ffffffff81c60000)
[    2.372961] Write protecting the kernel read-only data: 10240k
[    2.373154] Freeing unused kernel memory: 196K (ffff8800015cf000 -
ffff880001600000)
[    2.376180] Freeing unused kernel memory: 1384K (ffff8800018a6000 -
ffff880001a00000)
[    2.382802] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    2.406387] input: AT Translated Set 2 keyboard as
/devices/platform/i8042/serio0/input/input0
[    2.462733] random: systemd-udevd urandom read with 7 bits of
entropy available
[    2.489098] usb_common: module verification failed: signature
and/or required key missing - tainting kernel
[    2.489980] SCSI subsystem initialized
[    2.490425] ACPI: bus type USB registered
[    2.490480] usbcore: registered new interface driver usbfs
[    2.490520] usbcore: registered new interface driver hub
[    2.490570] usbcore: registered new device driver usb
[    2.491062] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    2.491330] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    2.491497] ehci-pci: EHCI PCI platform driver
[    2.491648] QUIRK: Enable AMD PLL fix
[    2.491706] ehci-pci 0000:00:12.2: EHCI Host Controller
[    2.491742] ehci-pci 0000:00:12.2: new USB bus registered, assigned
bus number 1
[    2.491780] ehci-pci 0000:00:12.2: applying AMD
SB700/SB800/Hudson-2/3 EHCI dummy qh workaround
[    2.491823] ehci-pci 0000:00:12.2: debug port 1
[    2.491889] ehci-pci 0000:00:12.2: irq 17, io mem 0xfe6ff800
[    2.492207] libata version 3.00 loaded.
[    2.495326] FUJITSU Extended Socket Network Device Driver - version
1.0 - Copyright (c) 2015 FUJITSU LIMITED
[    2.503041] ehci-pci 0000:00:12.2: USB 2.0 started, EHCI 1.00
[    2.503170] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
[    2.503208] usb usb1: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    2.503246] usb usb1: Product: EHCI Host Controller
[    2.503283] usb usb1: Manufacturer: Linux 4.6.0-1-amd64 ehci_hcd
[    2.503316] usb usb1: SerialNumber: 0000:00:12.2
[    2.503492] hub 1-0:1.0: USB hub found
[    2.503533] hub 1-0:1.0: 5 ports detected
[    2.503990] ehci-pci 0000:00:13.2: EHCI Host Controller
[    2.504034] ehci-pci 0000:00:13.2: new USB bus registered, assigned
bus number 2
[    2.504070] ehci-pci 0000:00:13.2: applying AMD
SB700/SB800/Hudson-2/3 EHCI dummy qh workaround
[    2.504112] ehci-pci 0000:00:13.2: debug port 1
[    2.504169] ehci-pci 0000:00:13.2: irq 17, io mem 0xfe6ff400
[    2.510886] [drm] Initialized drm 1.1.0 20060810
[    2.512530] pata_via 0000:04:00.0: version 0.3.4
[    2.512658] pata_via 0000:04:00.0: Using MSI
[    2.514973] r8169 Gigabit Ethernet driver 2.3LK-NAPI loaded
[    2.515448] r8169 0000:05:00.0 eth0: RTL8168e/8111e at
0xffffc90001b76000, 48:5b:39:47:35:a1, XID 0c100000 IRQ 30
[    2.515484] r8169 0000:05:00.0 eth0: jumbo features [frames: 9200
bytes, tx checksumming: ko]
[    2.515617] ehci-pci 0000:00:13.2: USB 2.0 started, EHCI 1.00
[    2.515700] usb usb2: New USB device found, idVendor=1d6b, idProduct=0002
[    2.515735] usb usb2: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    2.515772] usb usb2: Product: EHCI Host Controller
[    2.515803] usb usb2: Manufacturer: Linux 4.6.0-1-amd64 ehci_hcd
[    2.515838] usb usb2: SerialNumber: 0000:00:13.2
[    2.515972] hub 2-0:1.0: USB hub found
[    2.516011] hub 2-0:1.0: 5 ports detected
[    2.516159] xhci_hcd 0000:02:00.0: xHCI Host Controller
[    2.516204] xhci_hcd 0000:02:00.0: new USB bus registered, assigned
bus number 3
[    2.516357] xhci_hcd 0000:02:00.0: hcc params 0x014042cb hci
version 0x96 quirks 0x00000004
[    2.516480] scsi host0: pata_via
[    2.516531] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002
[    2.516565] usb usb3: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    2.516600] usb usb3: Product: xHCI Host Controller
[    2.516635] usb usb3: Manufacturer: Linux 4.6.0-1-amd64 xhci-hcd
[    2.516667] usb usb3: SerialNumber: 0000:02:00.0
[    2.516796] hub 3-0:1.0: USB hub found
[    2.516837] hub 3-0:1.0: 2 ports detected
[    2.516950] xhci_hcd 0000:02:00.0: xHCI Host Controller
[    2.516960] ehci-pci 0000:00:16.2: EHCI Host Controller
[    2.516966] ehci-pci 0000:00:16.2: new USB bus registered, assigned
bus number 4
[    2.516971] ehci-pci 0000:00:16.2: applying AMD
SB700/SB800/Hudson-2/3 EHCI dummy qh workaround
[    2.516982] ehci-pci 0000:00:16.2: debug port 1
[    2.517014] ehci-pci 0000:00:16.2: irq 17, io mem 0xfe6ff000
[    2.517165] xhci_hcd 0000:02:00.0: new USB bus registered, assigned
bus number 5
[    2.517277] scsi host1: pata_via
[    2.517368] ata1: PATA max UDMA/133 cmd 0xdc00 ctl 0xd880 bmdma 0xd400 irq 29
[    2.517413] ata2: PATA max UDMA/133 cmd 0xd800 ctl 0xd480 bmdma 0xd408 irq 29
[    2.517528] [drm] radeon kernel modesetting enabled.
[    2.518665] [drm] initializing kernel modesetting (RV730
0x1002:0x9490 0x174B:0xE100 0x00).
[    2.518723] [drm] register mmio base: 0xFE7F0000
[    2.518766] [drm] register mmio size: 65536
[    2.519722] usb usb5: We don't know the algorithms for LPM for this
host, disabling LPM.
[    2.519742] ATOM BIOS: RV730
[    2.519776] radeon 0000:01:00.0: VRAM: 512M 0x0000000000000000 -
0x000000001FFFFFFF (512M used)
[    2.519777] radeon 0000:01:00.0: GTT: 1024M 0x0000000020000000 -
0x000000005FFFFFFF
[    2.519778] [drm] Detected VRAM RAM=512M, BAR=256M
[    2.519779] [drm] RAM width 128bits DDR
[    2.521482] usb usb5: New USB device found, idVendor=1d6b, idProduct=0003
[    2.521515] usb usb5: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    2.521549] usb usb5: Product: xHCI Host Controller
[    2.521581] usb usb5: Manufacturer: Linux 4.6.0-1-amd64 xhci-hcd
[    2.521619] usb usb5: SerialNumber: 0000:02:00.0
[    2.521786] hub 5-0:1.0: USB hub found
[    2.521829] hub 5-0:1.0: 2 ports detected
[    2.524252] [TTM] Zone  kernel: Available graphics memory: 8152850 kiB
[    2.524291] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    2.524324] [TTM] Initializing pool allocator
[    2.524361] [TTM] Initializing DMA pool allocator
[    2.524412] [drm] radeon: 512M of VRAM memory ready
[    2.524444] [drm] radeon: 1024M of GTT memory ready.
[    2.524489] [drm] Loading RV730 Microcode
[    2.524538] radeon 0000:01:00.0: firmware: direct-loading firmware
radeon/RV730_pfp.bin
[    2.524585] radeon 0000:01:00.0: firmware: direct-loading firmware
radeon/RV730_me.bin
[    2.524637] radeon 0000:01:00.0: firmware: direct-loading firmware
radeon/R700_rlc.bin
[    2.524685] radeon 0000:01:00.0: firmware: direct-loading firmware
radeon/RV730_smc.bin
[    2.524722] [drm] Internal thermal controller with fan control
[    2.525288] [drm] radeon: dpm initialized
[    2.525369] radeon 0000:01:00.0: firmware: direct-loading firmware
radeon/RV710_uvd.bin
[    2.525427] [drm] GART: num cpu pages 262144, num gpu pages 262144
[    2.526576] [drm] enabling PCIE gen 2 link speeds, disable with
radeon.pcie_gen2=0
[    2.527233] ehci-pci 0000:00:16.2: USB 2.0 started, EHCI 1.00
[    2.527520] usb usb4: New USB device found, idVendor=1d6b, idProduct=0002
[    2.527563] usb usb4: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    2.527609] usb usb4: Product: EHCI Host Controller
[    2.527650] usb usb4: Manufacturer: Linux 4.6.0-1-amd64 ehci_hcd
[    2.527691] usb usb4: SerialNumber: 0000:00:16.2
[    2.527954] hub 4-0:1.0: USB hub found
[    2.528000] hub 4-0:1.0: 4 ports detected
[    2.528172] ahci 0000:00:11.0: version 3.0
[    2.528420] ahci 0000:00:11.0: AHCI 0001.0200 32 slots 6 ports 6
Gbps 0x3f impl SATA mode
[    2.528432] ohci-pci: OHCI PCI platform driver
[    2.528507] ahci 0000:00:11.0: flags: 64bit ncq sntf ilck pm led
clo pmp pio slum part
[    2.531502] scsi host2: ahci
[    2.532010] [drm] PCIE GART of 1024M enabled (table at 0x000000000025E000).
[    2.532070] radeon 0000:01:00.0: WB enabled
[    2.532100] radeon 0000:01:00.0: fence driver on ring 0 use gpu
addr 0x0000000020000c00 and cpu addr 0xffff880418cdec00
[    2.532133] radeon 0000:01:00.0: fence driver on ring 3 use gpu
addr 0x0000000020000c0c and cpu addr 0xffff880418cdec0c
[    2.532552] radeon 0000:01:00.0: fence driver on ring 5 use gpu
addr 0x000000000005c598 and cpu addr 0xffffc9000201c598
[    2.532586] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    2.532618] [drm] Driver supports precise vblank timestamp query.
[    2.532648] radeon 0000:01:00.0: radeon: MSI limited to 32-bit
[    2.532705] radeon 0000:01:00.0: radeon: using MSI.
[    2.532756] [drm] radeon: irq initialized.
[    2.533393] scsi host3: ahci
[    2.535207] scsi host4: ahci
[    2.545562] scsi host5: ahci
[    2.545824] scsi host6: ahci
[    2.545944] scsi host7: ahci
[    2.546013] ata3: SATA max UDMA/133 abar m1024@0xfe6ffc00 port
0xfe6ffd00 irq 19
[    2.546046] ata4: SATA max UDMA/133 abar m1024@0xfe6ffc00 port
0xfe6ffd80 irq 19
[    2.546079] ata5: SATA max UDMA/133 abar m1024@0xfe6ffc00 port
0xfe6ffe00 irq 19
[    2.546111] ata6: SATA max UDMA/133 abar m1024@0xfe6ffc00 port
0xfe6ffe80 irq 19
[    2.546143] ata7: SATA max UDMA/133 abar m1024@0xfe6ffc00 port
0xfe6fff00 irq 19
[    2.546176] ata8: SATA max UDMA/133 abar m1024@0xfe6ffc00 port
0xfe6fff80 irq 19
[    2.546349] ohci-pci 0000:00:12.0: OHCI PCI host controller
[    2.546387] ohci-pci 0000:00:12.0: new USB bus registered, assigned
bus number 6
[    2.546446] ohci-pci 0000:00:12.0: irq 18, io mem 0xfe6fe000
[    2.559081] firewire_ohci 0000:03:00.0: added OHCI v1.10 device as
card 0, 4 IR + 8 IT contexts, quirks 0x11
[    2.579648] [drm] ring test on 0 succeeded in 1 usecs
[    2.579688] [drm] ring test on 3 succeeded in 2 usecs
[    2.603240] usb usb6: New USB device found, idVendor=1d6b, idProduct=0001
[    2.603275] usb usb6: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    2.603307] usb usb6: Product: OHCI PCI host controller
[    2.603336] usb usb6: Manufacturer: Linux 4.6.0-1-amd64 ohci_hcd
[    2.603365] usb usb6: SerialNumber: 0000:00:12.0
[    2.603503] hub 6-0:1.0: USB hub found
[    2.603537] hub 6-0:1.0: 5 ports detected
[    2.603773] ohci-pci 0000:00:13.0: OHCI PCI host controller
[    2.603810] ohci-pci 0000:00:13.0: new USB bus registered, assigned
bus number 7
[    2.603859] ohci-pci 0000:00:13.0: irq 18, io mem 0xfe6fd000
[    2.667085] usb usb7: New USB device found, idVendor=1d6b, idProduct=0001
[    2.667118] usb usb7: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    2.667150] usb usb7: Product: OHCI PCI host controller
[    2.667179] usb usb7: Manufacturer: Linux 4.6.0-1-amd64 ohci_hcd
[    2.667208] usb usb7: SerialNumber: 0000:00:13.0
[    2.667357] hub 7-0:1.0: USB hub found
[    2.667391] hub 7-0:1.0: 5 ports detected
[    2.667622] ohci-pci 0000:00:14.5: OHCI PCI host controller
[    2.667655] ohci-pci 0000:00:14.5: new USB bus registered, assigned
bus number 8
[    2.667703] ohci-pci 0000:00:14.5: irq 18, io mem 0xfe6fc000
[    2.677927] ata1.00: ATAPI: PIONEER DVD-RW  DVR-110D, 1.39, max UDMA/66
[    2.677962] ata1.00: FORCE: xfer_mask set to udma/66
[    2.683056] ata1.00: configured for UDMA/66
[    2.696037] scsi 0:0:0:0: CD-ROM            PIONEER  DVD-RW
DVR-110D 1.39 PQ: 0 ANSI: 5
[    2.727078] usb usb8: New USB device found, idVendor=1d6b, idProduct=0001
[    2.727111] usb usb8: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    2.727142] usb usb8: Product: OHCI PCI host controller
[    2.727171] usb usb8: Manufacturer: Linux 4.6.0-1-amd64 ohci_hcd
[    2.727200] usb usb8: SerialNumber: 0000:00:14.5
[    2.727326] hub 8-0:1.0: USB hub found
[    2.727361] hub 8-0:1.0: 2 ports detected
[    2.727528] ohci-pci 0000:00:16.0: OHCI PCI host controller
[    2.727560] ohci-pci 0000:00:16.0: new USB bus registered, assigned
bus number 9
[    2.727607] ohci-pci 0000:00:16.0: irq 18, io mem 0xfe6f3000
[    2.764307] [drm] ring test on 5 succeeded in 1 usecs
[    2.764342] [drm] UVD initialized successfully.
[    2.764476] [drm] ib test on ring 0 succeeded in 0 usecs
[    2.764520] [drm] ib test on ring 3 succeeded in 0 usecs
[    2.787088] usb usb9: New USB device found, idVendor=1d6b, idProduct=0001
[    2.787120] usb usb9: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    2.787151] usb usb9: Product: OHCI PCI host controller
[    2.787180] usb usb9: Manufacturer: Linux 4.6.0-1-amd64 ohci_hcd
[    2.787209] usb usb9: SerialNumber: 0000:00:16.0
[    2.787340] hub 9-0:1.0: USB hub found
[    2.787374] hub 9-0:1.0: 4 ports detected
[    2.857622] ata6: SATA link down (SStatus 0 SControl 300)
[    3.015114] ata7: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    3.015165] ata8: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    3.015215] ata5: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    3.015267] ata3: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    3.015727] ata8.00: ATA-9: WDC WD20EFRX-68EUZN0, 80.00A80, max UDMA/133
[    3.015763] ata8.00: 3907029168 sectors, multi 0: LBA48 NCQ (depth 31/32), AA
[    3.015798] ata5.00: ATA-9: WDC WD20EFRX-68EUZN0, 80.00A80, max UDMA/133
[    3.015830] ata5.00: 3907029168 sectors, multi 0: LBA48 NCQ (depth 31/32), AA
[    3.015892] ata7.00: ATA-9: ST2000VN000-1H3164, SC42, max UDMA/133
[    3.015926] ata7.00: 3907029168 sectors, multi 0: LBA48 NCQ (depth 31/32), AA
[    3.016020] ata3.00: ATA-9: ST2000VN000-1H3164, SC42, max UDMA/133
[    3.016050] ata3.00: 3907029168 sectors, multi 0: LBA48 NCQ (depth 31/32), AA
[    3.016418] ata8.00: configured for UDMA/133
[    3.016471] ata5.00: configured for UDMA/133
[    3.016705] ata7.00: configured for UDMA/133
[    3.016842] ata3.00: configured for UDMA/133
[    3.017045] scsi 2:0:0:0: Direct-Access     ATA
ST2000VN000-1H31 SC42 PQ: 0 ANSI: 5
[    3.019105] ata4: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    3.019646] ata4.00: ATA-9: WDC WD20EFRX-68EUZN0, 82.00A82, max UDMA/133
[    3.019677] ata4.00: 3907029168 sectors, multi 0: LBA48 NCQ (depth 31/32), AA
[    3.020226] ata4.00: configured for UDMA/133
[    3.043352] scsi 3:0:0:0: Direct-Access     ATA      WDC
WD20EFRX-68E 0A82 PQ: 0 ANSI: 5
[    3.059192] firewire_core 0000:03:00.0: created device fw0: GUID
001e8c0000d59af4, S400
[    3.071350] scsi 4:0:0:0: Direct-Access     ATA      WDC
WD20EFRX-68E 0A80 PQ: 0 ANSI: 5
[    3.107346] scsi 6:0:0:0: Direct-Access     ATA
ST2000VN000-1H31 SC42 PQ: 0 ANSI: 5
[    3.135392] scsi 7:0:0:0: Direct-Access     ATA      WDC
WD20EFRX-68E 0A80 PQ: 0 ANSI: 5
[    3.170002] sd 2:0:0:0: [sda] 3907029168 512-byte logical blocks:
(2.00 TB/1.82 TiB)
[    3.170046] sd 2:0:0:0: [sda] 4096-byte physical blocks
[    3.170106] sd 6:0:0:0: [sdd] 3907029168 512-byte logical blocks:
(2.00 TB/1.82 TiB)
[    3.170115] sd 2:0:0:0: [sda] Write Protect is off
[    3.170116] sd 2:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    3.170130] sd 2:0:0:0: [sda] Write cache: enabled, read cache:
enabled, doesn't support DPO or FUA
[    3.171550] sd 6:0:0:0: [sdd] 4096-byte physical blocks
[    3.171589] sd 4:0:0:0: [sdc] 3907029168 512-byte logical blocks:
(2.00 TB/1.82 TiB)
[    3.171625] sd 4:0:0:0: [sdc] 4096-byte physical blocks
[    3.171663] sd 7:0:0:0: [sde] 3907029168 512-byte logical blocks:
(2.00 TB/1.82 TiB)
[    3.171702] sd 7:0:0:0: [sde] 4096-byte physical blocks
[    3.171746] sd 3:0:0:0: [sdb] 3907029168 512-byte logical blocks:
(2.00 TB/1.82 TiB)
[    3.171780] sd 3:0:0:0: [sdb] 4096-byte physical blocks
[    3.171860] sd 4:0:0:0: [sdc] Write Protect is off
[    3.171890] sd 4:0:0:0: [sdc] Mode Sense: 00 3a 00 00
[    3.171939] sd 7:0:0:0: [sde] Write Protect is off
[    3.171969] sd 7:0:0:0: [sde] Mode Sense: 00 3a 00 00
[    3.172018] sd 3:0:0:0: [sdb] Write Protect is off
[    3.172047] sd 3:0:0:0: [sdb] Mode Sense: 00 3a 00 00
[    3.172090] sd 4:0:0:0: [sdc] Write cache: enabled, read cache:
enabled, doesn't support DPO or FUA
[    3.172197] sd 7:0:0:0: [sde] Write cache: enabled, read cache:
enabled, doesn't support DPO or FUA
[    3.172270] sd 3:0:0:0: [sdb] Write cache: enabled, read cache:
enabled, doesn't support DPO or FUA
[    3.172613] sd 6:0:0:0: [sdd] Write Protect is off
[    3.172643] sd 6:0:0:0: [sdd] Mode Sense: 00 3a 00 00
[    3.172686] sd 6:0:0:0: [sdd] Write cache: enabled, read cache:
enabled, doesn't support DPO or FUA
[    3.179865] sr 0:0:0:0: [sr0] scsi3-mmc drive: 62x/62x writer cd/rw
xa/form2 cdda tray
[    3.179900] cdrom: Uniform CD-ROM driver Revision: 3.20
[    3.180057] sr 0:0:0:0: Attached scsi CD-ROM sr0
[    3.195112] usb 6-3: new low-speed USB device number 2 using ohci-pci
[    3.212945]  sde: sde1 sde2
[    3.213227] sd 7:0:0:0: [sde] Attached SCSI disk
[    3.219379]  sda: sda1 sda2
[    3.219709] sd 2:0:0:0: [sda] Attached SCSI disk
[    3.220272]  sdc: sdc1 sdc2
[    3.220526] sd 4:0:0:0: [sdc] Attached SCSI disk
[    3.223155]  sdb: sdb1 sdb2
[    3.223459] sd 3:0:0:0: [sdb] Attached SCSI disk
[    3.232790]  sdd: sdd1 sdd2
[    3.233118] sd 6:0:0:0: [sdd] Attached SCSI disk
[    3.295100] tsc: Refined TSC clocksource calibration: 3415.168 MHz
[    3.295135] clocksource: tsc: mask: 0xffffffffffffffff max_cycles:
0x313a47ae796, max_idle_ns: 440795291137 ns
[    3.353753] random: nonblocking pool is initialized
[    3.361369] usb 6-3: New USB device found, idVendor=13ba, idProduct=0017
[    3.361405] usb 6-3: New USB device strings: Mfr=0, Product=1, SerialNumber=0
[    3.361441] usb 6-3: Product: Generic USB K/B
[    3.368999] hidraw: raw HID events driver (C) Jiri Kosina
[    3.378507] usbcore: registered new interface driver usbhid
[    3.378541] usbhid: USB HID core driver
[    3.379916] input: Generic USB K/B as
/devices/pci0000:00/0000:00:12.0/usb6/6-3/6-3:1.0/0003:13BA:0017.0001/input/input1
[    3.423137] [drm] ib test on ring 5 succeeded
[    3.423578] [drm] Radeon Display Connectors
[    3.423614] [drm] Connector 0:
[    3.423642] [drm]   VGA-1
[    3.423674] [drm]   DDC: 0x7e20 0x7e20 0x7e24 0x7e24 0x7e28 0x7e28
0x7e2c 0x7e2c
[    3.423707] [drm]   Encoders:
[    3.423737] [drm]     CRT2: INTERNAL_KLDSCP_DAC2
[    3.423765] [drm] Connector 1:
[    3.423793] [drm]   HDMI-A-1
[    3.423820] [drm]   HPD2
[    3.423848] [drm]   DDC: 0x7f10 0x7f10 0x7f14 0x7f14 0x7f18 0x7f18
0x7f1c 0x7f1c
[    3.423879] [drm]   Encoders:
[    3.423906] [drm]     DFP2: INTERNAL_UNIPHY1
[    3.423934] [drm] Connector 2:
[    3.423962] [drm]   DVI-I-1
[    3.423989] [drm]   HPD1
[    3.424017] [drm]   DDC: 0x7e40 0x7e40 0x7e44 0x7e44 0x7e48 0x7e48
0x7e4c 0x7e4c
[    3.424047] [drm]   Encoders:
[    3.424075] [drm]     CRT1: INTERNAL_KLDSCP_DAC1
[    3.424103] [drm]     DFP1: INTERNAL_UNIPHY
[    3.432076] device-mapper: uevent: version 1.0.3
[    3.432167] device-mapper: ioctl: 4.34.0-ioctl (2015-10-28)
initialised: dm-devel@redhat.com
[    3.435373] hid-generic 0003:13BA:0017.0001: input,hidraw0: USB HID
v1.10 Keyboard [Generic USB K/B] on usb-0000:00:12.0-3/input0
[    3.435576] input: Generic USB K/B as
/devices/pci0000:00/0000:00:12.0/usb6/6-3/6-3:1.1/0003:13BA:0017.0002/input/input2
[    3.474053] [drm] fb mappable at 0xD045F000
[    3.474085] [drm] vram apper at 0xD0000000
[    3.474114] [drm] size 7680000
[    3.474144] [drm] fb depth is 24
[    3.474182] [drm]    pitch is 6400
[    3.474270] fbcon: radeondrmfb (fb0) is primary device
[    3.491244] hid-generic 0003:13BA:0017.0002: input,hidraw1: USB HID
v1.10 Mouse [Generic USB K/B] on usb-0000:00:12.0-3/input1
[    3.496485] Console: switching to colour frame buffer device 200x75
[    3.501309] radeon 0000:01:00.0: fb0: radeondrmfb frame buffer device
[    3.524738] [drm] Initialized radeon 2.43.0 20080528 for
0000:01:00.0 on minor 0
[    4.043086] raid6: sse2x1   gen()  4261 MB/s
[    4.111082] raid6: sse2x1   xor()  4543 MB/s
[    4.179081] raid6: sse2x2   gen()  7118 MB/s
[    4.247085] raid6: sse2x2   xor()  7706 MB/s
[    4.315080] raid6: sse2x4   gen()  7635 MB/s
[    4.383077] raid6: sse2x4   xor()  3947 MB/s
[    4.383095] raid6: using algorithm sse2x4 gen() 7635 MB/s
[    4.383117] raid6: .... xor() 3947 MB/s, rmw enabled
[    4.383137] raid6: using intx1 recovery algorithm
[    4.383171] clocksource: Switched to clocksource tsc
[    4.383375] xor: measuring software checksum speed
[    4.423084]    prefetch64-sse: 13156.000 MB/sec
[    4.463085]    generic_sse: 12535.000 MB/sec
[    4.463103] xor: using function: prefetch64-sse (13156.000 MB/sec)
[    4.464141] async_tx: api initialized (async)
[    4.465507] md: raid6 personality registered for level 6
[    4.465533] md: raid5 personality registered for level 5
[    4.465555] md: raid4 personality registered for level 4
[    4.465774] device-mapper: raid: Loading target version 1.7.0
[    4.482684] md/raid:mdX: device dm-9 operational as raid disk 4
[    4.482717] md/raid:mdX: device dm-7 operational as raid disk 3
[    4.482741] md/raid:mdX: device dm-5 operational as raid disk 2
[    4.482765] md/raid:mdX: device dm-3 operational as raid disk 1
[    4.482790] md/raid:mdX: device dm-1 operational as raid disk 0
[    4.483189] md/raid:mdX: allocated 5432kB
[    4.484145] md/raid:mdX: raid level 5 active with 5 out of 5
devices, algorithm 2
[    4.484178] RAID conf printout:
[    4.484193]  --- level:5 rd:5 wd:5
[    4.484208]  disk 0, o:1, dev:dm-1
[    4.484222]  disk 1, o:1, dev:dm-3
[    4.484237]  disk 2, o:1, dev:dm-5
[    4.484252]  disk 3, o:1, dev:dm-7
[    4.484266]  disk 4, o:1, dev:dm-9
[    4.484379] created bitmap (7 pages) for device mdX
[    4.507428] mdX: bitmap initialized from disk: read 1 pages, set 7
of 12800 bits
[    4.595221] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[    4.595885] md/raid:mdX: device dm-20 operational as raid disk 4
[    4.595914] md/raid:mdX: device dm-18 operational as raid disk 3
[    4.595939] md/raid:mdX: device dm-16 operational as raid disk 2
[    4.595964] md/raid:mdX: device dm-14 operational as raid disk 1
[    4.596318] md/raid:mdX: allocated 5432kB
[    4.596379] md/raid:mdX: raid level 5 active with 4 out of 5
devices, algorithm 2
[    4.596409] RAID conf printout:
[    4.596422]  --- level:5 rd:5 wd:4
[    4.596437]  disk 0, o:1, dev:dm-12
[    4.596451]  disk 1, o:1, dev:dm-14
[    4.597515]  disk 2, o:1, dev:dm-16
[    4.598541]  disk 3, o:1, dev:dm-18
[    4.599561]  disk 4, o:1, dev:dm-20
[    4.600673] created bitmap (7 pages) for device mdX
[    4.611386] mdX: bitmap initialized from disk: read 1 pages, set 6
of 12800 bits
[    4.640490] RAID conf printout:
[    4.641717]  --- level:5 rd:5 wd:4
[    4.642741]  disk 0, o:1, dev:dm-12
[    4.643752]  disk 1, o:1, dev:dm-14
[    4.644744]  disk 2, o:1, dev:dm-16
[    4.645726]  disk 3, o:1, dev:dm-18
[    4.646705]  disk 4, o:1, dev:dm-20
[    4.647674] RAID conf printout:
[    4.648633]  --- level:5 rd:5 wd:4
[    4.649575]  disk 0, o:1, dev:dm-12
[    4.650501]  disk 1, o:1, dev:dm-14
[    4.651411]  disk 2, o:1, dev:dm-16
[    4.652302]  disk 3, o:1, dev:dm-18
[    4.653164]  disk 4, o:1, dev:dm-20
[    4.756019] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[    4.757574] md/raid:mdX: device dm-31 operational as raid disk 4
[    4.758505] md/raid:mdX: device dm-29 operational as raid disk 3
[    4.759415] md/raid:mdX: device dm-27 operational as raid disk 2
[    4.760315] md/raid:mdX: device dm-25 operational as raid disk 1
[    4.761549] md/raid:mdX: allocated 5432kB
[    4.762458] md/raid:mdX: raid level 6 active with 4 out of 5
devices, algorithm 8
[    4.763321] RAID conf printout:
[    4.764160]  --- level:6 rd:5 wd:4
[    4.764986]  disk 0, o:1, dev:dm-23
[    4.765797]  disk 1, o:1, dev:dm-25
[    4.766607]  disk 2, o:1, dev:dm-27
[    4.767417]  disk 3, o:1, dev:dm-29
[    4.768223]  disk 4, o:1, dev:dm-31
[    4.769134] created bitmap (134 pages) for device mdX
[    4.781281] mdX: bitmap initialized from disk: read 9 pages, set 11
of 273072 bits
[    4.796082] RAID conf printout:
[    4.796923]  --- level:6 rd:5 wd:4
[    4.797744]  disk 0, o:1, dev:dm-23
[    4.798568]  disk 1, o:1, dev:dm-25
[    4.799386]  disk 2, o:1, dev:dm-27
[    4.800192]  disk 3, o:1, dev:dm-29
[    4.800976]  disk 4, o:1, dev:dm-31
[    4.801751] RAID conf printout:
[    4.802516]  --- level:6 rd:5 wd:4
[    4.803276]  disk 0, o:1, dev:dm-23
[    4.804043]  disk 1, o:1, dev:dm-25
[    4.804805]  disk 2, o:1, dev:dm-27
[    4.805559]  disk 3, o:1, dev:dm-29
[    4.806291]  disk 4, o:1, dev:dm-31
[    4.861808] device-mapper: raid: Failed to read superblock of
device at position 0
[    4.863200] md/raid:mdX: device dm-44 operational as raid disk 4
[    4.863998] md/raid:mdX: device dm-42 operational as raid disk 3
[    4.864773] md/raid:mdX: device dm-40 operational as raid disk 2
[    4.865537] md/raid:mdX: device dm-38 operational as raid disk 1
[    4.866612] md/raid:mdX: allocated 5432kB
[    4.867386] md/raid:mdX: raid level 6 active with 4 out of 5
devices, algorithm 8
[    4.868144] RAID conf printout:
[    4.868898]  --- level:6 rd:5 wd:4
[    4.869660]  disk 1, o:1, dev:dm-38
[    4.870429]  disk 2, o:1, dev:dm-40
[    4.871202]  disk 3, o:1, dev:dm-42
[    4.871972]  disk 4, o:1, dev:dm-44
[    4.872834] created bitmap (200 pages) for device mdX
[    4.890421] mdX: bitmap initialized from disk: read 13 pages, set 2
of 409600 bits
[    5.003523] device-mapper: raid: Failed to read superblock of
device at position 0
[    5.004924] md/raid:mdX: device dm-57 operational as raid disk 4
[    5.005725] md/raid:mdX: device dm-55 operational as raid disk 3
[    5.006507] md/raid:mdX: device dm-53 operational as raid disk 2
[    5.007303] md/raid:mdX: device dm-51 operational as raid disk 1
[    5.008399] md/raid:mdX: allocated 5432kB
[    5.009189] md/raid:mdX: raid level 5 active with 4 out of 5
devices, algorithm 2
[    5.009958] RAID conf printout:
[    5.010725]  --- level:5 rd:5 wd:4
[    5.011498]  disk 1, o:1, dev:dm-51
[    5.012274]  disk 2, o:1, dev:dm-53
[    5.013049]  disk 3, o:1, dev:dm-55
[    5.013825]  disk 4, o:1, dev:dm-57
[    5.014706] created bitmap (192 pages) for device mdX
[    5.034119] mdX: bitmap initialized from disk: read 13 pages, set 0
of 393216 bits
[    5.149803] device-mapper: raid: Failed to read superblock of
device at position 0
[    5.151242] md/raid:mdX: device dm-71 operational as raid disk 4
[    5.152055] md/raid:mdX: device dm-69 operational as raid disk 3
[    5.152853] md/raid:mdX: device dm-67 operational as raid disk 2
[    5.153674] md/raid:mdX: device dm-65 operational as raid disk 1
[    5.154807] md/raid:mdX: allocated 5432kB
[    5.155657] md/raid:mdX: raid level 5 active with 4 out of 5
devices, algorithm 2
[    5.156509] RAID conf printout:
[    5.157336]  --- level:5 rd:5 wd:4
[    5.158163]  disk 1, o:1, dev:dm-65
[    5.158991]  disk 2, o:1, dev:dm-67
[    5.159829]  disk 3, o:1, dev:dm-69
[    5.160657]  disk 4, o:1, dev:dm-71
[    5.161587] created bitmap (256 pages) for device mdX
[    5.175049] mdX: bitmap initialized from disk: read 17 pages, set 1
of 524288 bits
[    5.439730] netpoll: netconsole: local port 6665
[    5.440617] netpoll: netconsole: local IPv4 address 192.168.0.12
[    5.441499] netpoll: netconsole: interface 'eth0'
[    5.442380] netpoll: netconsole: remote port 6666
[    5.443270] netpoll: netconsole: remote IPv4 address 192.168.0.4
[    5.444154] netpoll: netconsole: remote ethernet address 6c:40:08:97:dd:e6
[    5.445037] netpoll: netconsole: device eth0 not up yet, forcing it
[    5.446175] r8169 0000:05:00.0: firmware: direct-loading firmware
rtl_nic/rtl8168e-1.fw
[    5.631040] r8169 0000:05:00.0 eth0: link down
[    5.631043] r8169 0000:05:00.0 eth0: link down
[    5.632922] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
[    7.943103] r8169 0000:05:00.0 eth0: link up
[    7.944080] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[    7.948934] console [netcon0] enabled
[    7.949898] netconsole: network logging started
[    7.954752] md: linear personality registered for level -1
[    7.956724] md: multipath personality registered for level -4
[    7.958681] md: raid0 personality registered for level 0
[    7.960751] md: raid1 personality registered for level 1
[    7.965236] md: raid10 personality registered for level 10
[   11.091345] PM: Starting manual resume from disk
[   11.092453] PM: Hibernation image partition 254:59 present
[   11.093562] PM: Looking for hibernation image.
[   11.094809] PM: Image not found (code -22)
[   11.095946] PM: Hibernation image not present or could not be loaded.
[   11.340925] EXT4-fs (dm-10): mounted filesystem with ordered data
mode. Opts: (null)
[   13.494968] ACPI: processor limited to max C-state 1
[   13.497074] input: Power Button as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input3
[   13.498633] ACPI: Power Button [PWRB]
[   13.500045] input: Power Button as
/devices/LNXSYSTM:00/LNXPWRBN:00/input/input4
[   13.501380] ACPI: Power Button [PWRF]
[   13.518982] ACPI Warning: SystemIO range
0x0000000000000B00-0x0000000000000B07 conflicts with OpRegion
0x0000000000000B00-0x0000000000000B2F (\_SB.PCI0.SBRG.ASOC.SMRG)
(20160108/utaddress-255)
[   13.520446] ACPI: If an ACPI driver is available for this device,
you should use it instead of the native driver
[   13.584761] parport_pc 00:02: reported by Plug and Play ACPI
[   13.586283] parport0: PC-style at 0x378, irq 7 [PCSPP,TRISTATE]
[   13.589820] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver v0.05
[   13.591341] sp5100_tco: PCI Vendor ID: 0x1002, Device ID: 0x4385,
Revision ID: 0x41
[   13.593003] sp5100_tco: Using 0xfed80b00 for watchdog MMIO address
[   13.594487] sp5100_tco: Last reboot was not triggered by watchdog.
[   13.596179] sp5100_tco: initialized (0xffffc90001b3eb00).
heartbeat=60 sec (nowayout=0)
[   13.596211] acpi-cpufreq: overriding BIOS provided _PSD data
[   13.599672] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[   13.619993] wmi: Mapper loaded
[   13.663537] sr 0:0:0:0: Attached scsi generic sg0 type 5
[   13.665925] sd 2:0:0:0: Attached scsi generic sg1 type 0
[   13.667937] sd 3:0:0:0: Attached scsi generic sg2 type 0
[   13.669872] sd 4:0:0:0: Attached scsi generic sg3 type 0
[   13.671997] sd 6:0:0:0: Attached scsi generic sg4 type 0
[   13.673943] sd 7:0:0:0: Attached scsi generic sg5 type 0
[   13.702971] snd_hda_intel 0000:01:00.1: Handle vga_switcheroo audio client
[   13.881558] input: HDA ATI HDMI HDMI/DP,pcm=3 as
/devices/pci0000:00/0000:00:02.0/0000:01:00.1/sound/card1/input5
[   13.895284] snd_hda_codec_realtek hdaudioC0D0: autoconfig for
ALC892: line_outs=4 (0x14/0x15/0x16/0x17/0x0) type:line
[   13.897266] snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=0
(0x0/0x0/0x0/0x0/0x0)
[   13.899211] snd_hda_codec_realtek hdaudioC0D0:    hp_outs=1
(0x1b/0x0/0x0/0x0/0x0)
[   13.901165] snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=0x0
[   13.903120] snd_hda_codec_realtek hdaudioC0D0:    dig-out=0x11/0x1e
[   13.905072] snd_hda_codec_realtek hdaudioC0D0:    inputs:
[   13.907019] snd_hda_codec_realtek hdaudioC0D0:      Front Mic=0x19
[   13.909095] input: PC Speaker as /devices/platform/pcspkr/input/input6
[   13.909388] snd_hda_codec_realtek hdaudioC0D0:      Rear Mic=0x18
[   13.909389] snd_hda_codec_realtek hdaudioC0D0:      Line=0x1a
[   13.924589] input: HDA ATI SB Front Mic as
/devices/pci0000:00/0000:00:14.2/sound/card0/input7
[   13.926179] input: HDA ATI SB Rear Mic as
/devices/pci0000:00/0000:00:14.2/sound/card0/input8
[   13.927756] input: HDA ATI SB Line as
/devices/pci0000:00/0000:00:14.2/sound/card0/input9
[   13.929334] input: HDA ATI SB Line Out Front as
/devices/pci0000:00/0000:00:14.2/sound/card0/input10
[   13.930910] input: HDA ATI SB Line Out Surround as
/devices/pci0000:00/0000:00:14.2/sound/card0/input11
[   13.932492] input: HDA ATI SB Line Out CLFE as
/devices/pci0000:00/0000:00:14.2/sound/card0/input12
[   13.934088] input: HDA ATI SB Line Out Side as
/devices/pci0000:00/0000:00:14.2/sound/card0/input13
[   13.935672] input: HDA ATI SB Front Headphone as
/devices/pci0000:00/0000:00:14.2/sound/card0/input14
[   13.961520] EDAC MC: Ver: 3.0.0
[   13.981750] MCE: In-kernel MCE decoding enabled.
[   14.020634] AMD64 EDAC driver v3.4.0
[   14.022285] EDAC amd64: DRAM ECC disabled.
[   14.023869] EDAC amd64: ECC disabled in the BIOS or no ECC
capability, module will not load.
                Either enable ECC checking or force module loading by
setting 'ecc_enable_override'.
                (Note that use of the override may cause unknown side effects.)
[   14.113551] kvm: Nested Virtualization enabled
[   14.116098] kvm: Nested Paging enabled
[   14.317302] ppdev: user-space parallel port driver
[   14.455960] sr 0:0:0:0: [sr0] tag#0 FAILED Result: hostbyte=DID_OK
driverbyte=DRIVER_SENSE
[   14.457563] sr 0:0:0:0: [sr0] tag#0 Sense Key : Illegal Request [current]
[   14.459128] sr 0:0:0:0: [sr0] tag#0 Add. Sense: Read of scrambled
sector without authentication
[   14.460703] sr 0:0:0:0: [sr0] tag#0 CDB: Read(10) 28 00 00 38 0e 80
00 00 40 00
[   14.462250] blk_update_request: I/O error, dev sr0, sector 14694912
[   14.515917] sr 0:0:0:0: [sr0] tag#0 FAILED Result: hostbyte=DID_OK
driverbyte=DRIVER_SENSE
[   14.515919] sr 0:0:0:0: [sr0] tag#0 Sense Key : Illegal Request [current]
[   14.515924] sr 0:0:0:0: [sr0] tag#0 Add. Sense: Read of scrambled
sector without authentication
[   14.515926] sr 0:0:0:0: [sr0] tag#0 CDB: Read(10) 28 00 00 38 0e 80
00 00 01 00
[   14.515928] blk_update_request: I/O error, dev sr0, sector 14694912
[   14.515929] Buffer I/O error on dev sr0, logical block 3673728,
async page read
[   14.567974] sr 0:0:0:0: [sr0] tag#0 FAILED Result: hostbyte=DID_OK
driverbyte=DRIVER_SENSE
[   14.570418] sr 0:0:0:0: [sr0] tag#0 Sense Key : Illegal Request [current]
[   14.572823] sr 0:0:0:0: [sr0] tag#0 Add. Sense: Read of scrambled
sector without authentication
[   14.575203] sr 0:0:0:0: [sr0] tag#0 CDB: Read(10) 28 00 00 38 0e 81
00 00 01 00
[   14.577595] blk_update_request: I/O error, dev sr0, sector 14694916
[   14.580017] Buffer I/O error on dev sr0, logical block 3673729,
async page read
[   14.699990] sr 0:0:0:0: [sr0] tag#0 FAILED Result: hostbyte=DID_OK
driverbyte=DRIVER_SENSE
[   14.706753] sr 0:0:0:0: [sr0] tag#0 Sense Key : Illegal Request [current]
[   14.713415] sr 0:0:0:0: [sr0] tag#0 Add. Sense: Read of scrambled
sector without authentication
[   14.720062] sr 0:0:0:0: [sr0] tag#0 CDB: Read(10) 28 00 00 00 04 00
00 00 02 00
[   14.726724] blk_update_request: I/O error, dev sr0, sector 4096
[   14.792136] sr 0:0:0:0: [sr0] tag#0 FAILED Result: hostbyte=DID_OK
driverbyte=DRIVER_SENSE
[   14.798780] sr 0:0:0:0: [sr0] tag#0 Sense Key : Illegal Request [current]
[   14.805320] sr 0:0:0:0: [sr0] tag#0 Add. Sense: Read of scrambled
sector without authentication
[   14.811865] sr 0:0:0:0: [sr0] tag#0 CDB: Read(10) 28 00 00 00 04 00
00 00 01 00
[   14.818371] blk_update_request: I/O error, dev sr0, sector 4096
[   14.824719] Buffer I/O error on dev sr0, logical block 1024, async page read
[   14.880209] sr 0:0:0:0: [sr0] tag#0 FAILED Result: hostbyte=DID_OK
driverbyte=DRIVER_SENSE
[   14.886457] sr 0:0:0:0: [sr0] tag#0 Sense Key : Illegal Request [current]
[   14.892667] sr 0:0:0:0: [sr0] tag#0 Add. Sense: Read of scrambled
sector without authentication
[   14.898905] sr 0:0:0:0: [sr0] tag#0 CDB: Read(10) 28 00 00 00 04 01
00 00 01 00
[   14.905116] blk_update_request: I/O error, dev sr0, sector 4100
[   14.911307] Buffer I/O error on dev sr0, logical block 1025, async page read
[   15.545125] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   15.552583] md/raid:mdX: device dm-20 operational as raid disk 4
[   15.558879] md/raid:mdX: device dm-18 operational as raid disk 3
[   15.565062] md/raid:mdX: device dm-16 operational as raid disk 2
[   15.571188] md/raid:mdX: device dm-14 operational as raid disk 1
[   15.578393] md/raid:mdX: allocated 5432kB
[   15.584578] md/raid:mdX: raid level 5 active with 4 out of 5
devices, algorithm 2
[   15.586180] RAID conf printout:
[   15.587648]  --- level:5 rd:5 wd:4
[   15.589122]  disk 0, o:1, dev:dm-12
[   15.590597]  disk 1, o:1, dev:dm-14
[   15.592065]  disk 2, o:1, dev:dm-16
[   15.593492]  disk 3, o:1, dev:dm-18
[   15.594889]  disk 4, o:1, dev:dm-20
[   15.596361] created bitmap (7 pages) for device mdX
[   15.698801] mdX: bitmap initialized from disk: read 1 pages, set 0
of 12800 bits
[   15.759202] RAID conf printout:
[   15.760668]  --- level:5 rd:5 wd:4
[   15.762093]  disk 0, o:1, dev:dm-12
[   15.763539]  disk 1, o:1, dev:dm-14
[   15.764957]  disk 2, o:1, dev:dm-16
[   15.766364]  disk 3, o:1, dev:dm-18
[   15.767765]  disk 4, o:1, dev:dm-20
[   15.769152] RAID conf printout:
[   15.770520]  --- level:5 rd:5 wd:4
[   15.771872]  disk 0, o:1, dev:dm-12
[   15.773186]  disk 1, o:1, dev:dm-14
[   15.774481]  disk 2, o:1, dev:dm-16
[   15.775761]  disk 3, o:1, dev:dm-18
[   15.777038]  disk 4, o:1, dev:dm-20
[   15.911780] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   15.919470] md/raid:mdX: device dm-20 operational as raid disk 4
[   15.924884] md/raid:mdX: device dm-18 operational as raid disk 3
[   15.930218] md/raid:mdX: device dm-16 operational as raid disk 2
[   15.933922] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   15.936093] md/raid:mdX: device dm-31 operational as raid disk 4
[   15.936096] md/raid:mdX: device dm-29 operational as raid disk 3
[   15.936098] md/raid:mdX: device dm-27 operational as raid disk 2
[   15.936099] md/raid:mdX: device dm-25 operational as raid disk 1
[   15.937160] md/raid:mdX: allocated 5432kB
[   15.937280] md/raid:mdX: raid level 6 active with 4 out of 5
devices, algorithm 8
[   15.937281] RAID conf printout:
[   15.937283]  --- level:6 rd:5 wd:4
[   15.937285]  disk 0, o:1, dev:dm-23
[   15.937287]  disk 1, o:1, dev:dm-25
[   15.937289]  disk 2, o:1, dev:dm-27
[   15.937290]  disk 3, o:1, dev:dm-29
[   15.937292]  disk 4, o:1, dev:dm-31
[   15.937462] created bitmap (134 pages) for device mdX
[   16.009896] md/raid:mdX: device dm-14 operational as raid disk 1
[   16.015621] md/raid:mdX: allocated 5432kB
[   16.020305] md/raid:mdX: raid level 5 active with 4 out of 5
devices, algorithm 2
[   16.024929] RAID conf printout:
[   16.029516]  --- level:5 rd:5 wd:4
[   16.033987]  disk 0, o:1, dev:dm-12
[   16.038415]  disk 1, o:1, dev:dm-14
[   16.042802]  disk 2, o:1, dev:dm-16
[   16.047162]  disk 3, o:1, dev:dm-18
[   16.051352]  disk 4, o:1, dev:dm-20
[   16.075432] created bitmap (7 pages) for device mdX
[   16.197686] mdX: bitmap initialized from disk: read 1 pages, set 0
of 12800 bits
[   16.230155] RAID conf printout:
[   16.231161]  --- level:5 rd:5 wd:4
[   16.232135]  disk 0, o:1, dev:dm-12
[   16.233079]  disk 1, o:1, dev:dm-14
[   16.234003]  disk 2, o:1, dev:dm-16
[   16.234905]  disk 3, o:1, dev:dm-18
[   16.235797]  disk 4, o:1, dev:dm-20
[   16.236661] RAID conf printout:
[   16.237506]  --- level:5 rd:5 wd:4
[   16.238343]  disk 0, o:1, dev:dm-12
[   16.239168]  disk 1, o:1, dev:dm-14
[   16.239981]  disk 2, o:1, dev:dm-16
[   16.240770]  disk 3, o:1, dev:dm-18
[   16.241541]  disk 4, o:1, dev:dm-20
[   16.242989] mdX: bitmap initialized from disk: read 9 pages, set 11
of 273072 bits
[   16.285479] RAID conf printout:
[   16.288761]  --- level:6 rd:5 wd:4
[   16.292020]  disk 0, o:1, dev:dm-23
[   16.295296]  disk 1, o:1, dev:dm-25
[   16.298520]  disk 2, o:1, dev:dm-27
[   16.301675]  disk 3, o:1, dev:dm-29
[   16.304749]  disk 4, o:1, dev:dm-31
[   16.307800] RAID conf printout:
[   16.308226] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   16.310357] md/raid:mdX: device dm-20 operational as raid disk 4
[   16.310361] md/raid:mdX: device dm-18 operational as raid disk 3
[   16.310363] md/raid:mdX: device dm-16 operational as raid disk 2
[   16.310365] md/raid:mdX: device dm-14 operational as raid disk 1
[   16.311482] md/raid:mdX: allocated 5432kB
[   16.311577] md/raid:mdX: raid level 5 active with 4 out of 5
devices, algorithm 2
[   16.311579] RAID conf printout:
[   16.311581]  --- level:5 rd:5 wd:4
[   16.311583]  disk 0, o:1, dev:dm-12
[   16.311586]  disk 1, o:1, dev:dm-14
[   16.311587]  disk 2, o:1, dev:dm-16
[   16.311589]  disk 3, o:1, dev:dm-18
[   16.311591]  disk 4, o:1, dev:dm-20
[   16.355607]  --- level:6 rd:5 wd:4
[   16.358752]  disk 0, o:1, dev:dm-23
[   16.361910]  disk 1, o:1, dev:dm-25
[   16.365068]  disk 2, o:1, dev:dm-27
[   16.368222]  disk 3, o:1, dev:dm-29
[   16.371373]  disk 4, o:1, dev:dm-31
[   16.389498] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   16.394926] md/raid:mdX: device dm-31 operational as raid disk 4
[   16.398192] md/raid:mdX: device dm-29 operational as raid disk 3
[   16.401414] md/raid:mdX: device dm-27 operational as raid disk 2
[   16.404702] md/raid:mdX: device dm-25 operational as raid disk 1
[   16.408431] md/raid:mdX: allocated 5432kB
[   16.409448] md/raid:mdX: raid level 6 active with 4 out of 5
devices, algorithm 8
[   16.410407] RAID conf printout:
[   16.411365]  --- level:6 rd:5 wd:4
[   16.412342]  disk 0, o:1, dev:dm-23
[   16.413308]  disk 1, o:1, dev:dm-25
[   16.414251]  disk 2, o:1, dev:dm-27
[   16.415174]  disk 3, o:1, dev:dm-29
[   16.416083]  disk 4, o:1, dev:dm-31
[   16.454089] created bitmap (7 pages) for device mdX
[   16.454137] created bitmap (134 pages) for device mdX
[   16.589288] mdX: bitmap initialized from disk: read 9 pages, set 11
of 273072 bits
[   16.666503] RAID conf printout:
[   16.667317]  --- level:6 rd:5 wd:4
[   16.668105]  disk 0, o:1, dev:dm-23
[   16.668878]  disk 1, o:1, dev:dm-25
[   16.669637]  disk 2, o:1, dev:dm-27
[   16.670376]  disk 3, o:1, dev:dm-29
[   16.671092]  disk 4, o:1, dev:dm-31
[   16.671806] RAID conf printout:
[   16.672515]  --- level:6 rd:5 wd:4
[   16.673229]  disk 0, o:1, dev:dm-23
[   16.673950]  disk 1, o:1, dev:dm-25
[   16.674671]  disk 2, o:1, dev:dm-27
[   16.675390]  disk 3, o:1, dev:dm-29
[   16.676110]  disk 4, o:1, dev:dm-31
[   16.708799] mdX: bitmap initialized from disk: read 1 pages, set 0
of 12800 bits
[   16.742015] RAID conf printout:
[   16.742756]  --- level:5 rd:5 wd:4
[   16.743469]  disk 0, o:1, dev:dm-12
[   16.744181]  disk 1, o:1, dev:dm-14
[   16.744896]  disk 2, o:1, dev:dm-16
[   16.745614]  disk 3, o:1, dev:dm-18
[   16.746325]  disk 4, o:1, dev:dm-20
[   16.747031] RAID conf printout:
[   16.747739]  --- level:5 rd:5 wd:4
[   16.748442]  disk 0, o:1, dev:dm-12
[   16.749151]  disk 1, o:1, dev:dm-14
[   16.749859]  disk 2, o:1, dev:dm-16
[   16.750568]  disk 3, o:1, dev:dm-18
[   16.751276]  disk 4, o:1, dev:dm-20
[   16.909822] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   16.911692] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   16.913900] md/raid:mdX: device dm-31 operational as raid disk 4
[   16.913903] md/raid:mdX: device dm-29 operational as raid disk 3
[   16.913906] md/raid:mdX: device dm-27 operational as raid disk 2
[   16.913907] md/raid:mdX: device dm-25 operational as raid disk 1
[   16.914949] md/raid:mdX: allocated 5432kB
[   16.915066] md/raid:mdX: raid level 6 active with 4 out of 5
devices, algorithm 8
[   16.915068] RAID conf printout:
[   16.915070]  --- level:6 rd:5 wd:4
[   16.915073]  disk 0, o:1, dev:dm-23
[   16.915075]  disk 1, o:1, dev:dm-25
[   16.915077]  disk 2, o:1, dev:dm-27
[   16.915079]  disk 3, o:1, dev:dm-29
[   16.915080]  disk 4, o:1, dev:dm-31
[   16.956513] md/raid:mdX: device dm-20 operational as raid disk 4
[   16.957208] md/raid:mdX: device dm-18 operational as raid disk 3
[   16.957488] created bitmap (134 pages) for device mdX
[   16.958568] md/raid:mdX: device dm-16 operational as raid disk 2
[   16.959268] md/raid:mdX: device dm-14 operational as raid disk 1
[   16.960313] md/raid:mdX: allocated 5432kB
[   16.961124] md/raid:mdX: raid level 5 active with 4 out of 5
devices, algorithm 2
[   16.961859] RAID conf printout:
[   16.962590]  --- level:5 rd:5 wd:4
[   16.963323]  disk 0, o:1, dev:dm-12
[   16.964071]  disk 1, o:1, dev:dm-14
[   16.964810]  disk 2, o:1, dev:dm-16
[   16.965548]  disk 3, o:1, dev:dm-18
[   16.966286]  disk 4, o:1, dev:dm-20
[   16.975418] created bitmap (7 pages) for device mdX
[   17.053614] mdX: bitmap initialized from disk: read 1 pages, set 0
of 12800 bits
[   17.054344] mdX: bitmap initialized from disk: read 9 pages, set 11
of 273072 bits
[   17.068638] RAID conf printout:
[   17.069455]  --- level:6 rd:5 wd:4
[   17.070224]  disk 0, o:1, dev:dm-23
[   17.070976]  disk 1, o:1, dev:dm-25
[   17.071718]  disk 2, o:1, dev:dm-27
[   17.072458]  disk 3, o:1, dev:dm-29
[   17.073182]  disk 4, o:1, dev:dm-31
[   17.073903] RAID conf printout:
[   17.074633]  --- level:6 rd:5 wd:4
[   17.075369]  disk 0, o:1, dev:dm-23
[   17.076113]  disk 1, o:1, dev:dm-25
[   17.076844]  disk 2, o:1, dev:dm-27
[   17.077565]  disk 3, o:1, dev:dm-29
[   17.078278]  disk 4, o:1, dev:dm-31
[   17.100397] RAID conf printout:
[   17.103235]  --- level:5 rd:5 wd:4
[   17.106045]  disk 0, o:1, dev:dm-12
[   17.108859]  disk 1, o:1, dev:dm-14
[   17.111671]  disk 2, o:1, dev:dm-16
[   17.114474]  disk 3, o:1, dev:dm-18
[   17.117283]  disk 4, o:1, dev:dm-20
[   17.120066] RAID conf printout:
[   17.122842]  --- level:5 rd:5 wd:4
[   17.125627]  disk 0, o:1, dev:dm-12
[   17.128439]  disk 1, o:1, dev:dm-14
[   17.131245]  disk 2, o:1, dev:dm-16
[   17.134058]  disk 3, o:1, dev:dm-18
[   17.136872]  disk 4, o:1, dev:dm-20
[   17.205326] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   17.208579] md/raid:mdX: device dm-20 operational as raid disk 4
[   17.211477] md/raid:mdX: device dm-18 operational as raid disk 3
[   17.214302] md/raid:mdX: device dm-16 operational as raid disk 2
[   17.217136] md/raid:mdX: device dm-14 operational as raid disk 1
[   17.221054] md/raid:mdX: allocated 5432kB
[   17.224009] md/raid:mdX: raid level 5 active with 4 out of 5
devices, algorithm 2
[   17.224858] RAID conf printout:
[   17.225561]  --- level:5 rd:5 wd:4
[   17.226265]  disk 0, o:1, dev:dm-12
[   17.226969]  disk 1, o:1, dev:dm-14
[   17.227679]  disk 2, o:1, dev:dm-16
[   17.228383]  disk 3, o:1, dev:dm-18
[   17.229087]  disk 4, o:1, dev:dm-20
[   17.229899] created bitmap (7 pages) for device mdX
[   17.267668] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   17.269079] md/raid:mdX: device dm-31 operational as raid disk 4
[   17.269830] md/raid:mdX: device dm-29 operational as raid disk 3
[   17.270555] md/raid:mdX: device dm-27 operational as raid disk 2
[   17.271281] md/raid:mdX: device dm-25 operational as raid disk 1
[   17.272366] md/raid:mdX: allocated 5432kB
[   17.273159] md/raid:mdX: raid level 6 active with 4 out of 5
devices, algorithm 8
[   17.274282] RAID conf printout:
[   17.275381]  --- level:6 rd:5 wd:4
[   17.276522]  disk 0, o:1, dev:dm-23
[   17.277626]  disk 1, o:1, dev:dm-25
[   17.278729]  disk 2, o:1, dev:dm-27
[   17.279866]  disk 3, o:1, dev:dm-29
[   17.280975]  disk 4, o:1, dev:dm-31
[   17.287437] created bitmap (134 pages) for device mdX
[   17.321117] mdX: bitmap initialized from disk: read 1 pages, set 0
of 12800 bits
[   17.368265] RAID conf printout:
[   17.369044]  --- level:5 rd:5 wd:4
[   17.369784]  disk 0, o:1, dev:dm-12
[   17.370530]  disk 1, o:1, dev:dm-14
[   17.371265]  disk 2, o:1, dev:dm-16
[   17.372002]  disk 3, o:1, dev:dm-18
[   17.372706]  disk 4, o:1, dev:dm-20
[   17.373405] RAID conf printout:
[   17.374096]  --- level:5 rd:5 wd:4
[   17.374795]  disk 0, o:1, dev:dm-12
[   17.375503]  disk 1, o:1, dev:dm-14
[   17.376213]  disk 2, o:1, dev:dm-16
[   17.376918]  disk 3, o:1, dev:dm-18
[   17.377608]  disk 4, o:1, dev:dm-20
[   17.395216] mdX: bitmap initialized from disk: read 9 pages, set 11
of 273072 bits
[   17.412451] RAID conf printout:
[   17.413181]  --- level:6 rd:5 wd:4
[   17.413868]  disk 0, o:1, dev:dm-23
[   17.414556]  disk 1, o:1, dev:dm-25
[   17.415246]  disk 2, o:1, dev:dm-27
[   17.415944]  disk 3, o:1, dev:dm-29
[   17.416631]  disk 4, o:1, dev:dm-31
[   17.417317] RAID conf printout:
[   17.418001]  --- level:6 rd:5 wd:4
[   17.418687]  disk 0, o:1, dev:dm-23
[   17.419372]  disk 1, o:1, dev:dm-25
[   17.420067]  disk 2, o:1, dev:dm-27
[   17.420754]  disk 3, o:1, dev:dm-29
[   17.421439]  disk 4, o:1, dev:dm-31
[   17.422506] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   17.424488] md/raid:mdX: device dm-31 operational as raid disk 4
[   17.425611] md/raid:mdX: device dm-29 operational as raid disk 3
[   17.426712] md/raid:mdX: device dm-27 operational as raid disk 2
[   17.427831] md/raid:mdX: device dm-25 operational as raid disk 1
[   17.429458] md/raid:mdX: allocated 5432kB
[   17.430655] md/raid:mdX: raid level 6 active with 4 out of 5
devices, algorithm 8
[   17.433904] RAID conf printout:
[   17.437136]  --- level:6 rd:5 wd:4
[   17.440320]  disk 0, o:1, dev:dm-23
[   17.443521]  disk 1, o:1, dev:dm-25
[   17.446662]  disk 2, o:1, dev:dm-27
[   17.449836]  disk 3, o:1, dev:dm-29
[   17.452999]  disk 4, o:1, dev:dm-31
[   17.456211] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   17.461665] md/raid:mdX: device dm-20 operational as raid disk 4
[   17.462855] md/raid:mdX: device dm-18 operational as raid disk 3
[   17.464025] md/raid:mdX: device dm-16 operational as raid disk 2
[   17.465189] md/raid:mdX: device dm-14 operational as raid disk 1
[   17.466852] md/raid:mdX: allocated 5432kB
[   17.467545] created bitmap (134 pages) for device mdX
[   17.469204] md/raid:mdX: raid level 5 active with 4 out of 5
devices, algorithm 2
[   17.470391] RAID conf printout:
[   17.471572]  --- level:5 rd:5 wd:4
[   17.472787]  disk 0, o:1, dev:dm-12
[   17.473973]  disk 1, o:1, dev:dm-14
[   17.475174]  disk 2, o:1, dev:dm-16
[   17.476368]  disk 3, o:1, dev:dm-18
[   17.477565]  disk 4, o:1, dev:dm-20
[   17.478827] created bitmap (7 pages) for device mdX
[   17.549930] mdX: bitmap initialized from disk: read 1 pages, set 0
of 12800 bits
[   17.576840] mdX: bitmap initialized from disk: read 9 pages, set 11
of 273072 bits
[   17.591569] RAID conf printout:
[   17.592594]  --- level:5 rd:5 wd:4
[   17.593584]  disk 0, o:1, dev:dm-12
[   17.594561]  disk 1, o:1, dev:dm-14
[   17.595519]  disk 2, o:1, dev:dm-16
[   17.596446]  disk 3, o:1, dev:dm-18
[   17.597372]  disk 4, o:1, dev:dm-20
[   17.598300] RAID conf printout:
[   17.599227]  --- level:5 rd:5 wd:4
[   17.600167]  disk 0, o:1, dev:dm-12
[   17.601096]  disk 1, o:1, dev:dm-14
[   17.602031]  disk 2, o:1, dev:dm-16
[   17.602944]  disk 3, o:1, dev:dm-18
[   17.603840]  disk 4, o:1, dev:dm-20
[   17.628930] RAID conf printout:
[   17.631891]  --- level:6 rd:5 wd:4
[   17.634775]  disk 0, o:1, dev:dm-23
[   17.637695]  disk 1, o:1, dev:dm-25
[   17.640606]  disk 2, o:1, dev:dm-27
[   17.643520]  disk 3, o:1, dev:dm-29
[   17.646426]  disk 4, o:1, dev:dm-31
[   17.649311] RAID conf printout:
[   17.649697] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   17.651837] md/raid:mdX: device dm-20 operational as raid disk 4
[   17.651840] md/raid:mdX: device dm-18 operational as raid disk 3
[   17.651842] md/raid:mdX: device dm-16 operational as raid disk 2
[   17.651844] md/raid:mdX: device dm-14 operational as raid disk 1
[   17.652869] md/raid:mdX: allocated 5432kB
[   17.652958] md/raid:mdX: raid level 5 active with 4 out of 5
devices, algorithm 2
[   17.652959] RAID conf printout:
[   17.652961]  --- level:5 rd:5 wd:4
[   17.652963]  disk 0, o:1, dev:dm-12
[   17.652965]  disk 1, o:1, dev:dm-14
[   17.652967]  disk 2, o:1, dev:dm-16
[   17.652968]  disk 3, o:1, dev:dm-18
[   17.652970]  disk 4, o:1, dev:dm-20
[   17.673630] created bitmap (7 pages) for device mdX
[   17.697873]  --- level:6 rd:5 wd:4
[   17.700930]  disk 0, o:1, dev:dm-23
[   17.704015]  disk 1, o:1, dev:dm-25
[   17.707093]  disk 2, o:1, dev:dm-27
[   17.710178]  disk 3, o:1, dev:dm-29
[   17.713262]  disk 4, o:1, dev:dm-31
[   17.814603] mdX: bitmap initialized from disk: read 1 pages, set 0
of 12800 bits
[   17.862261] RAID conf printout:
[   17.863047]  --- level:5 rd:5 wd:4
[   17.863803]  disk 0, o:1, dev:dm-12
[   17.864559]  disk 1, o:1, dev:dm-14
[   17.865302]  disk 2, o:1, dev:dm-16
[   17.866027]  disk 3, o:1, dev:dm-18
[   17.866732]  disk 4, o:1, dev:dm-20
[   17.867438] RAID conf printout:
[   17.868132]  --- level:5 rd:5 wd:4
[   17.868830]  disk 0, o:1, dev:dm-12
[   17.869532]  disk 1, o:1, dev:dm-14
[   17.870233]  disk 2, o:1, dev:dm-16
[   17.870935]  disk 3, o:1, dev:dm-18
[   17.871621]  disk 4, o:1, dev:dm-20
[   17.919899] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   17.923044] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   17.925154] md/raid:mdX: device dm-31 operational as raid disk 4
[   17.925156] md/raid:mdX: device dm-29 operational as raid disk 3
[   17.925157] md/raid:mdX: device dm-27 operational as raid disk 2
[   17.925157] md/raid:mdX: device dm-25 operational as raid disk 1
[   17.925649] md/raid:mdX: allocated 5432kB
[   17.925676] md/raid:mdX: raid level 6 active with 4 out of 5
devices, algorithm 8
[   17.925677] RAID conf printout:
[   17.925677]  --- level:6 rd:5 wd:4
[   17.925678]  disk 0, o:1, dev:dm-23
[   17.925679]  disk 1, o:1, dev:dm-25
[   17.925679]  disk 2, o:1, dev:dm-27
[   17.925680]  disk 3, o:1, dev:dm-29
[   17.925681]  disk 4, o:1, dev:dm-31
[   17.925777] created bitmap (134 pages) for device mdX
[   17.966619] md/raid:mdX: device dm-20 operational as raid disk 4
[   17.969432] md/raid:mdX: device dm-18 operational as raid disk 3
[   17.972165] md/raid:mdX: device dm-16 operational as raid disk 2
[   17.974864] md/raid:mdX: device dm-14 operational as raid disk 1
[   17.978641] md/raid:mdX: allocated 5432kB
[   17.981453] md/raid:mdX: raid level 5 active with 4 out of 5
devices, algorithm 2
[   17.982304] RAID conf printout:
[   17.982994]  --- level:5 rd:5 wd:4
[   17.983689]  disk 0, o:1, dev:dm-12
[   17.984395]  disk 1, o:1, dev:dm-14
[   17.985084]  disk 2, o:1, dev:dm-16
[   17.985765]  disk 3, o:1, dev:dm-18
[   17.986473]  disk 4, o:1, dev:dm-20
[   17.987260] created bitmap (7 pages) for device mdX
[   18.041839] mdX: bitmap initialized from disk: read 9 pages, set 11
of 273072 bits
[   18.074180] RAID conf printout:
[   18.077244]  --- level:6 rd:5 wd:4
[   18.080259]  disk 0, o:1, dev:dm-23
[   18.083286]  disk 1, o:1, dev:dm-25
[   18.086314]  disk 2, o:1, dev:dm-27
[   18.089342]  disk 3, o:1, dev:dm-29
[   18.092370]  disk 4, o:1, dev:dm-31
[   18.095360] RAID conf printout:
[   18.098292]  --- level:6 rd:5 wd:4
[   18.101155]  disk 0, o:1, dev:dm-23
[   18.104048]  disk 1, o:1, dev:dm-25
[   18.106940]  disk 2, o:1, dev:dm-27
[   18.109846]  disk 3, o:1, dev:dm-29
[   18.112714]  disk 4, o:1, dev:dm-31
[   18.115748] mdX: bitmap initialized from disk: read 1 pages, set 0
of 12800 bits
[   18.143535] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   18.146764] md/raid:mdX: device dm-31 operational as raid disk 4
[   18.147894] md/raid:mdX: device dm-29 operational as raid disk 3
[   18.148981] md/raid:mdX: device dm-27 operational as raid disk 2
[   18.150067] md/raid:mdX: device dm-25 operational as raid disk 1
[   18.151620] md/raid:mdX: allocated 5432kB
[   18.152824] md/raid:mdX: raid level 6 active with 4 out of 5
devices, algorithm 8
[   18.155134] RAID conf printout:
[   18.155137]  --- level:5 rd:5 wd:4
[   18.155140]  disk 0, o:1, dev:dm-12
[   18.155143]  disk 1, o:1, dev:dm-14
[   18.155145]  disk 2, o:1, dev:dm-16
[   18.155147]  disk 3, o:1, dev:dm-18
[   18.155149]  disk 4, o:1, dev:dm-20
[   18.155150] RAID conf printout:
[   18.155151]  --- level:5 rd:5 wd:4
[   18.155153]  disk 0, o:1, dev:dm-12
[   18.155155]  disk 1, o:1, dev:dm-14
[   18.155156]  disk 2, o:1, dev:dm-16
[   18.155158]  disk 3, o:1, dev:dm-18
[   18.155160]  disk 4, o:1, dev:dm-20
[   18.191930] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   18.193969] md/raid:mdX: device dm-20 operational as raid disk 4
[   18.193971] md/raid:mdX: device dm-18 operational as raid disk 3
[   18.193973] md/raid:mdX: device dm-16 operational as raid disk 2
[   18.193975] md/raid:mdX: device dm-14 operational as raid disk 1
[   18.194980] md/raid:mdX: allocated 5432kB
[   18.195070] md/raid:mdX: raid level 5 active with 4 out of 5
devices, algorithm 2
[   18.195071] RAID conf printout:
[   18.195072]  --- level:5 rd:5 wd:4
[   18.195074]  disk 0, o:1, dev:dm-12
[   18.195076]  disk 1, o:1, dev:dm-14
[   18.195078]  disk 2, o:1, dev:dm-16
[   18.195079]  disk 3, o:1, dev:dm-18
[   18.195081]  disk 4, o:1, dev:dm-20
[   18.240184] RAID conf printout:
[   18.243129]  --- level:6 rd:5 wd:4
[   18.246036]  disk 0, o:1, dev:dm-23
[   18.248955]  disk 1, o:1, dev:dm-25
[   18.251845]  disk 2, o:1, dev:dm-27
[   18.254729]  disk 3, o:1, dev:dm-29
[   18.257629]  disk 4, o:1, dev:dm-31
[   18.267711] created bitmap (134 pages) for device mdX
[   18.267713] created bitmap (7 pages) for device mdX
[   18.365744] mdX: bitmap initialized from disk: read 1 pages, set 0
of 12800 bits
[   18.388672] mdX: bitmap initialized from disk: read 9 pages, set 11
of 273072 bits
[   18.403651] RAID conf printout:
[   18.404409]  --- level:5 rd:5 wd:4
[   18.405142]  disk 0, o:1, dev:dm-12
[   18.405873]  disk 1, o:1, dev:dm-14
[   18.406584]  disk 2, o:1, dev:dm-16
[   18.407276]  disk 3, o:1, dev:dm-18
[   18.407970]  disk 4, o:1, dev:dm-20
[   18.408650] RAID conf printout:
[   18.409334]  --- level:5 rd:5 wd:4
[   18.410025]  disk 0, o:1, dev:dm-12
[   18.410723]  disk 1, o:1, dev:dm-14
[   18.410855] RAID conf printout:
[   18.410857]  --- level:6 rd:5 wd:4
[   18.410858]  disk 0, o:1, dev:dm-23
[   18.410859]  disk 1, o:1, dev:dm-25
[   18.410865]  disk 2, o:1, dev:dm-27
[   18.410866]  disk 3, o:1, dev:dm-29
[   18.410866]  disk 4, o:1, dev:dm-31
[   18.410867] RAID conf printout:
[   18.410868]  --- level:6 rd:5 wd:4
[   18.410868]  disk 0, o:1, dev:dm-23
[   18.410869]  disk 1, o:1, dev:dm-25
[   18.410869]  disk 2, o:1, dev:dm-27
[   18.410870]  disk 3, o:1, dev:dm-29
[   18.410871]  disk 4, o:1, dev:dm-31
[   18.411041] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   18.412103] md/raid:mdX: device dm-20 operational as raid disk 4
[   18.412104] md/raid:mdX: device dm-18 operational as raid disk 3
[   18.412105] md/raid:mdX: device dm-16 operational as raid disk 2
[   18.412106] md/raid:mdX: device dm-14 operational as raid disk 1
[   18.412576] md/raid:mdX: allocated 5432kB
[   18.419486] md/raid:mdX: raid level 5 active with 4 out of 5
devices, algorithm 2
[   18.419488] RAID conf printout:
[   18.419489]  --- level:5 rd:5 wd:4
[   18.419492]  disk 0, o:1, dev:dm-12
[   18.419494]  disk 1, o:1, dev:dm-14
[   18.419496]  disk 2, o:1, dev:dm-16
[   18.419498]  disk 3, o:1, dev:dm-18
[   18.419501]  disk 4, o:1, dev:dm-20
[   18.429870]  disk 2, o:1, dev:dm-16
[   18.430490]  disk 3, o:1, dev:dm-18
[   18.431112]  disk 4, o:1, dev:dm-20
[   18.431645] created bitmap (7 pages) for device mdX
[   18.499839] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   18.504932] md/raid:mdX: device dm-31 operational as raid disk 4
[   18.507815] md/raid:mdX: device dm-29 operational as raid disk 3
[   18.510639] md/raid:mdX: device dm-27 operational as raid disk 2
[   18.513452] md/raid:mdX: device dm-25 operational as raid disk 1
[   18.516499] mdX: bitmap initialized from disk: read 1 pages, set 0
of 12800 bits
[   18.517288] md/raid:mdX: allocated 5432kB
[   18.519362] md/raid:mdX: raid level 6 active with 4 out of 5
devices, algorithm 8
[   18.520093] RAID conf printout:
[   18.520797]  --- level:6 rd:5 wd:4
[   18.521503]  disk 0, o:1, dev:dm-23
[   18.522224]  disk 1, o:1, dev:dm-25
[   18.522928]  disk 2, o:1, dev:dm-27
[   18.523629]  disk 3, o:1, dev:dm-29
[   18.524293]  disk 4, o:1, dev:dm-31
[   18.543026] created bitmap (134 pages) for device mdX
[   18.625628] RAID conf printout:
[   18.626352]  --- level:5 rd:5 wd:4
[   18.627037]  disk 0, o:1, dev:dm-12
[   18.627735]  disk 1, o:1, dev:dm-14
[   18.628423]  disk 2, o:1, dev:dm-16
[   18.629105]  disk 3, o:1, dev:dm-18
[   18.629781]  disk 4, o:1, dev:dm-20
[   18.630452] RAID conf printout:
[   18.631129]  --- level:5 rd:5 wd:4
[   18.631817]  disk 0, o:1, dev:dm-12
[   18.632510]  disk 1, o:1, dev:dm-14
[   18.633201]  disk 2, o:1, dev:dm-16
[   18.633879]  disk 3, o:1, dev:dm-18
[   18.634555]  disk 4, o:1, dev:dm-20
[   18.667122] mdX: bitmap initialized from disk: read 9 pages, set 11
of 273072 bits
[   18.731712] RAID conf printout:
[   18.734564]  --- level:6 rd:5 wd:4
[   18.737368]  disk 0, o:1, dev:dm-23
[   18.740162]  disk 1, o:1, dev:dm-25
[   18.742945]  disk 2, o:1, dev:dm-27
[   18.745748]  disk 3, o:1, dev:dm-29
[   18.748544]  disk 4, o:1, dev:dm-31
[   18.751330] RAID conf printout:
[   18.754119]  --- level:6 rd:5 wd:4
[   18.756912]  disk 0, o:1, dev:dm-23
[   18.759705]  disk 1, o:1, dev:dm-25
[   18.760375] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   18.760402] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   18.761507] md/raid:mdX: device dm-20 operational as raid disk 4
[   18.761508] md/raid:mdX: device dm-18 operational as raid disk 3
[   18.761509] md/raid:mdX: device dm-16 operational as raid disk 2
[   18.761509] md/raid:mdX: device dm-14 operational as raid disk 1
[   18.762011] md/raid:mdX: allocated 5432kB
[   18.762034] md/raid:mdX: raid level 5 active with 4 out of 5
devices, algorithm 2
[   18.762035] RAID conf printout:
[   18.762036]  --- level:5 rd:5 wd:4
[   18.762037]  disk 0, o:1, dev:dm-12
[   18.762037]  disk 1, o:1, dev:dm-14
[   18.762038]  disk 2, o:1, dev:dm-16
[   18.762038]  disk 3, o:1, dev:dm-18
[   18.762039]  disk 4, o:1, dev:dm-20
[   18.763460] md/raid:mdX: device dm-31 operational as raid disk 4
[   18.763461] md/raid:mdX: device dm-29 operational as raid disk 3
[   18.763462] md/raid:mdX: device dm-27 operational as raid disk 2
[   18.763463] md/raid:mdX: device dm-25 operational as raid disk 1
[   18.763939] md/raid:mdX: allocated 5432kB
[   18.763980] md/raid:mdX: raid level 6 active with 4 out of 5
devices, algorithm 8
[   18.763980] RAID conf printout:
[   18.763981]  --- level:6 rd:5 wd:4
[   18.763981]  disk 0, o:1, dev:dm-23
[   18.763982]  disk 1, o:1, dev:dm-25
[   18.763983]  disk 2, o:1, dev:dm-27
[   18.763983]  disk 3, o:1, dev:dm-29
[   18.763984]  disk 4, o:1, dev:dm-31
[   18.767551] created bitmap (7 pages) for device mdX
[   18.767598] created bitmap (134 pages) for device mdX
[   18.851763]  disk 2, o:1, dev:dm-27
[   18.854814]  disk 3, o:1, dev:dm-29
[   18.857826]  disk 4, o:1, dev:dm-31
[   18.958646] mdX: bitmap initialized from disk: read 1 pages, set 0
of 12800 bits
[   19.000413] mdX: bitmap initialized from disk: read 9 pages, set 11
of 273072 bits
[   19.026585] RAID conf printout:
[   19.027347]  --- level:5 rd:5 wd:4
[   19.028096]  disk 0, o:1, dev:dm-12
[   19.028823]  disk 1, o:1, dev:dm-14
[   19.029519]  disk 2, o:1, dev:dm-16
[   19.030201]  disk 3, o:1, dev:dm-18
[   19.030862]  disk 4, o:1, dev:dm-20
[   19.031522] RAID conf printout:
[   19.032177]  --- level:5 rd:5 wd:4
[   19.032451] RAID conf printout:
[   19.032453]  --- level:6 rd:5 wd:4
[   19.032454]  disk 0, o:1, dev:dm-23
[   19.032454]  disk 1, o:1, dev:dm-25
[   19.032455]  disk 2, o:1, dev:dm-27
[   19.032456]  disk 3, o:1, dev:dm-29
[   19.032456]  disk 4, o:1, dev:dm-31
[   19.032457] RAID conf printout:
[   19.032457]  --- level:6 rd:5 wd:4
[   19.032457]  disk 0, o:1, dev:dm-23
[   19.032458]  disk 1, o:1, dev:dm-25
[   19.032458]  disk 2, o:1, dev:dm-27
[   19.032458]  disk 3, o:1, dev:dm-29
[   19.032459]  disk 4, o:1, dev:dm-31
[   19.032643] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   19.033347] md/raid:mdX: device dm-20 operational as raid disk 4
[   19.033348] md/raid:mdX: device dm-18 operational as raid disk 3
[   19.033348] md/raid:mdX: device dm-16 operational as raid disk 2
[   19.033349] md/raid:mdX: device dm-14 operational as raid disk 1
[   19.033755] md/raid:mdX: allocated 5432kB
[   19.033796] md/raid:mdX: raid level 5 active with 4 out of 5
devices, algorithm 2
[   19.033796] RAID conf printout:
[   19.033797]  --- level:5 rd:5 wd:4
[   19.033797]  disk 0, o:1, dev:dm-12
[   19.033798]  disk 1, o:1, dev:dm-14
[   19.033798]  disk 2, o:1, dev:dm-16
[   19.033799]  disk 3, o:1, dev:dm-18
[   19.033799]  disk 4, o:1, dev:dm-20
[   19.033885] created bitmap (7 pages) for device mdX
[   19.047717] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   19.048658] md/raid:mdX: device dm-31 operational as raid disk 4
[   19.048661] md/raid:mdX: device dm-29 operational as raid disk 3
[   19.048663] md/raid:mdX: device dm-27 operational as raid disk 2
[   19.048664] md/raid:mdX: device dm-25 operational as raid disk 1
[   19.049744] md/raid:mdX: allocated 5432kB
[   19.049824] md/raid:mdX: raid level 6 active with 4 out of 5
devices, algorithm 8
[   19.049825] RAID conf printout:
[   19.049827]  --- level:6 rd:5 wd:4
[   19.049829]  disk 0, o:1, dev:dm-23
[   19.049831]  disk 1, o:1, dev:dm-25
[   19.049832]  disk 2, o:1, dev:dm-27
[   19.049834]  disk 3, o:1, dev:dm-29
[   19.049836]  disk 4, o:1, dev:dm-31
[   19.049982] created bitmap (134 pages) for device mdX
[   19.062013]  disk 0, o:1, dev:dm-12
[   19.062694]  disk 1, o:1, dev:dm-14
[   19.063360]  disk 2, o:1, dev:dm-16
[   19.064029]  disk 3, o:1, dev:dm-18
[   19.064696]  disk 4, o:1, dev:dm-20
[   19.168024] mdX: bitmap initialized from disk: read 9 pages, set 11
of 273072 bits
[   19.180286] mdX: bitmap initialized from disk: read 1 pages, set 0
of 12800 bits
[   19.186972] RAID conf printout:
[   19.188061]  --- level:6 rd:5 wd:4
[   19.189089]  disk 0, o:1, dev:dm-23
[   19.190122]  disk 1, o:1, dev:dm-25
[   19.191157]  disk 2, o:1, dev:dm-27
[   19.192200]  disk 3, o:1, dev:dm-29
[   19.193239]  disk 4, o:1, dev:dm-31
[   19.194276] RAID conf printout:
[   19.195303]  --- level:6 rd:5 wd:4
[   19.196336]  disk 0, o:1, dev:dm-23
[   19.197355]  disk 1, o:1, dev:dm-25
[   19.198375]  disk 2, o:1, dev:dm-27
[   19.199397]  disk 3, o:1, dev:dm-29
[   19.200397]  disk 4, o:1, dev:dm-31
[   19.217800] RAID conf printout:
[   19.218625]  --- level:5 rd:5 wd:4
[   19.219414]  disk 0, o:1, dev:dm-12
[   19.220211]  disk 1, o:1, dev:dm-14
[   19.220997]  disk 2, o:1, dev:dm-16
[   19.221784]  disk 3, o:1, dev:dm-18
[   19.222574]  disk 4, o:1, dev:dm-20
[   19.223363] RAID conf printout:
[   19.224155]  --- level:5 rd:5 wd:4
[   19.224938]  disk 0, o:1, dev:dm-12
[   19.225721]  disk 1, o:1, dev:dm-14
[   19.226497]  disk 2, o:1, dev:dm-16
[   19.227267]  disk 3, o:1, dev:dm-18
[   19.228045]  disk 4, o:1, dev:dm-20
[   19.268322] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   19.268362] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   19.271099] md/raid:mdX: device dm-31 operational as raid disk 4
[   19.271102] md/raid:mdX: device dm-29 operational as raid disk 3
[   19.271104] md/raid:mdX: device dm-27 operational as raid disk 2
[   19.271106] md/raid:mdX: device dm-25 operational as raid disk 1
[   19.272207] md/raid:mdX: allocated 5432kB
[   19.272316] md/raid:mdX: raid level 6 active with 4 out of 5
devices, algorithm 8
[   19.272317] RAID conf printout:
[   19.272319]  --- level:6 rd:5 wd:4
[   19.272321]  disk 0, o:1, dev:dm-23
[   19.272323]  disk 1, o:1, dev:dm-25
[   19.272324]  disk 2, o:1, dev:dm-27
[   19.272326]  disk 3, o:1, dev:dm-29
[   19.272327]  disk 4, o:1, dev:dm-31
[   19.272493] created bitmap (134 pages) for device mdX
[   19.314976] md/raid:mdX: device dm-20 operational as raid disk 4
[   19.317857] md/raid:mdX: device dm-18 operational as raid disk 3
[   19.320612] md/raid:mdX: device dm-16 operational as raid disk 2
[   19.323529] md/raid:mdX: device dm-14 operational as raid disk 1
[   19.327869] md/raid:mdX: allocated 5432kB
[   19.331062] md/raid:mdX: raid level 5 active with 4 out of 5
devices, algorithm 2
[   19.333980] RAID conf printout:
[   19.336868]  --- level:5 rd:5 wd:4
[   19.339730]  disk 0, o:1, dev:dm-12
[   19.342519]  disk 1, o:1, dev:dm-14
[   19.345224]  disk 2, o:1, dev:dm-16
[   19.347932]  disk 3, o:1, dev:dm-18
[   19.350638]  disk 4, o:1, dev:dm-20
[   19.354143] created bitmap (7 pages) for device mdX
[   19.424623] mdX: bitmap initialized from disk: read 1 pages, set 0
of 12800 bits
[   19.466239] mdX: bitmap initialized from disk: read 9 pages, set 11
of 273072 bits
[   19.497831] RAID conf printout:
[   19.498522]  --- level:5 rd:5 wd:4
[   19.499179]  disk 0, o:1, dev:dm-12
[   19.499852]  disk 1, o:1, dev:dm-14
[   19.500523]  disk 2, o:1, dev:dm-16
[   19.501187]  disk 3, o:1, dev:dm-18
[   19.501856]  disk 4, o:1, dev:dm-20
[   19.502510] RAID conf printout:
[   19.503165]  --- level:5 rd:5 wd:4
[   19.503681] RAID conf printout:
[   19.503683]  --- level:6 rd:5 wd:4
[   19.503684]  disk 0, o:1, dev:dm-23
[   19.503685]  disk 1, o:1, dev:dm-25
[   19.503686]  disk 2, o:1, dev:dm-27
[   19.503686]  disk 3, o:1, dev:dm-29
[   19.503687]  disk 4, o:1, dev:dm-31
[   19.503687] RAID conf printout:
[   19.503688]  --- level:6 rd:5 wd:4
[   19.503689]  disk 0, o:1, dev:dm-23
[   19.503689]  disk 1, o:1, dev:dm-25
[   19.503690]  disk 2, o:1, dev:dm-27
[   19.503690]  disk 3, o:1, dev:dm-29
[   19.503691]  disk 4, o:1, dev:dm-31
[   19.504033] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   19.513401]  disk 0, o:1, dev:dm-12
[   19.514046]  disk 1, o:1, dev:dm-14
[   19.514690]  disk 2, o:1, dev:dm-16
[   19.515334]  disk 3, o:1, dev:dm-18
[   19.515980]  disk 4, o:1, dev:dm-20
[   19.516054] md/raid:mdX: device dm-20 operational as raid disk 4
[   19.516056] md/raid:mdX: device dm-18 operational as raid disk 3
[   19.516057] md/raid:mdX: device dm-16 operational as raid disk 2
[   19.516058] md/raid:mdX: device dm-14 operational as raid disk 1
[   19.516568] md/raid:mdX: allocated 5432kB
[   19.516622] md/raid:mdX: raid level 5 active with 4 out of 5
devices, algorithm 2
[   19.516622] RAID conf printout:
[   19.516623]  --- level:5 rd:5 wd:4
[   19.516624]  disk 0, o:1, dev:dm-12
[   19.516624]  disk 1, o:1, dev:dm-14
[   19.516625]  disk 2, o:1, dev:dm-16
[   19.516625]  disk 3, o:1, dev:dm-18
[   19.516626]  disk 4, o:1, dev:dm-20
[   19.516722] created bitmap (7 pages) for device mdX
[   19.519535] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   19.520271] md/raid:mdX: device dm-31 operational as raid disk 4
[   19.520272] md/raid:mdX: device dm-29 operational as raid disk 3
[   19.520273] md/raid:mdX: device dm-27 operational as raid disk 2
[   19.520273] md/raid:mdX: device dm-25 operational as raid disk 1
[   19.520668] md/raid:mdX: allocated 5432kB
[   19.520700] md/raid:mdX: raid level 6 active with 4 out of 5
devices, algorithm 8
[   19.520701] RAID conf printout:
[   19.520701]  --- level:6 rd:5 wd:4
[   19.520702]  disk 0, o:1, dev:dm-23
[   19.520702]  disk 1, o:1, dev:dm-25
[   19.520703]  disk 2, o:1, dev:dm-27
[   19.520703]  disk 3, o:1, dev:dm-29
[   19.520704]  disk 4, o:1, dev:dm-31
[   19.520794] created bitmap (134 pages) for device mdX
[   19.643521] mdX: bitmap initialized from disk: read 9 pages, set 11
of 273072 bits
[   19.657703] mdX: bitmap initialized from disk: read 1 pages, set 0
of 12800 bits
[   19.668219] RAID conf printout:
[   19.668961]  --- level:6 rd:5 wd:4
[   19.669674]  disk 0, o:1, dev:dm-23
[   19.670383]  disk 1, o:1, dev:dm-25
[   19.671075]  disk 2, o:1, dev:dm-27
[   19.671780]  disk 3, o:1, dev:dm-29
[   19.672450]  disk 4, o:1, dev:dm-31
[   19.673116] RAID conf printout:
[   19.673786]  --- level:6 rd:5 wd:4
[   19.674463]  disk 0, o:1, dev:dm-23
[   19.675146]  disk 1, o:1, dev:dm-25
[   19.675837]  disk 2, o:1, dev:dm-27
[   19.676513]  disk 3, o:1, dev:dm-29
[   19.677163]  disk 4, o:1, dev:dm-31
[   19.699145] RAID conf printout:
[   19.700010]  --- level:5 rd:5 wd:4
[   19.700805]  disk 0, o:1, dev:dm-12
[   19.701596]  disk 1, o:1, dev:dm-14
[   19.702394]  disk 2, o:1, dev:dm-16
[   19.703188]  disk 3, o:1, dev:dm-18
[   19.703984]  disk 4, o:1, dev:dm-20
[   19.704776] RAID conf printout:
[   19.705563]  --- level:5 rd:5 wd:4
[   19.706357]  disk 0, o:1, dev:dm-12
[   19.707147]  disk 1, o:1, dev:dm-14
[   19.707937]  disk 2, o:1, dev:dm-16
[   19.708715]  disk 3, o:1, dev:dm-18
[   19.709493]  disk 4, o:1, dev:dm-20
[   19.825499] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   19.830618] md/raid:mdX: device dm-20 operational as raid disk 4
[   19.833508] md/raid:mdX: device dm-18 operational as raid disk 3
[   19.836340] md/raid:mdX: device dm-16 operational as raid disk 2
[   19.839253] md/raid:mdX: device dm-14 operational as raid disk 1
[   19.842430] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   19.843844] md/raid:mdX: allocated 5432kB
[   19.845960] md/raid:mdX: raid level 5 active with 4 out of 5
devices, algorithm 2
[   19.845960] RAID conf printout:
[   19.845961]  --- level:5 rd:5 wd:4
[   19.845962]  disk 0, o:1, dev:dm-12
[   19.845962]  disk 1, o:1, dev:dm-14
[   19.845963]  disk 2, o:1, dev:dm-16
[   19.845963]  disk 3, o:1, dev:dm-18
[   19.845964]  disk 4, o:1, dev:dm-20
[   19.865139] created bitmap (7 pages) for device mdX
[   19.875906] md/raid:mdX: device dm-31 operational as raid disk 4
[   19.877027] md/raid:mdX: device dm-29 operational as raid disk 3
[   19.878128] md/raid:mdX: device dm-27 operational as raid disk 2
[   19.879226] md/raid:mdX: device dm-25 operational as raid disk 1
[   19.880803] md/raid:mdX: allocated 5432kB
[   19.881955] md/raid:mdX: raid level 6 active with 4 out of 5
devices, algorithm 8
[   19.883042] RAID conf printout:
[   19.884144]  --- level:6 rd:5 wd:4
[   19.885274]  disk 0, o:1, dev:dm-23
[   19.886420]  disk 1, o:1, dev:dm-25
[   19.887540]  disk 2, o:1, dev:dm-27
[   19.888663]  disk 3, o:1, dev:dm-29
[   19.889785]  disk 4, o:1, dev:dm-31
[   19.909910] created bitmap (134 pages) for device mdX
[   19.976441] mdX: bitmap initialized from disk: read 1 pages, set 0
of 12800 bits
[   19.999787] mdX: bitmap initialized from disk: read 9 pages, set 11
of 273072 bits
[   20.009830] RAID conf printout:
[   20.010603]  --- level:5 rd:5 wd:4
[   20.011340]  disk 0, o:1, dev:dm-12
[   20.012089]  disk 1, o:1, dev:dm-14
[   20.012808]  disk 2, o:1, dev:dm-16
[   20.013507]  disk 3, o:1, dev:dm-18
[   20.014200]  disk 4, o:1, dev:dm-20
[   20.014888] RAID conf printout:
[   20.015591]  --- level:5 rd:5 wd:4
[   20.016315]  disk 0, o:1, dev:dm-12
[   20.017042]  disk 1, o:1, dev:dm-14
[   20.017772]  disk 2, o:1, dev:dm-16
[   20.017775] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   20.018408] md/raid:mdX: device dm-20 operational as raid disk 4
[   20.018409] md/raid:mdX: device dm-18 operational as raid disk 3
[   20.018410] md/raid:mdX: device dm-16 operational as raid disk 2
[   20.018411] md/raid:mdX: device dm-14 operational as raid disk 1
[   20.018760] md/raid:mdX: allocated 5432kB
[   20.018789] md/raid:mdX: raid level 5 active with 4 out of 5
devices, algorithm 2
[   20.018790] RAID conf printout:
[   20.018791]  --- level:5 rd:5 wd:4
[   20.018792]  disk 0, o:1, dev:dm-12
[   20.018793]  disk 1, o:1, dev:dm-14
[   20.018794]  disk 2, o:1, dev:dm-16
[   20.018794]  disk 3, o:1, dev:dm-18
[   20.018795]  disk 4, o:1, dev:dm-20
[   20.019211] created bitmap (7 pages) for device mdX
[   20.029218]  disk 3, o:1, dev:dm-18
[   20.029947]  disk 4, o:1, dev:dm-20
[   20.039184] RAID conf printout:
[   20.039951]  --- level:6 rd:5 wd:4
[   20.040678]  disk 0, o:1, dev:dm-23
[   20.041411]  disk 1, o:1, dev:dm-25
[   20.042145]  disk 2, o:1, dev:dm-27
[   20.042881]  disk 3, o:1, dev:dm-29
[   20.043620]  disk 4, o:1, dev:dm-31
[   20.044348] RAID conf printout:
[   20.045078]  --- level:6 rd:5 wd:4
[   20.045802]  disk 0, o:1, dev:dm-23
[   20.046531]  disk 1, o:1, dev:dm-25
[   20.047261]  disk 2, o:1, dev:dm-27
[   20.047994]  disk 3, o:1, dev:dm-29
[   20.048726]  disk 4, o:1, dev:dm-31
[   20.083832] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   20.089567] md/raid:mdX: device dm-31 operational as raid disk 4
[   20.092725] md/raid:mdX: device dm-29 operational as raid disk 3
[   20.095843] md/raid:mdX: device dm-27 operational as raid disk 2
[   20.098945] md/raid:mdX: device dm-25 operational as raid disk 1
[   20.103020] md/raid:mdX: allocated 5432kB
[   20.106082] md/raid:mdX: raid level 6 active with 4 out of 5
devices, algorithm 8
[   20.109156] RAID conf printout:
[   20.112269]  --- level:6 rd:5 wd:4
[   20.115252]  disk 0, o:1, dev:dm-23
[   20.118211]  disk 1, o:1, dev:dm-25
[   20.121190]  disk 2, o:1, dev:dm-27
[   20.124159]  disk 3, o:1, dev:dm-29
[   20.127119]  disk 4, o:1, dev:dm-31
[   20.135626] created bitmap (134 pages) for device mdX
[   20.140798] mdX: bitmap initialized from disk: read 1 pages, set 0
of 12800 bits
[   20.167560] RAID conf printout:
[   20.168325]  --- level:5 rd:5 wd:4
[   20.169063]  disk 0, o:1, dev:dm-12
[   20.169808]  disk 1, o:1, dev:dm-14
[   20.170540]  disk 2, o:1, dev:dm-16
[   20.171265]  disk 3, o:1, dev:dm-18
[   20.171988]  disk 4, o:1, dev:dm-20
[   20.172690] RAID conf printout:
[   20.173392]  --- level:5 rd:5 wd:4
[   20.174102]  disk 0, o:1, dev:dm-12
[   20.174808]  disk 1, o:1, dev:dm-14
[   20.175519]  disk 2, o:1, dev:dm-16
[   20.176225]  disk 3, o:1, dev:dm-18
[   20.176915]  disk 4, o:1, dev:dm-20
[   20.233737] mdX: bitmap initialized from disk: read 9 pages, set 11
of 273072 bits
[   20.289882] RAID conf printout:
[   20.290606]  --- level:6 rd:5 wd:4
[   20.291299]  disk 0, o:1, dev:dm-23
[   20.291996]  disk 1, o:1, dev:dm-25
[   20.292693]  disk 2, o:1, dev:dm-27
[   20.293396]  disk 3, o:1, dev:dm-29
[   20.294092]  disk 4, o:1, dev:dm-31
[   20.294787] RAID conf printout:
[   20.295479]  --- level:6 rd:5 wd:4
[   20.296174]  disk 0, o:1, dev:dm-23
[   20.296865]  disk 1, o:1, dev:dm-25
[   20.297554]  disk 2, o:1, dev:dm-27
[   20.298241]  disk 3, o:1, dev:dm-29
[   20.298908]  disk 4, o:1, dev:dm-31
[   20.327814] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   20.330968] md/raid:mdX: device dm-20 operational as raid disk 4
[   20.332074] md/raid:mdX: device dm-18 operational as raid disk 3
[   20.333144] md/raid:mdX: device dm-16 operational as raid disk 2
[   20.334197] md/raid:mdX: device dm-14 operational as raid disk 1
[   20.335712] md/raid:mdX: allocated 5432kB
[   20.336799] md/raid:mdX: raid level 5 active with 4 out of 5
devices, algorithm 2
[   20.339730] RAID conf printout:
[   20.342641]  --- level:5 rd:5 wd:4
[   20.345568]  disk 0, o:1, dev:dm-12
[   20.348518]  disk 1, o:1, dev:dm-14
[   20.351457]  disk 2, o:1, dev:dm-16
[   20.354416]  disk 3, o:1, dev:dm-18
[   20.357326]  disk 4, o:1, dev:dm-20
[   20.371824] created bitmap (7 pages) for device mdX
[   20.375044] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   20.380317] md/raid:mdX: device dm-31 operational as raid disk 4
[   20.381449] md/raid:mdX: device dm-29 operational as raid disk 3
[   20.382552] md/raid:mdX: device dm-27 operational as raid disk 2
[   20.383663] md/raid:mdX: device dm-25 operational as raid disk 1
[   20.385257] md/raid:mdX: allocated 5432kB
[   20.386922] md/raid:mdX: raid level 6 active with 4 out of 5
devices, algorithm 8
[   20.388098] RAID conf printout:
[   20.389245]  --- level:6 rd:5 wd:4
[   20.390392]  disk 0, o:1, dev:dm-23
[   20.391547]  disk 1, o:1, dev:dm-25
[   20.392699]  disk 2, o:1, dev:dm-27
[   20.393857]  disk 3, o:1, dev:dm-29
[   20.395018]  disk 4, o:1, dev:dm-31
[   20.396324] created bitmap (134 pages) for device mdX
[   20.485991] mdX: bitmap initialized from disk: read 1 pages, set 0
of 12800 bits
[   20.533140] mdX: bitmap initialized from disk: read 9 pages, set 11
of 273072 bits
[   20.590635] RAID conf printout:
[   20.593894]  --- level:5 rd:5 wd:4
[   20.597133]  disk 0, o:1, dev:dm-12
[   20.600347]  disk 1, o:1, dev:dm-14
[   20.600581] RAID conf printout:
[   20.600582]  --- level:6 rd:5 wd:4
[   20.600584]  disk 0, o:1, dev:dm-23
[   20.600585]  disk 1, o:1, dev:dm-25
[   20.600585]  disk 2, o:1, dev:dm-27
[   20.600586]  disk 3, o:1, dev:dm-29
[   20.600587]  disk 4, o:1, dev:dm-31
[   20.600588] RAID conf printout:
[   20.600588]  --- level:6 rd:5 wd:4
[   20.600588]  disk 0, o:1, dev:dm-23
[   20.600589]  disk 1, o:1, dev:dm-25
[   20.600589]  disk 2, o:1, dev:dm-27
[   20.600590]  disk 3, o:1, dev:dm-29
[   20.600590]  disk 4, o:1, dev:dm-31
[   20.601028] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   20.602356] md/raid:mdX: device dm-20 operational as raid disk 4
[   20.602358] md/raid:mdX: device dm-18 operational as raid disk 3
[   20.602359] md/raid:mdX: device dm-16 operational as raid disk 2
[   20.602360] md/raid:mdX: device dm-14 operational as raid disk 1
[   20.602800] md/raid:mdX: allocated 5432kB
[   20.602829] md/raid:mdX: raid level 5 active with 4 out of 5
devices, algorithm 2
[   20.602830] RAID conf printout:
[   20.602830]  --- level:5 rd:5 wd:4
[   20.602831]  disk 0, o:1, dev:dm-12
[   20.602832]  disk 1, o:1, dev:dm-14
[   20.602832]  disk 2, o:1, dev:dm-16
[   20.602833]  disk 3, o:1, dev:dm-18
[   20.602834]  disk 4, o:1, dev:dm-20
[   20.602920] created bitmap (7 pages) for device mdX
[   20.690646]  disk 2, o:1, dev:dm-16
[   20.693674]  disk 3, o:1, dev:dm-18
[   20.696702]  disk 4, o:1, dev:dm-20
[   20.699705] RAID conf printout:
[   20.702697]  --- level:5 rd:5 wd:4
[   20.705701]  disk 0, o:1, dev:dm-12
[   20.708733]  disk 1, o:1, dev:dm-14
[   20.711766]  disk 2, o:1, dev:dm-16
[   20.714792]  disk 3, o:1, dev:dm-18
[   20.717822]  disk 4, o:1, dev:dm-20
[   20.727548] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   20.732994] md/raid:mdX: device dm-31 operational as raid disk 4
[   20.734128] md/raid:mdX: device dm-29 operational as raid disk 3
[   20.735248] md/raid:mdX: device dm-27 operational as raid disk 2
[   20.736396] md/raid:mdX: device dm-25 operational as raid disk 1
[   20.737988] md/raid:mdX: allocated 5432kB
[   20.739184] md/raid:mdX: raid level 6 active with 4 out of 5
devices, algorithm 8
[   20.742284] RAID conf printout:
[   20.745313]  --- level:6 rd:5 wd:4
[   20.748380]  disk 0, o:1, dev:dm-23
[   20.751590]  disk 1, o:1, dev:dm-25
[   20.754706]  disk 2, o:1, dev:dm-27
[   20.757785]  disk 3, o:1, dev:dm-29
[   20.760868]  disk 4, o:1, dev:dm-31
[   20.815731] created bitmap (134 pages) for device mdX
[   20.837715] mdX: bitmap initialized from disk: read 1 pages, set 0
of 12800 bits
[   20.912239] RAID conf printout:
[   20.915308]  --- level:5 rd:5 wd:4
[   20.915904] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   20.921576]  disk 0, o:1, dev:dm-12
[   20.924758]  disk 1, o:1, dev:dm-14
[   20.926791] md/raid:mdX: device dm-20 operational as raid disk 4
[   20.926794] md/raid:mdX: device dm-18 operational as raid disk 3
[   20.926796] md/raid:mdX: device dm-16 operational as raid disk 2
[   20.926799] md/raid:mdX: device dm-14 operational as raid disk 1
[   20.927903] md/raid:mdX: allocated 5432kB
[   20.928007] md/raid:mdX: raid level 5 active with 4 out of 5
devices, algorithm 2
[   20.928009] RAID conf printout:
[   20.928011]  --- level:5 rd:5 wd:4
[   20.928013]  disk 0, o:1, dev:dm-12
[   20.928015]  disk 1, o:1, dev:dm-14
[   20.928017]  disk 2, o:1, dev:dm-16
[   20.928019]  disk 3, o:1, dev:dm-18
[   20.928020]  disk 4, o:1, dev:dm-20
[   20.928160] created bitmap (7 pages) for device mdX
[   20.971068]  disk 2, o:1, dev:dm-16
[   20.974092]  disk 3, o:1, dev:dm-18
[   20.977089]  disk 4, o:1, dev:dm-20
[   20.980067] RAID conf printout:
[   20.983064]  --- level:5 rd:5 wd:4
[   20.986101]  disk 0, o:1, dev:dm-12
[   20.989172]  disk 1, o:1, dev:dm-14
[   20.992241]  disk 2, o:1, dev:dm-16
[   20.995283]  disk 3, o:1, dev:dm-18
[   20.998314]  disk 4, o:1, dev:dm-20
[   21.015303] mdX: bitmap initialized from disk: read 9 pages, set 11
of 273072 bits
[   21.031653] RAID conf printout:
[   21.032444]  --- level:6 rd:5 wd:4
[   21.033212]  disk 0, o:1, dev:dm-23
[   21.033984]  disk 1, o:1, dev:dm-25
[   21.034741]  disk 2, o:1, dev:dm-27
[   21.035471]  disk 3, o:1, dev:dm-29
[   21.036211]  disk 4, o:1, dev:dm-31
[   21.036942] RAID conf printout:
[   21.037679]  --- level:6 rd:5 wd:4
[   21.038412]  disk 0, o:1, dev:dm-23
[   21.039136]  disk 1, o:1, dev:dm-25
[   21.039846]  disk 2, o:1, dev:dm-27
[   21.040547]  disk 3, o:1, dev:dm-29
[   21.041243]  disk 4, o:1, dev:dm-31
[   21.082184] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   21.086725] md/raid:mdX: device dm-31 operational as raid disk 4
[   21.087905] md/raid:mdX: device dm-29 operational as raid disk 3
[   21.089061] md/raid:mdX: device dm-27 operational as raid disk 2
[   21.090198] md/raid:mdX: device dm-25 operational as raid disk 1
[   21.091788] md/raid:mdX: allocated 5432kB
[   21.093001] md/raid:mdX: raid level 6 active with 4 out of 5
devices, algorithm 8
[   21.096276] RAID conf printout:
[   21.099466]  --- level:6 rd:5 wd:4
[   21.102669]  disk 0, o:1, dev:dm-23
[   21.105866]  disk 1, o:1, dev:dm-25
[   21.109071]  disk 2, o:1, dev:dm-27
[   21.112277]  disk 3, o:1, dev:dm-29
[   21.115469]  disk 4, o:1, dev:dm-31
[   21.123706] created bitmap (134 pages) for device mdX
[   21.128811] mdX: bitmap initialized from disk: read 1 pages, set 0
of 12800 bits
[   21.162837] RAID conf printout:
[   21.163681]  --- level:5 rd:5 wd:4
[   21.164462]  disk 0, o:1, dev:dm-12
[   21.165265]  disk 1, o:1, dev:dm-14
[   21.166036]  disk 2, o:1, dev:dm-16
[   21.166791]  disk 3, o:1, dev:dm-18
[   21.167555]  disk 4, o:1, dev:dm-20
[   21.168285] RAID conf printout:
[   21.169017]  --- level:5 rd:5 wd:4
[   21.169753]  disk 0, o:1, dev:dm-12
[   21.170494]  disk 1, o:1, dev:dm-14
[   21.171237]  disk 2, o:1, dev:dm-16
[   21.171986]  disk 3, o:1, dev:dm-18
[   21.172730]  disk 4, o:1, dev:dm-20
[   21.233582] mdX: bitmap initialized from disk: read 9 pages, set 11
of 273072 bits
[   21.278256] RAID conf printout:
[   21.278601] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   21.279774]  --- level:6 rd:5 wd:4
[   21.280506]  disk 0, o:1, dev:dm-23
[   21.280801] md/raid:mdX: device dm-20 operational as raid disk 4
[   21.280804] md/raid:mdX: device dm-18 operational as raid disk 3
[   21.280806] md/raid:mdX: device dm-16 operational as raid disk 2
[   21.280808] md/raid:mdX: device dm-14 operational as raid disk 1
[   21.281918] md/raid:mdX: allocated 5432kB
[   21.282011] md/raid:mdX: raid level 5 active with 4 out of 5
devices, algorithm 2
[   21.282012] RAID conf printout:
[   21.282014]  --- level:5 rd:5 wd:4
[   21.282016]  disk 0, o:1, dev:dm-12
[   21.282018]  disk 1, o:1, dev:dm-14
[   21.282020]  disk 2, o:1, dev:dm-16
[   21.282022]  disk 3, o:1, dev:dm-18
[   21.282024]  disk 4, o:1, dev:dm-20
[   21.290836]  disk 1, o:1, dev:dm-25
[   21.291560]  disk 2, o:1, dev:dm-27
[   21.292269]  disk 3, o:1, dev:dm-29
[   21.292977]  disk 4, o:1, dev:dm-31
[   21.293684] RAID conf printout:
[   21.294388]  --- level:6 rd:5 wd:4
[   21.295094]  disk 0, o:1, dev:dm-23
[   21.295803]  disk 1, o:1, dev:dm-25
[   21.296509]  disk 2, o:1, dev:dm-27
[   21.297214]  disk 3, o:1, dev:dm-29
[   21.297920]  disk 4, o:1, dev:dm-31
[   21.298452] created bitmap (7 pages) for device mdX
[   21.355980] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   21.361657] md/raid:mdX: device dm-31 operational as raid disk 4
[   21.362786] md/raid:mdX: device dm-29 operational as raid disk 3
[   21.363897] md/raid:mdX: device dm-27 operational as raid disk 2
[   21.365000] md/raid:mdX: device dm-25 operational as raid disk 1
[   21.366593] md/raid:mdX: allocated 5432kB
[   21.367784] md/raid:mdX: raid level 6 active with 4 out of 5
devices, algorithm 8
[   21.370973] RAID conf printout:
[   21.374132]  --- level:6 rd:5 wd:4
[   21.377299]  disk 0, o:1, dev:dm-23
[   21.380460]  disk 1, o:1, dev:dm-25
[   21.383614]  disk 2, o:1, dev:dm-27
[   21.386767]  disk 3, o:1, dev:dm-29
[   21.389921]  disk 4, o:1, dev:dm-31
[   21.409677] created bitmap (134 pages) for device mdX
[   21.409732] mdX: bitmap initialized from disk: read 1 pages, set 0
of 12800 bits
[   21.451497] RAID conf printout:
[   21.452347]  --- level:5 rd:5 wd:4
[   21.453133]  disk 0, o:1, dev:dm-12
[   21.453915]  disk 1, o:1, dev:dm-14
[   21.454691]  disk 2, o:1, dev:dm-16
[   21.455450]  disk 3, o:1, dev:dm-18
[   21.456189]  disk 4, o:1, dev:dm-20
[   21.456931] RAID conf printout:
[   21.457670]  --- level:5 rd:5 wd:4
[   21.458404]  disk 0, o:1, dev:dm-12
[   21.459143]  disk 1, o:1, dev:dm-14
[   21.459895]  disk 2, o:1, dev:dm-16
[   21.460656]  disk 3, o:1, dev:dm-18
[   21.461399]  disk 4, o:1, dev:dm-20
[   21.521880] mdX: bitmap initialized from disk: read 9 pages, set 11
of 273072 bits
[   21.535372] RAID conf printout:
[   21.536153]  --- level:6 rd:5 wd:4
[   21.536879]  disk 0, o:1, dev:dm-23
[   21.537615]  disk 1, o:1, dev:dm-25
[   21.538348]  disk 2, o:1, dev:dm-27
[   21.539076]  disk 3, o:1, dev:dm-29
[   21.539810]  disk 4, o:1, dev:dm-31
[   21.540531] RAID conf printout:
[   21.541276]  --- level:6 rd:5 wd:4
[   21.541996]  disk 0, o:1, dev:dm-23
[   21.542722]  disk 1, o:1, dev:dm-25
[   21.543448]  disk 2, o:1, dev:dm-27
[   21.544180]  disk 3, o:1, dev:dm-29
[   21.544905]  disk 4, o:1, dev:dm-31
[   21.563876] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   21.563910] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   21.564897] md/raid:mdX: device dm-31 operational as raid disk 4
[   21.564898] md/raid:mdX: device dm-29 operational as raid disk 3
[   21.564899] md/raid:mdX: device dm-27 operational as raid disk 2
[   21.564900] md/raid:mdX: device dm-25 operational as raid disk 1
[   21.565382] md/raid:mdX: allocated 5432kB
[   21.565470] md/raid:mdX: raid level 6 active with 4 out of 5
devices, algorithm 8
[   21.565472] RAID conf printout:
[   21.565473]  --- level:6 rd:5 wd:4
[   21.565476]  disk 0, o:1, dev:dm-23
[   21.565478]  disk 1, o:1, dev:dm-25
[   21.565480]  disk 2, o:1, dev:dm-27
[   21.565482]  disk 3, o:1, dev:dm-29
[   21.565483]  disk 4, o:1, dev:dm-31
[   21.565644] created bitmap (134 pages) for device mdX
[   21.610374] md/raid:mdX: device dm-20 operational as raid disk 4
[   21.611086] md/raid:mdX: device dm-18 operational as raid disk 3
[   21.611791] md/raid:mdX: device dm-16 operational as raid disk 2
[   21.612489] md/raid:mdX: device dm-14 operational as raid disk 1
[   21.613578] md/raid:mdX: allocated 5432kB
[   21.614365] md/raid:mdX: raid level 5 active with 4 out of 5
devices, algorithm 2
[   21.617479] RAID conf printout:
[   21.620650]  --- level:5 rd:5 wd:4
[   21.623710]  disk 0, o:1, dev:dm-12
[   21.626886]  disk 1, o:1, dev:dm-14
[   21.629961]  disk 2, o:1, dev:dm-16
[   21.633046]  disk 3, o:1, dev:dm-18
[   21.636115]  disk 4, o:1, dev:dm-20
[   21.639241] created bitmap (7 pages) for device mdX
[   21.689041] mdX: bitmap initialized from disk: read 9 pages, set 11
of 273072 bits
[   21.735224] mdX: bitmap initialized from disk: read 1 pages, set 0
of 12800 bits
[   21.749382] RAID conf printout:
[   21.750181]  --- level:6 rd:5 wd:4
[   21.750937]  disk 0, o:1, dev:dm-23
[   21.751684]  disk 1, o:1, dev:dm-25
[   21.752403]  disk 2, o:1, dev:dm-27
[   21.753124]  disk 3, o:1, dev:dm-29
[   21.753842]  disk 4, o:1, dev:dm-31
[   21.754542] RAID conf printout:
[   21.755236]  --- level:6 rd:5 wd:4
[   21.755942]  disk 0, o:1, dev:dm-23
[   21.756653]  disk 1, o:1, dev:dm-25
[   21.757349]  disk 2, o:1, dev:dm-27
[   21.758038]  disk 3, o:1, dev:dm-29
[   21.758703]  disk 4, o:1, dev:dm-31
[   21.823744] RAID conf printout:
[   21.826564]  --- level:5 rd:5 wd:4
[   21.829304]  disk 0, o:1, dev:dm-12
[   21.832047]  disk 1, o:1, dev:dm-14
[   21.834784]  disk 2, o:1, dev:dm-16
[   21.837528]  disk 3, o:1, dev:dm-18
[   21.840278]  disk 4, o:1, dev:dm-20
[   21.842988] RAID conf printout:
[   21.845697]  --- level:5 rd:5 wd:4
[   21.848411]  disk 0, o:1, dev:dm-12
[   21.851146]  disk 1, o:1, dev:dm-14
[   21.853888]  disk 2, o:1, dev:dm-16
[   21.856629]  disk 3, o:1, dev:dm-18
[   21.859363]  disk 4, o:1, dev:dm-20
[   21.884085] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   21.884339] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   21.886462] md/raid:mdX: device dm-31 operational as raid disk 4
[   21.886465] md/raid:mdX: device dm-29 operational as raid disk 3
[   21.886468] md/raid:mdX: device dm-27 operational as raid disk 2
[   21.886470] md/raid:mdX: device dm-25 operational as raid disk 1
[   21.887575] md/raid:mdX: allocated 5432kB
[   21.887678] md/raid:mdX: raid level 6 active with 4 out of 5
devices, algorithm 8
[   21.887679] RAID conf printout:
[   21.887680]  --- level:6 rd:5 wd:4
[   21.887683]  disk 0, o:1, dev:dm-23
[   21.887685]  disk 1, o:1, dev:dm-25
[   21.887686]  disk 2, o:1, dev:dm-27
[   21.887689]  disk 3, o:1, dev:dm-29
[   21.887691]  disk 4, o:1, dev:dm-31
[   21.887851] created bitmap (134 pages) for device mdX
[   21.930911] md/raid:mdX: device dm-20 operational as raid disk 4
[   21.933773] md/raid:mdX: device dm-18 operational as raid disk 3
[   21.936590] md/raid:mdX: device dm-16 operational as raid disk 2
[   21.939402] md/raid:mdX: device dm-14 operational as raid disk 1
[   21.943322] md/raid:mdX: allocated 5432kB
[   21.946204] md/raid:mdX: raid level 5 active with 4 out of 5
devices, algorithm 2
[   21.947263] RAID conf printout:
[   21.948296]  --- level:5 rd:5 wd:4
[   21.949314]  disk 0, o:1, dev:dm-12
[   21.950334]  disk 1, o:1, dev:dm-14
[   21.951353]  disk 2, o:1, dev:dm-16
[   21.952376]  disk 3, o:1, dev:dm-18
[   21.953402]  disk 4, o:1, dev:dm-20
[   21.957692] created bitmap (7 pages) for device mdX
[   22.011367] mdX: bitmap initialized from disk: read 9 pages, set 11
of 273072 bits
[   22.085233] RAID conf printout:
[   22.088194]  --- level:6 rd:5 wd:4
[   22.091128]  disk 0, o:1, dev:dm-23
[   22.094101]  disk 1, o:1, dev:dm-25
[   22.097030]  disk 2, o:1, dev:dm-27
[   22.099882]  disk 3, o:1, dev:dm-29
[   22.102708]  disk 4, o:1, dev:dm-31
[   22.105488] RAID conf printout:
[   22.108289]  --- level:6 rd:5 wd:4
[   22.111114]  disk 0, o:1, dev:dm-23
[   22.113946]  disk 1, o:1, dev:dm-25
[   22.116813]  disk 2, o:1, dev:dm-27
[   22.119654]  disk 3, o:1, dev:dm-29
[   22.122393]  disk 4, o:1, dev:dm-31
[   22.125233] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   22.130226] md/raid:mdX: device dm-31 operational as raid disk 4
[   22.133095] md/raid:mdX: device dm-29 operational as raid disk 3
[   22.135880] md/raid:mdX: device dm-27 operational as raid disk 2
[   22.138615] md/raid:mdX: device dm-25 operational as raid disk 1
[   22.144746] md/raid:mdX: allocated 5432kB
[   22.146016] md/raid:mdX: raid level 6 active with 4 out of 5
devices, algorithm 8
[   22.146719] RAID conf printout:
[   22.147414]  --- level:6 rd:5 wd:4
[   22.148135]  disk 0, o:1, dev:dm-23
[   22.148838]  disk 1, o:1, dev:dm-25
[   22.149532]  disk 2, o:1, dev:dm-27
[   22.150224]  disk 3, o:1, dev:dm-29
[   22.150919]  disk 4, o:1, dev:dm-31
[   22.220782] created bitmap (134 pages) for device mdX
[   22.221063] mdX: bitmap initialized from disk: read 1 pages, set 0
of 12800 bits
[   22.268401] RAID conf printout:
[   22.269163]  --- level:5 rd:5 wd:4
[   22.269887]  disk 0, o:1, dev:dm-12
[   22.270615]  disk 1, o:1, dev:dm-14
[   22.271344]  disk 2, o:1, dev:dm-16
[   22.272083]  disk 3, o:1, dev:dm-18
[   22.272809]  disk 4, o:1, dev:dm-20
[   22.273527] RAID conf printout:
[   22.274245]  --- level:5 rd:5 wd:4
[   22.274964]  disk 0, o:1, dev:dm-12
[   22.275718]  disk 1, o:1, dev:dm-14
[   22.276443]  disk 2, o:1, dev:dm-16
[   22.277168]  disk 3, o:1, dev:dm-18
[   22.277892]  disk 4, o:1, dev:dm-20
[   22.329640] mdX: bitmap initialized from disk: read 9 pages, set 11
of 273072 bits
[   22.364194] RAID conf printout:
[   22.364965]  --- level:6 rd:5 wd:4
[   22.365710]  disk 0, o:1, dev:dm-23
[   22.366452]  disk 1, o:1, dev:dm-25
[   22.367193]  disk 2, o:1, dev:dm-27
[   22.367936]  disk 3, o:1, dev:dm-29
[   22.368649]  disk 4, o:1, dev:dm-31
[   22.369345] RAID conf printout:
[   22.370045]  --- level:6 rd:5 wd:4
[   22.370741]  disk 0, o:1, dev:dm-23
[   22.371442]  disk 1, o:1, dev:dm-25
[   22.371980] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   22.372892]  disk 2, o:1, dev:dm-27
[   22.372959] md/raid:mdX: device dm-20 operational as raid disk 4
[   22.372962] md/raid:mdX: device dm-18 operational as raid disk 3
[   22.372965] md/raid:mdX: device dm-16 operational as raid disk 2
[   22.372967] md/raid:mdX: device dm-14 operational as raid disk 1
[   22.374081] md/raid:mdX: allocated 5432kB
[   22.374134] md/raid:mdX: raid level 5 active with 4 out of 5
devices, algorithm 2
[   22.374135] RAID conf printout:
[   22.374136]  --- level:5 rd:5 wd:4
[   22.374139]  disk 0, o:1, dev:dm-12
[   22.374141]  disk 1, o:1, dev:dm-14
[   22.374142]  disk 2, o:1, dev:dm-16
[   22.374144]  disk 3, o:1, dev:dm-18
[   22.374146]  disk 4, o:1, dev:dm-20
[   22.374263] created bitmap (7 pages) for device mdX
[   22.383979] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   22.384756]  disk 3, o:1, dev:dm-29
[   22.384880] md/raid:mdX: device dm-31 operational as raid disk 4
[   22.384883] md/raid:mdX: device dm-29 operational as raid disk 3
[   22.384885] md/raid:mdX: device dm-27 operational as raid disk 2
[   22.384887] md/raid:mdX: device dm-25 operational as raid disk 1
[   22.386223] md/raid:mdX: allocated 5432kB
[   22.386316] md/raid:mdX: raid level 6 active with 4 out of 5
devices, algorithm 8
[   22.386317] RAID conf printout:
[   22.386319]  --- level:6 rd:5 wd:4
[   22.386321]  disk 0, o:1, dev:dm-23
[   22.386323]  disk 1, o:1, dev:dm-25
[   22.386325]  disk 2, o:1, dev:dm-27
[   22.386328]  disk 3, o:1, dev:dm-29
[   22.386330]  disk 4, o:1, dev:dm-31
[   22.386602] created bitmap (134 pages) for device mdX
[   22.396184]  disk 4, o:1, dev:dm-31
[   22.461813] mdX: bitmap initialized from disk: read 1 pages, set 0
of 12800 bits
[   22.488736] mdX: bitmap initialized from disk: read 9 pages, set 11
of 273072 bits
[   22.496195] RAID conf printout:
[   22.497007]  --- level:5 rd:5 wd:4
[   22.497797]  disk 0, o:1, dev:dm-12
[   22.498580]  disk 1, o:1, dev:dm-14
[   22.499348]  disk 2, o:1, dev:dm-16
[   22.500109]  disk 3, o:1, dev:dm-18
[   22.500852]  disk 4, o:1, dev:dm-20
[   22.501590] RAID conf printout:
[   22.502334]  --- level:5 rd:5 wd:4
[   22.503084]  disk 0, o:1, dev:dm-12
[   22.503843]  disk 1, o:1, dev:dm-14
[   22.504598]  disk 2, o:1, dev:dm-16
[   22.505339]  disk 3, o:1, dev:dm-18
[   22.505464] RAID conf printout:
[   22.505465]  --- level:6 rd:5 wd:4
[   22.505467]  disk 0, o:1, dev:dm-23
[   22.505468]  disk 1, o:1, dev:dm-25
[   22.505468]  disk 2, o:1, dev:dm-27
[   22.505469]  disk 3, o:1, dev:dm-29
[   22.505470]  disk 4, o:1, dev:dm-31
[   22.505470] RAID conf printout:
[   22.505471]  --- level:6 rd:5 wd:4
[   22.505471]  disk 0, o:1, dev:dm-23
[   22.505472]  disk 1, o:1, dev:dm-25
[   22.505472]  disk 2, o:1, dev:dm-27
[   22.505473]  disk 3, o:1, dev:dm-29
[   22.505473]  disk 4, o:1, dev:dm-31
[   22.505839] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   22.506604] md/raid:mdX: device dm-20 operational as raid disk 4
[   22.506605] md/raid:mdX: device dm-18 operational as raid disk 3
[   22.506606] md/raid:mdX: device dm-16 operational as raid disk 2
[   22.506606] md/raid:mdX: device dm-14 operational as raid disk 1
[   22.507006] md/raid:mdX: allocated 5432kB
[   22.507100] md/raid:mdX: raid level 5 active with 4 out of 5
devices, algorithm 2
[   22.507100] RAID conf printout:
[   22.507101]  --- level:5 rd:5 wd:4
[   22.507102]  disk 0, o:1, dev:dm-12
[   22.507102]  disk 1, o:1, dev:dm-14
[   22.507103]  disk 2, o:1, dev:dm-16
[   22.507103]  disk 3, o:1, dev:dm-18
[   22.507104]  disk 4, o:1, dev:dm-20
[   22.507180] created bitmap (7 pages) for device mdX
[   22.526531]  disk 4, o:1, dev:dm-20
[   22.620047] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   22.622031] md/raid:mdX: device dm-31 operational as raid disk 4
[   22.623183] md/raid:mdX: device dm-29 operational as raid disk 3
[   22.624312] md/raid:mdX: device dm-27 operational as raid disk 2
[   22.625402] md/raid:mdX: device dm-25 operational as raid disk 1
[   22.626925] md/raid:mdX: allocated 5432kB
[   22.628064] md/raid:mdX: raid level 6 active with 4 out of 5
devices, algorithm 8
[   22.629009] RAID conf printout:
[   22.629910]  --- level:6 rd:5 wd:4
[   22.630831]  disk 0, o:1, dev:dm-23
[   22.631779]  disk 1, o:1, dev:dm-25
[   22.632711]  disk 2, o:1, dev:dm-27
[   22.633629]  disk 3, o:1, dev:dm-29
[   22.634515]  disk 4, o:1, dev:dm-31
[   22.636796] mdX: bitmap initialized from disk: read 1 pages, set 0
of 12800 bits
[   22.646606] created bitmap (134 pages) for device mdX
[   22.774922] RAID conf printout:
[   22.778002]  --- level:5 rd:5 wd:4
[   22.780222] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   22.782371] md/raid:mdX: device dm-20 operational as raid disk 4
[   22.782375] md/raid:mdX: device dm-18 operational as raid disk 3
[   22.782376] md/raid:mdX: device dm-16 operational as raid disk 2
[   22.782378] md/raid:mdX: device dm-14 operational as raid disk 1
[   22.783440] md/raid:mdX: allocated 5432kB
[   22.783528] md/raid:mdX: raid level 5 active with 4 out of 5
devices, algorithm 2
[   22.783529] RAID conf printout:
[   22.783530]  --- level:5 rd:5 wd:4
[   22.783533]  disk 0, o:1, dev:dm-12
[   22.783535]  disk 1, o:1, dev:dm-14
[   22.783536]  disk 2, o:1, dev:dm-16
[   22.783538]  disk 3, o:1, dev:dm-18
[   22.783540]  disk 4, o:1, dev:dm-20
[   22.783691] created bitmap (7 pages) for device mdX
[   22.827378]  disk 0, o:1, dev:dm-12
[   22.830360]  disk 1, o:1, dev:dm-14
[   22.833343]  disk 2, o:1, dev:dm-16
[   22.836324]  disk 3, o:1, dev:dm-18
[   22.839291]  disk 4, o:1, dev:dm-20
[   22.842268] RAID conf printout:
[   22.845243]  --- level:5 rd:5 wd:4
[   22.848219]  disk 0, o:1, dev:dm-12
[   22.851187]  disk 1, o:1, dev:dm-14
[   22.854168]  disk 2, o:1, dev:dm-16
[   22.857150]  disk 3, o:1, dev:dm-18
[   22.860128]  disk 4, o:1, dev:dm-20
[   22.886252] mdX: bitmap initialized from disk: read 9 pages, set 11
of 273072 bits
[   22.942007] RAID conf printout:
[   22.942775]  --- level:6 rd:5 wd:4
[   22.943519]  disk 0, o:1, dev:dm-23
[   22.944275]  disk 1, o:1, dev:dm-25
[   22.945026]  disk 2, o:1, dev:dm-27
[   22.945778]  disk 3, o:1, dev:dm-29
[   22.946525]  disk 4, o:1, dev:dm-31
[   22.946566] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   22.948052] RAID conf printout:
[   22.948713] md/raid:mdX: device dm-31 operational as raid disk 4
[   22.948716] md/raid:mdX: device dm-29 operational as raid disk 3
[   22.948718] md/raid:mdX: device dm-27 operational as raid disk 2
[   22.948720] md/raid:mdX: device dm-25 operational as raid disk 1
[   22.949769] md/raid:mdX: allocated 5432kB
[   22.949861] md/raid:mdX: raid level 6 active with 4 out of 5
devices, algorithm 8
[   22.949862] RAID conf printout:
[   22.949863]  --- level:6 rd:5 wd:4
[   22.949865]  disk 0, o:1, dev:dm-23
[   22.949867]  disk 1, o:1, dev:dm-25
[   22.949869]  disk 2, o:1, dev:dm-27
[   22.949871]  disk 3, o:1, dev:dm-29
[   22.949873]  disk 4, o:1, dev:dm-31
[   22.950025] created bitmap (134 pages) for device mdX
[   22.959856]  --- level:6 rd:5 wd:4
[   22.960632]  disk 0, o:1, dev:dm-23
[   22.961417]  disk 1, o:1, dev:dm-25
[   22.962202]  disk 2, o:1, dev:dm-27
[   22.962976]  disk 3, o:1, dev:dm-29
[   22.963741]  disk 4, o:1, dev:dm-31
[   22.995819] mdX: bitmap initialized from disk: read 1 pages, set 0
of 12800 bits
[   23.064183] RAID conf printout:
[   23.064992]  --- level:5 rd:5 wd:4
[   23.065759]  disk 0, o:1, dev:dm-12
[   23.066529]  disk 1, o:1, dev:dm-14
[   23.067288]  disk 2, o:1, dev:dm-16
[   23.068044]  disk 3, o:1, dev:dm-18
[   23.068773]  disk 4, o:1, dev:dm-20
[   23.069494] RAID conf printout:
[   23.070214]  --- level:5 rd:5 wd:4
[   23.070942]  disk 0, o:1, dev:dm-12
[   23.071678]  disk 1, o:1, dev:dm-14
[   23.072410]  disk 2, o:1, dev:dm-16
[   23.073140]  disk 3, o:1, dev:dm-18
[   23.073852]  disk 4, o:1, dev:dm-20
[   23.092536] mdX: bitmap initialized from disk: read 9 pages, set 11
of 273072 bits
[   23.137114] RAID conf printout:
[   23.137867]  --- level:6 rd:5 wd:4
[   23.138568]  disk 0, o:1, dev:dm-23
[   23.139254]  disk 1, o:1, dev:dm-25
[   23.139908] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[   23.140614] md/raid:mdX: device dm-31 operational as raid disk 4
[   23.140615] md/raid:mdX: device dm-29 operational as raid disk 3
[   23.140616] md/raid:mdX: device dm-27 operational as raid disk 2
[   23.140616] md/raid:mdX: device dm-25 operational as raid disk 1
[   23.140968] md/raid:mdX: allocated 5432kB
[   23.140994] md/raid:mdX: raid level 6 active with 4 out of 5
devices, algorithm 8
[   23.140995] RAID conf printout:
[   23.140996]  --- level:6 rd:5 wd:4
[   23.140996]  disk 0, o:1, dev:dm-23
[   23.140997]  disk 1, o:1, dev:dm-25
[   23.140997]  disk 2, o:1, dev:dm-27
[   23.140998]  disk 3, o:1, dev:dm-29
[   23.140999]  disk 4, o:1, dev:dm-31
[   23.141078] created bitmap (134 pages) for device mdX
[   23.150699]  disk 2, o:1, dev:dm-27
[   23.151431]  disk 3, o:1, dev:dm-29
[   23.152163]  disk 4, o:1, dev:dm-31
[   23.152891] RAID conf printout:
[   23.153608]  --- level:6 rd:5 wd:4
[   23.154328]  disk 0, o:1, dev:dm-23
[   23.155054]  disk 1, o:1, dev:dm-25
[   23.155782]  disk 2, o:1, dev:dm-27
[   23.156510]  disk 3, o:1, dev:dm-29
[   23.157239]  disk 4, o:1, dev:dm-31
[   23.231303] mdX: bitmap initialized from disk: read 9 pages, set 11
of 273072 bits
[   23.268732] RAID conf printout:
[   23.271825]  --- level:6 rd:5 wd:4
[   23.274840]  disk 0, o:1, dev:dm-23
[   23.277892]  disk 1, o:1, dev:dm-25
[   23.280934]  disk 2, o:1, dev:dm-27
[   23.283975]  disk 3, o:1, dev:dm-29
[   23.287011]  disk 4, o:1, dev:dm-31
[   23.289967] RAID conf printout:
[   23.292859]  --- level:6 rd:5 wd:4
[   23.295721]  disk 0, o:1, dev:dm-23
[   23.298602]  disk 1, o:1, dev:dm-25
[   23.301488]  disk 2, o:1, dev:dm-27
[   23.304381]  disk 3, o:1, dev:dm-29
[   23.307225]  disk 4, o:1, dev:dm-31
[   25.347855] EXT4-fs (dm-10): re-mounted. Opts: commit=30
[   26.164494] lp0: using parport0 (interrupt-driven).
[   26.784511] Adding 52428796k swap on /dev/mapper/vg0-swap.
Priority:1 extents:1 across:52428796k FS
[   27.008876] RAID conf printout:
[   27.013239]  --- level:5 rd:5 wd:4
[   27.017479]  disk 0, o:1, dev:dm-12
[   27.021743]  disk 1, o:1, dev:dm-14
[   27.026011]  disk 2, o:1, dev:dm-16
[   27.030281]  disk 3, o:1, dev:dm-18
[   27.034465]  disk 4, o:1, dev:dm-20
[   27.038567] RAID conf printout:
[   27.042659]  --- level:5 rd:5 wd:4
[   27.046757]  disk 0, o:1, dev:dm-12
[   27.050879]  disk 1, o:1, dev:dm-14
[   27.054919]  disk 2, o:1, dev:dm-16
[   27.058864]  disk 3, o:1, dev:dm-18
[   27.062902]  disk 4, o:1, dev:dm-20
[   27.095652] md: recovery of RAID array mdX
[   27.099718] md: minimum _guaranteed_  speed: 1000 KB/sec/disk.
[   27.103776] md: using maximum available idle IO bandwidth (but not
more than 200000 KB/sec) for recovery.
[   27.107947] md: using 128k window, over a total of 6553600k.
[   27.388104] RAID conf printout:
[   27.392766]  --- level:6 rd:5 wd:4
[   27.397066]  disk 0, o:1, dev:dm-23
[   27.401394]  disk 1, o:1, dev:dm-25
[   27.405729]  disk 2, o:1, dev:dm-27
[   27.410052]  disk 3, o:1, dev:dm-29
[   27.414325]  disk 4, o:1, dev:dm-31
[   27.418546] RAID conf printout:
[   27.422793]  --- level:6 rd:5 wd:4
[   27.427063]  disk 0, o:1, dev:dm-23
[   27.431337]  disk 1, o:1, dev:dm-25
[   27.435587]  disk 2, o:1, dev:dm-27
[   27.439780]  disk 3, o:1, dev:dm-29
[   27.443974]  disk 4, o:1, dev:dm-31
[   27.554472] md: recovery of RAID array mdX
[   27.555767] md: minimum _guaranteed_  speed: 1000 KB/sec/disk.
[   27.557055] md: using maximum available idle IO bandwidth (but not
more than 200000 KB/sec) for recovery.
[   27.558369] md: using 128k window, over a total of 139812864k.
[   28.910683] EXT4-fs (dm-21): mounted filesystem with ordered data
mode. Opts: commit=30
[   29.243594] EXT4-fs (dm-32): mounted filesystem with ordered data
mode. Opts: commit=30
[   29.512289] EXT4-fs (dm-45): mounted filesystem with ordered data
mode. Opts: commit=30
[   29.821020] EXT4-fs (dm-72): mounted filesystem with ordered data
mode. Opts: commit=30
[   36.737943] RPC: Registered named UNIX socket transport module.
[   36.739182] RPC: Registered udp transport module.
[   36.740371] RPC: Registered tcp transport module.
[   36.741532] RPC: Registered tcp NFSv4.1 backchannel transport module.
[   36.911395] FS-Cache: Loaded
[   36.991673] FS-Cache: Netfs 'nfs' registered for caching
[   37.069258] Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
[   37.907493] tty_warn_deprecated_flags: 'setserial' is using
deprecated serial flags (with no effect): 00000100
[   37.916551] tty_warn_deprecated_flags: 'setserial' is using
deprecated serial flags (with no effect): 00000100
[   37.921331] ttyS1: LSR safety check engaged!
[   37.927709] ttyS1: LSR safety check engaged!
[   38.469410] ip_tables: (C) 2000-2006 Netfilter Core Team
[   38.557613] nf_conntrack version 0.5.0 (65536 buckets, 262144 max)
[   38.988520] NET: Registered protocol family 15
[   39.049509] ip6_tables: (C) 2000-2006 Netfilter Core Team
[   39.589166] CPU feature 'AVX registers' is not supported.
[   39.916234] CPU feature 'AVX registers' is not supported.
[   39.946220] CPU feature 'AVX registers' is not supported.
[   40.054316] AVX or AES-NI instructions are not detected.
[   40.093111] AVX or AES-NI instructions are not detected.
[   40.269264] CPU feature 'AVX registers' is not supported.
[   40.345409] alg: No test for fips(ansi_cprng) (fips_ansi_cprng)
[  141.709971] md: mdX: recovery done.
[  142.199299] RAID conf printout:
[  142.204926]  --- level:5 rd:5 wd:5
[  142.210817]  disk 0, o:1, dev:dm-12
[  142.210820]  disk 1, o:1, dev:dm-14
[  142.210830]  disk 2, o:1, dev:dm-16
[  142.210833]  disk 3, o:1, dev:dm-18
[  142.210835]  disk 4, o:1, dev:dm-20
[  715.771856] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[  715.777241] md/raid:mdX: device dm-20 operational as raid disk 4
[  715.781360] md/raid:mdX: device dm-18 operational as raid disk 3
[  715.785436] md/raid:mdX: device dm-16 operational as raid disk 2
[  715.789512] md/raid:mdX: device dm-14 operational as raid disk 1
[  715.794714] md/raid:mdX: allocated 5432kB
[  715.798979] md/raid:mdX: raid level 5 active with 4 out of 5
devices, algorithm 2
[  715.800083] RAID conf printout:
[  715.801052]  --- level:5 rd:5 wd:4
[  715.802023]  disk 0, o:1, dev:dm-12
[  715.802980]  disk 1, o:1, dev:dm-14
[  715.803933]  disk 2, o:1, dev:dm-16
[  715.804879]  disk 3, o:1, dev:dm-18
[  715.805826]  disk 4, o:1, dev:dm-20
[  715.806882] created bitmap (7 pages) for device mdX
[  715.989282] mdX: bitmap initialized from disk: read 1 pages, set 0
of 12800 bits
[  716.364781] RAID conf printout:
[  716.366354]  --- level:5 rd:5 wd:4
[  716.367883]  disk 0, o:1, dev:dm-12
[  716.369390]  disk 1, o:1, dev:dm-14
[  716.370902]  disk 2, o:1, dev:dm-16
[  716.372408]  disk 3, o:1, dev:dm-18
[  716.373913]  disk 4, o:1, dev:dm-20
[  716.375415] RAID conf printout:
[  716.376909]  --- level:5 rd:5 wd:4
[  716.378406]  disk 0, o:1, dev:dm-12
[  716.379916]  disk 1, o:1, dev:dm-14
[  716.381426]  disk 2, o:1, dev:dm-16
[  716.382941]  disk 3, o:1, dev:dm-18
[  716.384452]  disk 4, o:1, dev:dm-20
[ 2918.216811] md: mdX: recovery done.
[ 2920.818662] RAID conf printout:
[ 2920.820352]  --- level:6 rd:5 wd:5
[ 2920.821999]  disk 0, o:1, dev:dm-23
[ 2920.823669]  disk 1, o:1, dev:dm-25
[ 2920.825358]  disk 2, o:1, dev:dm-27
[ 2920.827054]  disk 3, o:1, dev:dm-29
[ 2920.828741]  disk 4, o:1, dev:dm-31
[ 3174.609445] device-mapper: raid: Device 0 specified for rebuild:
Clearing superblock
[ 3174.612166] md/raid:mdX: device dm-20 operational as raid disk 4
[ 3174.614110] md/raid:mdX: device dm-18 operational as raid disk 3
[ 3174.616053] md/raid:mdX: device dm-16 operational as raid disk 2
[ 3174.617981] md/raid:mdX: device dm-14 operational as raid disk 1
[ 3174.620972] md/raid:mdX: allocated 5432kB
[ 3174.622934] md/raid:mdX: raid level 5 active with 4 out of 5
devices, algorithm 2
[ 3174.623545] RAID conf printout:
[ 3174.624141]  --- level:5 rd:5 wd:4
[ 3174.624748]  disk 0, o:1, dev:dm-12
[ 3174.625364]  disk 1, o:1, dev:dm-14
[ 3174.625982]  disk 2, o:1, dev:dm-16
[ 3174.626587]  disk 3, o:1, dev:dm-18
[ 3174.627189]  disk 4, o:1, dev:dm-20
[ 3174.627901] created bitmap (7 pages) for device mdX
[ 3174.643938] mdX: bitmap initialized from disk: read 1 pages, set 0
of 12800 bits
[ 3174.665916] RAID conf printout:
[ 3174.668195]  --- level:5 rd:5 wd:4
[ 3174.670411]  disk 0, o:1, dev:dm-12
[ 3174.672632]  disk 1, o:1, dev:dm-14
[ 3174.674952]  disk 2, o:1, dev:dm-16
[ 3174.677182]  disk 3, o:1, dev:dm-18
[ 3174.679416]  disk 4, o:1, dev:dm-20
[ 3174.681651] RAID conf printout:
[ 3174.683901]  --- level:5 rd:5 wd:4
[ 3174.686178]  disk 0, o:1, dev:dm-12
[ 3174.688492]  disk 1, o:1, dev:dm-14
[ 3174.690816]  disk 2, o:1, dev:dm-16
[ 3174.693154]  disk 3, o:1, dev:dm-18
[ 3174.695465]  disk 4, o:1, dev:dm-20
