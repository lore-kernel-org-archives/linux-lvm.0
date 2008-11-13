Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mADDjXrZ028019
	for <linux-lvm@redhat.com>; Thu, 13 Nov 2008 08:45:33 -0500
Received: from mail.knebb.de (mail.knebb.de [83.137.99.149])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mADDiWIs003470
	for <linux-lvm@redhat.com>; Thu, 13 Nov 2008 08:44:33 -0500
Received: from tp.knebb.de (p54BC6088.dip.t-dialin.net [84.188.96.136])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by mail.knebb.de (Postfix) with ESMTP id 4C6C3FA06
	for <linux-lvm@redhat.com>; Thu, 13 Nov 2008 14:44:31 +0100 (CET)
Message-ID: <491C2F3E.7020700@knebb.de>
Date: Thu, 13 Nov 2008 14:44:30 +0100
From: =?ISO-8859-1?Q?Christian_V=F6lker?= <chrischan@knebb.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvmove --abort does nothing
References: <491BF3CF.2090800@knebb.de>	<C9F9ED04-6B26-4681-9D1D-46017DD7CF41@redhat.com>	<491C019F.6060205@knebb.de>
	<361513C7-BBE2-45D0-A6BA-F42E6219706A@redhat.com>
In-Reply-To: <361513C7-BBE2-45D0-A6BA-F42E6219706A@redhat.com>
Content-Transfer-Encoding: 7bit
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Yohoo!

Ingoring the existing pvmove0 LV i tried to pvmove the remaining PEs
away. Suddenly I got the following error and the pvmove aborted gracefully.

What is happening here?
Should I try to create a new VG?

/dev/sdf1: Moved: 74.5%
  /dev/sda5: Checksum error
  /dev/sdb1: Checksum error
  /dev/sdc1: Checksum error
  /dev/sdd1: Checksum error
  /dev/sde1: Checksum error
  /dev/sdf1: Checksum error
  /dev/sdg1: Checksum error
  /dev/sda5: Checksum error
  Couldn't read volume group metadata.
  /dev/sdb1: Checksum error
  Couldn't read volume group metadata.
  /dev/sdc1: Checksum error
  Couldn't read volume group metadata.
  /dev/sdd1: Checksum error
  Couldn't read volume group metadata.
  /dev/sde1: Checksum error
  Couldn't read volume group metadata.
  /dev/sdf1: Checksum error
  Couldn't read volume group metadata.
  /dev/sdg1: Checksum error
  Couldn't read volume group metadata.
  Volume group for uuid not found:
CJm32iLS51x5Had2WODRuk1FMODIuU1DsUbvsOrL7RapA

sTiXHi63CLXidYfYluP
  Unable to reactivate logical volume "pvmove1"
  /dev/sda5: Checksum error
  /dev/sdb1: Checksum error
  /dev/sdc1: Checksum error
  /dev/sdd1: Checksum error
  /dev/sde1: Checksum error
  /dev/sdf1: Checksum error
  /dev/sdg1: Checksum error
  /dev/sda5: Checksum error
  Couldn't read volume group metadata.
  /dev/sdb1: Checksum error
  Couldn't read volume group metadata.
  /dev/sdc1: Checksum error
  Couldn't read volume group metadata.
  /dev/sdd1: Checksum error
  Couldn't read volume group metadata.
  /dev/sde1: Checksum error
  Couldn't read volume group metadata.
  /dev/sdf1: Checksum error
  Couldn't read volume group metadata.
  /dev/sdg1: Checksum error
  Couldn't read volume group metadata.
  Volume group for uuid not found:
CJm32iLS51x5Had2WODRuk1FMODIuU1DZOGY8X7HYx1u6

IPJJjpM6K0vnrV5ZwVy
  ABORTING: Segment progression failed.
  /dev/sda5: Checksum error
  /dev/sdb1: Checksum error
  /dev/sdc1: Checksum error
  /dev/sdd1: Checksum error
  /dev/sde1: Checksum error
  /dev/sdf1: Checksum error
  /dev/sdg1: Checksum error
  /dev/sda5: Checksum error
  Couldn't read volume group metadata.
  /dev/sdb1: Checksum error
  Couldn't read volume group metadata.
  /dev/sdc1: Checksum error
  Couldn't read volume group metadata.
  /dev/sdd1: Checksum error
  Couldn't read volume group metadata.
  /dev/sde1: Checksum error
  Couldn't read volume group metadata.
  /dev/sdf1: Checksum error
  Couldn't read volume group metadata.
  /dev/sdg1: Checksum error
  Couldn't read volume group metadata.
  Volume group for uuid not found:
CJm32iLS51x5Had2WODRuk1FMODIuU1DZOGY8X7HYx1u6IPJJjpM6K0vnrV5ZwVy
  Failed to suspend minidv
  Locking LVs to remove temporary mirror failed
  /dev/sda5: Checksum error
  /dev/sdb1: Checksum error
  /dev/sdc1: Checksum error
  /dev/sdd1: Checksum error
  /dev/sde1: Checksum error
  /dev/sdf1: Checksum error
  /dev/sdg1: Checksum error
  /dev/sda5: Checksum error
  Couldn't read volume group metadata.
  /dev/sdb1: Checksum error
  Couldn't read volume group metadata.
  /dev/sdc1: Checksum error
  Couldn't read volume group metadata.
  /dev/sdd1: Checksum error
  Couldn't read volume group metadata.
  /dev/sde1: Checksum error
  Couldn't read volume group metadata.
  /dev/sdf1: Checksum error
  Couldn't read volume group metadata.
  /dev/sdg1: Checksum error
  Couldn't read volume group metadata.
  Volume group for uuid not found:
CJm32iLS51x5Had2WODRuk1FMODIuU1DsUbvsOrL7RapAsTiXHi63CLXidYfYluP
  Suspension of temporary mirror LV failed
  Volume group vg1 metadata is inconsistent
  Volume group for uuid not found:
CJm32iLS51x5Had2WODRuk1FMODIuU1DsUbvsOrL7RapAsTiXHi63CLXidYfYluP
  ABORTING: Unable to deactivate temporary logical volume "pvmove1"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFJHC8+0XNIYlAXmzsRAsHMAJ9Xtby9snSkQMfw1cgoPx2qWNmrHQCbBYfJ
gpwitsUqLNr42lTP/bIZNJ4=
=sPVz
-----END PGP SIGNATURE-----
