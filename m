From: "=?iso-8859-1?Q?J=FCrgen?= Vollmer" <juergen@informatik-vollmer.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-1332358667P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Message-ID: <22712.1003733873@joergli.cocolab.de>
Subject: [linux-lvm] mounting a reiserfs snaphsot fails
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
Date: Mon Oct 22 02:18:01 2001
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--==_Exmh_-1332358667P
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Hi erverybody,

I just created a snapshot and tried to mount it:

 lvcreate --size 112m --snapshot --name lvm-snapshot /dev/LVMhome_vg/home=

 mount -oro -t reiserfs /dev/LVMhome_vg/lvm-snapshot /lvm-snapshot

but I get only:
 mount: wrong fs type, bad option, bad superblock on
        /dev/LVMhome_vg/lvm-snapshot, or too many mounted file systems

The logical volumes have been created with SuSe 7.2 (i.e. an older versio=
n of
the LVM tools), now I use SuSe 7.3,
 lvcreate --version
   lvcreate: Logical Volume Manager 1.0.1-rc2
   Heinz Mauelshagen, Sistina Software  30/08/2001 (IOP 10)

Obviously, /dev/LVMhome_vg/home is a reiserfs.

Any idea?

J=FCrgen
-- =

Dr.rer.nat. Juergen Vollmer, Viktoriastrasse 15, D-76133 Karlsruhe
office: juergen@informatik-vollmer.de,  vollmer@cocolab.de
	    www.informatik-vollmer.de Tel: +49(721) 9204871 Fax: +49(721) 24874
private: Juergen.Vollmer@acm.org



--==_Exmh_-1332358667P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: Exmh version 2.3.1 01/18/2001

iD8DBQE708Nxn1Xi7IT+kG0RAq72AJ9WowFTwXkguGdQuKzYFv+RC0wDrACdHw/j
9IairzYmG2KJLl9KjrWbQs8=
=oCjV
-----END PGP SIGNATURE-----

--==_Exmh_-1332358667P--
