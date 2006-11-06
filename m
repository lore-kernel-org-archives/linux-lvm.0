Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kA67dpSI014181
	for <linux-lvm@redhat.com>; Mon, 6 Nov 2006 02:39:51 -0500
Received: from smtp.indatcom.net
	(IDENT:qmailr@ev1s-67-15-225-15.ev1servers.net [67.15.225.15]
	(may be forged))
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kA67do0N020065
	for <linux-lvm@redhat.com>; Mon, 6 Nov 2006 02:39:50 -0500
From: "InDatcom" <linux@cosmostech.net>
Date: Mon, 6 Nov 2006 01:39:44 -0600
Message-ID: <002201c70176$bad15c40$6500a8c0@mayel>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Lost 1 of 9 PVs and ext3 filesys needs recovery but
	--partial activates read-only
Reply-To: linux@cosmostech.net,
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

Hello,

We have a server which has 9 HDs, each of them is a PV on a single VG. A few
days ago 1 of the HDs (/dev/hdk) died suddenly, hardware dead, bios won't
detect it anymore so nothing more to do hardware-wise. Right now we don't
have another disk to replace it with and do a pvcreate -u / vgcfgrestore
process.

So we wanted to try a --partial mount, we were able to activate the VG and
LV, but it seems the ext3 filesystem has inconsistency errors and the
journal needs to be corrected but the VG is activated read-only so we can't
do this.

The question is: 

Is there a way to activate a VG in --partial mode in read/write so we can
run fsck.ext3 /dev/vg/lv ??

I can't find any mention of this either on man pages, mailinglist, google,
etc. Someone on the mailinglist even mentioned this, that he didn't
understand why --partial is done read-only.

We tried: lvchange -ay -P /dev/vg/lv and this is what we get:
  Partial mode. Incomplete volume groups will be activated read-only.

Either that or a way to remove that bad PV from the VG metadata, I've read a
couple of mails about using vgreduce --removemissing, the man page is a
little confusing, I almost ran that command but I tried it on a test box
first and yes, what it does is REMOVE the LV that has a missing PV, if you
read the man quickly it leads you to believe that it will remove the bad PVs
from your VG and lets you activate/mount it back on, but NOO, it kills the
LV to get the VG consistency back on. But that is exactly what I would like
to do, remove the bad PV from the LV, knowing that I will have a big
(300+gb) hole on the VG so I can backup and redo the filesystem.

Here's our steps:

root@localhost backup]# pvscan -P
  Partial mode. Incomplete volume groups will be activated read-only.
  /dev/ioerror: read failed after 0 of 4096 at 375809572864: Input/output
error
  /dev/ioerror: read failed after 0 of 4096 at 0: Input/output error
  /dev/ioerror: read failed after 0 of 4096 at 0: Input/output error
  Couldn't find device with uuid 'j05492-Dloo-RxMp-aIcJ-Y7dW-XA6L-mhuBtd'.
  /dev/ioerror: read failed after 0 of 4096 at 0: Input/output error
  Couldn't find device with uuid 'j05492-Dloo-RxMp-aIcJ-Y7dW-XA6L-mhuBtd'.
  /dev/ioerror: read failed after 0 of 4096 at 0: Input/output error
  Couldn't find device with uuid 'j05492-Dloo-RxMp-aIcJ-Y7dW-XA6L-mhuBtd'.
  PV /dev/hda3        VG pop   lvm2 [225.92 GB / 0    free]
  PV /dev/hdb1        VG pop   lvm2 [298.09 GB / 0    free]
  PV /dev/hde1        VG pop   lvm2 [298.09 GB / 0    free]
  PV /dev/hdf1        VG pop   lvm2 [298.09 GB / 0    free]
  PV /dev/hdg1        VG pop   lvm2 [279.46 GB / 0    free]
  PV /dev/hdh1        VG pop   lvm2 [279.46 GB / 0    free]
  PV /dev/hdj1        VG pop   lvm2 [298.09 GB / 0    free]
  PV unknown device   VG pop   lvm2 [298.09 GB / 0    free]
  PV /dev/hdl1        VG pop   lvm2 [298.09 GB / 0    free]
  Total: 9 [2.51 TB] / in use: 9 [2.51 TB] / in no VG: 0 [0   ]


[root@localhost backup]# vgscan -P
  Partial mode. Incomplete volume groups will be activated read-only.
  Reading all physical volumes.  This may take a while...
  /dev/ioerror: read failed after 0 of 4096 at 375809572864: Input/output
error
  /dev/ioerror: read failed after 0 of 4096 at 0: Input/output error
  /dev/ioerror: read failed after 0 of 4096 at 0: Input/output error
  Couldn't find device with uuid 'j05492-Dloo-RxMp-aIcJ-Y7dW-XA6L-mhuBtd'.
  /dev/ioerror: read failed after 0 of 4096 at 0: Input/output error
  Couldn't find device with uuid 'j05492-Dloo-RxMp-aIcJ-Y7dW-XA6L-mhuBtd'.
  Found volume group "pop" using metadata type lvm2




[root@localhost backup]# vgchange -ay -P
  Partial mode. Incomplete volume groups will be activated read-only.
  /dev/ioerror: read failed after 0 of 4096 at 0: Input/output error
  /dev/ioerror: read failed after 0 of 4096 at 375809572864: Input/output
error
  /dev/ioerror: read failed after 0 of 4096 at 0: Input/output error
  Couldn't find device with uuid 'j05492-Dloo-RxMp-aIcJ-Y7dW-XA6L-mhuBtd'.
  /dev/ioerror: read failed after 0 of 4096 at 0: Input/output error
  Couldn't find device with uuid 'j05492-Dloo-RxMp-aIcJ-Y7dW-XA6L-mhuBtd'.
  1 logical volume(s) in volume group "pop" now active


After this LV is active and is mountable, BUT:

[root@localhost /]# mount -t ext3 /dev/pop/data /backup/
mount: block device /dev/pop/data is write-protected, mounting read-only
mount: wrong fs type, bad option, bad superblock on /dev/pop/data,
       missing codepage or other error
       In some cases useful info is found in syslog - try
       dmesg | tail  or so

[root@localhost /]# dmesg|tail
EXT3-fs: INFO: recovery required on readonly filesystem.
EXT3-fs: write access unavailable, cannot proceed.

[root@localhost /]# fsck.ext3 /dev/pop/data 
e2fsck 1.38 (30-Jun-2005)
/dev/pop/data: recovering journal
fsck.ext3: unable to set superblock flags on /dev/pop/data

Need read/write permissions to fix this and then possibly be able to recover
some of the data.

Any help appreciated.

Ismael Sanchez
