Date: Wed, 3 May 2000 16:01:39 -0500
From: "Eric M. Hopper" <hopper@omnifarious.mn.org>
Subject: Re: [linux-lvm] SuSE/LVM boot problem
Message-ID: <20000503160139.A861@omnifarious.mn.org>
References: <200005031809.e43I93R26551@webber.adilger.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
In-Reply-To: <200005031809.e43I93R26551@webber.adilger.net>; from adilger@turbolabs.com on Wed, May 03, 2000 at 12:09:03PM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: Linux LVM mailing list <linux-lvm@msede.com>


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

On Wed, May 03, 2000 at 12:09:03PM -0600, Andreas Dilger wrote:
>=20
>> Yes. Would it be reasonable to have LVM tools check for this and warn
>> the user?

	One idea for making this happens is to have a way of locking
logical extents to physical extents so that you have to use a special
command to unlock them.  This kind of thing is already done in different
parts of LVM to make sure you don't delete logical volumes that are in
use, or remove physical volumes that still have extents allocated to
them.

	One this exists, altering lilo to detect LVM, and automatically
lock the necessary logical->physical extent mappings isn't too hard.

> You need to re-run LILO even if you move the kernel on a regular
> filesystem, so I don't think it's that important if LVM doesn't warn
> you about this.  How often do you move LVs around anyways?  If you
> keep them in your /boot LV and it's only a couple of PPs in size, it
> shouldn't be an issue.  Under AIX, you are forced to have your boot LV
> contiguous (which I think LILO doesn't need, as long as it is a single
> disk), and you are still required to run "bosboot" if you move or
> mirror your BLV.

	Well, the problem is that moving a few physical extents does not
obviously suggest re-running lilo.  Many physical extents are fine to
move, and trying to keep track of which physical extents lilo cares
about, and which one's it doesn't isn't a task I think a sysadmin should
have to deal with.

	The locking mechanism makes a sysadmin aware of when they're
moving something that lilo (or some other program that maintained
information about where stuff physically was) cared about, and re-run
the necssary utilities so than can regather the information they need.

> How does LILO do this now?  It currently gets a filename for the
> kernel, and that's it.  It must do some sort of internal calculation
> or IOCTL to get the physical block numbers on the disk.  Is the
> problem that it does its calculations w.r.t. the start of the
> partition?

	That's an interesting question, and I'm curious about it.  I
believe this also has implications for reiserfs /boot partitions.

>>  - the kernel needs to be able to reconstruct enough of the lvm
>>    descriptors to mount / at boot time.

	I don't believe this is a problem.  There is already something
called lvm_initrd that creates a ramdisk to load the lvm modules and
build the lvm devices so root can be mounted from an lvm device.  It
could be improved, but I have a suspicion this isn't a big problem.

	While I expected that /boot would have to be ext2fs, and
allocated a very generous 50M to it, I purposely compiled lvm into the
kernel in the hopes of one day having an lvm / parition.  Of course,
resizing an lvm / partition is a dicey affair.  :-)

> I think I need to dig a bit more into the LILO code to see what's
> really happening there.

	I think so too.  Sadly, though I have time to post here, I don't
have time to dig into lilo.

Have fun (if at all possible),
--=20
Its name is Public Opinion.  It is held in reverence. It settles everything.
Some think it is the voice of God.  Loyalty to petrified opinion never yet
broke a chain or freed a human soul.     ---Mark Twain
-- Eric Hopper (hopper@omnifarious.mn.org  http://omnifarious.mn.org/~hoppe=
r) --

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.1 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE5EJOzG4QeWBeRdS8RAhWHAKDCDwQpvzYPpZRs2iEnTMqXp6f/mACfVPM8
RhNj5KGOcObLV7Bj7nIXw6c=
=22Ge
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
