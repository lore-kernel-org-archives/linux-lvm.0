Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9DFRklw024939
	for <linux-lvm@redhat.com>; Fri, 13 Oct 2006 11:27:46 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.188])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k9DFRdWe010673
	for <linux-lvm@redhat.com>; Fri, 13 Oct 2006 11:27:40 -0400
Message-ID: <452FB129.7020208@gmx.net>
Date: Fri, 13 Oct 2006 17:30:49 +0200
From: Klaus Strebel <klaus.strebel@gmx.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Unable to add new drive to LV
References: <200610130827.42040.pwaldo@waldoware.com>
In-Reply-To: <200610130827.42040.pwaldo@waldoware.com>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: pwaldo@waldoware.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Paul Waldo schrieb:
> Hi all,
>=20
> I'm trying to add a shiny new drive (/dev/hdd) to an existing Logical Vol=
ume=20
> to no avail.  The HOWTO says I should be able to do this.  Googling indic=
ates=20
> that others have had this problem, but tells of no recorded resolution.  =
 I=20
> was hoping someone could point me to solution.  Info below.  Thanks in=20
> advance!

Hi Paul,

look's like you didn't get the LVM architecture :-(.
You can't add a drive to a LV, no matter how brand new and shiny it is
and no matter how deprerate you try.

If you read the LVM-HOWTO's from the beginning, you'll see that LVM is
collecting physical-volumes ( your drives or partitions on drives ) in
logical volume groups ( so called VG's, your ide_disks ) which are the
home of the logical volumes ( LV's, your bacula ).

So, to be able to extend your LV to use the space on your new disk, you
must first add the new disk to the VG with vgextend ( setting the
partition-type is not enough :-) ). If this doen't work, do a pvcreate
on the new disk first and try vgextend again.

Cheers
Klaus

>=20
> Paul
>=20
> root@backup:~# lvextend --size +149G -t /dev/ide_disks/bacula
>   Test mode: Metadata will NOT be updated.
>   Incorrect metadata area header checksum
>   Using stripesize of last segment 4KB
>   Rounding size (147200 extents) down to stripe boundary size for segment=
=20
> (147198 extents)
>   Extending logical volume bacula to 574.99 GB
>   Insufficient allocatable extents suitable for parallel use for logical =

> volume bacula: 147198 required
> root@backup:~# lvdisplay -vm /dev/ide_disks/bacula
>     Using logical volume(s) on command line
>   Incorrect metadata area header checksum
>   --- Logical volume ---
>   LV Name                /dev/ide_disks/bacula
>   VG Name                ide_disks
>   LV UUID                36N6XE-wDXh-8wZ1-uoVz-MW0h-6uvP-DWUiow
>   LV Write Access        read/write
>   LV Status              available
>   # open                 0
>   LV Size                426.00 GB
>   Current LE             109056
>   Segments               1
>   Allocation             inherit
>   Read ahead sectors     0
>   Block device           254:2
>=20
>   --- Segments ---
>   Logical extent 0 to 109055:
>     Type                striped
>     Stripes             3
>     Stripe size         4 KB
>     Stripe 0:
>       Physical volume   /dev/hdb
>       Physical extents  1750 to 38101
>     Stripe 1:
>       Physical volume   /dev/hdc
>       Physical extents  1750 to 38101
>     Stripe 2:
>       Physical volume   /dev/hda2
>       Physical extents  1750 to 38101
>=20
> root@backup:~# vgdisplay ide_disks
>   Incorrect metadata area header checksum
>   --- Volume group ---
>   VG Name               ide_disks
>   System ID
>   Format                lvm2
>   Metadata Areas        4
>   Metadata Sequence No  7
>   VG Access             read/write
>   VG Status             resizable
>   MAX LV                0
>   Cur LV                3
>   Open LV               2
>   Max PV                0
>   Cur PV                4
>   Act PV                4
>   VG Size               595.99 GB
>   PE Size               4.00 MB
>   Total PE              152573
>   Alloc PE / Size       114306 / 446.51 GB
>   Free  PE / Size       38267 / 149.48 GB
>   VG UUID               nbF5of-R5sV-u8mc-IVhK-GnAL-xZyO-7AQzh9
>=20
> root@backup:~# pvdisplay
>   Incorrect metadata area header checksum
>   Incorrect metadata area header checksum
>   Incorrect metadata area header checksum
>   Incorrect metadata area header checksum
>   --- Physical volume ---
>   PV Name               /dev/hda2
>   VG Name               ide_disks
>   PV Size               148.86 GB / not usable 0
>   Allocatable           yes
>   PE Size (KByte)       4096
>   Total PE              38109
>   Free PE               7
>   Allocated PE          38102
>   PV UUID               E8EsjG-gvEw-vpMI-nPH5-4TSe-iY1N-kZERc2
>=20
>   --- Physical volume ---
>   PV Name               /dev/hdb
>   VG Name               ide_disks
>   PV Size               149.05 GB / not usable 0
>   Allocatable           yes
>   PE Size (KByte)       4096
>   Total PE              38156
>   Free PE               54
>   Allocated PE          38102
>   PV UUID               910g9r-zVmg-ZMHR-Qe7y-rkyQ-7Jrg-iV6X4I
>=20
>   --- Physical volume ---
>   PV Name               /dev/hdc
>   VG Name               ide_disks
>   PV Size               149.05 GB / not usable 0
>   Allocatable           yes
>   PE Size (KByte)       4096
>   Total PE              38156
>   Free PE               54
>   Allocated PE          38102
>   PV UUID               q4C4sK-bdLY-SfMX-1CnC-r2Yi-MaJU-29GWef
>=20
>   --- Physical volume ---
>   PV Name               /dev/hdd1
>   VG Name               ide_disks
>   PV Size               149.03 GB / not usable 0
>   Allocatable           yes
>   PE Size (KByte)       4096
>   Total PE              38152
>   Free PE               38152
>   Allocated PE          0
>   PV UUID               XxOREs-3k4B-jhky-lhGD-zQx5-xhE3-HPqG0L
>=20
>   --- NEW Physical volume ---
>   PV Name               /dev/hda1
>   VG Name
>   PV Size               149.05 GB
>   Allocatable           NO
>   PE Size (KByte)       0
>   Total PE              0
>   Free PE               0
>   Allocated PE          0
>   PV UUID               PWBpiN-xxgY-m0Ck-A67u-a78Z-JwCx-Arh4dG


--=20
Mit freundlichen Gr=EF=BF=BDssen / best regards

Klaus Strebel, Dipl.-Inform. (FH), mailto:klaus.strebel@gmx.net

/"\
\ /     ASCII RIBBON CAMPAIGN
 X        AGAINST HTML MAIL
/ \
