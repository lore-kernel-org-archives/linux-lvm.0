Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iA7DxYr18230
	for <linux-lvm@redhat.com>; Sun, 7 Nov 2004 08:59:34 -0500
Received: from mta.hosting-seguridad.com (mta.hosting-seguridad.com
	[207.150.162.14])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iA7DxWI7023888
	for <linux-lvm@redhat.com>; Sun, 7 Nov 2004 08:59:33 -0500
Received: from localhost (localhost [127.0.0.1])
	by mta.hosting-seguridad.com (Postfix) with ESMTP id 2B46A60054
	for <linux-lvm@redhat.com>; Sun,  7 Nov 2004 14:59:27 +0100 (CET)
Received: from skorpio (unknown [80.103.233.117])
	by mta.hosting-seguridad.com (Postfix) with ESMTP id 6494F60050
	for <linux-lvm@redhat.com>; Sun,  7 Nov 2004 14:59:23 +0100 (CET)
From: Roman Medina-Heigl Hernandez <roman@rs-labs.com>
Date: Sun, 07 Nov 2004 15:01:10 +0100
Message-ID: <tk9so0di0jsl44dagc1dl8at6e9ld4r1be@4ax.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Creating PV over a /dev/mapper device
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


Hi,

I need to create a PV over a /dev/mapper device in order to create a
crypted LVM system (*) on a Debian Woody with 2.6.9 kernel.

I encrypted a partition (/dev/hda10) using DM-Crypt, getting
/dev/mapper/crypt10 device.

When trying to create PV, I got the following error:
jupiter:/# pvcreate /dev/mapper/crypt10
  /dev/mapper/crypt10: Couldn't find device.

I know how to temporaly fix the problem by adding the device to
/etc/lvm/.cache. But the problem is that I couldn't get it to be
permanent. I did several tests modifying /etc/lvm/lvm.conf and
re-running "vgchange" to re-read changes, but it didn't work.

I've tried different  lvm.conf configs like:

filter = [ "a|/dev/mapper/crypt.*|" ]
(cause I'd like to have crypt10, crypt11 and so on)

filter = [ "a|/dev/mapper/crypt10|" ]

filter = [ "a/.*/" ]

I mixed them with other directives like:
scan = [ "/dev" ]

scan = [ "/dev/mapper" ]

scan = [ "/dev/mapper" "/dev" ]


Nevertheless, when running vgscan, .cache is re-built without my crypt
device. What am I doing wrong? Is there any limitation on devices
scanned by vgscan?

I'm using this version of LVM:
jupiter:/# lvm version
  LVM version:     2.00.21 (2004-08-19)
  Library version: 1.00.15-ioctl (2004-04-07)
  Driver version:  4.1.0


(*) My idea of Crypted LVM system is to have crypted PVs and then
building LVM over them. This way I got total flexibility provided by
LVM and the security based on encryption (eg: I can extend/reduce a
live&mounted crypted fs on-the-fly). Anyone using a similar setup and
could/want to provide more ideas or feeback about this?

 Saludos,
 --Roman

--
PGP Fingerprint:
09BB EFCD 21ED 4E79 25FB  29E1 E47F 8A7D EAD5 6742
[Key ID: 0xEAD56742. Available at KeyServ]
