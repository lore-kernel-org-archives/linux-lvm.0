Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8QERWfN030236
	for <linux-lvm@redhat.com>; Tue, 26 Sep 2006 10:27:32 -0400
Received: from wx-out-0506.google.com (wx-out-0506.google.com [66.249.82.238])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k8QERQmO032647
	for <linux-lvm@redhat.com>; Tue, 26 Sep 2006 10:27:26 -0400
Received: by wx-out-0506.google.com with SMTP id i30so4038218wxd
	for <linux-lvm@redhat.com>; Tue, 26 Sep 2006 07:27:21 -0700 (PDT)
Message-ID: <625ccb870609260727n55f0cae9ga67efc01dda6779@mail.gmail.com>
Date: Tue, 26 Sep 2006 22:27:20 +0800
From: "bowen zheng" <linuzboy@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] I found some error messages, In the dmesg,
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

I found some error messages, In the dmesg,  Maybe it's useful for you
to diagnose the problem!
.......
hda: Host Protected Area disabled.
hda: 39102336 sectors (20020 MB) w/2048KiB Cache, CHS=38792/16/63, UDMA(100)
hda: cache flushes not supported
hda: hda1 hda2 hda3 hda4 < hda5 hda6 hda7 >
hdb: max request size: 128KiB
hdb: 78165360 sectors (40020 MB) w/2048KiB Cache, CHS=65535/16/63, UDMA(100)
hdb: cache flushes not supported
 hdb: hdb1 hdb2 < hdb5 hdb6 hdb7 >
hdc: ATAPI 48X CD-ROM drive, 120kB Cache, UDMA(33)
Uniform CD-ROM driver Revision: 3.20
device-mapper: 4.6.0-ioctl (2006-02-17) initialised: dm-devel@redhat.com
ide-cd: cmd 0x28 timed out
hdc: DMA interrupt recovery
hdc: lost interrupt
hdc: status timeout: status=0xd0 { Busy }
ide: failed opcode was: unknown
hdc: DMA disabled
hdc: drive not ready for command
hdc: ATAPI reset complete
device-mapper: snapshot is marked invalid
Attempting manual resume
SGI XFS with ACLs, security attributes, realtime, large block numbers,
no debug enabled
SGI XFS Quota Management subsystem
XFS mounting filesystem dm-9
Ending clean XFS mount for filesystem: dm-9
00:01: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
00:02: ttyS1 at I/O 0x2f8 (irq = 3) is a 16550A
Linux agpgart interface v0.101 (c) Dave Jones
agpgart: Detected an Intel i845 Chipset.
agpgart: AGP aperture is 64M @ 0xf4000000
PCI: Setting latency timer of device 0000:00:1f.5 to 64
Real Time Clock Driver v1.12ac
input: PC Speaker as /class/input/input1
intel8x0_measure_ac97_clock: measured 55789 usecs
intel8x0: clocking to 41145
Intel 810 + AC97 Audio, version 1.01, 16:56:33 Sep 13 2006
pci_hotplug: PCI Hot Plug PCI Core version: 0.5
shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
hw_random: RNG not detected
Floppy drive(s): fd0 is 1.44M
FDC 0 is a post-1991 82077
parport: PnPBIOS parport detected.
parport0: PC-style at 0x378 (0x778), irq 7, using FIFO
[PCSPP,TRISTATE,COMPAT,ECP]
input: ImExPS/2 Generic Explorer Mouse as /class/input/input2
ts: Compaq touchscreen protocol output
mice: PS/2 mouse device common for all mice
Filesystem "dm-9": Disabling barriers, not supported by the underlying device
loop: loaded (max 8 devices)
Filesystem "dm-6": Disabling barriers, not supported by the underlying device
XFS mounting filesystem dm-6
Ending clean XFS mount for filesystem: dm-6
Filesystem "dm-3": Disabling barriers, not supported by the underlying device
XFS mounting filesystem dm-3
Ending clean XFS mount for filesystem: dm-3
Filesystem "dm-2": Disabling barriers, not supported by the underlying device
XFS mounting filesystem dm-2
Ending clean XFS mount for filesystem: dm-2
Filesystem "dm-1": Disabling barriers, not supported by the underlying device
XFS mounting filesystem dm-1
Ending clean XFS mount for filesystem: dm-1
Filesystem "dm-4": Disabling barriers, not supported by the underlying device
XFS mounting filesystem dm-4
Ending clean XFS mount for filesystem: dm-4
Filesystem "dm-7": Disabling barriers, not supported by the underlying device
XFS mounting filesystem dm-7
Ending clean XFS mount for filesystem: dm-7
Filesystem "dm-5": Disabling barriers, not supported by the underlying device
XFS mounting filesystem dm-5
Ending clean XFS mount for filesystem: dm-5
Adding 1023992k swap on /dev/mapper/diskvg-swaplv.  Priority:-1
extents:1 across:1023992k
eth0:  setting full-duplex.
NET: Registered protocol family 10
lo: Disabled Privacy Extensions
IPv6 over IPv4 tunneling driver
eth0: no IPv6 routers present
Buffer I/O error on device dm-11, logical block 765936
Buffer I/O error on device dm-11, logical block 765936
Buffer I/O error on device dm-11, logical block 0
Buffer I/O error on device dm-11, logical block 1
Buffer I/O error on device dm-11, logical block 2
Buffer I/O error on device dm-11, logical block 3
Buffer I/O error on device dm-11, logical block 4
Buffer I/O error on device dm-11, logical block 5
Buffer I/O error on device dm-11, logical block 6
Buffer I/O error on device dm-11, logical block 7
printk: 10 messages suppressed.
Buffer I/O error on device dm-11, logical block 765936
Buffer I/O error on device dm-11, logical block 765936
XFS: unknown mount option [uuid].







2006/9/26, bowen zheng <linuzboy@gmail.com>:
> I try to use lvchange -ay to reactive the lv, but it shows error!
>
>
> shell> lvchange -ay /dev/diskvg/lvsnapshot
>  /dev/diskvg/lvsnapshot: read failed after 0 of 4096 at 0: Input/output error
>  Can't change snapshot logical volume "lvsnapshot"
>
> shell> lvchange -ay /dev/diskvg/rootlv
>  /dev/diskvg/lvsnapshot: read failed after 0 of 4096 at 0: Input/output error
>
>
>
> 2006/9/26, bowen zheng <linuzboy@gmail.com>:
> > Everything seems to work fine. But I found this
> >
> >
> > shell> lvscan
> >  /dev/diskvg/lvsnapshot: read failed after 0 of 4096 at 0: Input/output error
> > ..................
> >  inactive Original '/dev/diskvg/rootlv' [2.92 GB] inherit
> >  inactive Snapshot '/dev/diskvg/lvsnapshot' [100.00 MB] inherit
> > ........
> >
> > How can I active the rootlv and lvsnapshort. And what does the inactive mean?
> >
> > When I mount the lvsnapshort, and backup it. It always shows many IO
> > errors (both use tar and rsync).  How do I backup the lvsnapshort.
> >
> >
> > Thanks....
> >
>
