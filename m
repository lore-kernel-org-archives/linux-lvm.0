Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i7U7El304644
	for <linux-lvm@redhat.com>; Mon, 30 Aug 2004 03:14:47 -0400
Received: from hotmail.com (bay13-dav11.bay13.hotmail.com [64.4.31.185])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i7U7Efbo009725
	for <linux-lvm@redhat.com>; Mon, 30 Aug 2004 03:14:42 -0400
From: "Benjamin Runnels" <krav3n@hotmail.com>
Date: Sun, 29 Aug 2004 22:49:06 -0500
Message-ID: <000001c48e44$4c38d5d0$1400000a@nforce>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <1093728865.4130fa61689cf@sms.ed.ac.uk>
Subject: [linux-lvm] Why do I only have 11.51GB Free PE's when DF says I
	have 441GB free in the volume?
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

Anyone know how I can free up some PE's so I can do pvmove on a 160gb PV I
think may be failing?



p4:~ # vgdisplay
  --- Volume group ---
  VG Name               solar
  System ID             
  Format                lvm2
  Metadata Areas        6
  Metadata Sequence No  20
  VG Access             read/write
  VG Status             resizable
  MAX LV                256
  Cur LV                1
  Open LV               1
  Max PV                256
  Cur PV                6
  Act PV                6
  VG Size               1.01 TB
  PE Size               4.00 MB
  Total PE              265091
  Alloc PE / Size       262144 / 1.00 TB
  Free  PE / Size       2947 / 11.51 GB
  VG UUID               nEwuBX-aKsk-gFIb-DrqQ-zREN-33SE-R09Q4b
   
p4:~ # df
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/hda2             38569376  11102844  27466532  29% /
tmpfs                   128216         4    128212   1% /dev/shm
/dev/mapper/solar-saturn
                     1073709052 632227192 441481860  59% /media/saturn
