From: Greg Freemyer <freemyer@NorcrossGroup.com>
Subject: re[2]: [linux-lvm] e2fsadm and snapshots?
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20021105210510.EBYF5277.imf17bis.bellsouth.net@TAZ2>
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
Date: Tue Nov  5 15:04:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>linux-lvm@sistina.com

 >>  On Nov 05, 2002  12:24 -0500, Greg Freemyer wrote:
 >>  > Andreas Dilger wrote:
 >>  > >  I would suggest putting your snapshot LV onto a separate disk and see
 >>  how
 >>  > >  that does.
 >>  >
 >>  > Can that be done?
 >>  >=20
 >>  > I thought the snapshot LV had to share the same VG/PV as the base LV.

 >>  Same VG, but it can be on any PV therein.

 >>  > Is there some way to force the snapshot on to separate physical drives.

 >>  You just specify the PV on which to create the snapshot LV.  This is no
 >>  different than any other LV creation, for which you can optionally specify
 >>  the PV(s) on which it is created.

 >>  Cheers, Andreas
 >>  --
 >>  Andreas Dilger
 >>  http://www-mddsp.enel.ucalgary.ca/People/adilger/
 >>  http://sourceforge.net/projects/ext2resize/

Andreas,

I'm running lvm 1.0.3.  Assuming this has the feature you describe, I assume =
the PV goes in the "PhysicalVolumePath" argument.

This is not described in my man entry.

Would the below be correct?

pvcreate /dev/sd1  /dev/sd2        #  sd1 =3D 3ware raid,   sd2 =3D physical =
drive.

vgcreate MYvg /dev/sd1 /dev/sd2

lvcreate -L 2G -n data MYvg /dev/sd1

lvcreate --snapshot --size 1G --name data_snap "/dev/MYvg/scratch"  /dev/sd2

Thanks for bringing this "new to me" capability to my attention.

Greg Freemyer
Internet Engineer
Deployment and Integration Specialist
Compaq ASE - Tru64 v4, v5
Compaq Master ASE - SAN Architect
The Norcross Group
www.NorcrossGroup.com
