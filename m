Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l5TDMIUx009860
	for <linux-lvm@redhat.com>; Fri, 29 Jun 2007 09:22:18 -0400
Received: from smtp5-g19.free.fr (smtp5-g19.free.fr [212.27.42.35])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l5TDMD4w019049
	for <linux-lvm@redhat.com>; Fri, 29 Jun 2007 09:22:14 -0400
Received: from taris.localnet (stc92-2-82-228-136-150.fbx.proxad.net
	[82.228.136.150])
	by smtp5-g19.free.fr (Postfix) with ESMTP id 3EF5344FFB
	for <linux-lvm@redhat.com>; Fri, 29 Jun 2007 15:22:13 +0200 (CEST)
Received: from localhost ([127.0.0.1])
	by taris.localnet (Kerio MailServer 6.3.1) for linux-lvm@redhat.com;
	Fri, 29 Jun 2007 15:22:10 +0200
From: "Mathieu CARBONNEAUX" <info@ch2o.info>
Message-ID: <20070629132210.41def20c@taris.localnet>
Date: Fri, 29 Jun 2007 15:22:10 +0200
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="-----------2b194ad083937d02cfed1d8d600c2ca0"
Subject: [linux-lvm] os upgrade probleme...lv activation error...
Reply-To: info@ch2o.info,
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

This is a multi-part message in MIME format.

-------------2b194ad083937d02cfed1d8d600c2ca0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

=20

hi,

my configuration:
- bi-xeon emt64 hyperthread 2.8ghz.
- 3 go ram
- sata promise "Promise PDC20318 (SATA150 TX4)" cards.
- sata intel "6300ESB SATA Storage Controller" cards.


with i've upgraded opensuse from 10.0 (x64) to 10.2 (x64).
all worked fine... but one lv d'ont whant to activate...

and when they try to activate my lv/vg with "vgchange" they say device m=
apper error:
#vgchange -ay
  1 logical volume(s) in volume group "mailvg" now active
  1 logical volume(s) in volume group "imagesvg" now active
  device-mapper: reload ioctl failed: Invalid argument
  4 logical volume(s) in volume group "downvg" now active
  4 logical volume(s) in volume group "rootvg" now active
  1 logical volume(s) in volume group "backupvg" now active

#lvs
  LV         VG       Attr   LSize   Origin Snap%  Move Log Copy%
  lvbackup   backupvg -wi-ao  80.00G
  downloadlv downvg   -wi-d- 310.00G
  mysqllv    downvg   -wi-ao 200.00M
  rootarchlv downvg   -wi-ao   1.00G
  vmwarelv   downvg   -wi-ao  40.00G
  imageslv   imagesvg -wi-ao  80.00G
  lvmail     mailvg   -wi-ao  30.00G
  homelv     rootvg   -wi-ao 500.00M
  rootlv     rootvg   -wi-ao   6.80G
  swaplv     rootvg   -wi-ao   1.00G
  varlv      rootvg   -wi-ao   1.00G

the downloadlv from downvg can't be activated...
the device-mapper don't whant the device...

i've activated debug log and extracted the part who seem interesting:
Jun 29 11:59:51 taris lvm[31615]: memlock=5Fcount inc to 1
Jun 29 11:59:51 taris lvm[31615]: Setting activation/missing=5Fstripe=5F=
filler to /dev/ioerror
Jun 29 11:59:51 taris lvm[31615]: Getting device info for downvg-downloa=
dlv [LVM-opeUf9Zkipl4E843JYE0hxbksLxIZEscOUOvuMPZ4twoc4dC5WrxF1ScqfYwo3F=
r]
Jun 29 11:59:51 taris lvm[31615]: dm info  LVM-opeUf9Zkipl4E843JYE0hxbks=
LxIZEscOUOvuMPZ4twoc4dC5WrxF1ScqfYwo3Fr OF   [16384]
Jun 29 11:59:51 taris lvm[31615]: dm deps   (253:6) OF   [16384]
Jun 29 11:59:51 taris lvm[31615]: Getting device info for downvg-downloa=
dlv-real [LVM-opeUf9Zkipl4E843JYE0hxbksLxIZEscOUOvuMPZ4twoc4dC5WrxF1Scqf=
Ywo3Fr-real]
Jun 29 11:59:51 taris lvm[31615]: dm info  LVM-opeUf9Zkipl4E843JYE0hxbks=
LxIZEscOUOvuMPZ4twoc4dC5WrxF1ScqfYwo3Fr-real OF   [16384]
Jun 29 11:59:51 taris lvm[31615]: dm info  opeUf9Zkipl4E843JYE0hxbksLxIZ=
EscOUOvuMPZ4twoc4dC5WrxF1ScqfYwo3Fr-real OF   [16384]
Jun 29 11:59:51 taris lvm[31615]: dm info downvg-downloadlv-real  OF   [=
16384]
Jun 29 11:59:51 taris lvm[31615]: Getting device info for downvg-downloa=
dlv-cow [LVM-opeUf9Zkipl4E843JYE0hxbksLxIZEscOUOvuMPZ4twoc4dC5WrxF1ScqfY=
wo3Fr-cow]
Jun 29 11:59:51 taris lvm[31615]: dm info  LVM-opeUf9Zkipl4E843JYE0hxbks=
LxIZEscOUOvuMPZ4twoc4dC5WrxF1ScqfYwo3Fr-cow OF   [16384]
Jun 29 11:59:51 taris lvm[31615]: dm info  opeUf9Zkipl4E843JYE0hxbksLxIZ=
EscOUOvuMPZ4twoc4dC5WrxF1ScqfYwo3Fr-cow OF   [16384]
Jun 29 11:59:51 taris lvm[31615]: dm info downvg-downloadlv-cow  OF   [1=
6384]
Jun 29 11:59:51 taris lvm[31615]: Getting device info for downvg-downloa=
dlv=5Fmlog [LVM-opeUf9Zkipl4E843JYE0hxbksLxIZEscOUOvuMPZ4twoc4dC5WrxF1Sc=
qfYwo3Fr-=5Fmlog]
Jun 29 11:59:51 taris lvm[31615]: dm info  LVM-opeUf9Zkipl4E843JYE0hxbks=
LxIZEscOUOvuMPZ4twoc4dC5WrxF1ScqfYwo3Fr-=5Fmlog OF   [16384]
Jun 29 11:59:51 taris lvm[31615]: dm info  opeUf9Zkipl4E843JYE0hxbksLxIZ=
EscOUOvuMPZ4twoc4dC5WrxF1ScqfYwo3Fr-=5Fmlog OF   [16384]
Jun 29 11:59:51 taris lvm[31615]: dm info downvg-downloadlv=5Fmlog  OF  =
 [16384]
Jun 29 11:59:51 taris lvm[31615]: Getting target version for linear
Jun 29 11:59:51 taris lvm[31615]: dm versions   OF   [16384]
Jun 29 11:59:51 taris lvm[31615]: Getting target version for striped
Jun 29 11:59:51 taris lvm[31615]: dm versions   OF   [16384]
Jun 29 11:59:51 taris lvm[31615]: Loading downvg-downloadlv table
Jun 29 11:59:51 taris lvm[31615]: Adding target: 0 488390656 linear 8:33=
 384
Jun 29 11:59:51 taris lvm[31615]: Adding target: 488390656 245760 linear=
 8:65 384
Jun 29 11:59:51 taris lvm[31615]: Adding target: 488636416 98566144 line=
ar 8:65 63160704
Jun 29 11:59:51 taris lvm[31615]: Adding target: 587202560 62914560 line=
ar 8:65 182698368
Jun 29 11:59:51 taris lvm[31615]: dm table   (253:6) OF   [16384]
Jun 29 11:59:51 taris lvm[31615]: dm reload   (253:6) NF   [16384]
Jun 29 11:59:51 taris kernel: device-mapper: table: 253:6: linear: dm-li=
near: Device lookup failed
Jun 29 11:59:51 taris kernel: device-mapper: ioctl: error adding target =
to table
Jun 29 11:59:51 taris lvm[31615]: device-mapper: reload ioctl failed: In=
valid argument

is the only one vg that make "dm deps", what it is =3F why =3F

is the only one vg that is on two disk.
#pvs
  PV         VG       Fmt  Attr PSize   PFree
  /dev/hda2  rootvg   lvm2 a-     9.36G  72.00M
  /dev/sda1  backupvg lvm2 a-   232.88G 152.88G
  /dev/sdc1  downvg   lvm2 a-   232.88G      0
  /dev/sdd1  imagesvg lvm2 a-   232.88G 152.88G
  /dev/sde1  downvg   lvm2 a-   232.88G 114.57G
  /dev/sdf1  mailvg   lvm2 a-   232.88G 202.88G

i've tryed to recreate pv metadata in single user with
# pvcreate -ff --uuid "HHJhqk-4N8h-bwZF-6CIg-8pex-uMtK-NCTfJ4" --restore=
file  /etc/lvm/archive/downvg=5F00024.vg  /dev/sdc1
# pvcreate -ff --uuid "H58I7A-nzSX-9zbR-qxlo-LfXQ-3fNr-LBJdz3" --restore=
file  /etc/lvm/archive/downvg=5F00024.vg  /dev/sde1
# vgcfgrestore -f /etc/lvm/archive/downvg=5F00024.vg downvg
# vgscan
and when y try to activate vg it's ok!!!!

but when reboot in multi user...
i've the error again...

extract from downvg backup:
downvg {
        id =3D "opeUf9-Zkip-l4E8-43JY-E0hx-bksL-xIZEsc"
        seqno =3D 21
        status =3D ["EXPORTED", "RESIZEABLE", "READ", "WRITE"]
        extent=5Fsize =3D 8192              # 4 Megabytes
        max=5Flv =3D 0
        max=5Fpv =3D 0

        physical=5Fvolumes {

                pv0 {
                        id =3D "HHJhqk-4N8h-bwZF-6CIg-8pex-uMtK-NCTfJ4"
                        device =3D "/dev/sdc1"    # Hint only

                        status =3D ["ALLOCATABLE", "EXPORTED"]
                        dev=5Fsize =3D 488392002    # 232.883 Gigabytes
                        pe=5Fstart =3D 384
                        pe=5Fcount =3D 59618        # 232.883 Gigabytes
                }

                pv1 {
                        id =3D "H58I7A-nzSX-9zbR-qxlo-LfXQ-3fNr-LBJdz3"
                        device =3D "/dev/sde1"    # Hint only

                        status =3D ["ALLOCATABLE", "EXPORTED"]
                        dev=5Fsize =3D 488392002    # 232.883 Gigabytes
                        pe=5Fstart =3D 384
                        pe=5Fcount =3D 59618        # 232.883 Gigabytes
                }
        }

        logical=5Fvolumes {

                downloadlv {
                        id =3D "OUOvuM-PZ4t-woc4-dC5W-rxF1-Scqf-Ywo3Fr"
                        status =3D ["READ", "WRITE", "VISIBLE"]
                        segment=5Fcount =3D 4

                        segment1 {
                                start=5Fextent =3D 0
                                extent=5Fcount =3D 59618    # 232.883 Gi=
gabytes

                                type =3D "striped"
                                stripe=5Fcount =3D 1        # linear

                                stripes =3D [
                                        "pv0", 0
                                ]
                        }
                        segment2 {
                                start=5Fextent =3D 59618
                                extent=5Fcount =3D 30       # 120 Megaby=
tes

                                type =3D "striped"
                                stripe=5Fcount =3D 1        # linear

                                stripes =3D [
                                        "pv1", 0
                                ]
                        }
                        segment3 {
                                start=5Fextent =3D 59648
                                extent=5Fcount =3D 12032    # 47 Gigabyt=
es

                                type =3D "striped"
                                stripe=5Fcount =3D 1        # linear

                                stripes =3D [
                                        "pv1", 7710
                                ]
                        }
                        segment4 {
                                start=5Fextent =3D 71680
                                extent=5Fcount =3D 7680     # 30 Gigabyt=
es

                                type =3D "striped"
                                stripe=5Fcount =3D 1        # linear

                                stripes =3D [
                                        "pv1", 22302
                                ]
                        }
                }


package version on opensuse 10.0:


* kernel                 2.6.13

* device-mapper    1.01.04
* lvm2                   2.01.14
on opensuse 10.2:


* kernel                  2.6.18

* device-mapper     1.02.12
* lvm2                    2.02.13
any idea to correct this =3F
how to add more trace =3F

Thanks for help!
Best regards,
Mathieu

   =20
-------------2b194ad083937d02cfed1d8d600c2ca0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN'>
<html>
<head>
 <meta http-equiv=3D'Content-Type' content=3D'text/html;charset=3Dus-asc=
ii'>
 <style>BODY{font:10pt Tahoma, Verdana, sans-serif;}</style>
</head>
<body>



=20
=20


<pre>hi,<br><br>my configuration:<br>- bi-xeon emt64 hyperthread 2.8ghz.=
<br>- 3 go ram<br>- sata promise "Promise PDC20318 (SATA150 TX4)" cards.=
<br>- sata intel "6300ESB SATA Storage Controller" cards.<br><br><br>wit=
h i've upgraded opensuse from 10.0 (x64) to 10.2 (x64).<br>all worked fi=
ne... but one lv d'ont whant to activate...<br><br>and when they try to =
activate my lv/vg with "vgchange" they say device mapper error:<br>#vgch=
ange -ay<br>  1 logical volume(s) in volume group "mailvg" now active<br=
>  1 logical volume(s) in volume group "imagesvg" now active<br>  device=
-mapper: reload ioctl failed: Invalid argument<br>  4 logical volume(s) =
in volume group "downvg" now active<br>  4 logical volume(s) in volume g=
roup "rootvg" now active<br>  1 logical volume(s) in volume group "backu=
pvg" now active<br><br>#lvs<br>  LV         VG       Attr   LSize   Orig=
in Snap%  Move Log Copy%<br>  lvbackup   backupvg -wi-ao  80.00G<br>  do=
wnloadlv downvg   -wi-d- 310.00G<br>  mysqllv    downvg   -wi-ao 200.00M=
<br>  rootarchlv downvg   -wi-ao   1.00G<br>  vmwarelv   downvg   -wi-ao=
  40.00G<br>  imageslv   imagesvg -wi-ao  80.00G<br>  lvmail     mailvg =
  -wi-ao  30.00G<br>  homelv     rootvg   -wi-ao 500.00M<br>  rootlv    =
 rootvg   -wi-ao   6.80G<br>  swaplv     rootvg   -wi-ao   1.00G<br>  va=
rlv      rootvg   -wi-ao   1.00G<br><br>the downloadlv from downvg can't=
 be activated...<br>the device-mapper don't whant the device...<br><br>i=
've activated debug log and extracted the part who seem interesting:<br>=
Jun 29 11:59:51 taris lvm[31615]: memlock=5Fcount inc to 1<br>Jun 29 11:=
59:51 taris lvm[31615]: Setting activation/missing=5Fstripe=5Ffiller to =
/dev/ioerror<br>Jun 29 11:59:51 taris lvm[31615]: Getting device info fo=
r downvg-downloadlv [LVM-opeUf9Zkipl4E843JYE0hxbksLxIZEscOUOvuMPZ4twoc4d=
C5WrxF1ScqfYwo3Fr]<br>Jun 29 11:59:51 taris lvm[31615]: dm info  LVM-ope=
Uf9Zkipl4E843JYE0hxbksLxIZEscOUOvuMPZ4twoc4dC5WrxF1ScqfYwo3Fr OF   [1638=
4]<br>Jun 29 11:59:51 taris lvm[31615]: dm deps   (253:6) OF   [16384]<b=
r>Jun 29 11:59:51 taris lvm[31615]: Getting device info for downvg-downl=
oadlv-real [LVM-opeUf9Zkipl4E843JYE0hxbksLxIZEscOUOvuMPZ4twoc4dC5WrxF1Sc=
qfYwo3Fr-real]<br>Jun 29 11:59:51 taris lvm[31615]: dm info  LVM-opeUf9Z=
kipl4E843JYE0hxbksLxIZEscOUOvuMPZ4twoc4dC5WrxF1ScqfYwo3Fr-real OF   [163=
84]<br>Jun 29 11:59:51 taris lvm[31615]: dm info  opeUf9Zkipl4E843JYE0hx=
bksLxIZEscOUOvuMPZ4twoc4dC5WrxF1ScqfYwo3Fr-real OF   [16384]<br>Jun 29 1=
1:59:51 taris lvm[31615]: dm info downvg-downloadlv-real  OF   [16384]<b=
r>Jun 29 11:59:51 taris lvm[31615]: Getting device info for downvg-downl=
oadlv-cow [LVM-opeUf9Zkipl4E843JYE0hxbksLxIZEscOUOvuMPZ4twoc4dC5WrxF1Scq=
fYwo3Fr-cow]<br>Jun 29 11:59:51 taris lvm[31615]: dm info  LVM-opeUf9Zki=
pl4E843JYE0hxbksLxIZEscOUOvuMPZ4twoc4dC5WrxF1ScqfYwo3Fr-cow OF   [16384]=
<br>Jun 29 11:59:51 taris lvm[31615]: dm info  opeUf9Zkipl4E843JYE0hxbks=
LxIZEscOUOvuMPZ4twoc4dC5WrxF1ScqfYwo3Fr-cow OF   [16384]<br>Jun 29 11:59=
:51 taris lvm[31615]: dm info downvg-downloadlv-cow  OF   [16384]<br>Jun=
 29 11:59:51 taris lvm[31615]: Getting device info for downvg-downloadlv=
=5Fmlog [LVM-opeUf9Zkipl4E843JYE0hxbksLxIZEscOUOvuMPZ4twoc4dC5WrxF1ScqfY=
wo3Fr-=5Fmlog]<br>Jun 29 11:59:51 taris lvm[31615]: dm info  LVM-opeUf9Z=
kipl4E843JYE0hxbksLxIZEscOUOvuMPZ4twoc4dC5WrxF1ScqfYwo3Fr-=5Fmlog OF   [=
16384]<br>Jun 29 11:59:51 taris lvm[31615]: dm info  opeUf9Zkipl4E843JYE=
0hxbksLxIZEscOUOvuMPZ4twoc4dC5WrxF1ScqfYwo3Fr-=5Fmlog OF   [16384]<br>Ju=
n 29 11:59:51 taris lvm[31615]: dm info downvg-downloadlv=5Fmlog  OF   [=
16384]<br>Jun 29 11:59:51 taris lvm[31615]: Getting target version for l=
inear<br>Jun 29 11:59:51 taris lvm[31615]: dm versions   OF   [16384]<br=
>Jun 29 11:59:51 taris lvm[31615]: Getting target version for striped<br=
>Jun 29 11:59:51 taris lvm[31615]: dm versions   OF   [16384]<br>Jun 29 =
11:59:51 taris lvm[31615]: Loading downvg-downloadlv table<br>Jun 29 11:=
59:51 taris lvm[31615]: Adding target: 0 488390656 linear 8:33 384<br>Ju=
n 29 11:59:51 taris lvm[31615]: Adding target: 488390656 245760 linear 8=
:65 384<br>Jun 29 11:59:51 taris lvm[31615]: Adding target: 488636416 98=
566144 linear 8:65 63160704<br>Jun 29 11:59:51 taris lvm[31615]: Adding =
target: 587202560 62914560 linear 8:65 182698368<br>Jun 29 11:59:51 tari=
s lvm[31615]: dm table   (253:6) OF   [16384]<br>Jun 29 11:59:51 taris l=
vm[31615]: dm reload   (253:6) NF   [16384]<br>Jun 29 11:59:51 taris ker=
nel: device-mapper: table: 253:6: linear: dm-linear: Device lookup faile=
d<br>Jun 29 11:59:51 taris kernel: device-mapper: ioctl: error adding ta=
rget to table<br>Jun 29 11:59:51 taris lvm[31615]: device-mapper: reload=
 ioctl failed: Invalid argument<br><br>is the only one vg that make "dm =
deps", what it is =3F why =3F<br><br>is the only one vg that is on two d=
isk.<br>#pvs<br>  PV         VG       Fmt  Attr PSize   PFree<br>  /dev/=
hda2  rootvg   lvm2 a-     9.36G  72.00M<br>  /dev/sda1  backupvg lvm2 a=
-   232.88G 152.88G<br>  /dev/sdc1  downvg   lvm2 a-   232.88G      0<br=
>  /dev/sdd1  imagesvg lvm2 a-   232.88G 152.88G<br>  /dev/sde1  downvg =
  lvm2 a-   232.88G 114.57G<br>  /dev/sdf1  mailvg   lvm2 a-   232.88G 2=
02.88G<br><br>i've tryed to recreate pv metadata in single user with<br>=
# pvcreate -ff --uuid "HHJhqk-4N8h-bwZF-6CIg-8pex-uMtK-NCTfJ4" --restore=
file  /etc/lvm/archive/downvg=5F00024.vg  /dev/sdc1<br># pvcreate -ff --=
uuid "H58I7A-nzSX-9zbR-qxlo-LfXQ-3fNr-LBJdz3" --restorefile  /etc/lvm/ar=
chive/downvg=5F00024.vg  /dev/sde1<br># vgcfgrestore -f /etc/lvm/archive=
/downvg=5F00024.vg downvg<br># vgscan<br>and when y try to activate vg i=
t's ok!!!!<br><br>but when reboot in multi user...<br>i've the error aga=
in...<br><br>extract from downvg backup:<br>downvg {<br>        id =3D "=
opeUf9-Zkip-l4E8-43JY-E0hx-bksL-xIZEsc"<br>        seqno =3D 21<br>     =
   status =3D ["EXPORTED", "RESIZEABLE", "READ", "WRITE"]<br>        ext=
ent=5Fsize =3D 8192              # 4 Megabytes<br>        max=5Flv =3D 0=
<br>        max=5Fpv =3D 0<br><br>        physical=5Fvolumes {<br><br>  =
              pv0 {<br>                        id =3D "HHJhqk-4N8h-bwZF-=
6CIg-8pex-uMtK-NCTfJ4"<br>                        device =3D "/dev/sdc1"=
    # Hint only<br><br>                        status =3D ["ALLOCATABLE"=
, "EXPORTED"]<br>                        dev=5Fsize =3D 488392002    # 2=
32.883 Gigabytes<br>                        pe=5Fstart =3D 384<br>      =
                  pe=5Fcount =3D 59618        # 232.883 Gigabytes<br>   =
             }<br><br>                pv1 {<br>                        i=
d =3D "H58I7A-nzSX-9zbR-qxlo-LfXQ-3fNr-LBJdz3"<br>                      =
  device =3D "/dev/sde1"    # Hint only<br><br>                        s=
tatus =3D ["ALLOCATABLE", "EXPORTED"]<br>                        dev=5Fs=
ize =3D 488392002    # 232.883 Gigabytes<br>                        pe=
=5Fstart =3D 384<br>                        pe=5Fcount =3D 59618        =
# 232.883 Gigabytes<br>                }<br>        }<br><br>        log=
ical=5Fvolumes {<br><br>                downloadlv {<br>                =
        id =3D "OUOvuM-PZ4t-woc4-dC5W-rxF1-Scqf-Ywo3Fr"<br>             =
           status =3D ["READ", "WRITE", "VISIBLE"]<br>                  =
      segment=5Fcount =3D 4<br><br>                        segment1 {<br=
>                                start=5Fextent =3D 0<br>               =
                 extent=5Fcount =3D 59618    # 232.883 Gigabytes<br><br>=
                                type =3D "striped"<br>                  =
              stripe=5Fcount =3D 1        # linear<br><br>              =
                  stripes =3D [<br>                                     =
   "pv0", 0<br>                                ]<br>                    =
    }<br>                        segment2 {<br>                         =
       start=5Fextent =3D 59618<br>                                exten=
t=5Fcount =3D 30       # 120 Megabytes<br><br>                          =
      type =3D "striped"<br>                                stripe=5Fcou=
nt =3D 1        # linear<br><br>                                stripes =
=3D [<br>                                        "pv1", 0<br>           =
                     ]<br>                        }<br>                 =
       segment3 {<br>                                start=5Fextent =3D =
59648<br>                                extent=5Fcount =3D 12032    # 4=
7 Gigabytes<br><br>                                type =3D "striped"<br=
>                                stripe=5Fcount =3D 1        # linear<br=
><br>                                stripes =3D [<br>                  =
                      "pv1", 7710<br>                                ]<b=
r>                        }<br>                        segment4 {<br>   =
                             start=5Fextent =3D 71680<br>               =
                 extent=5Fcount =3D 7680     # 30 Gigabytes<br><br>     =
                           type =3D "striped"<br>                       =
         stripe=5Fcount =3D 1        # linear<br><br>                   =
             stripes =3D [<br>                                        "p=
v1", 22302<br>                                ]<br>                     =
   }<br>                }<br><br><br>package version on opensuse 10.0:<b=
r></pre><ul><li>kernel&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.6.13<br></li><li>device=
-mapper&nbsp;&nbsp;&nbsp; 1.01.04</li><li>lvm2&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; 2.01.14</li></ul>on opensuse 10.2:<br><ul><li>kernel&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; 2.6.18<br></li><li>device-mapper&nbsp;&nbsp;&nbsp;=
&nbsp; 1.02.12</li><li>lvm2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.=
02.13</li></ul>any idea to correct this =3F<br>how to add more trace =3F=
<br><br>Thanks for help!<br>Best regards,<br>Mathieu<br><br>
<style>
 BODY {font:10pt Tahoma,Verdana,sans-serif;}
</style>
</body></html>
-------------2b194ad083937d02cfed1d8d600c2ca0--
