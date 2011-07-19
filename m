Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p6JG24r8008409
	for <linux-lvm@redhat.com>; Tue, 19 Jul 2011 12:02:04 -0400
Received: from snt0-omc3-s27.snt0.hotmail.com (snt0-omc3-s27.snt0.hotmail.com
	[65.55.90.166])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6JG1uqf029773
	for <linux-lvm@redhat.com>; Tue, 19 Jul 2011 12:01:57 -0400
Message-ID: <SNT129-W1D3D317C0A80D476EE747944D0@phx.gbl>
Content-Type: multipart/alternative;
	boundary="_48561761-8478-4674-9edb-c19e8e30b030_"
From: neon_ bikini <neon_bikini@hotmail.com>
Date: Tue, 19 Jul 2011 16:01:56 +0000
MIME-Version: 1.0
Subject: [linux-lvm] Help me understand LVM as it may be implemented in
 cryptsetup and (not?) Gparted
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

--_48561761-8478-4674-9edb-c19e8e30b030_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


I'm pushing my way up to this list as my question has languished in other f=
orums...
----------
Upgrading F11 to F15 I've decided to take advantage of disk encryption for =
my laptop. My experience with Anaconda finds limited support for custom dis=
k partitions (mine is dual boot). The result of my second install attempt w=
as a PV boot and LVM Volume Group with home=2C root=2C and swap. The proble=
m is these three Logical Volumes were made each with their own encryption! =
Fedora documentation only gives instructions for setting encrypting during =
Anaconda as whole disk install or [after the system is installed](http://do=
cs.fedoraproject.org/en-US/Fedora/15/html/Installation_Guide/apcs04.html).
----------
From research and discussions I uncovered an [alternative](http://forums.fe=
doraforum.org/showpost.php?p=3D1496052&postcount=3D14) where the [VG is the=
 only encrypted part](http://www.fedoraforum.org/forum/showpost.php?p=3D138=
3201&postcount=3D2) of the partition scheme. Then I can continue installing=
 Fedora using a disk which includes the Anaconda installer. This would make=
 an encrypted Fedora system with a single unencrypt passphrase.=20
=20
What I am not clear on is the step to create the LVs. Reading cryptsetup do=
cs and the above examples I conclude LuksOpen and LuksClose commands "booke=
nd" the LVM linux commands pvcreate=2C vgcreate=2C and lvcreate. Then I won=
't use gparted at all?

Since I will be deleting the existing partitions=2C being careful not to di=
srupt the current Win partition (first)=2C I need do all of this from a liv=
eCD. And this disk needs to have the LVM commands pvcreate=2C vgcreate=2C l=
vcreate=2C and cryptsetup-luks=2C and dm-crypt packages?=20
Once the VG is encrypted and the LVs are added then I can launch the Fedora=
 spin or Full i386 DVD with Anaconda and complete the install?

Does this sound correct? Am I missing anything? Is there an easier way to d=
o this? (^_^)
 		 	   		  =

--_48561761-8478-4674-9edb-c19e8e30b030_
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
font-family:Tahoma
}
--></style>
</head>
<body class=3D'hmmessage'><div dir=3D'ltr'>
<DIV dir=3Dltr>I'm pushing my way up to this list as my question has langui=
shed in other forums...</DIV>
<DIV dir=3Dltr>----------</DIV>
<DIV dir=3Dltr>Upgrading F11 to F15 I've decided to take advantage of disk&=
nbsp=3Bencryption for my laptop. My experience with Anaconda finds limited =
support for custom disk partitions (mine is dual boot). The result of my se=
cond install attempt was a PV boot and LVM Volume Group with home=2C root=
=2C and swap. The problem is these three Logical Volumes were made each&nbs=
p=3Bwith their own encryption! Fedora documentation only gives instructions=
 for setting encrypting during Anaconda as whole disk install or [after&nbs=
p=3Bthe system is installed](<A href=3D"http://docs.fedoraproject.org/en-US=
/Fedora/15/html/Installation_Guide/apcs04.html">http://docs.fedoraproject.o=
rg/en-US/Fedora/15/html/Installation_Guide/apcs04.html</A>).<BR>----------<=
BR>From research and discussions I uncovered an [alternative](<A href=3D"ht=
tp://forums.fedoraforum.org/showpost.php?p=3D1496052&amp=3Bpostcount=3D14">=
http://forums.fedoraforum.org/showpost.php?p=3D1496052&amp=3Bpostcount=3D14=
</A>) where the [VG is the only encrypted part](<A href=3D"http://www.fedor=
aforum.org/forum/showpost.php?p=3D1383201&amp=3Bpostcount=3D2">http://www.f=
edoraforum.org/forum/showpost.php?p=3D1383201&amp=3Bpostcount=3D2</A>) of t=
he partition scheme. Then I can continue installing Fedora using a disk whi=
ch includes the Anaconda installer. This would make an encrypted Fedora sys=
tem with a single unencrypt passphrase. </DIV>
<DIV dir=3Dltr>&nbsp=3B</DIV>
<DIV dir=3Dltr>What I am not clear on is the step to create the LVs. Readin=
g cryptsetup docs and the above examples I conclude LuksOpen and LuksClose =
commands "bookend" the LVM linux commands pvcreate=2C vgcreate=2C and lvcre=
ate. Then I won't use gparted at all?</DIV>
<DIV dir=3Dltr><BR>Since I will be deleting the existing partitions=2C bein=
g careful not to disrupt the current Win partition (first)=2C I need do all=
 of this from a liveCD. And this disk needs to have the LVM commands pvcrea=
te=2C vgcreate=2C lvcreate=2C and cryptsetup-luks=2C and dm-crypt packages?=
 <BR>Once the VG is encrypted and the LVs are added then I can launch the F=
edora spin or Full i386 DVD with Anaconda&nbsp=3Band complete the install?<=
/DIV>
<DIV dir=3Dltr><BR>Does this sound correct? Am I missing anything? Is there=
 an easier way to do this? (^_^)<BR></DIV> 		 	   		  </div></body>
</html>=

--_48561761-8478-4674-9edb-c19e8e30b030_--
