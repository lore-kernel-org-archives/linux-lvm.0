Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6T6bRa00558
	for <linux-lvm@redhat.com>; Thu, 29 Jul 2004 02:37:27 -0400
Received: from bedevere.spamaps.org (ip-65-77-168-70-muca.aerosurf.net
	[65.77.168.70])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i6T6bLXn013515
	for <linux-lvm@redhat.com>; Thu, 29 Jul 2004 02:37:22 -0400
Received: from [172.16.128.10] (helo=[172.16.128.10])
	by bedevere.spamaps.org with esmtp (Exim 3.35 #1 (Debian))
	id 1Bq4XZ-0007NK-00
	for <linux-lvm@redhat.com>; Wed, 28 Jul 2004 23:37:21 -0700
From: Clint Byrum <cbyrum@spamaps.org>
Message-Id: <1091083040.9573.28.camel@lancelot>
Mime-Version: 1.0
Date: Wed, 28 Jul 2004 23:37:20 -0700
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM1 and software RAID1+0
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

Hi everyone. I recently setup a box running RedHat 8.0, which has LVM
1.0.3. The disks were 4xSCSI disks, /dev/sda - sdd. I got them setup in
a RAID1+0 setup, so

/dev/sda---|                              |---/dev/sdc
       raid1 /dev/md0---raid0---/dev/md1 raid1
/dev/sdb---|          /dev/md2            |---/dev/sdd

Ok so this was working great... I ran

pvcreate /dev/md2
vgcreate system /dev/md2
lvcreate .......

This all worked great, and I was able to mkfs on the lv's, and mount
them, use them, etc.

So I rebooted

vgscan, upon rebooting, refused to find any vg's. I ran 'pvscan' and it
showed /dev/md0 and /dev/md2 as  members of 'system'. [ding] the light
went on, I remembered that with LVM2 I had to create a device filter for
situations like this. 

So I searched, to no avail, for the same solution for LVM1. Could not
find it. The only way I've found around this is to wrap 'vgscan' with a
shell script that does this:

mv /dev/md0 /dev/md0.brb
vgscan $*
mv /dev/md0.brb /dev/md0

Which really sucks, and is totally hacky. It works, but I'm not happy
about it.

Is there anything I can do about this? I know LVM1, and especially 1.0.3
aren't exactly "current', but I still would like to see this documented
somewhere.

Thanks
-cb
