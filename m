Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i31EoNj16431
	for <linux-lvm@redhat.com>; Thu, 1 Apr 2004 09:50:23 -0500
Received: from mwinf0401.wanadoo.fr (smtp4.wanadoo.fr [193.252.22.27])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i31EoLjj030176
	for <linux-lvm@redhat.com>; Thu, 1 Apr 2004 09:50:22 -0500
Received: from tangerine.coulon.evette
	(ADijon-107-1-21-24.w81-251.abo.wanadoo.fr [81.251.84.24])
	by mwinf0401.wanadoo.fr (SMTP Server) with ESMTP id 8CEE25800101
	for <linux-lvm@redhat.com>; Thu,  1 Apr 2004 16:50:15 +0200 (CEST)
Received: from localhost ([127.0.0.1])
	by tangerine.coulon.evette with esmtp (Exim 4.30) id 1B93WH-0006Nl-Ne
	for linux-lvm@redhat.com; Thu, 01 Apr 2004 16:50:13 +0200
Received: from tangerine.coulon.evette ([127.0.0.1])
	by localhost (tangerine [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 23600-05 for <linux-lvm@redhat.com>;
	Thu, 1 Apr 2004 16:49:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=tangerine)
	by tangerine.coulon.evette with esmtp (Exim 4.30) id 1B93Vy-0006NP-4F
	for linux-lvm@redhat.com; Thu, 01 Apr 2004 16:49:54 +0200
Date: Thu, 1 Apr 2004 16:49:53 +0200
From: "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr>
Subject: =?iso-8859-1?B?UmWg?=
	=?iso-8859-1?Q?=3A?= [linux-lvm] lvm 1 unable to boot
Message-ID: <20040401144953.GC14646@tangerine.coulon.evette>
References: <1080745179.12286.16.camel@lupin.private.cimr.cam.ac.uk>
	<20040331154915.GD27360@tykepenguin.com>
	<1080765764.12286.20.camel@lupin.private.cimr.cam.ac.uk>
	<20040401134833.GG29222@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
	protocol="application/pgp-signature"; boundary="DKU6Jbt7q3WqK7+M"
Content-Disposition: inline
In-Reply-To: <20040401134833.GG29222@redhat.com> (from mauelshagen@redhat.com
	on jeu, avr 01, 2004 at 15:48:33 +0200)
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
To: linux-lvm@redhat.com


--DKU6Jbt7q3WqK7+M
Content-Type: text/plain; Format=Flowed; DelSp=Yes; charset=ISO-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le 01.04.2004 15:48, Heinz Mauelshagen a =E9crit=A0:
>On Wed, Mar 31, 2004 at 09:42:44PM +0100, Geoff Dolman wrote:
>> On Wed, 2004-03-31 at 16:49, Patrick Caulfield wrote:
>> > On Wed, Mar 31, 2004 at 03:59:39PM +0100, Geoff Dolman wrote:
>> > > Hi
>> > >
>> > > I have a machine with the following partition structure:
>> > >
>> > > /dev/sda1 /boot (ext3)
>> > > /dev/sda2 swap
>> > > /dev/sda3 LVM
>> > >
>> > > The LVM (1.03/rh9) contains one PV and this has Volume00 in it
>which
>> > > contains lvs for slash, usr, var, /usr/local and so on...
>> > >
>> > > I rebooted the machine for the first time in ages (same kernel
>> > > configuration as the last reboot and no changes - or very few).
>> > >
>> > > The machine won't reboot - it panics because of a message
>(something)
>> > > like:
>> > >
>> > > vgscan found inactive "Volume00"
>> > > Error 28 Unable to make /etc/lvmtab.d/Volume00/Volume00.tmp
>> > > vg_cfgbackup.c line 273
>> > >
>> >
>> > Error 28 is ENOSPC - your initrd is too small to hold the metadata
>backups.
>>
>> Thanks - but how do I fix this?
>
>Append the kernel boot parameter "ramdisk_size=3D" and give a size in
>kilobytes
>(eg, 'ramdisk_size=3D16384' makes 16MB ram disks.

I don't think so. It is not the ramdisk size which has a problem but =20
the filesystem created to support the initrd files (/dev, /etc, =20
modules, scripts, ...). The size of this filesystem is fixed while =20
creating the initrd.

At boot time, lvm want to write some files in /etc (lvmtab and lvmtab.=20
d). While in the boot process and in the ramdisk, the /etc is part of =20
this filesystem. If there is not enough room on it, lvm crashes.

lvmcreate_initrd computes the needed space.

I tried to mount via the loopback an initrd created with =20
lvmcreate_initrd, add the stuff needed to have xfs and I got short on =20
the filesystem.... The ramdisk was 8Mo and the initrd about 6Mb...

--
Regards
			- Jean-Luc
--DKU6Jbt7q3WqK7+M
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBAbCwRUdGGXzzGnNARAvLbAJ4xkqKCxqbUUMU0R9eK+iMJgXrvXQCfeouX
Pxvr4PhQJ8h9om6J2Yb5+pw=
=BFOZ
-----END PGP SIGNATURE-----

--DKU6Jbt7q3WqK7+M--
