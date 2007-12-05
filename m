Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lB5N6EuZ000843
	for <linux-lvm@redhat.com>; Wed, 5 Dec 2007 18:06:14 -0500
Received: from biostat.ucsf.edu (upstrm185.psg-ucsf.org [38.99.193.74])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lB5N5rOn012445
	for <linux-lvm@redhat.com>; Wed, 5 Dec 2007 18:05:53 -0500
From: Ross Boylan <ross@biostat.ucsf.edu>
Content-Transfer-Encoding: 7bit
Date: Wed, 05 Dec 2007 15:05:38 -0800
Message-Id: <1196895938.23282.15.camel@corn.betterworld.us>
Mime-Version: 1.0
Subject: [linux-lvm] snapshot has post-snapshot files
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

Yesterday (04 Dec) at 23:17 I started a backup job which creates
snapshots as its first step.  The backup is still running.

The snapshot appears to have files that changed after it was created,
e.g., 
corn:/var/spool/cyrus/mail/r/user/ross#  ls -l debian/user/cyrus.squat
-rw------- 1 cyrus mail 1137271795 2007-08-05 03:30
debian/user/cyrus.squat
# ls -l /snap/var/spool/cyrus/mail/r/user/ross/debian/user/cyrus.squat
-rw------- 1 cyrus mail 1137271795 2007-08-05
03:30 /snap/var/spool/cyrus/mail/r/user/ross/debian/user/cyrus.squat
while mount shows
/dev/mapper/daisy-snapspool on /snap/var/spool/cyrus type ext3 (rw)
/dev/mapper/daisy-snaplib on /snap/var/lib/cyrus type ext3 (rw)

There are 2 mysteries: why is the newer file on the snapshot, and why is
the snapshot working at all?  That file alone is about the size I
allocated for the snapshot, and there are other large files like it.
However,
------------------------------------------------------------------
# date; lvdisplay daisy/snapspool
Wed Dec  5 14:01:35 PST 2007
  --- Logical volume ---
  LV Name                /dev/daisy/snapspool
  VG Name                daisy
  LV UUID                k0AK2H-dCCX-xu30-aVSk-At3g-21n6-eDZgdn
  LV Write Access        read/write
  LV snapshot status     active destination for /dev/daisy/cyrspool
  LV Status              available
  # open                 1
  LV Size                19.62 GB
  Current LE             628
  COW-table size         1.00 GB
  COW-table LE           32
  Allocated to snapshot  42.25%
  Snapshot chunk size    8.00 KB
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           254:23

# vgdisplay daisy
  --- Volume group ---
  VG Name               daisy
  System ID             
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  17
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                11
  Open LV               8
  Max PV                0
  Cur PV                2
  Act PV                2
  VG Size               164.84 GB
  PE Size               32.00 MB
  Total PE              5275
  Alloc PE / Size       3891 / 121.59 GB
  Free  PE / Size       1384 / 43.25 GB
  VG UUID               z2Dbsr-Ywb0-J56t-BMDT-cfxH-7cum-Fodpe9
-------------------------------------------------------------------

I running Debian GNU/Linux with a Debian stock 2.6.18-5-686 kernel
(2.6.22-3 is now current, so I suppose there could be some version
mismatch issues).  The volumes were created under EVMS and recently
converted to vanilla LVM.  There are some other LVM1 VG's on the system.

I forgot when I created the snapshot that the *squat files would be
regenerated overnight; they are index files.  Relatively little of the
material in them  changes from day to day.  My assumption is that the
snapshot needs a copy of the whole file if anything changes; is that
correct?  If it's smarter than that, it might explain why I have not
blown through the space I allocated, though not why the snapshot isn't
frozen.

The script, ran as root, at the start of the backup, is

BTW, is sync necessary before snapshot, or is it automatic?
--------------------------------------------------------------
#! /bin/sh
echo "$0 invoked with argument $1"

/usr/sbin/invoke-rc.d cyrus2.2 stop

# ctl_mboxlist must run as cyrus
# but su says it needs a terminal
# sudo does not gives a password prompt if run as root
sudo -u cyrus /usr/sbin/ctl_mboxlist -d > /var/lib/cyrus/mailboxlist.txt

chown cyrus /var/lib/cyrus/mailboxlist.txt
sync # may be redundant with snapshot

# create snapshots
lvcreate -L1G -s -n snapspool /dev/daisy/cyrspool
lvcreate -L100M -s -n snaplib /dev/daisy/cyrlib

# resume operation
/usr/sbin/invoke-rc.d cyrus2.2 start

# mount snapshots
mkdir -p /snap/var/spool/cyrus
mkdir -p /snap/var/lib/cyrus
mount /dev/daisy/snapspool /snap/var/spool/cyrus
mount /dev/daisy/snaplib /snap/var/lib/cyrus


# I should be more careful about passing failure codes back
-----------------------------------------------------------------------------
