Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1NCWY117030
	for <linux-lvm@redhat.com>; Thu, 23 Feb 2006 07:32:34 -0500
Received: from mail.internode.on.net (bld-mail07.adl2.internode.on.net
	[203.16.214.71])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1NCWVWr031268
	for <linux-lvm@redhat.com>; Thu, 23 Feb 2006 07:32:32 -0500
Received: from frog.local (unverified [59.167.56.137]) 
	by mail.internode.on.net (SurgeMail 3.2f) with ESMTP id 13025463 
	for <linux-lvm@redhat.com>; Thu, 23 Feb 2006 23:02:29 +1030 (CDT)
From: Daniel <dragonheart@gentoo.org>
Date: Thu, 23 Feb 2006 23:45:41 +1100
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart13599420.tePCniHZ81";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200602232345.46437.dragonheart@gentoo.org>
Subject: [linux-lvm] lvextend - device-mapper: create ioctl failed: Device
	or resource busy\nFailed to suspend
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

--nextPart13599420.tePCniHZ81
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


Just wondering why I can't extend a lv.

Tips on removing vg/usr would be appreciated too.

spider / # umount /backup/

spider / # lvextend -L+60G vg/backup
  Extending logical volume backup to 110.00 GB
  device-mapper: create ioctl failed: Device or resource busy
  Failed to suspend backup
spider / # lvchange -an vg/backup

spider / # lvextend -L+60G vg/backup
  Extending logical volume backup to 110.00 GB
  device-mapper: create ioctl failed: Device or resource busy
  Failed to suspend backup

spider / # lvextend -L+60G /dev/vg/backup
  Extending logical volume backup to 110.00 GB
  device-mapper: create ioctl failed: Device or resource busy
  Failed to suspend backup

spider / # lvs -v
    Finding all logical volumes
  LV     VG   #Seg Attr   LSize  Maj Min KMaj KMin Origin Snap%  Move Copy%=
  Log LV UUID
  backup vg      1 -wi-a- 50.00G  -1  -1 254  3                            =
      vlW378-SXL7-hdko-W6Bs-uvBt-vIRa-fEqtVE
  home   vg      1 -wi-ao 20.00G  -1  -1 254  5                            =
      qsHAy4-JbyK-ix2n-gA9h-yD4Z-kAgl-jlHXsU
  media  vg      1 -wi-ao 50.00G  -1  -1 254  6                            =
      U9C4XC-VunD-VtPP-PsJ0-YY68-2XTU-CGU2ZN
  tmp    vg      1 -wi-ao  2.00G  -1  -1 254  0                            =
      uHbozJ-j6Zv-N8dP-P8pE-tr9U-Td13-ustY6B
  usr1   vg      1 -wi-ao 16.08G  -1  -1 254  7                            =
      EPUD1t-sJfE-2w7L-Y6Dl-EbS0-uUdr-vlisTa
  var    vg      1 -wi-ao 10.00G  -1  -1 254  2                            =
      woCb0X-lMj3-0g53-X8Sv-T1Es-4UPV-G19rDT

spider / # lvs --segments -v
    Finding all logical volumes
  LV     VG   Attr   Start SSize  #Str Type   Stripe Chunk
  backup vg   -wi-a-    0  50.00G    1 linear     0     0
  home   vg   -wi-ao    0  20.00G    1 linear     0     0
  media  vg   -wi-ao    0  50.00G    1 linear     0     0
  tmp    vg   -wi-ao    0   2.00G    1 linear     0     0
  usr1   vg   -wi-ao    0  16.08G    1 linear     0     0
  var    vg   -wi-ao    0  10.00G    1 linear     0     0


spider / # vgs -v
    Finding all volume groups
    Finding volume group "vg"
    Archiving volume group "vg" metadata (seqno 20).
    Archiving volume group "vg" metadata (seqno 19).
    Creating volume group backup "/etc/lvm/backup/vg" (seqno 19).
  VG   Attr   Ext   #PV #LV #SN VSize   VFree   VG UUID
  vg   wz--n- 4.00M   3   6   0 253.23G 105.15G RWyOcE-8Fbs-cRWS-C4k5-Oo85-=
6OYt-Yf3mYN

spider / # pvs -v
    Scanning for physical volume names
  PV         VG   Fmt  Attr PSize   PFree  DevSize PV UUID
  /dev/hda3  vg   lvm2 a-    46.56G 46.56G  46.57G dm64JZ-JadW-gNun-oEAK-oW=
C6-teLP-Itd8J5
  /dev/hda4  vg   lvm2 a-    58.59G 42.51G  58.59G vnW9zi-bWGt-77uV-OMZA-po=
zZ-cZ6F-4rQwX1
  /dev/hdb3  vg   lvm2 a-   148.08G 16.08G 148.08G 6zSraX-fdHS-7fFx-Ji8h-mE=
2u-BI5F-jI9fye

spider / # dmsetup table
vg-tmp: 0 4194304 linear 3:67 94372224
vg-usr: 0 20971520 linear 3:67 384
vg-var: 0 20971520 linear 3:67 73400704
vg-backup: 0 104857600 linear 3:67 203424128
vg-opt: 0 10485760 linear 3:67 62914944
vg-home: 0 41943040 linear 3:67 20971904
vg-usr1: 0 33726464 linear 3:4 384
vg-media: 0 104857600 linear 3:67 98566528

spider / # vgdisplay
  --- Volume group ---
  VG Name               vg
  System ID
  Format                lvm2
  Metadata Areas        3
  Metadata Sequence No  19
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                6
  Open LV               5
  Max PV                0
  Cur PV                3
  Act PV                3
  VG Size               253.23 GB
  PE Size               4.00 MB
  Total PE              64828
  Alloc PE / Size       37909 / 148.08 GB
  Free  PE / Size       26919 / 105.15 GB
  VG UUID               RWyOcE-8Fbs-cRWS-C4k5-Oo85-6OYt-Yf3mYN

spider / # lvextend -l +15000 /dev/vg/backup
  Extending logical volume backup to 108.59 GB
  device-mapper: create ioctl failed: Device or resource busy
  Failed to suspend backup

spider / # lvs --version
  LVM version:     2.02.02 (2006-02-07)
  Library version: 1.02.03 (2006-02-08)
  Driver version:  4.4.0

Portage 2.0.54 (hardened/x86/2.6, gcc-3.4.5, glibc-2.3.5-r2, 2.6.14-hardene=
d-r5 i686)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
System uname: 2.6.14-hardened-r5 i686 Pentium III (Coppermine)
Gentoo Base System version 1.6.14
distcc 2.18.3 i686-pc-linux-gnu (protocols 1 and 2) (default port 3632) [en=
abled]
dev-lang/python:     2.3.5, 2.4.2
sys-apps/sandbox:    1.2.12
sys-devel/autoconf:  2.13, 2.59-r6
sys-devel/automake:  1.4_p6, 1.5, 1.6.3, 1.7.9-r1, 1.8.5-r3, 1.9.6-r1
sys-devel/binutils:  2.16.1
sys-devel/libtool:   1.5.22
virtual/os-headers:  2.6.11-r2
ACCEPT_KEYWORDS=3D"x86"
AUTOCLEAN=3D"yes"
CBUILD=3D"i686-pc-linux-gnu"
CFLAGS=3D"-march=3Dpentium3 -O2 -pipe"
CHOST=3D"i686-pc-linux-gnu"


=2D-=20
Daniel Black <dragonheart@gentoo.org>
Gentoo Crypto/dev-embedded/Forensics/NetMon

--nextPart13599420.tePCniHZ81
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.9.18 (GNU/Linux)

iD8DBQBD/a56hhpKunZncJcRAgP9AJ9wWLxGQ1N4gSrDLj8LqCn9sbHQYwCfciLu
inPgvGVFZCzxkdcmIviPsA4=
=Chi2
-----END PGP SIGNATURE-----

--nextPart13599420.tePCniHZ81--
