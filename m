Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 73D32308BDA3
	for <linux-lvm@redhat.com>; Thu, 26 Jul 2018 00:41:58 +0000 (UTC)
Received: from mail1.merlins.org (magic.merlins.org [209.81.13.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 69FCE3084037
	for <linux-lvm@redhat.com>; Thu, 26 Jul 2018 00:41:57 +0000 (UTC)
Date: Wed, 25 Jul 2018 17:41:54 -0700
From: Marc MERLIN <marc@merlins.org>
Message-ID: <20180726004154.xcdjyqv7tkdfpvca@merlins.org>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Can't create thin lv
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

Howdy,

Kernel 4.17, trying thin LV for the first time, and I'm getting this:
gargamel:~# lvcreate -L 14.50TiB -Zn -T vgds2/thinpool2 
  Using default stripesize 64.00 KiB.
  Thin pool volume with chunk size 8.00 MiB can address at most <1.98 PiB of data.
  /dev/mapper/vgds2-thinpool2_tmeta: open failed: No such file or directory
  Failed to activate new LV.

any idea what I should try next?

gargamel:~# vgdisplay
  --- Volume group ---
  VG Name               vgds2
  System ID             
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  32
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                0
  Open LV               0
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               14.55 TiB
  PE Size               4.00 MiB
  Total PE              3815316
  Alloc PE / Size       0 / 0   
  Free  PE / Size       3815316 / 14.55 TiB
  VG UUID               pc1cTH-kFo7-g0Kz-dELp-j51s-1yOO-v20WIV
   
gargamel:~# lvdisplay
gargamel:~# 


Thanks,
Marc
-- 
"A mouse is a device used to point@the xterm you want to type in" - A.S.R.
Microsoft is to operating systems ....
                                      .... what McDonalds is to gourmet cooking
Home page: http://marc.merlins.org/                       | PGP 7F55D5F27AAF9D08
