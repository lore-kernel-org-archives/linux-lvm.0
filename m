Return-Path: <smdenton@bellsouth.net>
From: "S. Michael Denton" <smdenton@bellsouth.net>
Subject: RE: [linux-lvm] EMC Storage + LVM + XFS
Date: Thu, 24 May 2001 22:57:25 -0400
Message-ID: <000001c0e4c6$6ef3c1a0$7d80a8c0@dyndns.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Pine.LNX.4.33.0105242142530.6231-100000@UberGeek.coremetrics.com>
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

=20
-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

vgscan is your friend :) (read my earlier post about moving an entire
bus around)

- -----Original Message-----
From: linux-lvm-admin@sistina.com
[mailto:linux-lvm-admin@sistina.com]On
Behalf Of Austin Gonyou
Sent: Thursday, 24 May 2001 22:46
To: linux-lvm@sistina.com
Subject: [linux-lvm] EMC Storage + LVM + XFS


I have a potential dilemma, and I'd like some feedback for those who
might
be able to give it. If I have say 2-4 Fibre HBAs connected to an EMC
Symmetrix say 3930, and I create volumes, then disks are added some
of
which who's LUN value is lower than disks already in the system,
wouldn't
that cause all my sd values to change and move? I know if I add a
scsi
disk into a LAS array that happens. So if this does happen, what's a
good
procedure for recovering from it and making sure all my volumes are
ok?

- --=20
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-796-9023
email: austin@coremetrics.com


_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html


-----BEGIN PGP SIGNATURE-----
Version: PGP 7.0.1

iQA/AwUBOw3KFXC+DNfF0nVpEQJoegCeK5/7drb1Nsy6En3yGMZm6NfYfq0An1Py
bgGoVMUyxZcDQDZypLNrHTIt
=3DM7RU
-----END PGP SIGNATURE-----
