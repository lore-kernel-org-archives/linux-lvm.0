From: "yves.alloyer" <Yves.ALLOYER@slpinfoware.com>
Message-Id: <NEBBLHFAEINCLDICDLOAAEIACIAA.yves.alloyer@slpinfoware.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
In-Reply-To: <20011122041320.A1447@sky.net>
Subject: [linux-lvm] =?iso-8859-1?Q?RE:_=5Blinux-lvm=5D_lvm_problem_..._can=B4t_describe_it_sh?==?iso-8859-1?Q?ortely?=
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
Date: Thu Nov 22 04:12:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

vgscan scans drives in sequence. It takes the first drive mentioning a vg to
get the list of pvs for that vg. If you have stale pv info on a drive that
gets scanned early, you won't be able to activate the vg. I ran into this
before.
I used pvdisplay on drives/partitions to see the info. Then I nuked the
stale pv info.
	dd if=/dev/zero of=/dev/<pv> bs=512 count=1
does the trick.
Be careful not to run that on the whole disk, but on the partition if you
have partitions, you'd loose them.
Be careful also not to run that on any current pv.
AFAIK IDE drives get scanned before SCSI drives, so old /dev/hdb1 might be
the culprit.
You definitely should have no pv info on old /dev/sdc1 nor old /dev/hdb1
(Not sure what their names are now).
If pvdisplay on old, phased out pv, complains, you may want to try (assuming
you run 1.0.1rc4):
	dd if=/dev/<pv> bs=512 count=1|od -c
If the output looks like
	0000000   H   M
	... (snip 5 lines)
	0000240   (snip 12 positions) v   g   0   1
	0000260   \0 (snip rest of line)
Then you need to nuke the pv info.
Still new to this, somebody correct me if I'm wrong.

Good luck,
Yves

> -----Original Message-----
> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of Ulrich Wiederhold
> Sent: Thursday, November 22, 2001 4:13 AM
> To: linux-lvm@sistina.com
> Subject: [linux-lvm] lvm problem ... can�t describe it shortely
>
>
> Hello,
> I am using 2.4.14 with lvm and xfs patched.
>
> I used
> /dev/hda2 [20GB]
> /dev/hdb1 [8.5GB]
> /dev/hdd1 [10,5GB]
> /dev/sdb1 [9GB]
> /dev/sdc1 [4,5GB]
>
> In a volume group vg01 with 3 lv�s.
>
> Now I added another SCSI disk as /dev/sdd5 to my system, created the
> partition with 8e type, did a "pvcreate /dev/sdd5", "vgextend vg01
> /dev/sdd5", "pvmove /dev/sdc1 /dev/sdd5", "vgreduce vg01 /dev/sdc1".
> Same procedure with /dev/hdb1.
>
> Then I shutdown my PC, removed the 2 disks and added a new IDE HD as
> /dev/hda2 [80GB]
> /dev/hdb2 [the old /dev/hda2]
> /dev/hdd1
> /dev/sdb1
> /dev/sdc5 [the new SCSI disk instead of the old one, was /dev/sdd5]
>
> I rebooted and created a new pv with my new HD (/dev/hda3), created a
> new vg called store and a new lv called data. Then I copied all my data
> stored on a non-lvm volume (/dev/hdc1) to the new lvm drive
> (/dev/store/data), created a new pv (pvcreate /dev/hdc1), extended the
> vg store and extended the lv.
>
> Now I want to activate my old vg01 and vgscan only finds the new volume
> group store.
>
> I used uuid_fixer on every device
> " uuid_fixer /dev/hdd1 /dev/hdb2 /dev/sdb1 /dev/sdc5 /dev/sdb1 - Success"
>
> $# pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/hdc1" of VG "store" [57.25 GB / 0
> free]     #correct
> pvscan -- inactive PV "/dev/hdd1"  is associated to an unknown VG
> (run vgscan)
> pvscan -- inactive PV "/dev/hda3" of VG "store" [76.07 GB / 0
> free]     #correct
> pvscan -- inactive PV "/dev/hdb2"  is associated to an unknown VG
> (run vgscan)
> pvscan -- inactive PV "/dev/sdb1" is in no VG  [8.51 GB]                #
> pvscan -- inactive PV "/dev/sdc5"  is associated to an unknown VG
> (run vgscan)
> pvscan -- total: 6 [187.49 GB] / in use: 5 [178.98 GB] / in no VG: 1
> [8.51 GB]
>
>
> vgscan still only finds the vg store, so I tryed to use vgcfgrestore to
> get my vg01 back:
>
> $# vgcfgrestore -n vg01 -l
> --- Volume group ---
> VG Name               vg01
> VG Access             read/write
> VG Status             NOT available/resizable
> VG #                  0
> MAX LV                256
> Cur LV                3
> Open LV               0
> MAX LV Size           255.99 GB
> Max PV                256
> Cur PV                4
> Act PV                4
> VG Size               53.51 GB
> PE Size               4.00 MB
> Total PE              13698
> Alloc PE / Size       12583 / 49.15 GB
> Free  PE / Size       1115 / 4.36 GB
> VG UUID               p8KJS0-eei7-s10H-61hT-7uJS-Euiq-bXhlNs
>
>
> This seems to be correct for me.
> So I tryed the restore:
>
> $# vgcfgrestore -f /etc/lvmconf/vg01.conf -n vg01 /dev/sdc5
> vgcfgrestore -- physical volume "/dev/sdc5" doesn't belong to volume
> group "vg01"
>
> $# vgcfgrestore -f /etc/lvmconf/vg01.conf -n vg01 /dev/sdb1
> vgcfgrestore -- physical volume "/dev/sdb1" doesn't belong to volume
> group "vg01"
>
> $# vgcfgrestore -f /etc/lvmconf/vg01.conf -n vg01 /dev/hdb2
> vgcfgrestore -- physical volume "/dev/hdb2" doesn't belong to volume
> group "vg01"
>
> $# vgcfgrestore -f /etc/lvmconf/vg01.conf -n vg01 /dev/hdd1
> vgcfgrestore -- ERROR "vg_write(): open" storing VGDA of "vg01" on disks
>
>
> Do you have any ideas what I can do?
> Uli
>
> --
> 'The box said, 'Requires Windows 95 or better', so i installed
> Linux - TKK 5
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
