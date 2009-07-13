Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6DDbEDi005453
	for <linux-lvm@redhat.com>; Mon, 13 Jul 2009 09:37:14 -0400
Received: from eastrmmtao106.cox.net (eastrmmtao106.cox.net [68.230.240.48])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n6DDZv7X018734
	for <linux-lvm@redhat.com>; Mon, 13 Jul 2009 09:35:57 -0400
Received: from eastrmimpo02.cox.net ([68.1.16.120]) by eastrmmtao106.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090713133556.CQQS28892.eastrmmtao106.cox.net@eastrmimpo02.cox.net>
	for <linux-lvm@redhat.com>; Mon, 13 Jul 2009 09:35:56 -0400
Message-ID: <4A5B383C.3070905@cox.net>
Date: Mon, 13 Jul 2009 08:35:56 -0500
From: Ron Johnson <ron.l.johnson@cox.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Getting rid of a dying hard drive
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

Hi,

Does this thread do an adequate job of documenting the process of 
removing a PV from an L?
     http://ubuntuforums.org/showthread.php?t=449711

The problem is that sdb2 is the largest PV in my LV.

Is there a simpler way?

# pvscan
   WARNING: Ignoring duplicate config node: filter (seeking filter)
   PV /dev/sda1   VG main_huge_vg   lvm2 [232.75 GB / 0    free]
   PV /dev/sda2   VG main_huge_vg   lvm2 [232.75 GB / 0    free]
   PV /dev/sda3   VG main_huge_vg   lvm2 [232.75 GB / 0    free]
   PV /dev/sda4   VG main_huge_vg   lvm2 [233.00 GB / 0    free]
   PV /dev/sdc1   VG main_huge_vg   lvm2 [232.75 GB / 0    free]
   PV /dev/sdc2   VG main_huge_vg   lvm2 [232.75 GB / 0    free]
   PV /dev/sdc3   VG main_huge_vg   lvm2 [232.88 GB / 0    free]
 >>PV /dev/sdb2   VG main_huge_vg   lvm2 [594.25 GB / 0    free]
   PV /dev/sdd4   VG main_huge_vg   lvm2 [529.00 GB / 0    free]
   Total: 9 [2.69 TB] / in use: 9 [2.69 TB] / in no VG: 0 [0   ]

# df -m /data/big
Filesystem           1M-blocks      Used Available Use% Mounted on
/dev/dm-0              2774711    680803   1952962  26% /data/big


As you can see, there's a whole lot of extra space on the LV.

Thanks.

-- 
Scooty Puff, Sr
The Doom-Bringer
