Return-Path: <bg@blacknet.de>
Date: Tue, 5 Jun 2001 19:45:56 +0200
From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] How can I my disk type to 0x8e?
Message-ID: <20010605194556.A4266@dragon.blacknet.de>
References: <991759497.3b1d0c8930e80@www.etfal.g12.br>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Content-Disposition: inline
In-Reply-To: <991759497.3b1d0c8930e80@www.etfal.g12.br>; from leandrosales@cefet-al.br on Tue, Jun 05, 2001 at 01:44:57PM -0300
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

--wac7ysb48OaltWcw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Tue, Jun 05 '01 at 13:44, Leandro Sales - Estagi=E1rio GTI wrote:
> I'm a new user and I compiled LVM recently. I'd like to know I can I
> change my disk type to 0x8e... What does 0x8e type mean?
You must use fdisk to change the "type" of your partition, try=20
"man fdisk" for a start.
0x8e is the partitiontype reserved for Linux LVM (it's a "magic" number
between 0x01 and 0xff, that indecates how a partition on a disk should
be used, e.g. the file system type or the oprtation system using this
partition).

> If I change to 0x8e, will I have lost data? Please, help me ok?
No, but if you than do a pvcreate /dev/[hs]d?, the pysical volume header
will be written to the partition, this will, most likely, make any file
system that used to by on this partition (if any), VERY unhappy and you
most likely WILL lose everything, make a backup first.
Or better practise on a toy box with no (critical) data on it.

    Goetz.

--wac7ysb48OaltWcw
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7HRrUf5srOMkjkQoRApbuAJ99rIRZv/Hch/CdqJMeKvIqf0uVwACgy5A6
ywvVk4+F2n08G4rc6SUNBq4=
=Oznu
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--
