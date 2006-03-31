Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k2VN4fVq026031
	for <linux-lvm@redhat.com>; Fri, 31 Mar 2006 18:04:41 -0500
Received: from dristor.dazoot.ro (dristor.dazoot.ro [82.76.80.33])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id k2VN4Zo5000642
	for <linux-lvm@redhat.com>; Fri, 31 Mar 2006 18:04:35 -0500
Date: Sat, 1 Apr 2006 02:04:25 +0300
From: Catalin Constantin <catalin@bounce-software.com>
Message-ID: <1079461495.20060401020425@bounce-software.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm2 recovery issue
Reply-To: Catalin Constantin <catalin@bounce-software.com>,
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

Hi there,

I am using lvm2 on debian.
The lvm was build on top of 2 software raid partitions:
/dev/md2 and /dev/md3

/dev/md3 was a raid 1 partition built from
/dev/sdc1 and /dev/sdd1

The partition type is xfs. (both raids /dev/md2, /dev/md3 and lvm
storage).

Now, the problem i have.

Somehow the /dev/md3 partition got messed up (out of sync) and between
reboots the lvm partition uses alternatively either
/dev/sdc1 or /dev/sdd1

eg:
pvdisplay
  Found duplicate PV VxRU9BoOAwLDxJ8yifZT2fJGEn8CeLvs: using /dev/sdd1 not /dev/sdc1
  --- Physical volume ---
  PV Name               /dev/md2
  VG Name               vg
  PV Size               100.50 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              25727
  Free PE               0
  Allocated PE          25727
  PV UUID               1vtRnR-jmjP-zbgG-JZJs-1WJu-3ZyV-Vik6wH

  --- Physical volume ---
  PV Name               /dev/sdc1
  VG Name               vg
  PV Size               130.39 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              33381
  Free PE               0
  Allocated PE          33381
  PV UUID               VxRU9B-oOAw-LDxJ-8yif-ZT2f-JGEn-8CeLvs

The bad thing is that some files ended up on /dev/sdd1 and some others
on /dev/sdc1.

I've unmounted the storage lvm drive and tryed to do a /dev/md3
Assemble but it looks like it won't come up !

mdadm --detail /dev/md3
mdadm: md device /dev/md3 does not appear to be active.

mdadm -A /dev/md3
mdadm: no devices found for /dev/md3

mdadm -A /dev/md3 /dev/sdd1
mdadm: /dev/md3 assembled from 1 drive - need all 2 to start it (use --run to insist).

mdadm -A /dev/md3 /dev/sdd1 /dev/sdc1
mdadm: failed to add /dev/sdc1 to /dev/md3: Device or resource busy
mdadm: /dev/md3 assembled from 1 drive - need all 2 to start it (use --run to insist).

I've already did a backup of what i can mount now.

Some files are still on the "other lvm".

What i need to know are some advices from you guys of how to recover
the most of the data from the "mess" i ended up with !

Eg:
- start lvm with /dev/sdd1 and do another backup (how do i do it in
order to make the damage minimum)
- start the md3 (repair or some) and not to loose data

Anything you can come up will be highly appreciated.

Thank you for your time and sorry if the post is too big!


-- 
Catalin Constantin
Bounce Software
