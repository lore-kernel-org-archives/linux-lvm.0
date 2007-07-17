Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6HEXpAI028578
	for <linux-lvm@redhat.com>; Tue, 17 Jul 2007 10:33:51 -0400
Received: from post.berlin.i-dmedia.com (post.i-dmedia.com [62.159.214.250])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l6HEXlgG031411
	for <linux-lvm@redhat.com>; Tue, 17 Jul 2007 10:33:48 -0400
Received: from localhost (localhost [127.0.0.1])
	by post.berlin.i-dmedia.com (Postfix) with ESMTP id 0E9CF152
	for <linux-lvm@redhat.com>; Tue, 17 Jul 2007 16:33:38 +0200 (CEST)
Received: from post.berlin.i-dmedia.com ([127.0.0.1])
	by localhost (post.berlin.i-dmedia.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 27876-04 for <linux-lvm@redhat.com>;
	Tue, 17 Jul 2007 16:33:32 +0200 (CEST)
Received: from x1.ads.i-dmedia.com (x1.berlin.i-dmedia.com [10.1.69.45])
	by post.berlin.i-dmedia.com (Postfix) with ESMTP id D244013C
	for <linux-lvm@redhat.com>; Tue, 17 Jul 2007 16:33:32 +0200 (CEST)
Message-ID: <469CD32D.6040104@idmedia.com>
Date: Tue, 17 Jul 2007 16:33:17 +0200
From: Falko Zurell <falko.zurell@idmedia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] snapshots can't be deactivated
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@redhat.com

Hello list,

I have a strange behaviour on my snapshots.
I got a Ubuntu Server 7.04 with LVM2 setup:

lvm> version
   LVM version:     2.02.06 (2006-05-12)
   Library version: 1.02.08 (2006-07-17)
   Driver version:  4.11.0


I have two logical volumes I want to make snapshots of every night:

/dev/vg0/home with XFS
/dev/vg0/opt with XFS

These snapshots will be mounted read-only under /backup

So in principle the steps to achieve this should be:

  - unmount the snapshot from yesterday (umount /backup/home)
  - discard the snapshot from yesterday (lvremove -f
/dev/vg0/daily-snapshot-home)
  - freeze the filesystem (xfs_freeze -f /dev/vg0/home)
  - create the snapshot (lvcreate --snapshot --size 20G --name=20
daily-snap-home -v /dev/vg0/home)
  - unfreeze the filesystem (xfs_freeze -u /dev/vg0/home)
  - mount the new snapshot ro (mount -oro,nouuid=20
/dev/vg0/daily-snap-home /backup/home)


I wrote a script for that with some error checking too. But sometimes=20
this doesn't work. The problem seems to be that the snapshot isn't=20
removed even if "lvremove -f " sais it is removed. I got the following=20
error message when I then recreate the snapshot:

root@konrad:~# ./create-snapshot-home.sh
+ /sbin/lvs
   LV              VG   Attr   LSize   Origin Snap%  Move Log Copy%
   daily-snap-home vg0  swi-ao  20.00G home     0.00
   daily-snap-opt  vg0  swi-ao  20.00G opt      0.08
   home            vg0  owi-ao 100.00G
   opt             vg0  owi-ao 100.00G
   root            vg0  -wi-ao  10.00G
   video           vg0  -wi-ao 800.00G
+ /bin/umount -f /backup/home
+ /sbin/lvdisplay
+ grep /dev/vg0/daily-snap-home
                          /dev/vg0/daily-snap-home [active]
   LV Name                /dev/vg0/daily-snap-home
+ [ 0 -eq 0 ]
+ [ -b /dev/mapper/vg0-daily--snap--home ]
+ /sbin/lvremove -f /dev/vg0/daily-snap-home
   Logical volume "daily-snap-home" successfully removed
+ sleep 5
+ [ -b /dev/mapper/vg0-daily--snap--home ]
+ [ 0 -eq 0 ]
+ /usr/sbin/xfs_freeze -f /home
+ [ 0 -eq 0 ]
+ /sbin/lvcreate --snapshot --size 20G --name daily-snap-home -v=20
/dev/vg0/home
     Setting chunksize to 16 sectors.
     Finding volume group "vg0"
     Archiving volume group "vg0" metadata (seqno 116).
     Creating logical volume daily-snap-home
     Creating volume group backup "/etc/lvm/backup/vg0" (seqno 117).
     Found volume group "vg0"
     Creating vg0-daily--snap--home
     Loading vg0-daily--snap--home table
     Resuming vg0-daily--snap--home (254:5)
     Clearing start of logical volume "daily-snap-home"
     Found volume group "vg0"
   LV vg0/daily-snap-home in use: not deactivating
   Couldn't deactivate new snapshot.
+ /usr/sbin/xfs_freeze -u /home
+ /bin/mount -oro,nouuid /dev/vg0/daily-snap-home /backup/home
mount: you must specify the filesystem type

I don't know why this happens. The script will work perfectly 3 out of 5=20
times. But sometimes it comes up with the error above.

Are my steps right in principle? Did I forget to do something before or=20
after removing?

Thanks and kind regards

--=20

Falko Zurell
Head of Application Management


/i-d media AG
Ohlauer Stra=EF=BF=BDe 43
D-10999 Berlin

Tel +49 (0)30 - 2 59 47 - 357
Fax +49 (0)30 - 2 59 47 - 471
www.idmedia.com

_______________________________________________

Board: Regine Haschka-Helmer (CEO), Franz Klose (CFO)
Chairman of the Supervisory Board: Christian A. Hufnagl
Headquarters: Berlin, Place of Jurisdiction: Berlin HRB 76342
UST-Id. DE812698340
_______________________________________________


This message may contain confidential information and must not be=20
copied, disclosed or used by anybody other than the intended recipient.=20
If you have received this message in error, please notify us immediately=20
by reply e-mail and delete all records of the message from your=20
computer. The views represented in this message are solely those of the=20
author. Neither the author nor I-D Media AG accepts any liability for=20
the contents of this message.
