Return-Path: <tandem@dnmi.no>
Subject: Re: [linux-lvm] Request for misalignment tests
References: <20010626161947.A11918@sistina.com>
From: Adrian Phillips <a.phillips@dnmi.no>
Date: 27 Jun 2001 07:11:14 +0200
In-Reply-To: Heinz Mauelshagen's message of "Tue, 26 Jun 2001 16:19:47 -0500"
Message-ID: <wvofrao6bx.fsf@freeze.oslo.dnmi.no>
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "Heinz" == Heinz Mauelshagen <mauelshagen@sistina.com> writes:

    Heinz> All,

    Heinz> we need your help in regard to the misalignment problems we
    Heinz> are trying to fix right now in order to get facts
    Heinz> concerning how many people are actually suffering from it.


    Heinz> In case you created VGs or extended them with LVM 0.9.1
    Heinz> Beta 6 or 7, we'd appreciate if you could send us the
    Heinz> output (if any) of

    Heinz>    pvdisplay -v /dev/YourPVname | grep "^ *00000"

    Heinz> if the sector offset in the last column is odd.

    Heinz> If so, please add a "pvdisplay /dev/YourPVname" as well.

Linux dusk 2.2.20pre2 #1 Tue Jun 12 10:17:08 CEST 2001 i686 unknown
(patched with reiserfs 3.5.32, lvm 0.9.1beta7)

ii  lvm            0.9.1beta7-1   The Logical Volume Manager for Linux

dusk:~# pvdisplay -v /dev/rd/c0d0p2 | grep "^ *00000"
   00000 /dev/rootvg/tmplv         00000   537
--- Physical volume ---
PV Name               /dev/rd/c0d0p2
VG Name               rootvg
PV Size               34.02 GB / NOT usable 268 KB [LVM: 155 KB]
PV#                   1
PV Status             available
Allocatable           yes
Cur LV                6
PE Size (KByte)       4096
Total PE              8709
Free PE               7909
Allocated PE          800
PV UUID               YZtLqC-1ETn-hEqv-cfm2-OUCD-vF0p-IC1ur0

***** DAC960 RAID Driver Version 2.2.10 of 1 February 2001 *****
Copyright 1998-2001 by Leonard N. Zubkoff <lnz@dandelion.com>
Configuring Mylex AcceleRAID 170 PCI RAID Controller
  Firmware Version: 6.00-01, Channels: 1, Memory Size: 32MB
  PCI Bus: 0, Device: 9, Function: 1, I/O Address: Unassigned
  PCI Address: 0xE6800000 mapped at 0xD0803000, IRQ Channel: 11
  Controller Queue Depth: 512, Maximum Blocks per Command: 2048
  Driver Queue Depth: 511, Scatter/Gather Limit: 128 of 257 Segments
  Physical Devices:
    0:0  Vendor: IBM       Model: DDYS-T18350M      Revision: S93E
         Wide Synchronous at 40 MB/sec
         Serial Number:         4EY9B929
         Disk Status: Online, 35807232 blocks
    0:1  Vendor: IBM       Model: DDYS-T18350M      Revision: S93E
         Wide Synchronous at 40 MB/sec
         Serial Number:         4EY99390
         Disk Status: Online, 35807232 blocks
    0:2  Vendor: IBM       Model: DDYS-T18350M      Revision: S93E
         Wide Synchronous at 40 MB/sec
         Serial Number:         4EY9F875
         Disk Status: Online, 35807232 blocks
    0:7  Vendor: MYLEX     Model: AcceleRAID 170    Revision: 0600
         Wide Synchronous at 160 MB/sec
         Serial Number:   
  Logical Drives:
    /dev/rd/c0d0: RAID-5, Online, 71614464 blocks
                  Logical Device Initialized, BIOS Geometry: 255/63
                  Stripe Size: 64KB, Segment Size: 8KB
                  Read Cache Disabled, Write Cache Disabled
  No Rebuild or Consistency Check in Progress

Let me know if you need more info. Note, that I've not noticed any
problems.

Sincerely,

Adrian Phillips

-- 
Your mouse has moved.
Windows NT must be restarted for the change to take effect.
Reboot now?  [OK]
