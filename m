Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6JGadfB032295
	for <linux-lvm@redhat.com>; Wed, 19 Jul 2006 12:36:39 -0400
Received: from as2.cineca.com (as2.cineca.com [130.186.84.242])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6JGaY29012927
	for <linux-lvm@redhat.com>; Wed, 19 Jul 2006 12:36:34 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by as2.cineca.com (Postfix) with ESMTP id 0352623F
	for <linux-lvm@redhat.com>; Wed, 19 Jul 2006 18:36:28 +0200 (CEST)
Received: from cineca.mm.cineca.it (cineca.mm.cineca.it [130.186.10.200])
	by as2.cineca.com (Postfix) with ESMTP id 90C0D31C
	for <linux-lvm@redhat.com>; Wed, 19 Jul 2006 18:35:57 +0200 (CEST)
Received: from [130.186.6.8] (pc-cecchi.cineca.it [130.186.6.8])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	as user t.cecchi@cineca.it by cineca.mm.cineca.it (Postfix) with ESMTP
	id 4BA297573C3
	for <linux-lvm@redhat.com>; Wed, 19 Jul 2006 18:35:57 +0200 (MEST)
Message-ID: <44BE5F6C.40704@cineca.it>
From: Tommaso Cecchi <t.cecchi@cineca.it>
MIME-Version: 1.0
Subject: [linux-lvm] duplicate PV
References: <2711988D405D2247BC9B82786F99E8E5066307@MAIL4.corp.isib.net>
In-Reply-To: <2711988D405D2247BC9B82786F99E8E5066307@MAIL4.corp.isib.net>
Content-Transfer-Encoding: 7bit
Date: Wed, 19 Jul 2006 18:35:57 +0200 (MEST)
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello everyone,
I have the following problem: I want to use a snapshot mechanism external to
LVM2 (i.e. snapshot from the storage server) so it happens that I access from a
linux box two identical LUNs with the same PVID. It is not a matter of
multipathing, they just are completely different devices with the same content
(and with the same PVID of course).

What I would like to do is to use and mount the second device on a different
mount point. So:

/dev/sdd1 is the primary PV
/dev/sdf1 is the snapshot of the primary PV

The result of pvscan before the discovery is:

drdb2:~ # pvscan
   PV /dev/sde1   VG drrg2_vg      lvm2 [200.00 GB / 0    free]
   PV /dev/sdd1   VG test_vg       lvm2 [200.00 GB / 0    free]
   PV /dev/sdb1   VG oracledb_vg   lvm2 [220.00 GB / 0    free]
   PV /dev/sdc1   VG oracledb_vg   lvm2 [20.00 GB / 0    free]
   PV /dev/sda3   VG root_vg       lvm2 [59.75 GB / 47.26 GB free]
   Total: 5 [699.73 GB] / in use: 5 [699.73 GB] / in no VG: 0 [0   ]

after the discovery of the new device is:

drdb2:~ # pvscan
   Found duplicate PV PnvnzL7YFft76Ky0EaPbOh519SQD5Uxc: using /dev/sdf1 not
/dev/sdd1
   PV /dev/sde1   VG drrg2_vg      lvm2 [200.00 GB / 0    free]
   PV /dev/sdd1   VG test_vg       lvm2 [200.00 GB / 0    free]
   PV /dev/sdb1   VG oracledb_vg   lvm2 [220.00 GB / 0    free]
   PV /dev/sdc1   VG oracledb_vg   lvm2 [20.00 GB / 0    free]
   PV /dev/sda3   VG root_vg       lvm2 [59.75 GB / 47.26 GB free]
   Total: 5 [699.73 GB] / in use: 5 [699.73 GB] / in no VG: 0 [0   ]

I guess this problem is the same I'd have if I copy any single byte from a 
device to another the last one resulting in having the same LVM label.

What I tried is to:

1) vgreduce:

drdb2:~ # vgreduce test_vg /dev/sdf1
   Found duplicate PV PnvnzL7YFft76Ky0EaPbOh519SQD5Uxc: using /dev/sdf1 not
/dev/sdd1
   Physical Volume "/dev/sdf1" not found in Volume Group "test_vg"

sdf1 does not belong to test_vg

2) pvchange --uuid:

drdb2:~ # pvchange --uuid /dev/sdf1
   Found duplicate PV PnvnzL7YFft76Ky0EaPbOh519SQD5Uxc: using /dev/sdd1 not
/dev/sdf1
   Volume group containing /dev/sdf1 has active logical volumes
   0 physical volumes changed / 1 physical volume not changed

My idea was to modify the PVID so to let LVM understand they are completely 
different devices.
How can I manage this?

Thanks for any help you may give me.
Tommaso

-- 
================================================================
|     Tommaso Cecchi                          CINECA
| System Management Group              Via Magnanelli 6/3 40033
| e-mail: t.cecchi@cineca.it             Casalecchio di Reno
| Tel: 051/6171411                         Bologna - ITALY
| Fax 051/6132198                       http://www.cineca.it
================================================================
