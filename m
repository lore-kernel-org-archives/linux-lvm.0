Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1SB04113124
	for <linux-lvm@redhat.com>; Tue, 28 Feb 2006 06:00:04 -0500
Received: from mail.internode.on.net (bld-mail07.adl2.internode.on.net
	[203.16.214.71])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1SB01AS030442
	for <linux-lvm@redhat.com>; Tue, 28 Feb 2006 06:00:03 -0500
Received: from frog.local (unverified [59.167.56.137]) 
	by mail.internode.on.net (SurgeMail 3.2f) with ESMTP id 13851067 
	for <linux-lvm@redhat.com>; Tue, 28 Feb 2006 21:29:59 +1030 (CDT)
From: Daniel <dragonheart@gentoo.org>
Subject: Re: [linux-lvm] lvextend - device-mapper: create ioctl failed: Device
	or resource busy\nFailed to suspend
Date: Tue, 28 Feb 2006 22:02:51 +1100
References: <200602232345.46437.dragonheart@gentoo.org>
	<200602242117.05125.krakrjak@volumehost.net>
	<200602251630.40762.dragonheart@gentoo.org>
In-Reply-To: <200602251630.40762.dragonheart@gentoo.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5521682.tL8UpdRYLS";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200602282202.52038.dragonheart@gentoo.org>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--nextPart5521682.tL8UpdRYLS
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Guessing the additional info didn't help and there is no easy way to reset =
the=20
state.

I'm going to use spare space to create a new logical volume and move data=20
across and delete the wacky vg-backup unless any other bright ideas arise=20
soon.

Thanks to everyone who has thought about solutions/ causes to this and offe=
red=20
their time to help.

On Sat, 25 Feb 2006 04:30 pm, Daniel wrote:
> On Sat, 25 Feb 2006 02:17 pm, Zac Slade wrote:
> > On Thursday 23 February 2006 06:45, Daniel wrote:
> > > spider / # umount /backup/
> >
> > Shouldn't be needed.  You can resize the lvol while it's mounted.
>
> ok. good to know.
>
> > Your
> > symptoms below look like the vg metadata may be out of sync.
>
> I was hoping a vgscan would reset this.
>
> > Are you
> > performing a pvmove or other LVM operations?
>
> No other operation in progress. I dont' think i've done a pvmove either.
>
> > > spider / # lvextend -L+60G vg/backup
> > >   Extending logical volume backup to 110.00 GB
> > >   device-mapper: create ioctl failed: Device or resource busy
> > >   Failed to suspend backup
> >
> > Interesting....  You gave tons of other output below, but what would be
> > really helpful is a vgdisplay -v vg and an lvdisplay vg/backup.
>
> spider ~ # vgdisplay -v vg
>     Using volume group(s) on command line
>     Finding volume group "vg"
>   --- Volume group ---
>   VG Name               vg
>   System ID
>   Format                lvm2
>   Metadata Areas        3
>   Metadata Sequence No  19
>   VG Access             read/write
>   VG Status             resizable
>   MAX LV                0
>   Cur LV                6
>   Open LV               6
>   Max PV                0
>   Cur PV                3
>   Act PV                3
>   VG Size               253.23 GB
>   PE Size               4.00 MB
>   Total PE              64828
>   Alloc PE / Size       37909 / 148.08 GB
>   Free  PE / Size       26919 / 105.15 GB
>   VG UUID               RWyOcE-8Fbs-cRWS-C4k5-Oo85-6OYt-Yf3mYN
>
>   --- Logical volume ---
>   LV Name                /dev/vg/home
>   VG Name                vg
>   LV UUID                qsHAy4-JbyK-ix2n-gA9h-yD4Z-kAgl-jlHXsU
>   LV Write Access        read/write
>   LV Status              available
>   # open                 1
>   LV Size                20.00 GB
>   Current LE             5120
>   Segments               1
>   Allocation             inherit
>   Read ahead sectors     0
>   Block device           254:5
>
>   --- Logical volume ---
>   LV Name                /dev/vg/var
>   VG Name                vg
>   LV UUID                woCb0X-lMj3-0g53-X8Sv-T1Es-4UPV-G19rDT
>   LV Write Access        read/write
>   LV Status              available
>   # open                 1
>   LV Size                10.00 GB
>   Current LE             2560
>   Segments               1
>   Allocation             inherit
>   Read ahead sectors     0
>   Block device           254:2
>
>   --- Logical volume ---
>   LV Name                /dev/vg/tmp
>   VG Name                vg
>   LV UUID                uHbozJ-j6Zv-N8dP-P8pE-tr9U-Td13-ustY6B
>   LV Write Access        read/write
>   LV Status              available
>   # open                 1
>   LV Size                2.00 GB
>   Current LE             512
>   Segments               1
>   Allocation             inherit
>   Read ahead sectors     0
>   Block device           254:0
>
>   --- Logical volume ---
>   LV Name                /dev/vg/media
>   VG Name                vg
>   LV UUID                U9C4XC-VunD-VtPP-PsJ0-YY68-2XTU-CGU2ZN
>   LV Write Access        read/write
>   LV Status              available
>   # open                 1
>   LV Size                50.00 GB
>   Current LE             12800
>   Segments               1
>   Allocation             inherit
>   Read ahead sectors     0
>   Block device           254:6
>
>   --- Logical volume ---
>   LV Name                /dev/vg/backup
>   VG Name                vg
>   LV UUID                vlW378-SXL7-hdko-W6Bs-uvBt-vIRa-fEqtVE
>   LV Write Access        read/write
>   LV Status              available
>   # open                 1
>   LV Size                50.00 GB
>   Current LE             12800
>   Segments               1
>   Allocation             inherit
>   Read ahead sectors     0
>   Block device           254:3
>
>   --- Logical volume ---
>   LV Name                /dev/vg/usr1
>   VG Name                vg
>   LV UUID                EPUD1t-sJfE-2w7L-Y6Dl-EbS0-uUdr-vlisTa
>   LV Write Access        read/write
>   LV Status              available
>   # open                 1
>   LV Size                16.08 GB
>   Current LE             4117
>   Segments               1
>   Allocation             inherit
>   Read ahead sectors     0
>   Block device           254:7
>
>   --- Physical volumes ---
>   PV Name               /dev/hdb3
>   PV UUID               6zSraX-fdHS-7fFx-Ji8h-mE2u-BI5F-jI9fye
>   PV Status             allocatable
>   Total PE / Free PE    37909 / 4117
>
>   PV Name               /dev/hda3
>   PV UUID               dm64JZ-JadW-gNun-oEAK-oWC6-teLP-Itd8J5
>   PV Status             allocatable
>   Total PE / Free PE    11920 / 11920
>
>   PV Name               /dev/hda4
>   PV UUID               vnW9zi-bWGt-77uV-OMZA-pozZ-cZ6F-4rQwX1
>   PV Status             allocatable
>   Total PE / Free PE    14999 / 10882
>
> spider ~ #  lvdisplay vg/backup
>   --- Logical volume ---
>   LV Name                /dev/vg/backup
>   VG Name                vg
>   LV UUID                vlW378-SXL7-hdko-W6Bs-uvBt-vIRa-fEqtVE
>   LV Write Access        read/write
>   LV Status              available
>   # open                 1
>   LV Size                50.00 GB
>   Current LE             12800
>   Segments               1
>   Allocation             inherit
>   Read ahead sectors     0
>   Block device           254:3
>
> > You also
> > asked about removing vg/usr, however that lv only shows up in dmsetup
> > table.
>
> I managed to remove it with a 'dmsetup remove'
>
> > Is there a snapshot being taken?  Is there an active snapshot volume?
>
> No. I've never played with snapshots.
>
> > Sounds like the volume group is actually locked right now.
>
> Anyway to reset this.? The state is persistant across reboots.

=2D-=20
Daniel Black <dragonheart@gentoo.org>
Gentoo Crypto/dev-embedded/Forensics/NetMon

--nextPart5521682.tL8UpdRYLS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.9.18 (GNU/Linux)

iD8DBQBEBC3chhpKunZncJcRAsDzAJ9TOa8faMWTQ4hwvXCxV6GDKzctFQCfbKcw
cek5l8igL2URRY9XQ+XZc7k=
=567f
-----END PGP SIGNATURE-----

--nextPart5521682.tL8UpdRYLS--
