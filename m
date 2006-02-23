Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1NDYd102416
	for <linux-lvm@redhat.com>; Thu, 23 Feb 2006 08:34:39 -0500
Received: from mail.internode.on.net (bld-mail02.adl2.internode.on.net
	[203.16.214.66])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1NDYaHD027174
	for <linux-lvm@redhat.com>; Thu, 23 Feb 2006 08:34:37 -0500
Received: from frog.local (unverified [59.167.56.137]) 
	by mail.internode.on.net (SurgeMail 3.2f) with ESMTP id 204958264 
	for <linux-lvm@redhat.com>; Fri, 24 Feb 2006 00:04:34 +1030 (CDT)
From: Daniel <dragonheart@gentoo.org>
Subject: Re: [linux-lvm] lvextend - device-mapper: create ioctl failed: Device
	or resource busy\nFailed to suspend
Date: Fri, 24 Feb 2006 00:34:22 +1100
References: <200602232345.46437.dragonheart@gentoo.org>
In-Reply-To: <200602232345.46437.dragonheart@gentoo.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2526710.3KxQc7aSlE";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200602240034.27220.dragonheart@gentoo.org>
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

--nextPart2526710.3KxQc7aSlE
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline


More info.

strace
http://dev.gentoo.org/~dragonheart/lvstrace.txt

reveils:

ioctl(9, DM_DEV_CREATE, 0x81c51c8) =3D -1 EBUSY
in strace when fd 9 is /dev/mapper/control

lvextend -vvvv  -l +15000 /dev/vg/backup
=2E...
=2E.. (searching other volumes)
=2E..
#format_text/format-text.c:320         Read vg metadata (19) from /dev/hdb3=
 at=20
44032 size 2265
#metadata/pv_manip.c:241         /dev/hdb3 0:      0   2560: NULL(0:0)
#metadata/pv_manip.c:241         /dev/hdb3 1:   2560   5120: home(0:0)
#metadata/pv_manip.c:241         /dev/hdb3 2:   7680   1280: NULL(0:0)
#metadata/pv_manip.c:241         /dev/hdb3 3:   8960   2560: var(0:0)
#metadata/pv_manip.c:241         /dev/hdb3 4:  11520    512: tmp(0:0)
#metadata/pv_manip.c:241         /dev/hdb3 5:  12032  12800: media(0:0)
#metadata/pv_manip.c:241         /dev/hdb3 6:  24832  12800: backup(0:0)
#metadata/pv_manip.c:241         /dev/hdb3 7:  37632    277: NULL(0:0)
#metadata/pv_manip.c:241         /dev/hda3 0:      0  11920: NULL(0:0)
#metadata/pv_manip.c:241         /dev/hda4 0:      0   4117: usr1(0:0)
#metadata/pv_manip.c:241         /dev/hda4 1:   4117  10882: NULL(0:0)
#format_text/archiver.c:129     Archiving volume group "vg" metadata (seqno=
=20
19).
  Extending logical volume backup to 108.59 GB
#metadata/pv_map.c:46         Allowing allocation on /dev/hdb3 start PE 0=20
length 2560
#metadata/pv_map.c:46         Allowing allocation on /dev/hdb3 start PE 768=
0=20
length 1280
#metadata/pv_map.c:46         Allowing allocation on /dev/hdb3 start PE 376=
32=20
length 277
#metadata/pv_map.c:46         Allowing allocation on /dev/hda3 start PE 0=20
length 11920
#metadata/pv_map.c:46         Allowing allocation on /dev/hda4 start PE 411=
7=20
length 10882
#metadata/pv_manip.c:241         /dev/hdb3 0:      0   2560: NULL(0:0)
#metadata/pv_manip.c:241         /dev/hdb3 1:   2560   5120: home(0:0)
#metadata/pv_manip.c:241         /dev/hdb3 2:   7680   1280: NULL(0:0)
#metadata/pv_manip.c:241         /dev/hdb3 3:   8960   2560: var(0:0)
#metadata/pv_manip.c:241         /dev/hdb3 4:  11520    512: tmp(0:0)
#metadata/pv_manip.c:241         /dev/hdb3 5:  12032  12800: media(0:0)
#metadata/pv_manip.c:241         /dev/hdb3 6:  24832  13077: backup(0:0)
#metadata/pv_manip.c:241         /dev/hda3 0:      0  11920: backup(13077:0)
#metadata/pv_manip.c:241         /dev/hda4 0:      0   4117: usr1(0:0)
#metadata/pv_manip.c:241         /dev/hda4 1:   4117   2803: backup(24997:0)
#metadata/pv_manip.c:241         /dev/hda4 2:   6920   8079: NULL(0:0)
#format_text/format-text.c:414         Writing vg metadata to /dev/hda3 at=
=20
17920 len 2513
#format_text/format-text.c:414         Writing vg metadata to /dev/hda4 at=
=20
17920 len 2513
#format_text/format-text.c:414         Writing vg metadata to /dev/hdb3 at=
=20
46592 len 2513
#format_text/format-text.c:516         Pre-Committing vg metadata (20)=20
to /dev/hda3 header at 4096
#format_text/format-text.c:516         Pre-Committing vg metadata (20)=20
to /dev/hda4 header at 4096
#format_text/format-text.c:516         Pre-Committing vg metadata (20)=20
to /dev/hdb3 header at 4096
#format_text/archiver.c:364     Creating volume group backup=20
"/etc/lvm/backup/vg" (seqno 20).
#format_text/format-text.c:711         Writing vg metadata=20
to /etc/lvm/backup/.lvm_spider_31093_1641323837
#format_text/format-text.c:755         Committing vg metadata (20)
#format_text/format-text.c:756         Renaming /etc/lvm/backup/vg.tmp=20
to /etc/lvm/backup/vg
#locking/file_locking.c:250         Locking LV=20
RWyOcE8FbscRWSC4k5Oo856OYtYf3mYNvlW378SXL7hdkoW6BsuvBtvIRafEqtVE (W)
#metadata/metadata.c:1171       Finding volume group for uuid=20
RWyOcE8FbscRWSC4k5Oo856OYtYf3mYNvlW378SXL7hdkoW6BsuvBtvIRafEqtVE
#label/label.c:167       /dev/hda3: lvm2 label detected
#label/label.c:167       /dev/hda4: lvm2 label detected
#label/label.c:167       /dev/hdb3: lvm2 label detected
#label/label.c:167       /dev/hdb3: lvm2 label detected
#label/label.c:167       /dev/hda3: lvm2 label detected
#label/label.c:167       /dev/hda4: lvm2 label detected
#format_text/format-text.c:320         Read vg metadata (19) from /dev/hda3=
 at=20
15360 size 2265
#label/label.c:167       /dev/hdb3: lvm2 label detected
#label/label.c:167       /dev/hda3: lvm2 label detected
#label/label.c:167       /dev/hda4: lvm2 label detected
#format_text/format-text.c:320         Read vg metadata (19) from /dev/hda4=
 at=20
15360 size 2265
#label/label.c:167       /dev/hdb3: lvm2 label detected
#label/label.c:167       /dev/hda3: lvm2 label detected
#label/label.c:167       /dev/hda4: lvm2 label detected
#format_text/format-text.c:320         Read vg metadata (19) from /dev/hdb3=
 at=20
44032 size 2265
#metadata/metadata.c:1177     Found volume group "vg"
#metadata/metadata.c:1171       Finding volume group for uuid=20
RWyOcE8FbscRWSC4k5Oo856OYtYf3mYNvlW378SXL7hdkoW6BsuvBtvIRafEqtVE
#label/label.c:167       /dev/hda3: lvm2 label detected
#label/label.c:167       /dev/hda4: lvm2 label detected
#label/label.c:167       /dev/hdb3: lvm2 label detected
#label/label.c:167       /dev/hdb3: lvm2 label detected
#label/label.c:167       /dev/hda3: lvm2 label detected
#label/label.c:167       /dev/hda4: lvm2 label detected
#format_text/format-text.c:320         Read vg pre-commit metadata (20)=20
from /dev/hda3 at 17920 size 2513
#label/label.c:167       /dev/hdb3: lvm2 label detected
#label/label.c:167       /dev/hda3: lvm2 label detected
#label/label.c:167       /dev/hda4: lvm2 label detected
#format_text/format-text.c:320         Read vg pre-commit metadata (20)=20
from /dev/hda4 at 17920 size 2513
#label/label.c:167       /dev/hdb3: lvm2 label detected
#label/label.c:167       /dev/hda3: lvm2 label detected
#label/label.c:167       /dev/hda4: lvm2 label detected
#format_text/format-text.c:320         Read vg pre-commit metadata (20)=20
from /dev/hdb3 at 46592 size 2513
#metadata/metadata.c:1177     Found volume group "vg"
#activate/activate.c:370         Getting device info for vg-backup
#ioctl/libdm-iface.c:1454         dm version   O   [16384]
#ioctl/libdm-iface.c:1454         dm info =20
LVM-RWyOcE8FbscRWSC4k5Oo856OYtYf3mYNvlW378SXL7hdkoW6BsuvBtvIRafEqtVE N  =20
[16384]
#ioctl/libdm-iface.c:1454         dm info =20
RWyOcE8FbscRWSC4k5Oo856OYtYf3mYNvlW378SXL7hdkoW6BsuvBtvIRafEqtVE N   [16384]
#ioctl/libdm-iface.c:1454         dm info vg-backup  N   [16384]
#config/config.c:757       Setting activation/missing_stripe_filler=20
to /dev/ioerror
#activate/dev_manager.c:588         Getting device info for vg-backup=20
[LVM-RWyOcE8FbscRWSC4k5Oo856OYtYf3mYNvlW378SXL7hdkoW6BsuvBtvIRafEqtVE]
#ioctl/libdm-iface.c:1454         dm info =20
LVM-RWyOcE8FbscRWSC4k5Oo856OYtYf3mYNvlW378SXL7hdkoW6BsuvBtvIRafEqtVE O  =20
[16384]
#ioctl/libdm-iface.c:1454         dm info =20
RWyOcE8FbscRWSC4k5Oo856OYtYf3mYNvlW378SXL7hdkoW6BsuvBtvIRafEqtVE O   [16384]
#ioctl/libdm-iface.c:1454         dm info vg-backup  O   [16384]
#ioctl/libdm-iface.c:1454         dm deps   (254:3) O   [16384]
#activate/dev_manager.c:588         Getting device info for vg-backup-real=
=20
[LVM-RWyOcE8FbscRWSC4k5Oo856OYtYf3mYNvlW378SXL7hdkoW6BsuvBtvIRafEqtVE-real]
#ioctl/libdm-iface.c:1454         dm info =20
LVM-RWyOcE8FbscRWSC4k5Oo856OYtYf3mYNvlW378SXL7hdkoW6BsuvBtvIRafEqtVE-real O=
  =20
[16384]
#ioctl/libdm-iface.c:1454         dm info =20
RWyOcE8FbscRWSC4k5Oo856OYtYf3mYNvlW378SXL7hdkoW6BsuvBtvIRafEqtVE-real O  =20
[16384]
#ioctl/libdm-iface.c:1454         dm info vg-backup-real  O   [16384]
#activate/dev_manager.c:588         Getting device info for vg-backup-cow=20
[LVM-RWyOcE8FbscRWSC4k5Oo856OYtYf3mYNvlW378SXL7hdkoW6BsuvBtvIRafEqtVE-cow]
#ioctl/libdm-iface.c:1454         dm info =20
LVM-RWyOcE8FbscRWSC4k5Oo856OYtYf3mYNvlW378SXL7hdkoW6BsuvBtvIRafEqtVE-cow O =
 =20
[16384]
#ioctl/libdm-iface.c:1454         dm info =20
RWyOcE8FbscRWSC4k5Oo856OYtYf3mYNvlW378SXL7hdkoW6BsuvBtvIRafEqtVE-cow O  =20
[16384]
#ioctl/libdm-iface.c:1454         dm info vg-backup-cow  O   [16384]
#activate/activate.c:293       Getting target version for linear
#ioctl/libdm-iface.c:1454         dm versions   O   [16384]
#activate/activate.c:293       Getting target version for striped
#ioctl/libdm-iface.c:1454         dm versions   O   [16384]
#libdm-deptree.c:1148     Creating vg-backup
#ioctl/libdm-iface.c:1454         dm create vg-backup=20
LVM-RWyOcE8FbscRWSC4k5Oo856OYtYf3mYNvlW378SXL7hdkoW6BsuvBtvIRafEqtVE N  =20
[16384]
#ioctl/libdm-iface.c:1471   device-mapper: create ioctl failed: Device or=20
resource busy
#libdm-deptree.c:1493         <backtrace>
#activate/dev_manager.c:993         <backtrace>
#activate/activate.c:505         <backtrace>
#activate/activate.c:640         <backtrace>
#lvresize.c:530   Failed to suspend backup
#format_text/format-text.c:520         Wiping pre-committed vg metadata=20
from /dev/hda3 header at 4096
#format_text/format-text.c:520         Wiping pre-committed vg metadata=20
from /dev/hda4 header at 4096
#format_text/format-text.c:520         Wiping pre-committed vg metadata=20
from /dev/hdb3 header at 4096
#locking/file_locking.c:59       Unlocking /var/lock/lvm/V_vg
#device/dev-io.c:483         Closed /dev/hda3
#device/dev-io.c:483         Closed /dev/hda4
#device/dev-io.c:483         Closed /dev/hdb3

Seems to map to kernel drivers/md/dm-ioctl.c:228


=2D-=20
Daniel Black <dragonheart@gentoo.org>
Gentoo Crypto/dev-embedded/Forensics/NetMon

--nextPart2526710.3KxQc7aSlE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.9.18 (GNU/Linux)

iD8DBQBD/bnjhhpKunZncJcRArFSAJ43aMYb4C6YzpI+MH/sq2wzgk0z7wCfcBvn
ldOdZ7gegUJctNACX3Vks1A=
=S8hm
-----END PGP SIGNATURE-----

--nextPart2526710.3KxQc7aSlE--
