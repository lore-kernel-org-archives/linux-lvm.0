Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l65G89mx018201
	for <linux-lvm@redhat.com>; Thu, 5 Jul 2007 12:08:09 -0400
Received: from mail.futurelabusa.com (c-67-165-227-32.hsd1.co.comcast.net
	[67.165.227.32])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l65G87BW028176
	for <linux-lvm@redhat.com>; Thu, 5 Jul 2007 12:08:08 -0400
Received: from i0.futurelabusa.com (i0.fu-lab.com [192.168.0.101])
	by mail.futurelabusa.com (Postfix) with ESMTP id 8BE0177702
	for <linux-lvm@redhat.com>; Wed,  4 Jul 2007 08:04:38 -0600 (MDT)
Date: Wed, 04 Jul 2007 08:05:04 -0600
From: Jim Schatzman <james.schatzman@futurelabusa.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Message-Id: <20070704140438.8BE0177702@mail.futurelabusa.com>
Subject: [linux-lvm] Pvmove Cannot Be Aborted
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

All-

I made the mistake of trying to use pvmove to move any good data from a bad disk to a new identical good disk in an LV. Unfortunately, the Pvmove failed in midoperation. It cannot now be aborted, presumably because of the bad disk.

Furthermore, when I set up /dev/ioerror with dmsetup and try to activate the LV with -Pay, I get a LV that is unusable ("d" type).

So... if I activate/mount the LV normally, the mount works but I get IO errors and eventually the drive turns itself off. I cannot mount the LV without the missing drive (type "d", which I am guessing happens due to the pending pvmove). I cannot abort the pvmove because of the bad drive.

So... I have learned my lesson - never use pvmove on a bad drive. However, now that I have done it, how can I extract the data from the remaining JBOD disks in the LV?

Thanks!

Jim
