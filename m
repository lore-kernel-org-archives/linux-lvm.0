Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8G0asr32644
	for <linux-lvm@redhat.com>; Wed, 15 Sep 2004 20:36:54 -0400
Received: from homer.hilling.de (homer.hilling.de [62.8.210.228])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8G0arbC009100
	for <linux-lvm@redhat.com>; Wed, 15 Sep 2004 20:36:53 -0400
Received: from [62.8.210.226] (nelson.hilling.de [62.8.210.226])
	by homer.hilling.de (Postfix) with ESMTP id EC6FDA74C3
	for <linux-lvm@redhat.com>; Thu, 16 Sep 2004 02:38:41 +0200 (CEST)
From: Gunnar Hilling <fedora.gunnar@hilling.de>
Date: Thu, 16 Sep 2004 02:36:47 +0200
Message-Id: <1095295007.4750.8.camel@nelson.hilling.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] snapshot on 6.8.5/FC development
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hello,

I just tried the lvm2/dm-snapshot feature and failed miserably...
After reading some older postings in this and the dm-devel mailing lists
I'm not sure what to do:

setup:
lvm2-2.0.21
kernel-2.6.8
xfs

VG-Size: 4G on Raid-Mirror (/dev/md1)
LV-Size: 1G

Calling:

lvcreate --snapshot --size 100m --name snap /dev/TestMirrorGroup/OnlineVol

will block forever. I have to reboot the computer. After
that /dev/TestMirrorGroup/snap is there...

I froze xfs before (xfs_freeze -f)

Any Clue? Is this related to xfs-FS only or do there exist general
problems (I read somewhere about problems snapshotting raids...)

BTW: Why isn't it possible to create the snapshot on another VG than the
original. This would be quite nice becauce in a typical setup it could
be an advantate to have the snapshot on a small extra disk, keeping the
original data separated from the writes to the snapshot.

Any help appreciated,

-Gunnar
