Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j35FAEO18984
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2005 11:10:14 -0400
Received: from smtpout1.cns.ohiou.edu (smtpout1.cns.ohiou.edu [132.235.51.146])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j35FADSF002014
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2005 11:10:13 -0400
Received: from hibbard.research.ohiou.edu (hibbard.research.ohiou.edu
	[132.235.167.185])
	by oak.cats.ohiou.edu (8.13.1/8.13.1) with ESMTP id j35EtIpr2503724
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NOT)
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2005 10:55:19 -0400 (EDT)
From: Tim Hibbard <hibbard@ohio.edu>
Date: Tue, 5 Apr 2005 09:55:15 -0500
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart25889026.4klX6br35S";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200504051055.18460.hibbard@ohio.edu>
Subject: [linux-lvm] Problems compiling LVM2.2.01.09
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

--nextPart25889026.4klX6br35S
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

I am trying to compile LVM2.2.01.09 and I am having problems.  I have patch=
ed=20
kernel-2.4.30 with device-mapper.1.00.21 support.  I now have the kernel=20
booted with device manager support.

When I type 'make install' on LVM2 I get the following errors:

gcc -E -P cmdnames.h 2> /dev/null | \
        egrep -v '^ *(|#.*|dumpconfig|formats|help|pvdata|segtypes|version)=
=20
*$' > .commands
gcc -o lvm archiver.o dumpconfig.o formats.o lvchange.o lvcreate.o lvdispla=
y.o=20
lvextend.o lvmchange.o lvmcmdline.o lvmdiskscan.o lvreduce.o lvremove.o=20
lvrename.o lvresize.o lvscan.o polldaemon.o pvchange.o pvcreate.o pvdisplay=
=2Eo=20
pvmove.o pvremove.o pvscan.o reporter.o segtypes.o toollib.o vgcfgbackup.o=
=20
vgcfgrestore.o vgchange.o vgck.o vgcreate.o vgconvert.o vgdisplay.o=20
vgexport.o vgextend.o vgimport.o vgmerge.o vgmknodes.o vgreduce.o vgremove.=
o=20
vgrename.o vgscan.o vgsplit.o lvm.o -Wl,--export-dynamic -L../lib -L/lib=20
=2Dllvm -ldevmapper -ldl  -rdynamic
=2E./lib/liblvm.a(dev_manager.o)(.text+0x2ab): In function `_info_run':
: undefined reference to `dm_task_no_open_count'
=2E./lib/liblvm.a(dev_manager.o)(.text+0x45e): In function `_status_run':
: undefined reference to `dm_task_no_open_count'
=2E./lib/liblvm.a(dev_manager.o)(.text+0x75b): In function `_percent_run':
: undefined reference to `dm_task_no_open_count'
=2E./lib/liblvm.a(dev_manager.o)(.text+0xcdd): In function `_rename':
: undefined reference to `dm_task_no_open_count'
=2E./lib/liblvm.a(dev_manager.o)(.text+0xe79): In function `_suspend_or_res=
ume':
: undefined reference to `dm_task_no_open_count'
=2E./lib/liblvm.a(dev_manager.o)(.text+0x1163): more undefined references t=
o=20
`dm_task_no_open_count' follow
collect2: ld returned 1 exit status
make[1]: *** [lvm] Error 1
make[1]: Leaving directory `/home/yibbiy/cluster/LVM2.2.01.09/tools'
make: *** [tools] Error 2


Any feedback is appreciated.  Thanks in advance.

Tim Hibbard


=2D-=20
Tim Hibbard
Database/Programmer for
Vice President Of Research
109C RTEC
Ohio University
Athens, Ohio 45701
740.593.0373

******** W A R N I N G ! **************************************
Linux should not be used by those under the influence of MicroSoft.
May cause dizziness or vertigo. Consult your tech support before
using Linux. (note--after using Linux, you may notice extreme
discomfort when using MicroSoft. Discontinue use of MicroSoft.)
************************************** W A R N I N G ! ********

--nextPart25889026.4klX6br35S
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iQCVAwUAQlKm1h4Uh8wHoWf/AQJEsQP/QkSz2RyealwZafIVk51Vn+jNWrdxZi2Y
tgIKMDGJBFhmBlAwOPQfTva/50YE1TVk4FrFZIYxVgJR3Dl2yhvFB9RcwJRWw6H0
nyLL3gbBNrWQG4sI8FMpgPdjNm2Rp4rJqkDhnHTExVgWtZ2IE05jKmE6p54S2wGD
JycmFBzvg44=
=xuh+
-----END PGP SIGNATURE-----

--nextPart25889026.4klX6br35S--
