From: "=?iso-8859-1?Q?J=FCrgen?= Vollmer" <juergen@informatik-vollmer.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_586402826P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Message-ID: <7344.1039265449@joergli.cocolab.de>
Subject: [linux-lvm] snapshot file zombies
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
Date: Sat Dec  7 06:52:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--==_Exmh_586402826P
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Hi dear list,

I created a snapshot from my /home to do my usual backup with tar.
Then I got 15 messages of the kind

  tar: lvm-snapshot/vollmer/Mail/inbox/,120:  can not stat, no permission=

      (or so it's translated from german to englich by me)


doing a
  find /lvm-snapshot/vollmer/Mail/inbox/ -name ",120"
rsults in
  /lvm-snapshot/vollmer/Mail/inbox/,120

so the file exists, but:
  ls -l   /lvm-snapshot/vollmer/Mail/inbox/,120
results in
  ls: /lvm-snapshot/vollmer/Mail/inbox/,120: Permission denied

get some infos via find:
  find /lvm-snapshot/vollmer/Mail/inbox/ -name ",120" -print "-A@"
results in:
  find: /lvm-snapshot/vollmer/Mail/inbox/,120: Permission denied

The "original file" ~vollmer/Mail/inbox/,120 is ok and readable.

Two weeks ago everything worked fine.

So what's wrong with it? Is my corrupted? (tar --compare seems to complai=
n
only at those files).

I use SuSe 8.1, Logical Volume Manager 1.0.5(mp-v6)

With best regards

J=FCrgen

-- =

Dr.rer.nat. Juergen Vollmer, Viktoriastrasse 15, D-76133 Karlsruhe
Tel: +49(721) 9204871 Fax: +49(721) 24874
juergen@informatik-vollmer.de,vollmer@cocolab.de,Juergen.Vollmer@acm.org
www.informatik-vollmer.de



--==_Exmh_586402826P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)
Comment: Exmh version 2.3.1 01/18/2001

iD8DBQE98e6pn1Xi7IT+kG0RAgIHAJ9Ul43dPkcKxRz2EXr/YN+9XW2CxQCfdxl7
ni1B5cO1wPmq7GAxSyqUbxA=
=nv+G
-----END PGP SIGNATURE-----

--==_Exmh_586402826P--
