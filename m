From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Re: lvm 1.0.3, kernel 2.4.17 and the libs...
Message-Id: <20020227184102.A21636@sistina.com>
References: <1014762518.12325.76.camel@dirac.cids.ca>
    <20020226155618.C12832@lynx.adilger.int>
    <1014830883.13642.12.camel@dirac.cids.ca>
MIME-Version: 1.0
In-Reply-To: <1014830883.13642.12.camel@dirac.cids.ca>; from
    dsavard@cids.ca on Wed, Feb 27, 2002 at 12:28:03PM -0500
Content-Transfer-Encoding: quoted-printable
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
Date: Wed Feb 27 11:41:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Wed, Feb 27, 2002 at 12:28:03PM -0500, Daniel Savard wrote:
> le mar 26-02-2002 =E0 17:56, Andreas Dilger a =E9crit :
> > On Feb 26, 2002  17:28 -0500, Daniel Savard wrote:
> > > I did mkfs.ext2 on /dev/sda8 !!! However, this was still pointing t=
o my
> > > LVM partition even if fdisk was not showing this.
> > >=20
> > > The big question: Is it still possible to recover some data from th=
e LVM
> > > partition which was the only partition in my VG?
> >=20
> > Well, mke2fs writes a LOT of data into the partition, being especiall=
y
> > careful to overwrite everything at the start of the disk.  It might b=
e
> > possible to recover this with "vgcfgrestore", but even then you have =
the
> > problem of overwriting the rest of the data on the disk.  If the prim=
ary
> > ext2 superblock is overwritten on an LV inside this disk, you can use
> > "e2fsck -b 32768" or so to try and recover.
> >=20
> > Cheers, Andreas
> > --
> > Andreas Dilger
> > http://sourceforge.net/projects/ext2resize/
> > http://www-mddsp.enel.ucalgary.ca/People/adilger/
> >=20
>=20
> Since my LVM partition has been moved by the operations on the
> partitions with fdisk. I had to use the vgcfgrestore command as follow
> and getting the following error:
>=20
> [root@einstein sbin]# vgcfgrestore -n datavg -o /dev/sda9 /dev/sda7
> vgcfgrestore -- INFO: using backup file "/etc/lvmconf/datavg.conf"
> vgcfgrestore -- ERROR "pv_read(): PV identifier invalid" reading physic=
al volume "/dev/sda7"
>=20
> Is there still something I can try or should I forget it?

"pvcreate -ff /dev/sda7" before you try vgcfgrestore again.

>=20
> --=20
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Daniel Savard
>=20
> Internet: dsavard@cids.ca
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

--=20

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-
