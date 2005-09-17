Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8HEDWV20687
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2005 10:13:32 -0400
Received: from server.rdshosting.net (209.177.102.84-cust.idyia.net
	[209.177.102.84] (may be forged))
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j8HEDOMx018432
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2005 10:13:29 -0400
Received: from localhost ([127.0.0.1] helo=www.stellarimagination.com)
	by server.rdshosting.net with smtp (Exim 4.42) id 1EGd6c-0003L1-6w
	for linux-lvm@redhat.com; Sat, 17 Sep 2005 08:51:50 -0500
Message-ID: <50387.65.93.236.186.1126965110.squirrel@www.stellarimagination.com>
Date: Sat, 17 Sep 2005 08:51:50 -0500 (CDT)
From: michael@stellarimagination.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Recovering Data From LVM
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

I've done some googling all night and I haven't found anything that can
help me with my current dilemma.  :-(  I have a HDD that was imaged with
Fedora Core 3, and there is some data on there that I want to recover. 
The data is on an LVM, which occupied just the one drive (it never spanned
multiple disks).

The problem is that there does not appear to be any logical volumes in the
volume group.  This was the original layout of the disks:

/dev/hda1 ext3   102MB  1   13
/dev/hda2  lvm 39104MB 14 4998

VolGroup00   Size 39040
  LogVol00 / ext3 38272
  LogVol01   swap   768

I am working from a computer with Fedora Core 4 now, and this old hard
drive is mounted as a slave (/dev/hdb).  I have tried the following:

# pvscan
  PV /dev/hda2   VG VolGroup00   lvm2 [37.16 GB / 32.00 MB free]
  PV /dev/hdb2                   lvm2 [38.18 GB]
  Total: 2 [75.33 GB] / in use: 1 [37.16 GB] / in no VG: 1 [38.18 GB]

There is no name for me to vgimport.  And if I install the drive as a
master to this computer, to try and boot from it and transfer the data
out, it informs me that it can't find VolGroup00 and refuses to boot.

If I take that HDD to a Windows machine and mount it as a slave,
explore2fs reads /dev/hdb1 which is just an ext3 partition, but doesn't
see the LVM at all.

I suspect that I corrupted the structure of the LVM when I was trying to
mount it originally.  At one point I had run "vgcreate oldhdd /dev/hb2" or
something to that effect.  None of the processes took more than a second,
so I strongly believe that the data itself is still there.

Any help would be greatly appreciated!

Best regards,

Michael.
