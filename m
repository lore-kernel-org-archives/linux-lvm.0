Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k298xc127659
	for <linux-lvm@redhat.com>; Thu, 9 Mar 2006 03:59:38 -0500
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id k298xRLY008398
	for <linux-lvm@redhat.com>; Thu, 9 Mar 2006 03:59:28 -0500
Date: Thu, 9 Mar 2006 09:59:22 +0100 (MET)
From: "Axel Braun" <Axel.Braun@gmx.de>
MIME-Version: 1.0
Message-ID: <4248.1141894762@www078.gmx.net>
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] LVM2 on a USB-disk/ same VG name
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

Hello experts,

I need your advice to save some data: My old laptop died, but I could make
the HD work again via a USB-adapter. I attached it to the new Laptop (as
well running SuSE 10.0 / lvm2), and the lvm on the USB-Disk is not
displayed.

The lvm on the installed system is active:
z60m:~ # pvdisplay /dev/sda8
  --- Physical volume ---
  PV Name               /dev/sda8
  VG Name               system
  PV Size               28.75 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              7359
  Free PE               11
  Allocated PE          7348
  PV UUID               ZdwaLr-anXc-Z7ck-cGI0-oFoW-UluI-F7SZ18

This group is also active:
z60m:~ # lvscan
  ACTIVE            '/dev/system/daten' [12.70 GB] inherit
  ACTIVE            '/dev/system/home' [8.00 GB] inherit
  ACTIVE            '/dev/system/root' [8.00 GB] inherit

Now, on the USB-disk is a LVM as well:
z60m:~ # pvdisplay /dev/sdb8
  --- Physical volume ---
  PV Name               /dev/sdb8
  VG Name               system
  PV Size               17.48 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              4475
  Free PE               9
  Allocated PE          4466
  PV UUID               P8KDPg-QbME-4Hzc-lw8G-ntOA-1dIv-1DeXmR

vgscan does not activate the group on the USB - due to the same name?
z60m:~ #  vgchange -a y
  3 logical volume(s) in volume group "system" now active
z60m:~ # pvscan
  PV /dev/sda8   VG system   lvm2 [28.75 GB / 44.00 MB free]
  Total: 1 [28.75 GB] / in use: 1 [28.75 GB] / in no VG: 0 [0   ]
z60m:~ # lvscan
  ACTIVE            '/dev/system/daten' [12.70 GB] inherit
  ACTIVE            '/dev/system/home' [8.00 GB] inherit
  ACTIVE            '/dev/system/root' [8.00 GB] inherit

What is your proposal to activate the USB-lvm group - best without loosing
data.....

TIA
Axel

--=20
"Feel free" mit GMX FreeMail!
Monat f=EF=BF=BDr Monat 10 FreeSMS inklusive! http://www.gmx.net
