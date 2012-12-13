Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id qBDDWTII029965
	for <linux-lvm@redhat.com>; Thu, 13 Dec 2012 08:32:29 -0500
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qBDDWRhF001148
	for <linux-lvm@redhat.com>; Thu, 13 Dec 2012 08:32:27 -0500
Received: by mail-pa0-f46.google.com with SMTP id bh2so1491881pad.33
	for <linux-lvm@redhat.com>; Thu, 13 Dec 2012 05:32:27 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 13 Dec 2012 14:32:27 +0100
Message-ID: <CAG2kNCw6r7KKOZonGagjCbw9QiftDQOAv5Qn-m8aNnLQUf4sNQ@mail.gmail.com>
From: Gianluca Cecchi <gianluca.cecchi@gmail.com>
Subject: [linux-lvm] Convert striped lv to single pv on another disk?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello,
I have a 300Gb LV composed by 2 150Gb each PV in striping:

lvdisplay:
  --- Logical volume ---
  LV Name                /dev/VG_TEST/LV_TEST
  VG Name                VG_TEST
  LV UUID                9LVrQr-XPSW-kuHt-eyYx-BrlE-MwQh-LcSfhN
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                299.99 GB
  Current LE             76798
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     512
  Block device           253:61

lvdisplay --maps:
  --- Logical volume ---
  LV Name                /dev/VG_TEST/LV_TEST
  VG Name                VG_TEST
  LV UUID                9LVrQr-XPSW-kuHt-eyYx-BrlE-MwQh-LcSfhN
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                299.99 GB
  Current LE             76798
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     512
  Block device           253:61

  --- Segments ---
  Logical extent 0 to 76797:
    Type                striped
    Stripes             2
    Stripe size         64 KB
    Stripe 0:
      Physical volume   /dev/mapper/mpath133
      Physical extents  0 to 38398
    Stripe 1:
      Physical volume   /dev/mapper/mpath134
      Physical extents  0 to 38398

I have to migrate to a single third 400Gb disk that I'm gong to
configure as a further PV of VG_TEST.
How can I pvmove a striped volume to a single one?
Thanks,
Gianluca
