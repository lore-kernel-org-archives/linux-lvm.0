From: "=?iso-8859-1?Q?J=FCrgen?= Vollmer" <juergen@informatik-vollmer.de>
MIME-Version: 1.0
Content-Type: multipart/signed;
    boundary="==_Exmh_-374632018P";
    micalg=pgp-sha1;
    protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Message-Id: <23380.1010745737@joergli.cocolab.de>
Subject: [linux-lvm] kernel: zam-7001: io error in reiserfs_find_entry (2)
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
Date: Fri Jan 11 04:43:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--==_Exmh_-374632018P
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Hi,

this is an addition to my previous mail.

after the problem occured, I tried to umount the snapshot:

	joergli: umount -v /lvm-snapshot
but I get only
	umount: /lvm-snapshot: device is busy

	joergli: fuser -a -v /lvm-snapshot
	  USER        PID ACCESS COMMAND
	  /lvm-snapshot        root     kernel mount  /lvm-snapshot

So I'm not able to remove the snapshot. Any idea?

J=FCrgen


-- =

Dr.rer.nat. Juergen Vollmer, Viktoriastrasse 15, D-76133 Karlsruhe
Tel: +49(721) 9204871 Fax: +49(721) 24874
juergen@informatik-vollmer.de,vollmer@cocolab.de,Juergen.Vollmer@acm.org
www.informatik-vollmer.de



--==_Exmh_-374632018P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: Exmh version 2.3.1 01/18/2001

iD8DBQE8PsGJn1Xi7IT+kG0RArMAAKCQqBhQ0PsAoWVbd9BgTiX+r0vNrQCfbZBC
vyFJ29enMPlygcIiWasHbM4=
=7zcj
-----END PGP SIGNATURE-----

--==_Exmh_-374632018P--
