Received: from null.msp.redhat.com (null.msp.redhat.com [172.16.31.120])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id i3QDwrV2018323
	for <linux-lvm@redhat.com>; Mon, 26 Apr 2004 09:58:53 -0400
Received: from null.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by null.msp.redhat.com (8.12.11/8.12.11) with ESMTP id i3QDwrsd017587
	for <linux-lvm@redhat.com>; Mon, 26 Apr 2004 08:58:53 -0500
Received: (from alewis@localhost)
	by null.msp.redhat.com (8.12.11/8.12.11/Submit) id i3QDwrSR017586
	for linux-lvm@redhat.com; Mon, 26 Apr 2004 08:58:53 -0500
Date: Mon, 26 Apr 2004 08:58:53 -0500
From: AJ Lewis <alewis@redhat.com>
Subject: Re: [linux-lvm] 2.6 upgrade - LVM version ? & root partition access
	problems...
Message-ID: <20040426135853.GA17309@null.msp.redhat.com>
References: <408C2883.5080606@sneakemail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Content-Disposition: inline
In-Reply-To: <408C2883.5080606@sneakemail.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 25, 2004 at 11:07:15PM +0200, Peter Valdemar M??rch wrote:
> I'm running on RH9 with what used to be a pretty standard install except
> for a EXT3 LVM root partition and a ReiserFS Software Raid1 /home
> partition. (OK so a  LVM '/' partition is a bad idea. I didn't know that
> then. I do now!)

It's not necessarily a bad idea, it just makes it a lot more tricky in cases
like this.
=20
> I can't boot with my newly compiled 2.6.5 kernel, lvmcreate_initrd
> doesn't work for either 2.4 or 2.6 kernels with my current setup and
> tools, and "lvm version" gives an error (see below)

Someone made a new initrd creation script and posted it here:
http://www.poochiereds.net/svn/lvm2/
I can't guarentee it'll work, but i've heard good things about it.  Use it
against the 2.6.5 kernel you compiled.
=20
> In one of the many guides about 2.6 upgrading I was suggested to upgrade
> to the *.i386.rpms in http://people.redhat.com/arjanv/2.6/RPMS.kernel/
> (The URL seemed to indicate a reputable source for RH9 rpms)
> Among others, I installed
> lvm-1.0.3-17.i386.rpm
> lvm2-2.00.08-2.i386.rpm
> device-mapper-1.00.07-3.1.i386.rpm
>=20
> Now I'm not even sure what LVM version I'm running:
> [root@valde root]# lvm version
>   LVM version:     2.00.08 (2003-11-14)
>   Library version: 1.00.07-ioctl (2003-11-21)
>   /dev/mapper/control: open failed: No such file or directory
>   Is device-mapper driver missing from kernel?

You're using lvm version 2 - however, can you run 'pvscan -V' without the
'lvm' prefix?  If so, you have both tools available to you, and running
'vgchange -ay' again, without the 'lvm' prefix should work just fine for you
in your 2.4 kernel.  If you're booted into your 2.4 kernel, it sounds like
you still have the lvm1 tools and are just fine (lvm1 did *not* have the
'lvm' command)
=20
> In the output, I'm asked:
> "Is device-mapper driver missing from kernel?".
> I don't know. Is it? I'm running a stock 2.4.20-20.9 kernel from redhat
> with the non-stock bridge-nf patch. If device-mapper driver is missing
> from kernel what do I do about that?

Nope, device-mapper is *not* in that kernel.  You either need to upgrade to
a 2.6 kernel, or use the patches that are found in the lvm2 tarball to patch
a 2.4 kernel to contain device-mapper.
=20
> FAQ entry: "I get errors about /dev/mapper/control when I try to use the
> LVM 2 tools" from http://www.tldp.org/HOWTO/LVM-HOWTO/lvm2faq.html#AEN231
> says  "The primary cause of this is not having run the devmap_mknod.sh
> script after rebooting into a dm capable kernel."
> True. I haven't run devmap_mknod.sh. In fact I don't have it on my
> system. It isn't part of any of my lvm* rpms. But am I running "a dm
> capable kernel" yet with my RedHat 2.4.20-20.9 kernel?

If that initrd creation script works for you, you may not need to run the
devmap_mknod.sh script.  However, what the script does is looks in
/proc/misc for a '$some-number device-mapper' entry, and creates
/dev/mapper/control with 'mknod /dev/mapper/control c 10 $some-number', so
you can do that by hand if you like.=20
=20
> It seems I'm now in a chicken-and-egg situation. I can't get
> lvmcreate_initrd to work until I update the kernel to a dm kernel. I
> can't boot into one until I have lvmcreate_initrd (or mkinitrd) working.
>   Hmm...
>=20
> So: Should I
> *) Get, compile, install and run "a dm capable kernel." Which one?

2.6.5 will be fine as long as you don't need snapshots or pvmove.  If you do
need those capabilities right now, grab the lvm2 tarball and a 2.4.26
kernel, and apply the device-mapper kernel patches from the tarball.  You
don't need to use the tarball to install the tools

> *) Accept that installing the lvm2 rpm was a bad idea and install lvm2
> from tarball to get and run devmap_mknod.sh? Anything to watch out for he=
re?

The lvm2 rpm should be fine, you just need to make sure /dev/mapper/control
is created.

> *) Upgrade my /dev/Volume00/LogVol00 to LVM2 somehow?

Don't need to do this

> *) Turn my '/' into a non-LVM volume? How?

Scary.  It's possible, but wait until the above options don't work before
trying it.

> *) Backup all my 90 GB somewhere, reinstall with a fresh 2.6 kernel
> distro and get all my apps & setup working again from scratch? (YIKES!)

Shouldn't need to

> ***************************
>    Boot disk creation?
> ***************************
> I also don't have a good boot disk around with the LVM access. How do I
> create one, now that my tools are messed up but before I loose my system
> forever? Once I have it, how do I test that its working and not
> accessing the lvm tools from the / partition in some sneaky fashion?
> Are all the LVM access tools already in /boot/initrd-2.4.20-20.9.img (It
> does contain e.g. /bin/vgchange)? Am I fine as long as I leave an entry
> for this 2.4.20-20.9 kernel in grub.conf?

Forget this for the moment, let's get the system stabilized first.
=20
> ***************************
>    lvmcreate_initrd
>    seems to not work for me
> ***************************
> OK, so then I thought I'd just put MD, RAID1, EXT3 and REISERFS into the
> kernel instead of as modules and follow the
> http://www.tldp.org/HOWTO/LVM-HOWTO/
> on how to run "lvmcreate_initrd 2.6.5" to create the initrd-lvm file. I
> have not yet succeeded in running lvmcreate_initrd successfully. I
> always get approx 2000 "cpio: No space left on device" errors that
> finish with
> lvmcreate_initrd -- ERROR cpio to ram disk
> (Because of messed up lvm tools?)

This does not work for lvm2.
=20
> If I ignore all of this, and create a 2.6.5 kernel with RAID1, EXT3, LVM
> and REISERFS as modules, and mkinitrd, then when I try to boot it I get:
>=20
> RAMDISK: Compressed image found at block 0
> RAMDISK: incomplete write (-28 !=3D 32768) 4194304
> VFS: Cannot open root device "Volume00/LogVol00" or unknown-block(0,0)
> Please append a correct "root=3D" boot option
> Kernel panic: VFS: Unable to mount root fs on unknown-block(0,0

Yep, need that lvm2-capable initrd.
=20
Well, I've heard good things about the initrd creation script i mentioned at
the beginning, so maybe you could give that a shot first with the 2.6.5
kernel?

Regards,
--=20
AJ Lewis                                   Voice:  612-638-0500
Red Hat Inc.                               E-Mail: alewis@redhat.com
720 Washington Ave. SE, Suite 200
Minneapolis, MN 55414

Current GPG fingerprint =3D FE77 4B43 6A9B F982 A731  02FA 2BF5 7574 294A A=
A5A
Grab the key at: http://people.redhat.com/alewis/gpg.html or one of the
many keyservers out there...
-----Begin Obligatory Humorous Quote----------------------------------------
Mountain Dew... because breakfast is the most important meal of the day.
-----End Obligatory Humorous Quote------------------------------------------

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAjRWc9QxUqFeMhxURArS3AJ9VPclacwGwtXG0a8Vl0oyVG28wrwCfRtUt
No12/giCAH+WPMo/PhX5LWo=
=zT8c
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--
