Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2OBfsoF005978
	for <linux-lvm@redhat.com>; Tue, 24 Mar 2009 07:41:54 -0400
Received: from mail-bw0-f170.google.com (mail-bw0-f170.google.com
	[209.85.218.170])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n2OBe92a008280
	for <linux-lvm@redhat.com>; Tue, 24 Mar 2009 07:40:35 -0400
Received: by mail-bw0-f170.google.com with SMTP id 18so2117170bwz.3
	for <linux-lvm@redhat.com>; Tue, 24 Mar 2009 04:40:35 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 24 Mar 2009 12:40:34 +0100
Message-ID: <af3e5b60903240440q671356f5xd4e8e8c92ace8a56@mail.gmail.com>
From: Sascha Thomas Spreitzer <sascha@spreitzer.name>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] lvm mirror read performance, no load balance with PV ?
Reply-To: sascha@spreitzer.name,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Hello mailing list,

I currently sensed that LVM2 is not load balancing reads of mirrored
LV's form their corresponding PV.

PV1     PV2
LV        LV'
IO=0    IO=90MB/s

[~]# lvm version
  LVM version:     2.02.39 (2008-06-27)
  Library version: 1.02.27 (2008-06-25)
  Driver version:  4.14.0

Distribution is Fedora 10, updated.

Is this normal behaviour, or did a make a big mistake in my configuration?

FYI:

[~]# pvs -o+lv_name,lv_size,lv_attr
  PV         VG         Fmt  Attr PSize   PFree LV                LSize   Attr
  /dev/sda2  VolGroup00 lvm2 a-   145,22G 4,97G [lvroot_mlog]      32,00M lwi-ao
  /dev/sda2  VolGroup00 lvm2 a-   145,22G 4,97G [lvhome_mlog]      32,00M lwi-ao
  /dev/sda2  VolGroup00 lvm2 a-   145,22G 4,97G lvdata            285,50G -wi-ao
  /dev/sda2  VolGroup00 lvm2 a-   145,22G 4,97G [lvswap_mlog]      32,00M lwi-ao
  /dev/sda2  VolGroup00 lvm2 a-   145,22G 4,97G                        0
  /dev/sda3  VolGroup00 lvm2 a-   553,28G    0  [lvswap_mimage_1]   5,03G iwi-ao
  /dev/sda3  VolGroup00 lvm2 a-   553,28G    0  [lvroot_mimage_1]  15,00G iwi-ao
  /dev/sda3  VolGroup00 lvm2 a-   553,28G    0  [lvhome_mimage_1] 533,25G iwi-ao
  /dev/sdb1  VolGroup00 lvm2 a-   698,62G    0  [lvswap_mimage_0]   5,03G iwi-ao
  /dev/sdb1  VolGroup00 lvm2 a-   698,62G    0  [lvroot_mimage_0]  15,00G iwi-ao
  /dev/sdb1  VolGroup00 lvm2 a-   698,62G    0  [lvhome_mimage_0] 533,25G iwi-ao
  /dev/sdb1  VolGroup00 lvm2 a-   698,62G    0  lvdata            285,50G -wi-ao

-- 
Mit freundlichen Gr��en, / with kind regards,
Sascha Thomas Spreitzer
http://spreitzer.name/
