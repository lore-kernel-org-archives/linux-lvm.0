Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lBJ8uBR6008121
	for <linux-lvm@redhat.com>; Wed, 19 Dec 2007 03:56:11 -0500
Received: from mx.lectra.com (mx.lectra.com [195.115.79.115])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lBJ8tnKD012272
	for <linux-lvm@redhat.com>; Wed, 19 Dec 2007 03:55:50 -0500
From: Naslain Christophe <c.naslain@lectra.com>
Content-Class: urn:content-classes:message
Date: Wed, 19 Dec 2007 09:55:42 +0100
Subject: RE: [linux-lvm] Resize LVM2 partition under VMware
Message-ID: <73BD1CEC958A564DB6771C5E97339F280167D03C@SMAIL.eu.lectra.com>
References: <73BD1CEC958A564DB6771C5E97339F280167D03B@SMAIL.eu.lectra.com>
	<47684253.4000404@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi David,
Thank a lot for the info, that works fine:

[root@devcentos5 ~]# vgdisplay VolGroup00
  --- Volume group ---
  VG Name               VolGroup00
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  3
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                2
  Open LV               2
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               19.88 GB
  PE Size               32.00 MB
  Total PE              636
  Alloc PE / Size       636 / 19.88 GB
  Free  PE / Size       0 / 0
  VG UUID               Ix1XeP-LzJ0-3SEX-wMJ2-I4Im-2gWv-WCAgWm

[root@devcentos5 ~]# pvresize /dev/sda2
  Physical volume "/dev/sda2" changed
  1 physical volume(s) resized / 0 physical volume(s) not resized

Then I used system-config-lvm to resize the logical volume.

Best,

Chris
