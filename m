Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8HJgtl7006454
	for <linux-lvm@redhat.com>; Wed, 17 Sep 2008 15:42:55 -0400
Received: from mho-01-bos.mailhop.org (mho-01-bos.mailhop.org [63.208.196.178])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m8HJgi7U015061
	for <linux-lvm@redhat.com>; Wed, 17 Sep 2008 15:42:45 -0400
Received: from cpe001346f5b825-cm0014045b220e.cpe.net.cable.rogers.com
	([99.233.10.29] helo=nexus.edgeofthenet.org)
	by mho-01-bos.mailhop.org with esmtpsa (SSLv3:AES256-SHA:256)
	(Exim 4.68) (envelope-from <rmichael@edgeofthenet.org>)
	id 1Kg2vE-000Mfj-7B
	for linux-lvm@redhat.com; Wed, 17 Sep 2008 19:42:44 +0000
Date: Wed, 17 Sep 2008 15:42:43 -0400
From: Richard Michael <rmichael-lvm@edgeofthenet.org>
Message-ID: <20080917194243.GA11502@nexus.edgeofthenet.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] How to start duplicate VG with new name and UUID?
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

Hello list,

I'm using FC7 2.6.23.12-52.fc7 and LVM2 lvm2-2.02.24-1.fc7.

I have a RAID1 mdadm software array containing a VG.  Half the array has
been removed from the system and now returned and I want data from the
old half, before it is resync'd back into the array.

I can start the old half as a new degraded mdadm array easily enough:
mdadm --assemble /dev/md3 --run --update=uuid /dev/sdc2

Of course, lvm complains about a duplicate volume group.  So I want to
rename and re-UUID the PV and VG.  I've tried

pvchange --uuid /dev/md3

But lvm refuses because the volume group name is "vg0" in the /dev/md3
metadata and vg0 is an active volume group on /dev/md1, the other half
of the RAID1.  (It seems lvm's check is slightly naive and it is just
looking at the name?)

How can change the metadata on /dev/md3 such that it can be activated
without interfering with the currently active VG of the same name and
uuid on /dev/md2?

I'm sure I've misunderstood something somewhere!

Aside, it's a bit alarming when the vg/pv related tools report "Found
duplicate PV <uuid>: using /dev/md3 not /dev/md1".  "Using" for what?
Will the system change to using the newly connected duplicate PV?  I
definitely don't want it to do that!


Thanks,
Richard
