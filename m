Return-Path: <bg@blacknet.de>
Date: Mon, 11 Jun 2001 23:11:00 +0200
From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] Switching one of my disks to hdc from hdb
Message-ID: <20010611231100.B14752@dragon.blacknet.de>
References: <01060621061602.01075@notch> <20010606232620.B6704@dragon.blacknet.de> <01060623465900.02898@notch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="V0207lvV8h4k8FAm"
Content-Disposition: inline
In-Reply-To: <01060623465900.02898@notch>; from pwk.linuxfan@gmx.de on Wed, Jun 06, 2001 at 11:46:59PM +0200
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

--V0207lvV8h4k8FAm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Wed, Jun 06 '01 at 23:46, Peter Kirk wrote:
> > Well, as I don't know your current configuration to well, it's just
> > pocking in the dark ...
> Here it comes:
> I have two disks, currently on hda and hdb.
> hda:
> 10MB of /boot
> 1GB for SWAP
> the lot (18GB) in LV with hdb
>=20
> hdb:
> 19GB in LV with hda
>=20
> [ ... ]
Sorry, but I was unable to come back to you any erlier.

If you still don't have just tried it, I'd suggest you to simply do so
:-) (but see the warning at the end).

But only if your /boot contains an initrd, that runs vgscan and=20
vgchange.=20

If this is the case, you should be able to simply switch the drive to
hdc.

IF your system should not boot, because it can't find some LV, don't
panik.

In this case you've two options:
- shutdown as clean as possible (CRTL-ALT-DELETE) and switch back.
  Your system will come up again. (savest version)
- Hope that the boot throws you into a shell (to repair your system),
  mount the drive that contains /etc as RW (probably mount -o remount,rw /)
  and do a vgscan (this should fix the /etc/lvm* entries). Now all
  your LV should be detected again. Now your system should work as=20
  before.

Everything basicaly depends on the quality of your initrd and you
should be fine if you use the one provided by lvmcreate_initrd.

For savety reasond you should make a backup of the /etc/lvm* files. (or
better of all files, but this is most likely no an option)

    Goetz.

--V0207lvV8h4k8FAm
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7JTPkf5srOMkjkQoRAllrAJ9Gwo/A/z8rIj4ouqa9coTXoFd3vQCgxxc6
xTli9dGzU0bkqvWj8ws2mFw=
=xoxn
-----END PGP SIGNATURE-----

--V0207lvV8h4k8FAm--
