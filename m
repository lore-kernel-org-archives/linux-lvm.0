Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9RM2Jr12574
	for <linux-lvm@redhat.com>; Wed, 27 Oct 2004 18:02:19 -0400
Received: from postfix4-2.free.fr (postfix4-2.free.fr [213.228.0.176])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id i9RM2GNT003503
	for <linux-lvm@redhat.com>; Wed, 27 Oct 2004 18:02:17 -0400
Received: from [192.168.29.141] (sesame.monjoin.com [82.229.236.181])
	by postfix4-2.free.fr (Postfix) with ESMTP id 747E32357E0
	for <linux-lvm@redhat.com>; Thu, 28 Oct 2004 00:02:10 +0200 (CEST)
Message-ID: <41801ADE.6030308@monjoin.net>
Date: Thu, 28 Oct 2004 00:02:06 +0200
From: Eric Monjoin <eric@monjoin.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Software raid on top of lvm logical volume
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi,

I would like to know if it's possible (works perfectly) to create a 
software mirror (md0) on top of  2 LVM logical volumes :

Physical Devices : /dev/sdb1, /dev/sdc1, /dev/sdd1, /dev/sde1, 
/dev/sdf1, /dev/sdg1
pvcreate /dev/sdb1 /dev/sdc1 /dev/sdd1 /dev/sde1 /dev/sdf1 /dev/sdg1
vgcreate -s 32 vgdata1 /dev/sdb1 /dev/sdc1 /dev/sdd1
lvcreate -l xxx vgdata1 lvdata1
vgcreate -s 32 vgdata2 /dev/sde1 /dev/sdf1 /dev/sdg1
lvcreate -l xxx vgdata2 lvdata2

/etc/raidtab :
raiddev /dev/md0
    raid-level                     1
    nr-raid-disks                2
    nr-spare-disks              0
    chunk-size                    32
    persistant-superblock   1
    device                          /dev/vgdata1
    raid-disk                       0
    device                          /dev/vgdata2
    raid-disk                       1

Tks


Eric Monjoin
IT Architect
IBM france
