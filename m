Received: from o.ww.redhat.com (vpnuser1.stuttgart.redhat.com [172.16.4.1])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id i1R9tVoH002242
	for <linux-lvm@redhat.com>; Fri, 27 Feb 2004 10:55:32 +0100
From: Heinz Mauelshagen <Mauelshagen@redhat.com>
Subject: Re: [linux-lvm] ReCreating the 1st 512 bytes of PV
Message-ID: <20040227095531.GA8688@redhat.com>
References: <5643332$1077818466403e34629ed435.76339021@config10.schlund.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5643332$1077818466403e34629ed435.76339021@config10.schlund.de>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Fri Feb 27 04:54:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Thu, Feb 26, 2004 at 07:12:02PM +0100, lvm-list.mail@nex-consult.com wrote:
> 
> Hi All:
> 
> While freeing my System from Windows (parallel installation)
> the Win. - HardDisk-Managagement tool informed me that something has
> been "corrected" on a disk partition. (My Linux LVM - device!)

Nice, isn't it ?

> 
> /dev/hda5 contains one Volume Group "vg00" and the Logical Volumes
> "lvol01", "lvol02" and "lvol03"
> 
> It seems to be a Windows boot sector or something like this, because of
> "55aa" ??

It is an obviously empty one with the 'magic' number at the end.

> 
> In the following the 1st 512 bytes of my /dev/hda5 
> ****************
> 0000000: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 0000010: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 0000020: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 0000030: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 0000040: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 0000050: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 0000060: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 0000070: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 0000080: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 0000090: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 00000a0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 00000b0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 00000c0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 00000d0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 00000e0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 00000f0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 0000100: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 0000110: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 0000120: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 0000130: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 0000140: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 0000150: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 0000160: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 0000170: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 0000180: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 0000190: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 00001a0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 00001b0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 00001c0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 00001d0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 00001e0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 00001f0: 0000 0000 0000 0000 0000 0000 0000 55aa  ..............U.
> ****************
> 
> I've tryed to fix it manually by comparing the bytes with another
> system.
> Now, the modified version:
> 
> ****************
> 0000000: 484d 0100 0000 0000 0004 0000 0010 0000  HM..............
> 0000010: 0010 0000 0020 0000 8080 0000 00b0 0000  ..... ..........
> 0000020: 4849 0100 0000 0200 0000 4100 3030 3030  HI........A.0000
> 0000030: 3131 3131 3232 3232 3333 3333 3434 3434  1111222233334444
> 0000040: 3535 3535 3636 3636 3737 3737 0000 0000  555566667777....
> 0000050: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 0000060: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 0000070: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 0000080: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 0000090: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 00000a0: 0000 0000 0000 0000 0000 0000 7667 3030  ............vg00
> 00000b0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 00000c0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 00000d0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 00000e0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 00000f0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 0000100: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 0000110: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 0000120: 0000 0000 0000 0000 0000 0000 7468 6567  ............theg
> 0000130: 6174 6531 3037 3735 3535 3239 3000 0000  ate1077555290...
> 0000140: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 0000150: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 0000160: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 0000170: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 0000180: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 0000190: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 00001a0: 0000 0000 0000 0000 0000 0000 0300 0000  ................
> 00001b0: 0100 0000 0100 0000 0200 0000 0bb6 fd00  ................
> 00001c0: 0100 0000 0020 0000 ee07 0000 ee07 0000  ..... ..........
> 00001d0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 00001e0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 00001f0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
> 
> ****************
> 
> --> now I can see more, but it doesn?t work.
> 
> 
> root@0[hda7]# pvdisplay  /dev/hda5
> --- Physical volume ---
> PV Name               /dev/hda5
> VG Name               vg00
> PV Size               7.93 GB [16627211 secs] / NOT usable 4.19 MB [LVM:
> 135 KB]
> PV#                   1
> PV Status             available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              2030
> Free PE               0
> Allocated PE          2030
> PV UUID               000011-1122-2233-3344-4455-5566-667777

The Total PE don't fit the PV Size. Only be 2028 PE fit onto the device.

> 
> 
> ****************
> 
> root@0[hda7]# vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- ERROR "pv_read_all_pv_of_vg(): no PV" can't get data of volume
> group "vg00" from physical volume(s)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume
> group
> 
> 
> ****************
> root@0[hda7]# lvmdiskscan
> lvmdiskscan -- reading all disks / partitions (this may take a while...)
> lvmdiskscan -- /dev/hda1  [       4.88 GB] Primary   [0x07]
> lvmdiskscan -- /dev/hda2  [      32.37 GB] Primary   [0x0F]
> lvmdiskscan -- /dev/hda5  [       7.93 GB] Extended LVM partition [0x8E]
> lvmdiskscan -- /dev/hda6  [      31.38 MB] Extended LINUX native
> partition [0x83]
> lvmdiskscan -- /dev/hda7  [      24.41 GB] Extended LINUX native
> partition [0x83]
> lvmdiskscan -- 1 disk
> lvmdiskscan -- 0 whole disks
> lvmdiskscan -- 0 loop devices
> lvmdiskscan -- 0 multiple devices
> lvmdiskscan -- 0 network block devices
> lvmdiskscan -- 5 partitions
> lvmdiskscan -- 1 LVM physical volume partition
> ****************
> 
> I?ve found "/etc/lvmtab.d/vg00", "/etc/lvmconf/vg00.conf" and
> "/etc/lvmtab" on a backup 
> (which doesn?t contain my real important data)
> 
> But: 
> 
> root@0[hda7]# vgcfgrestore -n vg00 /dev/hda5
> vgcfgrestore -- INFO: using backup file "/etc/lvmconf/vg00.conf"
> vgcfgrestore -- ERROR: different structure size stored in
> "/etc/lvmconf/vg00.conf" than expected in file vg_cfgrestore.c [line
> 120]
> vgcfgrestore -- ERROR "vg_cfgrestore(): read" restoring volume group
> "vg00"
> ****************

This must be a rather old metadata backup when you hit this problem
of changed structure sizes.
You need an actual metadata backup or the vgcfgrestore you took the backup with
in order to restore the old one.

> 
> .. to locate the file-systems directly on /dev/hda5/, "dd" them into a
> file and mount it as loop-back-device works 
> slightly, but contains only a few usable data (after fsck.reiserfs
> --rebuilt-tree), mostly only files with crap content.

You started with the wrong offset and/or have a non-trivial mapping
where logical extents and physical extents ar not in order.


Summary:

a) if you have an *actual* metadata backup, restore it.

b) if not, use the LVM tool version you used for the metadata backup
   to vgcfgrestore it (mind to "pvcreate -ff /dev/hda5" before vgcfgrestore).

c) if you have a sequential 1:1 mapping, find the correct offset of the
   first extent and retry dd'ing data off hda5

> 
> 
> ****************
> 
> Could someone help me please ???!!!??????
> 
> 
> Thanks & Regards
> Tobias Katzer
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
