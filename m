Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jAJMCsV13423
	for <linux-lvm@redhat.com>; Sat, 19 Nov 2005 17:12:54 -0500
Received: from viefep17-int.chello.at (viefep17-int.chello.at [213.46.255.23])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jAJMCqE0011367
	for <linux-lvm@redhat.com>; Sat, 19 Nov 2005 17:12:52 -0500
Received: from AthLux.PrivateLAN.at ([84.114.151.31]) by viefep17-int.chello.at
	(InterMail vM.6.01.04.04 201-2131-118-104-20050224) with ESMTP id
	<20051119221246.DLLD1788.viefep17-int.chello.at@AthLux.PrivateLAN.at>
	for <linux-lvm@redhat.com>; Sat, 19 Nov 2005 23:12:46 +0100
From: Matthias Meyer <Matthias.Meyer@gmx.li>
Date: Sat, 19 Nov 2005 23:12:49 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200511192312.49547.Matthias.Meyer@gmx.li>
Subject: [linux-lvm] can't remove volume group
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hello,

I have a volume group with one physical volume and I can't remove this 
volume group :-(

vdr:~# vgdisplay LVM2
--- Volume group ---
VG Name               LVM2
VG Access             read/write
VG Status             available/resizable
VG #                  1
MAX LV                256
Cur LV                0
Open LV               0
MAX LV Size           2 TB
Max PV                256
Cur PV                1
Act PV                1
VG Size               92.75 GB
PE Size               256 MB
Total PE              371
Alloc PE / Size       0 / 0
Free  PE / Size       371 / 92.75 GB
VG UUID               2Oojws-3owd-iK1X-wbpy-Mx9X-CieY-7JN0b0

vdr:~# vgreduce LVM2 /dev/hdd1
vgreduce -- can't reduce volume group "LVM2" to zero physical volumes

vdr:~# vgremove LVM2
vgremove -- ERROR: can't remove active volume group "LVM2"

What I have to do?

Thanks in advance
Matthias
-- 
Don't Panic
