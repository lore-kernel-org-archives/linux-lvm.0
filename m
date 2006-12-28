Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kBSKuTRA011992
	for <linux-lvm@redhat.com>; Thu, 28 Dec 2006 15:56:29 -0500
Received: from irobot.com (smtp1.irobot.com [66.238.211.203])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kBSKuSv2014865
	for <linux-lvm@redhat.com>; Thu, 28 Dec 2006 15:56:28 -0500
Message-ID: <45942F64.9050502@hacksaw.org>
Date: Thu, 28 Dec 2006 15:56:04 -0500
From: Hacksaw <hacksaw@hacksaw.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Hot backup for boot/root disk
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

I have a Linux system with 2 identical disks for the OS portion. The 
goal is to have them essentially mirrored, but not continuously. I want 
to be able to rsync them on occasion.

I need this disk to be bootable on a moments notice, in case the main 
one dies.

The layout of the current boot disk is a partition for /boot which is 
ext3, and then the rest as a LVM set, of essentially one large partition.

My first thought is to create the second disk pretty much as the first 
was created, do the rsyncs, and make some script that will maintain the 
configuration files which mention the physical disks.

I have to admit that it's unclear what they all are.

In fact, I'd prefer something clever with disk labels.

In the best of all possible worlds, the system would recognize the 
bootable partitions, and fail over to the backup one if there was a 
problem with the main one.

I would appreciate some advice here. I need this machine to go live in a 
few days, as the server it's replacing is close to just falling over 
after more than 6 years of active service, all honor to it.
