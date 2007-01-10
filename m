Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l0AGWjr5006364
	for <linux-lvm@redhat.com>; Wed, 10 Jan 2007 11:32:46 -0500
Received: from smtp-b1.antel.net.uy (smtp-b1.antel.net.uy [200.40.30.224])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l0AGWiTD017026
	for <linux-lvm@redhat.com>; Wed, 10 Jan 2007 11:32:44 -0500
Received: from [192.168.0.16] (200.40.82.186) by smtp-b1.antel.net.uy
	(7.2.072.1) (authenticated as arle)
	id 456AF1820319A61F for linux-lvm@redhat.com;
	Wed, 10 Jan 2007 13:51:13 -0200
Message-ID: <45A5194D.5070501@adinet.com.uy>
Date: Wed, 10 Jan 2007 13:50:21 -0300
From: =?UTF-8?B?QXJsZXF1w61u?= <arle@adinet.com.uy>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] fsck.ext3 truncates boot sequence
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@redhat.com

Hello, list.

I've a LVM working OK. I plugged an externar USB harddisk and Linux=20
emulates SCSCI, so it is seen as /dev/sdc1

I formated it as ext3 and the added it as a new Physical Volume in order=20
to gaim more disk space. Then, create a new logical volume, say=20
<LOGICAL_VOLUME_**new**> and was up'n'running OK.

I assume that the USB device is recognized before LVM mount, since the=20
boot sequence:

   Setting up LVM Volume Groups ...done
   Starting Enterprise Volume Management System ...done
   Checking all file systems

      fsck.ext3 Bad magic number in super-block while trying to open
/dev/sdc1

      the superblock could not be read or does not describe a correct
ext2 filesystem. if the device is valid and it really contains an ext2
filesystem (and not swap ou ufs or something else), then the superblock
is corrupt, and you might try running e2fsck with an alternate superblock:
e2fsck - 8193 <device>

/dev/<VOLUME_GROUP>/<LOGICAL_VOLUME_**new**> clean

    fsck failed Please repair manually


Freezes there and only can continue starting the system using Ctrl+D.
Please note that after that the system works just fine, LVM & USB device=20
included.

Tried to run fsck.ext on that parition and says it's clean.

What am I missing to solve?
How can I avoid the boot sequence being stopped?

Thanks in advance. Cheers.
--=20
Arlequ=C3=ADn                         _o)
arle_AT_adinet_DOT_com_DOT_uy    / \\
http://counter.li.org/         _(___V
Linux Registered User          #207262
