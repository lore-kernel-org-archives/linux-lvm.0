Received: from antimony.msp.redhat.com (antimony.msp.redhat.com [172.16.31.51])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id i22FRPJ5022826
	for <linux-lvm@redhat.com>; Tue, 2 Mar 2004 10:27:26 -0500
Received: from antimony.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by antimony.msp.redhat.com (8.12.8/8.12.8) with ESMTP id i22FRPiP006203
	for <linux-lvm@redhat.com>; Tue, 2 Mar 2004 09:27:25 -0600
Received: (from alewis@localhost)
	by antimony.msp.redhat.com (8.12.8/8.12.8/Submit) id i22FRP8s006200
	for linux-lvm@redhat.com; Tue, 2 Mar 2004 09:27:25 -0600
From: AJ Lewis <alewis@redhat.com>
Subject: Re: [linux-lvm] Bug in 1.0.8
Message-ID: <20040302152725.GC1870@antimony.msp.redhat.com>
References: <2443240000.1078240962@[192.168.200.4]>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HG+GLK89HZ1zG0kk"
Content-Disposition: inline
In-Reply-To: <2443240000.1078240962@[192.168.200.4]>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Tue Mar  2 10:25:03 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--HG+GLK89HZ1zG0kk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 02, 2004 at 09:22:42AM -0600, Steven Lembark wrote:
>=20
> LVM-1.0.8 was installed with prefix of /lvm, can't find
> pieces of itself. Seems that the --prefix should've udpated
> a #define somewhere...
>=20
> # /lvm/sbin/e2fsadm -L4G /dev/vg00/lvol2
> e2fsck 1.32 (09-Nov-2002)
> Pass 1: Checking inodes, blocks, and sizes
> Pass 2: Checking directory structure
> Pass 3: Checking directory connectivity
> Pass 4: Checking reference counts
> Pass 5: Checking group summary information
> /dev/vg00/lvol2: 13147/262144 files (4.8% non-contiguous), 454358/524288=
=20
> blocks
> e2fsadm -- Sorry: 'lvextend' not found in any of /sbin /usr/sbin=20
> /usr/local/sbin /bin /usr/bin
> e2fsadm -- ERROR: can't extend logical volume

Hrm...i think e2fsadm relies on $PATH to find the external binaries - is
this really a bug?  You should be able to fix it with a PATH=3D/lvm e2fsadm,
but that's a pretty ugly solution...maybe e2fsadm could be modified when
it's installed to check the --prefix location for binaries first...

--=20
AJ Lewis                                   Voice:  612-638-0500
Red Hat Inc.                               E-Mail: alewis@redhat.com
720 Washington Ave. SE, Suite 200
Minneapolis, MN 55414

Current GPG fingerprint =3D FE77 4B43 6A9B F982 A731  02FA 2BF5 7574 294A A=
A5A
Grab the key at: http://people.redhat.com/alewis/gpg.html or one of the
many keyservers out there...
-----Begin Obligatory Humorous Quote----------------------------------------
cthread. cthread_fork(). Fork, thread, fork!
-----End Obligatory Humorous Quote------------------------------------------

--HG+GLK89HZ1zG0kk
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFARKfdhn5UyEmEOBMRAvpoAJ9XBQ98qxLZkp7PjEPaUYuWxrZarACfZGRk
7rs3FBSUdLUYb9P5kHH+tzM=
=n0b9
-----END PGP SIGNATURE-----

--HG+GLK89HZ1zG0kk--
