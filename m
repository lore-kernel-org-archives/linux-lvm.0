Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r0R7DImf023881
	for <linux-lvm@redhat.com>; Sun, 27 Jan 2013 02:13:18 -0500
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0R7DGsP008855
	for <linux-lvm@redhat.com>; Sun, 27 Jan 2013 02:13:17 -0500
Received: by mail-ea0-f182.google.com with SMTP id a12so705383eaa.27
	for <linux-lvm@redhat.com>; Sat, 26 Jan 2013 23:13:16 -0800 (PST)
MIME-Version: 1.0
Date: Sun, 27 Jan 2013 07:13:16 +0000
Message-ID: <CAOS+5GEXDTX2eWyY2PX5xiU+qn1RsBLpj5W_rbCW6SR8S7GVDA@mail.gmail.com>
From: Another Sillyname <anothersname@googlemail.com>
Subject: [linux-lvm] Just to add some further info to my previous
	post........
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

user@machine ~ $sudo pvscan
  PV /dev/sdb5   VG lvmdevice   lvm2 [502.22 GiB / 107.22 GiB free]
  Total: 1 [502.22 GiB] / in use: 1 [502.22 GiB] / in no VG: 0 [0   ]

user@machine ~ $sudo vgdisplay
  --- Volume group ---
  VG Name               lvmdevice
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  10
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               0
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               502.22 GiB
  PE Size               32.00 MiB
  Total PE              16071
  Alloc PE / Size       12640 / 395.00 GiB
  Free  PE / Size       3431 / 107.22 GiB
  VG UUID               longguidkey

user@machine ~ $sudo lvs
  LV      VG          Attr     LSize   Pool Origin Data%  Move Log
Copy%  Convert
  lv_root lvmdevice -wi-a--- 395.00g

user@machine ~ $sudo lvdisplay
  --- Logical volume ---
  LV Path                /dev/lvmdevice/lv_root
  LV Name                lv_root
  VG Name                lvmdevice
  LV UUID                longguidkey
  LV Write Access        read/write
  LV Creation host, time ,
  LV Status              available
  # open                 0
  LV Size                395.00 GiB
  Current LE             12640
  Segments               3
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           252:0

Any ideas how to fix this appreciated.
