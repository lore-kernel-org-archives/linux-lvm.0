Return-Path: <root@srv.sistina.com>
Date: Tue, 6 Feb 2001 12:01:29 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgscan -- ERROR -132: volume group "vgall" is inconsistent
Message-ID: <20010206120129.F8914@srv.sistina.com>
References: <3A7B931E.EACE50A7@cs.tu-berlin.de>
Mime-Version: 1.0
In-Reply-To: <3A7B931E.EACE50A7@cs.tu-berlin.de>; from wipeout@cs.tu-berlin.de on Sat, Feb 03, 2001 at 06:11:59AM +0100
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

Hi Andreas.

First of all: if you still have your /etc/lvmconf/vgall.conf and/or
/etc/lvmconf/vgall.conf.[0-9*].old in place you have good luck ;-)

Hack to activate your VG agian:

Figure out which one of the above files is a valid metadata backup of your VG.
You can achive that by using "vgcfgrestore -ll -n vgall -f /etc/lvmconf/X".
Put in one of the above file names for X and check the output for valid PVs
and LVs.

If you found the correct one copy it to /etc/lvmtab.d/vgall and
do an "echo -ne 'vgall\0' > /etc/lvmtab;vgchange -ay" in order to activate
your VG.

The bug you are facing with vgscan should already be fixed with LVM 0.9.1 beta3
which you can get from www.sistina.com.

Cheers,
Heinz


On Sat, Feb 03, 2001 at 06:11:59AM +0100, Andreas Martin wrote:
> Hi there.
> I got a incredible lvm inconsistency simply by trying to remove two
> logical volumes with yast1.
> I can exactly describe what I did:
> 
> I'm running Suse 7.0 with Kernel 2.2, all partitions are listed below:
> 
> lvmdiskscan -- reading all disks / partitions (this may take a while...)
> 
> lvmdiskscan -- /dev/hda1 [       10.3 MB] Primary  LINUX native
> partition [0x83]
> lvmdiskscan -- /dev/hda2 [        1.9 GB] DOS extended partition [0x5]
> lvmdiskscan -- /dev/hda3 [      17.18 GB] Primary  LVM partition [0x8E]
> lvmdiskscan -- /dev/hda5 [       1.77 GB] Extended LINUX native
> partition [0x83]
> lvmdiskscan -- /dev/hda6 [     127.45 MB] Extended  [0x82]
> lvmdiskscan -- /dev/hdc1 [      38.16 GB] Primary  LVM partition [0x8E]
> lvmdiskscan -- /dev/hdd1 [      76.34 GB] Primary  LVM partition [0x8E]
> lvmdiskscan -- 3 disks
> lvmdiskscan -- 0 whole disks
> lvmdiskscan -- 0 loop devices
> lvmdiskscan -- 0 multiple devices
> lvmdiskscan -- 0 network block devices
> lvmdiskscan -- 7 partitions
> lvmdiskscan -- 3 LVM physical volume partitions
> 
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/hda3"  is associated to an unknown VG (run
> vgscan)
> pvscan -- inactive PV "/dev/hdc1"  is associated to an unknown VG (run
> vgscan)
> pvscan -- inactive PV "/dev/hdd1"  is associated to an unknown VG (run
> vgscan)
> pvscan -- total: 3 [131.67 GB] / in use: 3 [131.67 GB] / in no VG: 0 [0]
> 
> I had a VG called vgall containing /dev/hda3 /dev/hdc1 and /dev/hdd1
> with 3 LVs in it
> /dev/vgall/music    [~120GB]
> /dev/vgall/data       [~10GB]
> /dev/vgall/backup  [~10GB]
> 
> All three LVs containing reiserfs.
> 
> /dev/vgall/data    and /dev/vgall/backup  were both empty, so I wanted
> to remove them.
> Therefor I deactivated all three LVs and the VG vgall. Because I was
> lazy I wanted to remove
> the two LVs with yast1. Trying to remove LV data and backup, yast
> returned an error code.
> I quit yast and tried to mount the old LVs, they were unmountable and
> unremovable:
> lvremove -- ERROR: "/etc/lvmtab.d" doesn't exist; please run vgscan
> 
> But vgscan leads to:
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found inactive volume group "vgall"
> vgscan -- ERROR -132: volume group "vgall" is inconsistent
> vgscan -- ERROR: unable to do a backup of volume group "vgall"
> vgscan --  successfully created
> vgscan -- WARNING: you may not have an actual backup of your volume
> group
> 
> Unfortunately "/etc/lvmtab" and "/etc/lvmtab.d" still don't exist.
> pvdata reports a lot of "pvdata -- logical volume struct at offset 189
> is inconsistent"
> on /dev/hda3 and /dev/hdc1. (/dev/hdd1 is ok, there should be the major
> part of the LV /vgall/music)
> When calling the lvm - configurator in yast1, yast quits with a
> segmentation fault.
> What went wrong, and is there any way to save my data at
> /dev/vgall/music?
> 
> Thanks a lot for any comments,
> Best Regards,
> 
> Andreas Martin.
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
