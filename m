Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3KHAxbH004006
	for <linux-lvm@redhat.com>; Fri, 20 Apr 2007 13:10:59 -0400
Received: from minbar.sigsegv.at
	(83-64-197-38.kaisermuehlen.xdsl-line.inode.at [83.64.197.38])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l3KHAu4Q020574
	for <linux-lvm@redhat.com>; Fri, 20 Apr 2007 13:10:57 -0400
Subject: Re: [linux-lvm] How to resize a PV located on a SAN LUN
From: Thomas Hager <duke@sigsegv.at>
In-Reply-To: <20070420114742.GA6661@mail.mhnet.de>
References: <20070420114742.GA6661@mail.mhnet.de>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-EuHuh3+8VT2n03Q+XKkh"
Date: Fri, 20 Apr 2007 19:10:48 +0200
Message-Id: <1177089048.10232.6.camel@zhadum.wg.at>
Mime-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


--=-EuHuh3+8VT2n03Q+XKkh
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2007-04-20 at 13:47 +0200, Micha Holzmann wrote:
> Hello,
hi,

> Now i had to increase the size of partition of sda12 which is a LVM.
why would you want to do that? if your vg is running out of free
extents, why not just add a new LUN from the SAN and extend the vg with
it?

> I am not sure which is the right way. Within the storage managment
> software i can increase the size of the LUN. After rebooting the machine
> the additional space is appended at the end of partitions and it is
> marked as free. How can i now increase the LVM partition. Which
> tool/programm i do need for this task?
you can't really increase the physical volume, because there's a swap
partition between your physical volume and the free space.
use fdisk to partition the free space as /dev/sda14, create a physical
volume on the new partition (pvcreate /dev/sda14) and extend the
volume group with the new physical volume (vgextend yourvg /dev/sda14).

hth,
tom.

--=20
Thomas "Duke" Hager                       {duke,hager}@sigsegv.at
GPG: 1024D/D27F858C            http://www.sigsegv.at/gpg/duke.gpg
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
"Never Underestimate the Power of Stupid People in Large Groups."



--=-EuHuh3+8VT2n03Q+XKkh
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBGKPQXO0Kx4NJ/hYwRAsFYAJsFH0wPS9471Oq3JtmrplMSk4KKAACbBA3l
OAPNTZLXgND4cybGDRxWcoE=
=Yxv3
-----END PGP SIGNATURE-----

--=-EuHuh3+8VT2n03Q+XKkh--
