Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l03KmGas009626
	for <linux-lvm@redhat.com>; Wed, 3 Jan 2007 15:48:16 -0500
Received: from wx-out-0506.google.com (wx-out-0506.google.com [66.249.82.230])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l03KmFp8019432
	for <linux-lvm@redhat.com>; Wed, 3 Jan 2007 15:48:16 -0500
Received: by wx-out-0506.google.com with SMTP id s11so7857992wxc
	for <linux-lvm@redhat.com>; Wed, 03 Jan 2007 12:48:15 -0800 (PST)
Message-ID: <9b2e66b20701031248l405753d5nf811c414ce754f2d@mail.gmail.com>
Date: Wed, 3 Jan 2007 14:48:15 -0600
From: "Adam Tybor" <adam.tybor@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Recovering PV and LG after fdisk or Repartition
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi,

I made a huge mistake last night.  I was repartitioning drives in my
system using fdisk.  I accidentally fdisk the wrong drive, rebooted,
and lost my lvm2.  In light of this error, I did a dd from the
original disk to another disk of the exact same geometry before I
started trying to recover the original.

Here is what I did to try and recover.
Disk 300GB 1 partition of type 8e /dev/sdc1
It had a single volume group on the pv which was /dev/sdc1

I tried recreating the PV using the archive file, that failed.  I
forced the creation of the PV on /dev/sdc1 with the uuid from the
archive file, that succeeded.

I then ran:
vgcfgrestore -n vg-storage -t -v -f /etc/lvm/backup/vg-storage vg-storage

This worked and restored my two logical volumes.  I then activated the
volumes running vgchange -ay.  Now I cannot mount the volumes.

The two volumes had reiserfs, mount will not mount them, a dmesg shows
this error.

ReiserFS: dm-6: warning: sh-2021: reiserfs_fill_super: can not find
reiserfs on dm-6

Running reiserfsck does nothing, it just returns immediately with no output.

I tried rebuilding the super block, the tree, everything.  It seems
like reiserfsck cannot find anything.

Is there anything else I can do, I really need this data?

Thanks,

Adam
