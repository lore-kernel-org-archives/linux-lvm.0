Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j479emO10288
	for <linux-lvm@redhat.com>; Sat, 7 May 2005 05:40:48 -0400
Received: from mx-00.sil.at (mx-00.sil.at [62.116.68.196])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j479ef15005636
	for <linux-lvm@redhat.com>; Sat, 7 May 2005 05:40:42 -0400
Received: from unknown (HELO OOPS2) ([213.129.238.225])
	(envelope-sender <monitor@oops.co.at>)
	by mx-00.sil.at (qmail-ldap-1.03) with SMTP
	for <linux-lvm@redhat.com>; 7 May 2005 09:40:39 -0000
Date: Sat, 7 May 2005 11:40:26 +0200
From: "Stefan G. Weichinger" <monitor@oops.co.at>
Message-ID: <1524354177.20050507114026@oops.co.at>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Logical volume contains an incomplete mapping table
Reply-To: "Stefan G. Weichinger" <monitor@oops.co.at>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com


Hello, linux-lvm-list,

I write to you because I couldn't yet find a solution to the given
situation yet:

Suse 9.3 Pro, 3 IDE-disks with various partitions ...

Yesterday I decided to reorganize things, moved data and freed up some
partitions. Changed their ID to 8e with fdisk, rebooted.

fdisk -l displayed them fine, so I went on to create a Volume Group.
Added three PVs, created an LV with xfs on it, worked great.

Moved data back to this new LV, cleared up two more partitions.
Changed their ID, rebooted, added them to the Group.

Somehow one of these partitions weren't listed in pvscan as member of
the group.

And it started telling me

3 PV(s) found for VG Gruppe1: expected 5

Hmmm...

Much fiddling from then ... trying to get things working again,
web-research ...

"vgreduce --removemissing" sounded good, but didn't get me back ...

Right now I have:

root@oops1:~ # pvdisplay
  Found duplicate PV bmKfBpNQfkiKBMli7WfG9fXP4aWR6huV: using /dev/hdc2 not /dev/hda1
  Found duplicate PV bmKfBpNQfkiKBMli7WfG9fXP4aWR6huV: using /dev/hdc2 not /dev/hda1
  2 PV(s) found for VG Gruppe1: expected 5
  Logical volume (LV01) contains an incomplete mapping table.
  --- Physical volume ---
  PV Name               /dev/hda1
  VG Name               Gruppe1
  PV Size               9.77 GB / not usable 5.37 MB
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              2499
  Free PE               0
  Allocated PE          2499
  PV UUID               bmKfBp-NQfk-iKBM-li7W-fG9f-XP4a-WR6huV

  --- Physical volume ---
  PV Name               /dev/hdb1
  VG Name               Gruppe1
  PV Size               16.77 GB / not usable 7.01 MB
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              4291
  Free PE               16
  Allocated PE          4275
  PV UUID               DUwDDw-mKkp-7atr-A6cP-m5Ej-dAOD-O7TwEA


root@oops1:~ # vgdisplay
  Found duplicate PV bmKfBpNQfkiKBMli7WfG9fXP4aWR6huV: using /dev/hdc2 not /dev/hda1
  Found duplicate PV bmKfBpNQfkiKBMli7WfG9fXP4aWR6huV: using /dev/hdc2 not /dev/hda1
  2 PV(s) found for VG Gruppe1: expected 5
  Volume group "Gruppe1" doesn't exist  


No clue about that duplicate PV ...

Is there any way out of this without losing the data? I assume it is
still valid, but I don't know how to access it properly.

No problem to recreate the LVM if I can pull off the data before doing
that ...

--

Please let me know any pointers or hints, I'll also provide more
information if needed.

Please also CC: your replies to me as I am not (yet) a subscriber to
this list.

Thanks a lot.

-- 
Regards,
Stefan
