From: "=?iso-8859-1?Q?J=FCrgen?= Vollmer" <juergen@informatik-vollmer.de>
Subject: Re: [linux-lvm] snapshot file zombies
In-Reply-To: Your message of "Mon, 09 Dec 2002 14:46:53 +0100."
             <20021209144653.B19400@sistina.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-1446775179P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Message-ID: <12329.1041699153@joergli.cocolab.de>
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
Date: Sat Jan  4 11:03:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--==_Exmh_-1446775179P
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


"Heinz J . Mauelshagen" <mauelshagen@sistina.com>:
> If reading the snapshot LV fails, let's go forward analyzing LVM, if no=
t
> there might be a reiserfs fix for that.

Dear Heinz,
A good new year to you!

I've just some spare time :-)

I created the snapshot as usual and let tar access the files:
  for i seq 1 20
  do
    tar -cvf /dev/null /lvm-snapshot
  done

after some time tar produces the following:
  tar: /lvm-snapshot/vollmer/.exmh/exmh_addrs: can not stat, permission d=
enied
(message translated by me from german)

During that I did some work on the original (reading email and news, runn=
ing
some compile jobs, running some seti@home jobs).

It seems to me, that when I modify or delete a file in the original, thos=
e
files trigger the problem! (I just modified a Makefile and deleted a file=

and the next time tar visits that Makefile and the deleted file =

it was flagged with the above error message);

The problem is reproducible.

The files exists and are accessible in the original.

ls -l  /lvm-snapshot/vollmer/.exmh/
ls: /lvm-snapshot/vollmer/.exmh/exmh_addrs.bak: no permission
ls: /lvm-snapshot/vollmer/.exmh/exmh_addrs: no permission
insgesamt 34
-rw-r--r--    1 vollmer  users       11282 2003-01-01 20:03 exmh-defaults=

-rw-r--r--    1 vollmer  users       11115 2002-09-25 20:25 exmh-defaults=
~
drwxr-x---    2 vollmer  users        1872 2002-07-06 10:18 exmh-images/
-rw-r--r--    1 vollmer  users          65 2001-01-19 11:09 exmh-shell-hi=
story
-rw-r-----    1 vollmer  users        1564 1999-10-27 23:45 exmhsedit

The files seem to be in the directory catalog, but not in the filesystem
anymore.

Here the original:
ls -l /home/vollmer/.exmh/
insgesamt 466
-rw-r--r--    1 vollmer  users       11282 2003-01-01 20:03 exmh-defaults=

-rw-r--r--    1 vollmer  users       11115 2002-09-25 20:25 exmh-defaults=
~
drwxr-x---    2 vollmer  users        1872 2002-07-06 10:18 exmh-images/
-rw-r--r--    1 vollmer  users          65 2001-01-19 11:09 exmh-shell-hi=
story
-rw-r--r--    1 vollmer  users      220115 2003-01-04 17:20 exmh_addrs
-rw-r--r--    1 vollmer  users      220115 2003-01-04 17:14 exmh_addrs.ba=
k
-rw-r-----    1 vollmer  users        1564 1999-10-27 23:45 exmhsedit


Currently I use a SuSe 8.1 system with the actual (i.e. patch-40) kernel
from ftp.suse.com/pub/people/mantel/next.

I use an SMP System (2 x XENON 2GHz, 1GB RAM) with 4 SCSI devices. Three =
of
them under control of LVM. As filesystem I use reiserfs

ReiserFS version:
$ mkreiserfs -h
mkreiserfs 3.6.2 (2002)

LVM version:
$lvcreate --version
lvcreate: Logical Volume Manager 1.0.5(mp-v6)
Heinz Mauelshagen, Sistina Software  15/07/2002 (IOP 10)

Do you need more information, how can I help to find the problem.

With best regards

J=FCrgen


-- =

Dr.rer.nat. Juergen Vollmer, Viktoriastrasse 15, D-76133 Karlsruhe
Tel: +49(721) 9204871 Fax: +49(721) 24874
juergen@informatik-vollmer.de,vollmer@cocolab.de,Juergen.Vollmer@acm.org
www.informatik-vollmer.de



--==_Exmh_-1446775179P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)
Comment: Exmh version 2.3.1 01/18/2001

iD8DBQE+FxFQn1Xi7IT+kG0RAiJlAKCfDfldgrt8UR200xTaI0dz7U7a+ACfXKNl
h3VhRBmHJ7HQlB0aADRVLIQ=
=CBXn
-----END PGP SIGNATURE-----

--==_Exmh_-1446775179P--
