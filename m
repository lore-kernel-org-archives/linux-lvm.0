Subject: Re: [linux-lvm] Re: lvm 1.0.3, kernel 2.4.17 and the libs...
From: Daniel Savard <dsavard@cids.ca>
In-Reply-To: <20020226155618.C12832@lynx.adilger.int>
References: <1014762518.12325.76.camel@dirac.cids.ca>
    <20020226155618.C12832@lynx.adilger.int>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1014830883.13642.12.camel@dirac.cids.ca>
MIME-Version: 1.0
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
Date: Wed Feb 27 11:28:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: Andreas Dilger <adilger@turbolabs.com>
Cc: linux-lvm@sistina.com

le mar 26-02-2002 =E0 17:56, Andreas Dilger a =E9crit :
> On Feb 26, 2002  17:28 -0500, Daniel Savard wrote:
> > I did mkfs.ext2 on /dev/sda8 !!! However, this was still pointing to my
> > LVM partition even if fdisk was not showing this.
> >=20
> > The big question: Is it still possible to recover some data from the LV=
M
> > partition which was the only partition in my VG?
>=20
> Well, mke2fs writes a LOT of data into the partition, being especially
> careful to overwrite everything at the start of the disk.  It might be
> possible to recover this with "vgcfgrestore", but even then you have the
> problem of overwriting the rest of the data on the disk.  If the primary
> ext2 superblock is overwritten on an LV inside this disk, you can use
> "e2fsck -b 32768" or so to try and recover.
>=20
> Cheers, Andreas
> --
> Andreas Dilger
> http://sourceforge.net/projects/ext2resize/
> http://www-mddsp.enel.ucalgary.ca/People/adilger/
>=20

Since my LVM partition has been moved by the operations on the
partitions with fdisk. I had to use the vgcfgrestore command as follow
and getting the following error:

[root@einstein sbin]# vgcfgrestore -n datavg -o /dev/sda9 /dev/sda7
vgcfgrestore -- INFO: using backup file "/etc/lvmconf/datavg.conf"
vgcfgrestore -- ERROR "pv_read(): PV identifier invalid" reading physical v=
olume "/dev/sda7"

Is there still something I can try or should I forget it?

--=20

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Daniel Savard

Internet: dsavard@cids.ca
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
