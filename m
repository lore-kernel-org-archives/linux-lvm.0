Date: Mon, 27 Aug 2001 12:42:12 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] extending striped lv
Message-ID: <20010827124212.C1308@sistina.com>
References: <20010823232349.9882.qmail@web20306.mail.yahoo.com> <20010824112859.A10992@dragon.blacknet.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="Izn7cH1Com+I3R9J"
Content-Disposition: inline
In-Reply-To: <20010824112859.A10992@dragon.blacknet.de>; from bock@blacknet.de on Fri, Aug 24, 2001 at 11:28:59AM +0200
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

--Izn7cH1Com+I3R9J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 24, 2001 at 11:28:59AM +0200, Goetz Bock wrote:
> On Thu, Aug 23 '01 at 16:23, Brad Langhorst wrote:
> > [ ... extending a (striped) LV ... ]
> I'm not 100% positive, but AFAIK you can extend striped LV, but if you
> do the extened LV is only partially striped.

Nope, you can only extend a striped LV on the PV's it is currently on.
After that you either have to pvmove it to larger PVs or rebuild with more
disks.

If you want to be able to extend LVs and need software striping, you might
want to consider using MD striping underneath LVM.

Regards,
--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-638-0500
1313 5th St SE, Suite 111              Fax:    612-638-0500
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)

-----Begin Obligatory Humorous Quote----------------------------------------
Hope is NOT a thing with feathers, the thing with feathers is my nephew,
and I have to take him to a specialist in Zurich. - Woody Allen
-----End Obligatory Humorous Quote------------------------------------------

--Izn7cH1Com+I3R9J
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7ioZ0pE6/iGtdjLERAgDzAJ91gGvqv/VM0eDksrmhvKXf6wOqUQCgjwNA
c9qgpkH0kV86oGYjTWBwAUk=
=Sq9F
-----END PGP SIGNATURE-----

--Izn7cH1Com+I3R9J--
