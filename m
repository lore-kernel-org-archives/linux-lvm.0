Return-Path: <zoo1@corecomm.net>
Date: Thu, 22 Feb 2001 18:13:00 -0500
From: zoo1@corecomm.net
Subject: Re: [linux-lvm] Upgrading...
Message-ID: <20010222181300.A29027@bar.nowhere>
References: <20010222134043.B5285@omnifarious.mn.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
In-Reply-To: <20010222134043.B5285@omnifarious.mn.org>; from hopper@omnifarious.mn.org on Thu, Feb 22, 2001 at 01:40:43PM -0600
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

--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2001 at 01:40:43PM -0600, Eric M. Hopper wrote:

>	I have on _old_ version of LVM (0.8i).  I don't do anything
>fancy with it.  Only a few logical volumes and one volume group and
>striping across a couple of disks.  Standard 4M block size.  No
>mirroring, no snapshots.  I do use reiserfs.
>	This is under the 2.2.16 kernel.
>	What problems, if any, should I expect if I upgrade to 2.4.2?

i'm in a similar situation myself, sitting on a late 2.4.0-pre kernel
with 0.8something waiting for a good time to upgrade.

now, i don't actually _know_ what your problems will be, since i'm not a
developer and really not very expert with LVM. but as far as i have
gathered from reading this list a while:

 - your old 0.8 tools will not work with the new LVM in the new kernel;
 - the tools you'll have to upgrade to won't work with the LVM code in
   your old kernel, so once you upgrade the tools all you'll be able to
   do (as far as LVM goes) is boot the new kernel and hope for the best;
 - the LVM data structures on your disk will work with the new code. the
   new code will update them with some new stuff (UUIDs); whether the
   thusly upgraded on-disk structures would work with old LVM code i
   don't know, but i would guess it will.
 - and a stock, fresh-from-Linus'-harddisk kernel may need LVM patches,
   the official tree might not have quite all it should as far as LVM
   goes, so downloading the latest LVM tarball and letting it patch your
   new kernel sources before building your new kernel might be wise.

personally, i'm waiting for a situation where an official kernel will
have an officially sanctioned, stable and complete LVM version and an
official LVM toolset will be able to deal with my old kernel before i
upgrade. yes, i have a backup tape drive, and yes, i have the expertise
to take the plunge, but i simply do not have the time to fiddle around
in case something breaks, and i want this machine to keep on working.

--=20
   PGP/GnuPG key (ID 1024D/BFE0D6D0) available from keyservers everywhere

       "Everything I am today, I owe to people whom it is now too late
                                   to punish."

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6lZz8NfZCE7/g1tARAiPOAKCkDEbdE08Bv08ejOHQMdUc/sQzBACfRYeB
NA2wIXKilveLczodCQX+REo=
=Oe3C
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
