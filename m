From: Gunnar Hilling <fedora.gunnar@hilling.de>
Date: Thu, 16 Sep 2004 02:56:27 +0200
Message-Id: <1095296187.4750.12.camel@nelson.hilling.de>
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
To: dm-devel@redhat.com, linux-lvm@redhat.com

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
