Return-Path: <lewis@sistina.com>
Date: Fri, 23 Feb 2001 10:26:17 -0600
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Patch needed for kernel 2.4.2 ?
Message-ID: <20010223102617.D12979@sistina.com>
References: <Pine.SOL.4.31.0102221208260.25773-100000@herald.cc.purdue.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1sNVjLsmu1MXqwQ/"
Content-Disposition: inline
In-Reply-To: <Pine.SOL.4.31.0102221208260.25773-100000@herald.cc.purdue.edu>; from rajak@purdue.edu on Thu, Feb 22, 2001 at 12:23:53PM -0500
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--1sNVjLsmu1MXqwQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2001 at 12:23:53PM -0500, Brian Poole wrote:
> First of all, thanks for all the hard work ;) I've been running LVM on a
> production server for over 6 months now and never have had it fail on me.

Great!

> Getting to the point, I'm upgrading hardware on my server & I intend to
> upgrade the kernel from 2.4.0-test7 to 2.4.2 as well, as I have to add
> some drivers anyways I might as well get the bug fixes in. My question is
> do I have to patch anything in the kernel for LVM? I notice that the
> README in beta 5, which I assume I should be upgrading to, has a bit of
> info about patches, but looking in PATCHES/ there are only patches for
> 2.4.1, as 2.4.2 hadn't been released at the time. Have these patches
> already been incorporated into 2.4.2, or if not, will they still apply
> cleanly to 2.4.2 and are they needed?

Read the README in the PATCHES directory.  This explains how to generate a
patch for your kernel.  And yes, you do need to patch the kernel.  The IOP
version was reved to 11, and the 2.4.2 kernel still has 0.9.1 Beta2 LVM
code, which is IOP 10, so the Beta5 tools will not work with it.

> Any other tips, hints and tricks would be appreciated for this upgrade.
> Moving to 0.8 final -> 0.9 beta 5a, adding new drives to the VG,
> expanding the LV and the FS and I must say, I'm a bit nervous ;) Restoring
> 100G from tapes is never fun. I have already read the relevant sections in
> the HOWTO, but as always, I'm willing to take any other advice people wish
> to throw at me, whether on the list or off.

I'll just advise you to make sure your backup is current.  I haven't heard
of any problems with Beta5 yet, but it's better to be safe than lose your
data.  It is a beta relese you know.  ;)  Other than that, the migration
process *should* be smooth.  Let us know if you run into any problems.

Regards,
--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-379-3951
1313 5th St SE, Suite 111              Fax:    612-379-3952
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)

-----Begin Obligatory Humorous Quote----------------------------------------
A morning without coffee is like something without something else.
-----End Obligatory Humorous Quote------------------------------------------

--1sNVjLsmu1MXqwQ/
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6lo8ppE6/iGtdjLERAoYgAKCVDI9JH4hYfNbZsrTZT+n43mU4hACfbmSx
ZEbJC4A/gcxbQH1Bnj91SHY=
=gUr3
-----END PGP SIGNATURE-----

--1sNVjLsmu1MXqwQ/--
