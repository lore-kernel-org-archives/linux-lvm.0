From: Daniel Savard <dsavard@cids.ca>
In-Reply-To: <E16awby-00059c-00@hermes.sistina.com>
References: <E16awby-00059c-00@hermes.sistina.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1013616001.3175.26.camel@dirac.cids.ca>
MIME-Version: 1.0
Subject: [linux-lvm] Re: Building LVM ona RH7.2 - errors
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
Date: Wed Feb 13 10:00:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

le mer 13-02-2002 =E0 05:26, linux-lvm-request@sistina.com a =E9crit :

>=20
> (sorry about the length). sed is not my string point at all.
> Any ideas what I'm doing wrong?
>=20
> TIA,
>=20
> Jeff
>=20

Jeff,

1st) Untar the kernel somewhere like: /usr/src/linux-2.4.17
2nd) Untar the LVM 1.0.2, it will create the sub-directory 1.0.2 in the
current dir, for example: /usr/src/LVM/1.0.2
3rd) Create the directory /usr/src/LVM/build
4th) cd /usr/src/LVM/build
5th) ../1.0.2/configure --with-kernel-dir=3D/usr/src/linux-2.4.17
6th) Read instructions in /usr/src/LVM/1.0.2/PATCHES/README

From your description, it is not clear, but I guess you mixed LVM stuff
with Kernel stuff while building the patches and Makefile modifications
may encountered problems with the Linux kernel Makefile.

--=20

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Daniel Savard
Consultation Informatique Daniel Savard
551, boul. Sir-Wilfrid-Laurier
suite 105
Beloeil, (Qu=E9bec)
Canada J3G 4J1

T=E9l: (450) 467-8014
Internet: dsavard@cids.ca
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
