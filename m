Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k94L6Ag0020119
	for <linux-lvm@redhat.com>; Wed, 4 Oct 2006 17:06:10 -0400
Received: from smtp.mail.service.medium.net (justchat.medium.net [83.120.2.52])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k94L68PB010849
	for <linux-lvm@redhat.com>; Wed, 4 Oct 2006 17:06:09 -0400
Received: from notebook.local.baldauf.org
	([2001:1b20:1008:2:202:3fff:fe1a:bfb0]
	helo=[IPv6:2001:1b20:1008:2:202:3fff:fe1a:bfb0])
	by smtp.mail.service.medium.net with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.42) id 1GVDwE-0005lA-W0
	for linux-lvm@redhat.com; Wed, 04 Oct 2006 23:06:02 +0200
Message-ID: <4524222F.3060902@baldauf.org>
Date: Wed, 04 Oct 2006 23:05:51 +0200
From: =?ISO-8859-1?Q?Xu=E2n_Baldauf?=
	<xuan--2006.10.04--linux-lvm--redhat.com@baldauf.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Bug in LVM2 tools
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

Hello,

I observed an obscure bug in the current LVM2 tools. Observe this:


# dd if=3D/dev/zero of=3Dtestfile bs=3D1024k count=3D1
1+0 records in
1+0 records out
1048576 bytes (1,0 MB) copied, 0,009037 seconds, 116 MB/s
# losetup /dev/loop4 testfile
# pvcreate /dev/loop4
  Physical volume "/dev/loop4" successfully created
# vgcreate --physicalextentsize=3D1k test.vg /dev/loop4
  Volume group "test.vg" successfully created
# lvcreate --name=3Dtest.lv --size=3D832k test.vg
  Insufficient free extents (640) in volume group test.vg: 832 required
# vgremove test.vg
  Volume group "test.vg" successfully removed
# vgcreate --physicalextentsize=3D1k test.vg /dev/loop4
  Volume group "test.vg" successfully created
# lvcreate --name=3Dtest.lv --size=3D832k test.vg
  Logical volume "test.lv" created
#

I create a file "testfile" of 1024KiB size and view it as /dev/loop4.
Then I create a physical volume on /dev/loop4 and a volume group
"test.vg" covering that physical volume. The metadata needs the first
192KiB. However, I cannot use the remaining 832KiB for a logical volume.
This is the bug.

However, if I remove the volume group "test.vg" and once more create it
again, now the remaining 832KiB are fully usable. This behaviour is
inconsistent.

Analyzing the metadata after the first "vgcreate", one can see that the
pe_count of the physical volume is too small. It seems that there is
space reserved for a second metadata copy at the end of /dev/loop4,
however, no second metadata copy is requrested at the invocation of
"pvcreate".

For me, it is in particuliar important that the first "vgcreate" does
not use any extra space at the end of the block device the physical
volume lives on, as, in my case, the physical volume contains already
data (which is to be made available as a logical volume).

ciao,
Xu=EF=BF=BDn.
