From: Wiktor Wodecki <wodecki@gmx.de>
Message-ID: <20020530114956.GC1155@kakerlak>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2JFBq9zoW8cOFH7v"
Content-Disposition: inline
Subject: [linux-lvm] pv_read(): PV identifier invalid
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
Date: Thu May 30 04:47:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--2JFBq9zoW8cOFH7v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

can anybody please tell me what the following means:

kakerlak:~# pvscan=20
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ERROR "pv_read(): PV identifier invalid" reading physical volumes

this comes regardless if I have any LVM partitions on my system. On a
sidenote, my primary master ide disk gets wrong CHS values assigned by
linux. I did override them with the hda=3Dxxxx,xxx,xx boot paramameter,
but maybe that's the problem. LVM in Questions is 1.0.4 on kernel
2.4.19-pre7 with recent vm patches from andrea, netfilter stuff and a patch=
 for my
scsi adapter.

--=20
Regards,

Wiktor Wodecki      |    http://johoho.eggheads.org
wodecki@gmx.de      |    IRC: Johoho@IrcNET

--2JFBq9zoW8cOFH7v
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE89hHk6SNaNRgsl4MRAu2AAJ4+XRws70Sb/pcmXYku2dcAUaBUJwCg0gO4
tBzFig9QVXXGorQ7KjCx++U=
=tRA0
-----END PGP SIGNATURE-----

--2JFBq9zoW8cOFH7v--
