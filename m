Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D041607B5
	for <linux-lvm@redhat.com>; Thu, 19 Oct 2017 17:54:40 +0000 (UTC)
Received: from erato-smout.broadpark.no (erato-smout.broadpark.no
	[80.202.10.26]) by mx1.redhat.com (Postfix) with ESMTP id 75C7925784
	for <linux-lvm@redhat.com>; Thu, 19 Oct 2017 17:54:36 +0000 (UTC)
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Received: from osl1cloudm1.nextgentel.net ([80.202.10.58])
	by erato-smout.broadpark.no
	(Oracle Communications Messaging Server 7u4-27.01(7.0.4.27.0) 64bit
	(built Aug
	30 2012)) with ESMTP id <0OY300AV80B21B30@erato-smout.broadpark.no> for
	linux-lvm@redhat.com; Thu, 19 Oct 2017 19:54:35 +0200 (CEST)
From: Oleg Cherkasov <o1e9@member.fsf.org>
Message-id: <f30cd99b-2ea1-2766-a8c9-fd61c2f2e41c@member.fsf.org>
Date: Thu, 19 Oct 2017 19:54:34 +0200
Content-language: en-US
Subject: [linux-lvm] cache on SSD makes system unresponsive
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
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

Recently I have decided to try out LVM cache feature on one of our Dell 
NX3100 servers running CentOS 7.4.1708 with 110Tb disk array (hardware 
RAID5 with H710 and H830 Dell adapters).  Two SSD disks each 256Gb are 
in hardware RAID1 using H710 adapter with primary and extended 
partitions so I decided to make ~240Gb LVM cache to see if system I/O 
may be improved.  The server is running Bareos storage daemon and beside 
sshd and Dell OpenManage monitoring does not have any other services. 
Unfortunately testing went not as I expected nonetheless at the end 
system is up and running with no data corrupted.

Initially I have tried the default writethrough mode and after running 
dd reading test with 250Gb file got system unresponsive for roughly 
15min with cache allocation around 50%.  Writing to disks it seems speed 
up the system however marginally, so around 10% on my tests and I did 
manage to pull more than 32Tb via backup from different hosts and once 
system became unresponsive to ssh and icmp requests however for a very 
short time.

I though it may be something with cache mode so switched to writeback 
via lvconvert and run dd reading test again with 250Gb file however that 
time everything went completely unexpected.  System started to slow 
responding for simple user interactions like list files and run top. And 
then became completely unresponsive for about half an hours.  Switching 
to main console via iLO I saw a lot of OOM messages and kernel tried to 
survive therefore randomly killed almost all processes.  Eventually I 
did manage to reboot and immediately uncached the array.

My question is about very strange behavior of LVM cache.  Well, I may 
expect no performance boost or even I/O degradation however I do not 
expect run out of memory and than OOM kicks in.  That server has only 
12Gb RAM however it does run only sshd, bareos SD daemon and OpenManange 
java based monitoring system so no RAM problems were notices for last 
few years running with our LVM cache.

Any ideas what may be wrong?  I have second NX3200 server with similar 
hardware setup and it would be switch to FreeBSD 11.1 with ZFS very time 
soon however I may try to install CentOS 7.4 first and see if the 
problem may be reproduced.

LVM2 installed is version lvm2-2.02.171-8.el7.x86_64.


Thank you!
Oleg
