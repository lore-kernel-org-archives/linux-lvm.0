Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3KDJqHt013971
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2010 09:19:52 -0400
Received: from snt0-omc3-s16.snt0.hotmail.com (snt0-omc3-s16.snt0.hotmail.com
	[65.55.90.155])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3KDJgMZ012473
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2010 09:19:42 -0400
Message-ID: <SNT144-w65AE38C3AAEDE1D8396FA3E40A0@phx.gbl>
Content-Type: multipart/alternative;
	boundary="_16695401-9f0a-48a6-9490-d914d992374d_"
From: behzad r <b_rahimi@hotmail.com>
Date: Tue, 20 Apr 2010 13:19:42 +0000
MIME-Version: 1.0
Subject: [linux-lvm] resize an LVM physical volume
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--_16695401-9f0a-48a6-9490-d914d992374d_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hello=20

One of the client has a bladeframe that contains two linux nodes(one is pro=
de and other one is test both have the same OS and are virtualized ) and I =
have a primergy that has a virtualized linux node on it by using vmware=20
On client system there is a lun(EMC) that contains one partition /dev/sde1 =
=2C the partition is already enveloped by LVM =2C they have  increased the =
lun but I need to increase the physical partition /dev/sde1 =2C I have crea=
ted the following procedure that is working on virtualized linux node on pr=
imergy=20

umount /partition that must be increased=20
pvdisplay /dev/sde2 | grep VG=20
vgchange -a n myvg=20
fdisk /dev/sde=20
delete the partition and recreate a new one with same start cylinder and in=
crease the number of cylinder=20
pvresize /dev/sde1=20
vgchange -a y myvg=20
reiserfsck /dev/myvg/mylv=20
=20
but on bladeframe when I use the fdisk to increase the partition the system=
 destroy everything the physical volume reject the partion  /dev/sde1 (when=
 I run pvdisplay it's not on the list anymore)and all the data is destroyed=
 I got a feeling that fdisk remove the /dev/sda1 and re-create a new one
here is the kernel information concerning the bladeframe=20

#cat /etc/SuSE-release=20
SUSE Linux Enterprise Server 10 (x86_64)=20
VERSION =3D 10=20
PATCHLEVEL =3D 1=20
# uname -a=20
Linux 2.6.16.46-0.12-smp #1 SMP Thu May 17 14:00:09 UTC 2007 x86_64 x86_64 =
x86_64 GNU/Linux=20


And the virtualized node on primergy=20

#cat SuSE-release=20
SUSE Linux Enterprise Server 10 (i586)=20
VERSION =3D 10=20
PATCHLEVEL =3D 1=20
SLES10-LVM:/etc # uname -a=20
Linux 2.6.16.46-0.12-default #1 Thu May 17 14:00:09 UTC 2007 i686 i686 i386=
 GNU/Linux=20


We come up with another solution to create a new partion=20
Fdisk new partition=20
pvcreate /dev/sde2=20
vgextend myVG /dev/sde2=20

but this is not the right one=20

Regards=20
Behzad=20

 		 	   		 =20
_________________________________________________________________
New=2C Used=2C Demo=2C Dealer or Private? Find it at CarPoint.com.au
http://clk.atdmt.com/NMN/go/206222968/direct/01/=

--_16695401-9f0a-48a6-9490-d914d992374d_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<style><!--
.hmmessage P
{
margin:0px=3B
padding:0px
}
body.hmmessage
{
font-size: 10pt=3B
font-family:Verdana
}
--></style>
</head>
<body class=3D'hmmessage'>
Hello <br><br>One of the client has a bladeframe that contains two linux no=
des(one is prode and other one is test both have the same OS and are virtua=
lized ) and I have a primergy that has a virtualized linux node on it by us=
ing vmware <br>On client system there is a lun(EMC) that contains one parti=
tion /dev/sde1 =2C the partition is already enveloped by LVM =2C they have&=
nbsp=3B increased the lun but I need to increase the physical partition /de=
v/sde1 =2C I have created the following procedure that is working on virtua=
lized linux node on primergy <br><br>umount /partition that must be increas=
ed <br>pvdisplay /dev/sde2 | grep VG <br>vgchange -a n myvg <br>fdisk /dev/=
sde <br>delete the partition and recreate a new one with same start cylinde=
r and increase the number of cylinder <br>pvresize /dev/sde1 <br>vgchange -=
a y myvg <br>reiserfsck /dev/myvg/mylv <br>&nbsp=3B<br>but on bladeframe wh=
en I use the fdisk to increase the partition the system destroy everything =
the physical volume reject the partion&nbsp=3B /dev/sde1 (when I run pvdisp=
lay it's not on the list anymore)and all the data is destroyed I got a feel=
ing that fdisk remove the /dev/sda1 and re-create a new one<br>here is the =
kernel information concerning the bladeframe <br><br>#cat /etc/SuSE-release=
 <br>SUSE Linux Enterprise Server 10 (x86_64) <br>VERSION =3D 10 <br>PATCHL=
EVEL =3D 1 <br># uname -a <br>Linux 2.6.16.46-0.12-smp #1 SMP Thu May 17 14=
:00:09 UTC 2007 x86_64 x86_64 x86_64 GNU/Linux <br><br><br>And the virtuali=
zed node on primergy <br><br>#cat SuSE-release <br>SUSE Linux Enterprise Se=
rver 10 (i586) <br>VERSION =3D 10 <br>PATCHLEVEL =3D 1 <br>SLES10-LVM:/etc =
# uname -a <br>Linux 2.6.16.46-0.12-default #1 Thu May 17 14:00:09 UTC 2007=
 i686 i686 i386 GNU/Linux <br><br><br>We come up with another solution to c=
reate a new partion <br>Fdisk new partition <br>pvcreate /dev/sde2 <br>vgex=
tend myVG /dev/sde2 <br><br>but this is not the right one <br><br>Regards <=
br>Behzad <br><br> 		 	   		  <br /><hr />Find it at CarPoint.com.au <a hre=
f=3D'http://clk.atdmt.com/NMN/go/206222968/direct/01/' target=3D'_new'>New=
=2C Used=2C Demo=2C Dealer or Private?</a></body>
</html>=

--_16695401-9f0a-48a6-9490-d914d992374d_--
