Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l0P950UZ002885
	for <linux-lvm@redhat.com>; Thu, 25 Jan 2007 04:05:00 -0500
Received: from mailout06.sul.t-online.com (mailout06.sul.t-online.com
	[194.25.134.19])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l0P94vHu007450
	for <linux-lvm@redhat.com>; Thu, 25 Jan 2007 04:04:58 -0500
Received: from gate.privat.tux (localhost [127.0.0.1])
	by outmail.privat.tux (Katzennetz Outgoing Mailer) with ESMTP id
	6F60626CF
	for <linux-lvm@redhat.com>; Thu, 25 Jan 2007 10:04:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by gate.privat.tux (Katzennetz Internal Mailer) with ESMTP id 1878126EA
	for <linux-lvm@redhat.com>; Thu, 25 Jan 2007 10:04:48 +0100 (CET)
Received: from gate.privat.tux ([127.0.0.1])
	by localhost (gate.privat.tux [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 22634-06 for <linux-lvm@redhat.com>;
	Thu, 25 Jan 2007 10:04:42 +0100 (CET)
Received: from linbook.privat.tux (dhcp29.wlan.tux [192.168.77.29])
	by gate.privat.tux (Katzennetz Internal Mailer) with ESMTP id 6C7AA26CF
	for <linux-lvm@redhat.com>; Thu, 25 Jan 2007 10:03:51 +0100 (CET)
Date: Thu, 25 Jan 2007 10:03:48 +0100
From: "Bernhard Hoelcker" <hoelcker@t-online.de>
Subject: Re: [linux-lvm] lvextend Insufficient free space
Message-ID: <20070125090347.GA5198@bhoelcker.arcor.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline
Reply-To: bhoelcker@arcor.de,
	LVM general discussion and development <linux-lvm@redhat.com>
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


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 1/11/07, David Tran <davidtt3@???> wrote:
> Thank for your help.
> My pvs:
> linux-server:/ # pvscan
> PV /dev/hdb1 VG gdata lvm2 [111.79 GB / 0 free]
> PV /dev/hde1 VG gdata lvm2 [279.46 GB / 40.00 MB free]
> PV /dev/hdf1 VG gdata lvm2 [153.38 GB / 153.38 GB free] (this is the
> new hd)
> Total: 3 [544.62 GB] / in use: 3 [544.62 GB] / in no VG: 0 [0 ]
> I think that it is enogh free space, because I add one more HD already.
> More over, vgdisplay show it has: Free PE / Size 39276 / 153.42 GB

It looks like i have the same problem:

uname -a
Linux xen0 2.6.18.2-34-xen #1 SMP Mon Nov 27 11:46:27 UTC 2006 x86_64 x86_6=
4 x86_64 GNU/Linux
lvm version
  LVM version:     2.02.13 (2006-10-27)
  Library version: 1.02.12 (2006-10-13)
  Driver version:  4.7.0
  --- Physical volume ---
  PV Name               /dev/md1
  VG Name               mirror
--- Volume group ---
  VG Name               mirror
  Free  PE / Size       2560 / 40,00 GB
--- Logical volume ---
  LV Name                /dev/mirror/data1
  VG Name                mirror
  LV Size                78,02 GB
  Segments               1

lvresize -t -l +100%FREE  /dev/mirror/data1
  Test mode: Metadata will NOT be updated.
  Extending logical volume data1 to 118,02 GB
  Insufficient free space: 7553 extents needed, but only 2560 available

I am using no striped lv. Thank you for any help,

Bernhard

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Here some details:

uname -a
Linux xen0 2.6.18.2-34-xen #1 SMP Mon Nov 27 11:46:27 UTC 2006 x86_64 x86_6=
4 x86_64 GNU/Linux
lvm version
  LVM version:     2.02.13 (2006-10-27)
  Library version: 1.02.12 (2006-10-13)
  Driver version:  4.7.0
lvdisplay --maps
  --- Logical volume ---
  LV Name                /dev/nomirror/xen-dom0
  VG Name                nomirror
  LV UUID                NvpDf7-yOZM-VhKM-AiY5-PR1i-CLEm-5dQELt
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                1,00 GB
  Current LE             64
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:8
  =20
  --- Segments ---
  Logical extent 0 to 63:
    Type		linear
    Physical volume	/dev/hdc6
    Physical extents	0 to 63
  =20
  =20
  --- Logical volume ---
  LV Name                /dev/nomirror/xen-dom1
  VG Name                nomirror
  LV UUID                mps0tV-WabP-NUa9-5NXx-maSy-y6Gl-9zF46o
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                2,00 GB
  Current LE             128
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:9
  =20
  --- Segments ---
  Logical extent 0 to 127:
    Type		linear
    Physical volume	/dev/hdc6
    Physical extents	64 to 191
  =20
  =20
  --- Logical volume ---
  LV Name                /dev/nomirror/xen-dom2
  VG Name                nomirror
  LV UUID                ZLSE2F-uDUg-aha7-dQGa-56Uh-eSBZ-DuVJud
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                2,00 GB
  Current LE             128
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:10
  =20
  --- Segments ---
  Logical extent 0 to 127:
    Type		linear
    Physical volume	/dev/hdc6
    Physical extents	192 to 319
  =20
  =20
  --- Logical volume ---
  LV Name                /dev/xen/dom0
  VG Name                xen
  LV UUID                PKuPka-ZYLk-A05p-HRpN-0kCt-NaKT-f8uCSi
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                5,00 GB
  Current LE             1280
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:3
  =20
  --- Segments ---
  Logical extent 0 to 1279:
    Type		linear
    Physical volume	/dev/dm-2
    Physical extents	0 to 1279
  =20
  =20
  --- Logical volume ---
  LV Name                /dev/xen/swap0
  VG Name                xen
  LV UUID                SmSAeK-5acl-34y1-xsqg-ct39-uViK-wBhu6f
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                4,50 GB
  Current LE             1152
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:4
  =20
  --- Segments ---
  Logical extent 0 to 1151:
    Type		linear
    Physical volume	/dev/dm-2
    Physical extents	1280 to 2431
  =20
  =20
  --- Logical volume ---
  LV Name                /dev/xen/dom1_xenadmin
  VG Name                xen
  LV UUID                haSdts-9rK4-tTFr-liMc-UdnF-dshy-VF2E3c
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                10,00 GB
  Current LE             2560
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:5
  =20
  --- Segments ---
  Logical extent 0 to 2559:
    Type		linear
    Physical volume	/dev/dm-2
    Physical extents	2432 to 4991
  =20
  =20
  --- Logical volume ---
  LV Name                /dev/xen/backup
  VG Name                xen
  LV UUID                aWiNtP-exZ3-W7ek-y39S-ZIfr-VLuU-Htl659
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                20,00 GB
  Current LE             5120
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:6
  =20
  --- Segments ---
  Logical extent 0 to 5119:
    Type		linear
    Physical volume	/dev/dm-2
    Physical extents	4992 to 10111
  =20
  =20
  --- Logical volume ---
  LV Name                /dev/xen/data
  VG Name                xen
  LV UUID                485oi3-VNrW-pdZm-nBUQ-wQer-iIlz-OqAbYH
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                30,00 GB
  Current LE             7680
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:7
  =20
  --- Segments ---
  Logical extent 0 to 7679:
    Type		linear
    Physical volume	/dev/dm-2
    Physical extents	10112 to 17791
  =20
  =20
  --- Logical volume ---
  LV Name                /dev/mirror/root
  VG Name                mirror
  LV UUID                k3AhUV-knRG-Jm9h-qgyd-O81p-p5w0-Hd8Ij2
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                10,00 GB
  Current LE             640
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:11
  =20
  --- Segments ---
  Logical extent 0 to 639:
    Type		linear
    Physical volume	/dev/md1
    Physical extents	0 to 639
  =20
  =20
  --- Logical volume ---
  LV Name                /dev/mirror/var
  VG Name                mirror
  LV UUID                45I0C7-NKPg-IaSz-4rcm-Q2Eu-X06j-7BgL5U
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                5,00 GB
  Current LE             320
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:12
  =20
  --- Segments ---
  Logical extent 0 to 319:
    Type		linear
    Physical volume	/dev/md1
    Physical extents	640 to 959
  =20
  =20
  --- Logical volume ---
  LV Name                /dev/mirror/usr_local
  VG Name                mirror
  LV UUID                uCC90y-R80M-OcvK-GqsK-UkMj-DBN6-RJrUUz
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                5,00 GB
  Current LE             320
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:13
  =20
  --- Segments ---
  Logical extent 0 to 319:
    Type		linear
    Physical volume	/dev/md1
    Physical extents	960 to 1279
  =20
  =20
  --- Logical volume ---
  LV Name                /dev/mirror/tmp
  VG Name                mirror
  LV UUID                hq1Qxo-ISyb-deNQ-53XY-Sj2Y-DHas-tdvdDD
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                3,00 GB
  Current LE             192
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:14
  =20
  --- Segments ---
  Logical extent 0 to 191:
    Type		linear
    Physical volume	/dev/md1
    Physical extents	1280 to 1471
  =20
  =20
  --- Logical volume ---
  LV Name                /dev/mirror/home
  VG Name                mirror
  LV UUID                OHheEX-yag2-eFwJ-uN7S-3gpo-52Uz-yh0ISE
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                5,00 GB
  Current LE             320
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:15
  =20
  --- Segments ---
  Logical extent 0 to 319:
    Type		linear
    Physical volume	/dev/md1
    Physical extents	1472 to 1791
  =20
  =20
  --- Logical volume ---
  LV Name                /dev/mirror/data1
  VG Name                mirror
  LV UUID                3AUXNd-w7ws-X0hb-nhWB-KNd2-XFF8-Nuiqig
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                78,02 GB
  Current LE             4993
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:16
  =20
  --- Segments ---
  Logical extent 0 to 4992:
    Type		linear
    Physical volume	/dev/md1
    Physical extents	1792 to 6784
  =20
  =20
pvdisplay
  --- Physical volume ---
  PV Name               /dev/hdc6
  VG Name               nomirror
  PV Size               37,28 GB / not usable 10,03 MB
  Allocatable           yes=20
  PE Size (KByte)       16384
  Total PE              2385
  Free PE               2065
  Allocated PE          320
  PV UUID               zw68YW-MKEf-gTH6-jc5g-EO2U-OhlB-oVSxq3
  =20
  --- Physical volume ---
  PV Name               /dev/hdd6
  VG Name               nomirror
  PV Size               37,28 GB / not usable 10,03 MB
  Allocatable           yes=20
  PE Size (KByte)       16384
  Total PE              2385
  Free PE               2385
  Allocated PE          0
  PV UUID               xOR6E7-4g7y-38EK-IPST-kEpd-VkKT-l9AlIg
  =20
  --- Physical volume ---
  PV Name               /dev/dm-2
  VG Name               xen
  PV Size               230,88 GB / not usable 1,50 MB
  Allocatable           yes=20
  PE Size (KByte)       4096
  Total PE              59104
  Free PE               41312
  Allocated PE          17792
  PV UUID               Q1zRYC-b2Ks-3ztt-mOLn-um8r-jYSz-zACCOk
  =20
  --- Physical volume ---
  PV Name               /dev/md1
  VG Name               mirror
  PV Size               146,03 GB / not usable 14,56 MB
  Allocatable           yes=20
  PE Size (KByte)       16384
  Total PE              9345
  Free PE               2560
  Allocated PE          6785
  PV UUID               rZEwPw-SpLS-bkAb-frgA-hmQa-dCfy-qsUZYc
  =20
vgdisplay
  --- Volume group ---
  VG Name               nomirror
  System ID            =20
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  14
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                3
  Open LV               0
  Max PV                0
  Cur PV                2
  Act PV                2
  VG Size               74,53 GB
  PE Size               16,00 MB
  Total PE              4770
  Alloc PE / Size       320 / 5,00 GB
  Free  PE / Size       4450 / 69,53 GB
  VG UUID               RlRH66-9BdX-oI0I-X30z-V3fA-M09j-o2jXdf
  =20
  --- Volume group ---
  VG Name               xen
  System ID            =20
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  7
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                5
  Open LV               3
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               230,88 GB
  PE Size               4,00 MB
  Total PE              59104
  Alloc PE / Size       17792 / 69,50 GB
  Free  PE / Size       41312 / 161,38 GB
  VG UUID               m6DWFg-NNBX-5fbZ-b8XY-0ud5-fKLE-Rtt4bi
  =20
  --- Volume group ---
  VG Name               mirror
  System ID            =20
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  12
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                6
  Open LV               0
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               146,02 GB
  PE Size               16,00 MB
  Total PE              9345
  Alloc PE / Size       6785 / 106,02 GB
  Free  PE / Size       2560 / 40,00 GB
  VG UUID               IEu2nW-7tg5-iSyq-mU8Y-89Sr-yEsI-vpZu7f
  =20
lvdisplay
  --- Logical volume ---
  LV Name                /dev/nomirror/xen-dom0
  VG Name                nomirror
  LV UUID                NvpDf7-yOZM-VhKM-AiY5-PR1i-CLEm-5dQELt
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                1,00 GB
  Current LE             64
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:8
  =20
  --- Logical volume ---
  LV Name                /dev/nomirror/xen-dom1
  VG Name                nomirror
  LV UUID                mps0tV-WabP-NUa9-5NXx-maSy-y6Gl-9zF46o
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                2,00 GB
  Current LE             128
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:9
  =20
  --- Logical volume ---
  LV Name                /dev/nomirror/xen-dom2
  VG Name                nomirror
  LV UUID                ZLSE2F-uDUg-aha7-dQGa-56Uh-eSBZ-DuVJud
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                2,00 GB
  Current LE             128
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:10
  =20
  --- Logical volume ---
  LV Name                /dev/xen/dom0
  VG Name                xen
  LV UUID                PKuPka-ZYLk-A05p-HRpN-0kCt-NaKT-f8uCSi
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                5,00 GB
  Current LE             1280
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:3
  =20
  --- Logical volume ---
  LV Name                /dev/xen/swap0
  VG Name                xen
  LV UUID                SmSAeK-5acl-34y1-xsqg-ct39-uViK-wBhu6f
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                4,50 GB
  Current LE             1152
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:4
  =20
  --- Logical volume ---
  LV Name                /dev/xen/dom1_xenadmin
  VG Name                xen
  LV UUID                haSdts-9rK4-tTFr-liMc-UdnF-dshy-VF2E3c
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                10,00 GB
  Current LE             2560
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:5
  =20
  --- Logical volume ---
  LV Name                /dev/xen/backup
  VG Name                xen
  LV UUID                aWiNtP-exZ3-W7ek-y39S-ZIfr-VLuU-Htl659
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                20,00 GB
  Current LE             5120
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:6
  =20
  --- Logical volume ---
  LV Name                /dev/xen/data
  VG Name                xen
  LV UUID                485oi3-VNrW-pdZm-nBUQ-wQer-iIlz-OqAbYH
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                30,00 GB
  Current LE             7680
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:7
  =20
  --- Logical volume ---
  LV Name                /dev/mirror/root
  VG Name                mirror
  LV UUID                k3AhUV-knRG-Jm9h-qgyd-O81p-p5w0-Hd8Ij2
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                10,00 GB
  Current LE             640
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:11
  =20
  --- Logical volume ---
  LV Name                /dev/mirror/var
  VG Name                mirror
  LV UUID                45I0C7-NKPg-IaSz-4rcm-Q2Eu-X06j-7BgL5U
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                5,00 GB
  Current LE             320
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:12
  =20
  --- Logical volume ---
  LV Name                /dev/mirror/usr_local
  VG Name                mirror
  LV UUID                uCC90y-R80M-OcvK-GqsK-UkMj-DBN6-RJrUUz
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                5,00 GB
  Current LE             320
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:13
  =20
  --- Logical volume ---
  LV Name                /dev/mirror/tmp
  VG Name                mirror
  LV UUID                hq1Qxo-ISyb-deNQ-53XY-Sj2Y-DHas-tdvdDD
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                3,00 GB
  Current LE             192
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:14
  =20
  --- Logical volume ---
  LV Name                /dev/mirror/home
  VG Name                mirror
  LV UUID                OHheEX-yag2-eFwJ-uN7S-3gpo-52Uz-yh0ISE
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                5,00 GB
  Current LE             320
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:15
  =20
  --- Logical volume ---
  LV Name                /dev/mirror/data1
  VG Name                mirror
  LV UUID                3AUXNd-w7ws-X0hb-nhWB-KNd2-XFF8-Nuiqig
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                78,02 GB
  Current LE             4993
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:16
  =20
lvresize -t -l +100%FREE  /dev/mirror/data1
  Test mode: Metadata will NOT be updated.
  Extending logical volume data1 to 118,02 GB
  Insufficient free space: 7553 extents needed, but only 2560 available


--=20

Bernhard H=C3=B6lcker


--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQFFuHJzicC7E4pU9FMRAie5AJ49eaCADkBNDabAcv9o+iGzcdWqtwCfeZcI
lBJFrpG3E/ADz1FZgHezcP4=
=/iAs
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
