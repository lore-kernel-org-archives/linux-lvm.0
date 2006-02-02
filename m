Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k12I72114706
	for <linux-lvm@redhat.com>; Thu, 2 Feb 2006 13:07:02 -0500
Received: from palrel10.hp.com (palrel10.hp.com [156.153.255.245])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k12I6rTp000703
	for <linux-lvm@redhat.com>; Thu, 2 Feb 2006 13:06:54 -0500
Received: from smtp1.ptp.hp.com (smtp.cup.hp.com [15.1.28.250])
	by palrel10.hp.com (Postfix) with ESMTP id A003634131
	for <linux-lvm@redhat.com>; Thu,  2 Feb 2006 10:06:48 -0800 (PST)
Received: from [15.244.57.26] (airwolf.cup.hp.com [15.244.57.26])
	by smtp1.ptp.hp.com (Postfix) with ESMTP id 58CF03B0A65
	for <linux-lvm@redhat.com>; Thu,  2 Feb 2006 18:06:48 +0000 (UTC)
Message-ID: <43E24A37.6010801@cup.hp.com>
Date: Thu, 02 Feb 2006 10:06:47 -0800
From: John DeFranco <defranco@cup.hp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] vgchange -an question with disconnected disks
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

I have a question regarding the behavior of vgchange -a n on lvm2 when 
there are disk failures. Specifically the following:

1. vgchange -a y vg00
2. disconnect the disks
3. vgchange -a n vg00

Now this fails with many messages, such as:
[root@harris ~]# vgchange -a n vg00
   /dev/sda1: read failed after 0 of 4096 at 0: Input/output error
   /dev/sdb1: read failed after 0 of 4096 at 0: Input/output error
   /dev/sdb2: read failed after 0 of 4096 at 0: Input/output error
   /dev/sdc1: read failed after 0 of 4096 at 0: Input/output error
   /dev/sda: read failed after 0 of 1024 at 0: Input/output error
   /dev/sda: read failed after 0 of 1024 at 312475648: Input/output error
   /dev/sda: read failed after 0 of 2048 at 0: Input/output error
   /dev/sda1: read failed after 0 of 4096 at 1966080: Input/output error
   /dev/sda1: read failed after 0 of 4096 at 0: Input/output error
   /dev/sda2: read failed after 0 of 4096 at 310312960: Input/output error
   /dev/sda2: read failed after 0 of 4096 at 0: Input/output error
   /dev/sdb: read failed after 0 of 1024 at 0: Input/output error
   /dev/sdb: read failed after 0 of 1024 at 312475648: Input/output error
   /dev/sdb: read failed after 0 of 2048 at 0: Input/output error
   /dev/sdb1: read failed after 0 of 4096 at 1966080: Input/output error
   /dev/sdb1: read failed after 0 of 4096 at 0: Input/output error
   /dev/sdb2: read failed after 0 of 4096 at 310312960: Input/output error
   /dev/sdb2: read failed after 0 of 4096 at 0: Input/output error
   /dev/sdc: read failed after 0 of 1024 at 0: Input/output error
   /dev/sdc: read failed after 0 of 1024 at 16384000: Input/output error
   /dev/sdc: read failed after 0 of 2048 at 0: Input/output error
   /dev/sdc1: read failed after 0 of 4096 at 16318464: Input/output error
   /dev/sdc1: read failed after 0 of 4096 at 0: Input/output error
   Unable to find volume group "vg00"
[root@harris ~]#

This the vg is not deactivated. Now this is different behavior that with 
lvm1 which would just proceed as normal. My question is that is there a 
way to force the deactivation to occur in this case?

Thanks!

-- 
===========
John DeFranco                  Hewlett Packard Company
john.defranco@hp.com           Availability Clusters Solution Lab
phone: 408 447-7543            19111 Pruneridge Ave., M/S 4101
fax:   408 447-0056            Cupertino, CA 95014
