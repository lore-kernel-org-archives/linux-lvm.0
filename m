From: "Jason A. Lixfeld" <jlixfeld@andromedas.com>
Date: Wed, 3 Oct 2001 22:54:21 -0400
Message-ID: <008a01c14c7f$de865e30$836788cf@industry>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.33.0110040141320.21655-100000@fogarty.jakma.org>
Subject: [linux-lvm] What have I done!?
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
To: linux-lvm@sistina.com

I was running some kernel version (but I forget which one because I
deleted it! :/  Now, I'm running 2.4.10.  I was running LVM 0.9B7 or B8.
Don't remember.  I upgraded to 1.0 without checking for backwards
compatibility and now my life is a living hell!  I then upgraded to
1.0.1-rc4 in hopes that it would help.  Here's a rundown of my current
confusion as a result of my stupidity:

# /sbin/lvscan
lvscan -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please
run vgscan

# /sbin/vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "HiTiSO3"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
group

(BTW:  whenever I run vgscan, I get these errors all over the place.
The drives are for an LV that is in /proc but not in any of the configs!
I even deleted the /dev file hoping it would kill it)
hdj: read_intr: error=0x04 { DriveStatusError }
hdj: read_intr: status=0x59 { DriveReady SeekComplete DataRequest Error
}
hdj: read_intr: error=0x04 { DriveStatusError }
hdj: read_intr: status=0x59 { DriveReady SeekComplete DataRequest Error
}
hdl: read_intr: error=0x04 { DriveStatusError }
hdl: read_intr: status=0x59 { DriveReady SeekComplete DataRequest Error
}
hdl: read_intr: error=0x04 { DriveStatusError }
hdl: read_intr: status=0x59 { DriveReady SeekComplete DataRequest Error
}

# /sbin/pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hdm"  is in no VG  [76.34 GB]
pvscan -- ACTIVE   PV "/dev/hdn1" of VG "foo3" [76.32 GB / 0 free]
pvscan -- inactive PV "/dev/hdi"  is in no VG  [76.34 GB]
pvscan -- ACTIVE   PV "/dev/hdg1" of VG "foo3" [76.33 GB / 0 free]
pvscan -- inactive PV "/dev/hde"  is in no VG  [4.50 MB]
pvscan -- total: 5 [305.34 GB] / in use: 2 [152.66 GB] / in no VG: 3
[152.67 GB]

# cat /proc/lvm/global
LVM driver LVM version 1.0.1-rc4(03/10/2001)

Total:  2 VGs  4 PVs  2 LVs (1 LV open 1 times)

Global: 1244191 bytes malloced   IOP version: 10   5:22:56 active

VG:  foo3  [2 PV, 1 LV/1 open]  PE Size: 4096 KB
  Usage [KB/PE]: 160071680 /39080 total  160071680 /39080 used  0 /0
free
  PVs: [AA] hdn1                  80031744 /19539   80031744 /19539
0 /0     
       [AA] hdg1                  80039936 /19541   80039936 /19541
0 /0     
    LV:  [AWDL  ] FOO3                     160071680 /39080    1x open

VG:  foo1  [2 PV, 1 LV/0 open]  PE Size: 4096 KB
  Usage [KB/PE]: 156295168 /38158 total  156295168 /38158 used  0 /0
free
  PVs: [AA] hdj                   78147584 /19079   78147584 /19079
0 /0     
       [AA] hdl                   78147584 /19079   78147584 /19079
0 /0     
    LV:  [AWDL  ] FOO1                  156295168 /38158    close

# ls /etc/lvmconf
foo3.conf

# more /etc/lvmtab
foo3

# ls /etc/lvmtab.d/
foo3

# /sbin/pvcreate /dev/hdk
pvcreate -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please
run vgscan

# /sbin/pvdisplay        
pvdisplay -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please
run vgscan

# /sbin/vgdisplay
vgdisplay -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please
run vgscan

# /sbin/lvdisplay
lvdisplay -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please
run vgscan

There's a couple things:

1) I deleted everything in /etc/lv* except for anything related to foo3,
yet there is another VG, foo1 in /proc.
2) I can't remove inactive drives from showing up in pvscan

Basically, I just want to delete EVERYTHING EXCEPT for foo3.  I'm going
to try a downgraded kernel with the old programs and the old drivers and
see if that makes any difference (I do have all the configs backed up
for the VGs that I deleted previously).

If anyone has some insight on how I can just delete these things and be
done with it, I'd appreciate it.  I can't run any vg commands without
getting those VGDA consistency errors.  I tried a fix for that which I
found on the archives, but that didn't help at all.

Any info would be greatly appreciated!!

-JL
