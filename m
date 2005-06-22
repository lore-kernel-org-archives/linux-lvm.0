Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5MBbPu13492
	for <linux-lvm@redhat.com>; Wed, 22 Jun 2005 07:37:25 -0400
Received: from zproxy.gmail.com (zproxy.gmail.com [64.233.162.197])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j5MBbJmI026399
	for <linux-lvm@redhat.com>; Wed, 22 Jun 2005 07:37:19 -0400
Received: by zproxy.gmail.com with SMTP id 18so289736nzp
	for <linux-lvm@redhat.com>; Wed, 22 Jun 2005 04:37:13 -0700 (PDT)
Message-ID: <3cd4d99305062204374db9549@mail.gmail.com>
Date: Wed, 22 Jun 2005 21:37:13 +1000
From: Jeff Ewing <jeffiewing@gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] PV segments corrupted in vg1 : LVM corrupted
Reply-To: Jeff Ewing <jeffiewing@gmail.com>,
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

After removing some logical volumes (backup,etc) and extending home
logical volume, data in the whole volume group (vg1) has become
corrupted: Root logical volume is mounted at boot time, but am unable
to mount any other logical volumes in that volume group (var,home etc)
after reboot.

pvscan displays :  PV segment VG free_count mismatch: 0 != 4294966485
  Internal error: PV segments corrupted in vg1.
  No matching physical volumes found

vgdisplay, vgchange,vgscan display similiar message.

Using 2 IDE drives, with 2 meta disks on each (mirrored across the drives).
1 meta disk contains boot
1 meta disk contains  LVM - 1 volume group, logical volumes for
root,swap,var,usr,home

vgcfgrestore fails.

/etc/lvm/backup/vg1 contains (english) description of last known state of the 
logical volumes.  
/etc/lvmconf/vg1.conf  is a binary file (may be out of date)
/etc/lvmtab.d/vg1 appears to be the same binary file above (may be out of date)

System is Debian Unstable, running lvm2,udev,device mapper, kernel
2.6.8 compiled from Debian source. System appeared stable for 1 week
after lvm changes, but failed on reboot.

1. What command can be used to recreate the vg1.conf binary file from
the english description backup? (vg1.conf modification date is older
than changes)

2. What is the VG free count and how can it be reset to 0?

3. What other tools available to fix broken lvm.

Thank you
