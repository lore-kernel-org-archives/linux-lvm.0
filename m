Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j61BQZu03150
	for <linux-lvm@redhat.com>; Fri, 1 Jul 2005 07:26:35 -0400
Received: from tauism.org (tauism.org [217.155.219.14])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id j61BQXGx014418
	for <linux-lvm@redhat.com>; Fri, 1 Jul 2005 07:26:33 -0400
Received: from hub.home ([127.0.0.1])
	by localhost (hub [127.0.0.1]) (amavisd-new, port 10024) with SMTP
	id 15721-10 for <linux-lvm@redhat.com>;
	Fri, 1 Jul 2005 12:26:17 +0100 (BST)
Date: Fri, 1 Jul 2005 12:26:07 +0100
From: Nick Leverton <nickl@icritical.com>
Message-ID: <20050701112607.GB2770@icritical.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="gatW/ieO32f1wygP"
Content-Disposition: inline
Subject: [linux-lvm] Machine crashed during pvmove, now can't manage VG
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
To: linux-lvm@redhat.com


--gatW/ieO32f1wygP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

My machine hung during a pvmove, and now I get kernel panic when
accessing, in any formatted way, the LV with /usr on.  I've tried running
just 'pvmove' by itself as per the pvmove man page, but it won't recover.
The error message is:
	pvmove: ABORTING: Mirror percentage check failed

I can display the pv, lv, and vg details if I boot from a CD, I can work
with the other LVs on the VG, but I can't figure out how to fix the LV.

How it got like this: I have an lvm2 setup on Debian Sarge (kernels
2.6.8 or 2.6.10, lvm version 2.01.04).  My original drive, hda, was a
mess of small partitions, some LVM and some not.

Yesterday I added a new hard drive (hdb), and introduced it to the VG -
the intention being to move all the contents across and remove the old
drive from the VG, so that I can sort out its layout.

So I did 'pvmove /dev/hda5; pvmove /dev/hda6' as they are the two
partitions I needed freeing up.  The first one (hda5) was taking ages
so I left it going overnight (stdout and stderr were being tee'd to a
file on a non-LVM partition).

I came down this morning and found the machine was frozen.  It has done
this before very rarely, but never at so inopportune a time.  The screen
was blank as monitor powersaving had apparently kicked in.  The saved
stdout records that the first pvmove had gone to 100.0% completion,
but the second hadn't started displaying anything.  The output from
pvdisplay etc is attached.  There is an LV called /dev/VG1/pvmove0,
which is roughly twice as big as /dev/hda5 and a little smaller than
/dev/hda6, if that gives any clues.

I have seen (too late, of course!) that there are advisories such as Red
Hat's RHBA-2005:192-19 which mention problems with a long running pvmove.
Unfortunately I'm now stuck.  Pvmove won't sort out the problem, and as
an LVM newbie I don't know what recovery tools I might use.  The kernel
panics any time I either mount or fsck the Reiserfs on the /usr LV
(which was fine before this as it had been checked on reboot).

The linux-lvm list archive search doesn't help me, as I can't even make
it come up with the single posting that Google shows me on this error,
https://www.redhat.com/archives/linux-lvm/2005-February/msg00059.html

I'd be very grateful for any help at all in recovering /usr, it would
save me a massive reinstallation job.

Thanks in hope,

Nick, posting from work due to lack of /usr at home !

--gatW/ieO32f1wygP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=pvdisplay

    Scanning for physical volume names
  --- Physical volume ---
  PV Name               /dev/ide/host0/bus0/target0/lun0/part5
  VG Name               VG1
  PV Size               9.40 GB / not usable 0   
  Allocatable           yes 
  PE Size (KByte)       4096
  Total PE              2407
  Free PE               234
  Allocated PE          2173
  PV UUID               VfRI1s-mghr-Eewv-w5cz-s5Au-Hj2W-1k3YwV
   
  --- Physical volume ---
  PV Name               /dev/ide/host0/bus0/target0/lun0/part6
  VG Name               VG1
  PV Size               17.42 GB / not usable 0   
  Allocatable           yes 
  PE Size (KByte)       4096
  Total PE              4460
  Free PE               239
  Allocated PE          4221
  PV UUID               gjZrcn-3jGI-d8W3-3g5M-3T9j-6vf3-hJDDNo
   
  --- Physical volume ---
  PV Name               /dev/ide/host0/bus0/target1/lun0/part4
  VG Name               VG1
  PV Size               71.60 GB / not usable 0   
  Allocatable           yes 
  PE Size (KByte)       4096
  Total PE              18330
  Free PE               13875
  Allocated PE          4455
  PV UUID               w6Mhpb-Sd3g-lSMJ-TFmH-GI0e-g9nK-eUpeX7
   

--gatW/ieO32f1wygP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=vgdisplay

    Finding all volume groups
    Finding volume group "VG1"
  --- Volume group ---
  VG Name               VG1
  System ID             
  Format                lvm2
  Metadata Areas        3
  Metadata Sequence No  18
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                3
  Open LV               0
  Max PV                0
  Cur PV                3
  Act PV                3
  VG Size               98.43 GB
  PE Size               4.00 MB
  Total PE              25197
  Alloc PE / Size       10849 / 42.38 GB
  Free  PE / Size       14348 / 56.05 GB
  VG UUID               ROCDhz-7YlG-U3JT-eSo6-LF1M-gzj5-eeyR80
   
  --- Logical volume ---
  LV Name                /dev/VG1/Home
  VG Name                VG1
  LV UUID                XqRRcy-7JSB-8uNY-5AQl-swPt-6IEM-C8l8no
  LV Write Access        read/write
  LV Status              NOT available
  LV Size                17.89 GB
  Current LE             4580
  Segments               2
  Allocation             inherit
  Read ahead sectors     0
   
  --- Logical volume ---
  LV Name                /dev/VG1/Usr
  VG Name                VG1
  LV UUID                FPW32k-GZoo-W2GU-1w41-Wmdo-tfQW-w4JG2w
  LV Write Access        read/write
  LV Status              NOT available
  LV Size                8.00 GB
  Current LE             2048
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
   
  --- Logical volume ---
  LV Name                /dev/VG1/pvmove0
  VG Name                VG1
  LV UUID                Or9vT1-DEmW-abUS-2WpW-CJbz-mF74-FndTJb
  LV Write Access        read/write
  LV Status              NOT available
  LV Size                16.49 GB
  Current LE             4221
  Segments               2
  Allocation             contiguous
  Read ahead sectors     0
   
  --- Physical volumes ---
  PV Name               /dev/ide/host0/bus0/target0/lun0/part5     
  PV UUID               VfRI1s-mghr-Eewv-w5cz-s5Au-Hj2W-1k3YwV
  PV Status             allocatable
  Total PE / Free PE    2407 / 234
   
  PV Name               /dev/ide/host0/bus0/target0/lun0/part6     
  PV UUID               gjZrcn-3jGI-d8W3-3g5M-3T9j-6vf3-hJDDNo
  PV Status             allocatable
  Total PE / Free PE    4460 / 239
   
  PV Name               /dev/ide/host0/bus0/target1/lun0/part4     
  PV UUID               w6Mhpb-Sd3g-lSMJ-TFmH-GI0e-g9nK-eUpeX7
  PV Status             allocatable
  Total PE / Free PE    18330 / 13875
   

--gatW/ieO32f1wygP--
