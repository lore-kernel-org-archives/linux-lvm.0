Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5C0DA003103
	for <linux-lvm@redhat.com>; Fri, 11 Jun 2004 20:13:10 -0400
Received: from pd5mo3so.prod.shaw.ca (shawidc-mo1.cg.shawcable.net
	[24.71.223.10])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i5C0D9i5009681
	for <linux-lvm@redhat.com>; Fri, 11 Jun 2004 20:13:09 -0400
Received: from pd3mr7so.prod.shaw.ca (pd3mr7so-qfe3.prod.shaw.ca [10.0.141.23])
	by l-daemon (iPlanet Messaging Server 5.2 HotFix 1.18 (built Jul 28
	2003))
	with ESMTP id <0HZ600H9F5NV1K@l-daemon> for linux-lvm@redhat.com; Fri,
	11 Jun 2004 18:07:07 -0600 (MDT)
Received: from pn2ml4so.prod.shaw.ca ([10.0.121.148])
	by pd3mr7so.prod.shaw.ca (Sun ONE Messaging Server 6.0 HotFix 1.01
	(built Mar
	15 2004)) with ESMTP id <0HZ600DB05NVLJ70@pd3mr7so.prod.shaw.ca> for
	linux-lvm@redhat.com; Fri, 11 Jun 2004 18:07:07 -0600 (MDT)
Received: from tyler (S010600485485bc00.cg.shawcable.net [68.146.152.115])
	by l-daemon (iPlanet Messaging Server 5.2 HotFix 1.18 (built Jul 28
	2003))
	with ESMTP id <0HZ600B8C5NVF4@l-daemon> for linux-lvm@redhat.com; Fri,
	11 Jun 2004 18:07:07 -0600 (MDT)
Date: Fri, 11 Jun 2004 18:07:07 -0600
From: Tyler <tyler@tylercentral.com>
Message-id: <0HZ600B8D5NVF4@l-daemon>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Subject: [linux-lvm] Stripes and PE's
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

I'm having problems creating a logical volume on a 4 disk SCSI volume group.
I want to use the entire space as 1 LV that is striped, but can't seem to do
it.

I get an error telling me I don't have enough Physical Extents, when I
clearly do.

livecd root # vgdisplay
  --- Volume group ---
  VG Name               group
  System ID
  Format                lvm2
  Metadata Areas        4
  Metadata Sequence No  1
  VG Access             read/write
  VG Status             resizable
  MAX LV                255
  Cur LV                0
  Open LV               0
  Max PV                255
  Cur PV                4
  Act PV                4
  VG Size               13.91 GB
  PE Size               4.00 MB
  Total PE              3560
  Alloc PE / Size       0 / 0
  Free  PE / Size       3560 / 13.91 GB
  VG UUID               DjxWid-oxqx-zol9-Lu8a-CO94-AsBn-c7k3le

livecd root # lvcreate -i4 -I16 -l3560 -nstorage group
  Insufficient allocatable extents suitable for striping for logical volume
storage: 3560 required
livecd root # lvcreate -i4 -I16 -l3000 -nstorage group
  Insufficient allocatable extents suitable for striping for logical volume
storage: 3000 required

Even if I try to use less space then it says I have, it still wont let me.

I've had this error before, but never found a solution.  I also have not
found the solution on the mailing list archives either.  I can create a
contiguous LV, but without striping.  I'd like to have it striped if I
could.

What am I doing wrong?

Tyler
