From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] lvm und promise fasttrack
Message-ID: <20011026081326.A18287@dragon.blacknet.de>
References: <3BD849C6.7060308@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline
In-Reply-To: <3BD849C6.7060308@gmx.de>; from jens.tkotz@gmx.de on Thu, Oct 25, 2001 at 07:20:06PM +0200
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
Date: Fri Oct 26 01:12:02 2001
List-Id: <linux-lvm.redhat.com>
To: Linux-LVM@Sistina.com

--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hallo Jens,
> > ich hab schon wieder ein "Problem".
Well, it might be a good idea to write your requests to an international
mailing list in english ...
so let's translate your questions (not a strict translation)

> > Auf meinem Mainboard ist ein Promise Fasttrack 100 Controller.
> > Die Festplatten kann ich ueber /dev/hd[e-h] ansprechen.
> My mainboard features a Promise Fasttrack 100 Controller, and I can
> access my harddrives as /dev/hd[e-h]
>=20
> > Es gibt aber auch die Moeglichkeit das Hardware Raid anzuspechen ueber
> > /dev/ataraid/d[0-2]px , mit x als Partitionsnummer.
> But there is also the option to use the hardware raid as
> /dev/ataraid/d[0-2]px, with x beeing the partition number
>=20
> > Beim Aufruf von vgcreate passiert folgendes :
> when calling vgcreate like this:
> vgcreate gl_lvm /dev/ataraid/d0p1
> vgcreate -- physical volume name "/dev/ataraid/d0p1" is invalid
For this to work, you must first use pvcreate to add the LVM's PV
information to your device:
pvcreate /dev/ataraid/d0p1

But this will not help you, as pvcreate checls the device name against a
list of valid devices, and /dev/ataraid is not port of this (at last not
in the way outdated 0.9.1beta5 src I've on this system)

OOTH you should not trust the bios based softraid of any of the consumer
raid devices, it is no hardware raid (not just MHO). If you want to do raid
with IDE devices, I'd suggest using the kernel based MD drivers, and puttin=
g=20
every IDE disk on it's own channel.  =20

--=20
Goetz Bock                                              IT Consultant
Dipl.-Inf. Univ.

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE72P8Ef5srOMkjkQoRAuNsAJ48AJxbtpoX4v5FSAFySztcjhcIPgCdGi5t
baszVZH0Q1iN7YKjlOd4KnY=
=MSUN
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
