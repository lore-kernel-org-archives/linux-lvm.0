From: "=?iso-8859-1?Q?J=FCrgen?= Vollmer" <juergen@informatik-vollmer.de>
Subject: Re: [linux-lvm] snapshot file zombies 
In-Reply-To: Your message of "Mon, 09 Dec 2002 11:37:19 +0100."
             <20021209113719.A18845@sistina.com> 
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_7814995P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Message-ID: <19352.1039432905@joergli.cocolab.de>
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
Date: Mon Dec  9 05:23:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--==_Exmh_7814995P
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Dear heinz,

"Heinz J . Mauelshagen" <mauelshagen@sistina.com>
> Can you find any nasty messages in your syslog related to the
> access fault or _before_ you weren't able to access it?

the only obscure message I found was:

Dec  7 01:22:07 joergli kernel: vs-7000: search_by_entry_key: search_by_k=
ey returned item position =3D=3D 0<4>vs-7000: search_by_entry_key: search=
_by_key returned item position =3D=3D 0<4>vs-7000: search_by_entry_key: s=
earch_by_key returned item position =3D=3D 0<4>zam-7001: io error in reis=
erfs_find_entry

Dec  7 01:22:07 joergli kernel: vs-7000: search_by_entry_key: search_by_k=
ey returned item position =3D=3D 0<4>zam-7001: io error in reiserfs_find_=
entry

but the failure was around 15:00 on that day

J=FCrgen

-- =

Dr.rer.nat. Juergen Vollmer, Viktoriastrasse 15, D-76133 Karlsruhe
Tel: +49(721) 9204871 Fax: +49(721) 24874
juergen@informatik-vollmer.de,vollmer@cocolab.de,Juergen.Vollmer@acm.org
www.informatik-vollmer.de



--==_Exmh_7814995P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)
Comment: Exmh version 2.3.1 01/18/2001

iD8DBQE99HzJn1Xi7IT+kG0RAocYAKCZqr37rSGB7ViLOV6tFu/74eXCtQCcD56E
4UsYHO6INkA2LArHayUwSxc=
=py2J
-----END PGP SIGNATURE-----

--==_Exmh_7814995P--
