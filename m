Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j05BDmr02862
	for <linux-lvm@redhat.com>; Wed, 5 Jan 2005 06:13:48 -0500
Received: from smtp1.ldcom.fr (smtp1.ldcom.fr [62.39.9.135])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j05BDlk8030584
	for <linux-lvm@redhat.com>; Wed, 5 Jan 2005 06:13:47 -0500
Received: from smtp1.ldcom.fr (localhost [127.0.0.1])
	by smtp1.smtp1.ldcom.fr (Postfix) with ESMTP id 9F517269AFE
	for <linux-lvm@redhat.com>; Wed,  5 Jan 2005 11:40:44 +0100 (MET)
Received: from ldcomsw00108.burv.ldcom.ad (ldcomsw00108e0.cbv.ldcom.ld
	[10.92.48.97]) by smtp1.ldcom.fr (Postfix) with ESMTP id 74F78269AD8
	for <linux-lvm@redhat.com>; Wed,  5 Jan 2005 11:40:44 +0100 (MET)
Message-ID: <7F045B1BBA80CA4B9235A456E8EAE00502398A23@ldcomsw00103e0.cbv.ldcom.ld>
From: "NGUYEN, Laurent (Elite)" <Laurent.NGUYEN@neuf.com>
Date: Wed, 5 Jan 2005 11:44:46 +0100 
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C4F313.92AB8920"
Subject: [linux-lvm] Fedora lvm PV lost ! Need to recover data
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
To: "'linux-lvm@redhat.com'" <linux-lvm@redhat.com>
Cc: "BRUNEL, Aurelie" <aurelie.brunel@neuf.com>, "MOQUET,
	Alain" <alain.moquet@neuf.com>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C4F313.92AB8920
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

We have lost the physical volume /dev/hda4 since a reboot of Fedora.

/dev/hda4 had lots of data on a logicial volume and we know the data is
still on /dev/hda4. Data was on /dev/Volume01/LogVol00 =20

/dev/hda2 has no problem (still on dev/Volume00/LogVol00).

=20

=20

=20

Here is information about my system :

=20

[root@localhost lvmconf]# uname -a

Linux localhost.localdomain 2.4.22-1.2115.nptl #1 Wed Oct 29 15:42:51 =
EST
2003 i686 i686 i386 GNU/Linux

=20

[root@localhost lvmconf]# pvscan

pvscan -- reading all physical volumes (this may take a while...)

pvscan -- ACTIVE   PV "/dev/hda2" of VG "Volume00" [3.90 GB / 4 MB =
free]

pvscan -- total: 1 [3.91 GB] / in use: 1 [3.91 GB] / in no VG: 0 [0]

=20

=20

[root@localhost lvmconf]# fdisk -l /dev/hda

Disk /dev/hda: 10.1 GB, 10110320640 bytes

255 heads, 63 sectors/track, 1229 cylinders

Units =3D cylinders of 16065 * 512 =3D 8225280 bytes

=20

   Device Boot    Start       End    Blocks   Id  System

/dev/hda1   *         1        64    514048+  83  Linux

/dev/hda2            65       574   4096575   8e  Linux LVM

/dev/hda3           575       607    265072+  82  Linux swap

/dev/hda4           608      1229   4996215   8e  Linux LVM

=20

[root@localhost Volume01]# pvdata /dev/hda4

--- Physical volume ---

PV Name               /dev/hda4

VG Name              =20

PV Size               8 GB [16777216 secs] / NOT usable 0 [LVM: 3.54 =
GB]

PV#                   0

PV Status             NOT available

Allocatable           NO

Cur LV                4270743425

PE Size (KByte)       2097151

Total PE              2024734720

Free PE               2024734568

Allocated PE          152

PV UUID               none

=20

=20

--- List of logical volumes ---

=20

Segmentation fault

=20

[root@localhost Volume01]# more /etc/fstab

/dev/Volume00/LogVol00  /                       ext3    defaults        =
1 1

LABEL=3D/boot             /boot                   ext3    defaults      =
  1 2

none                    /dev/pts                devpts  =
gid=3D5,mode=3D620  0 0

none                    /proc                   proc    defaults        =
0 0

none                    /dev/shm                tmpfs   defaults        =
0 0

#/dev/Volume01/LogVol00  /user                   ext3    defaults       =
 1 2

/dev/hda3               swap                    swap    defaults        =
0 0

/dev/cdrom              /mnt/cdrom              udf,iso9660
noauto,owner,kudzu,ro 0 0

=20

Thanks a lot for your help. I am available to give you more =
information.

=20

Best Regards,

Laurent Nguyen

9 T=E9l=E9com Quai Ouest

=20


------_=_NextPart_001_01C4F313.92AB8920
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:st1=3D"urn:schemas-microsoft-com:office:smarttags" =
xmlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<meta name=3DGenerator content=3D"Microsoft Word 11 (filtered medium)">
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"City"/>
<o:SmartTagType =
namespaceuri=3D"urn:schemas-microsoft-com:office:smarttags"
 name=3D"place"/>
<!--[if !mso]>
<style>
st1\:*{behavior:url(#default#ieooui) }
</style>
<![endif]-->
<style>
<!--
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:Arial;
	color:windowtext;}
@page Section1
	{size:595.3pt 841.9pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DFR link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>Hello,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>We have lost the physical volume /dev/hda4 =
since a
reboot of Fedora.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>/dev/hda4 had lots of data on a logicial =
volume and
we know the data is still on /dev/hda4. Data was on =
/dev/Volume01/LogVol00=A0 <o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>/dev/hda2 has no problem (still on =
dev/Volume00/LogVol00).<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>=A0<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>Here is information about my system =
:<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>[root@localhost lvmconf]# uname =
-a<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>Linux localhost.localdomain =
2.4.22-1.2115.nptl #1 Wed
Oct 29 15:42:51 EST 2003 i686 i686 i386 =
GNU/Linux<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>[root@localhost lvmconf]# =
pvscan<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>pvscan -- reading all physical volumes (this =
may take
a while...)<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>pvscan -- ACTIVE=A0=A0 PV =
&quot;/dev/hda2&quot; of VG
&quot;Volume00&quot; [3.90 GB / 4 MB free]<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>pvscan -- total: 1 [3.91 GB] / in use: 1 =
[3.91 GB] /
in no VG: 0 [0]<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>[root@localhost lvmconf]# fdisk -l =
/dev/hda<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>Disk /dev/hda: 10.1 GB, 10110320640 =
bytes<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>255 heads, 63 sectors/track, 1229 =
cylinders<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>Units =3D cylinders of 16065 * 512 =3D =
8225280 bytes<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>=A0=A0 Device Boot=A0=A0=A0 =
Start=A0=A0=A0=A0=A0=A0 End=A0=A0=A0 Blocks=A0=A0 Id=A0
System<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>/dev/hda1=A0=A0 *=A0=A0=A0=A0=A0=A0=A0=A0 =
1=A0=A0=A0=A0=A0=A0=A0 64=A0=A0=A0 514048+=A0 83=A0 =
Linux<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>/dev/hda2=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
65=A0=A0=A0=A0=A0=A0 574=A0=A0 4096575=A0=A0 8e=A0 Linux =
LVM<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>/dev/hda3=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
575=A0=A0=A0=A0=A0=A0 607=A0=A0=A0 265072+=A0 82=A0 Linux =
swap<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>/dev/hda4=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
608=A0=A0=A0=A0=A0 1229=A0=A0 4996215=A0=A0 8e=A0 Linux =
LVM<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>[root@localhost Volume01]# pvdata =
/dev/hda4<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>--- Physical volume =
---<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>PV =
Name=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
/dev/hda4<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>VG =
Name=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>PV =
Size=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 8 GB [16777216 secs] / =
NOT
usable 0 [LVM: 3.54 GB]<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>PV#=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 0<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>PV Status=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
NOT available<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>Allocatable=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
NO<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>Cur <st1:City w:st=3D"on"><st1:place =
w:st=3D"on">LV</st1:place></st1:City>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0
4270743425<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>PE Size (KByte)=A0=A0=A0=A0=A0=A0 =
2097151<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>Total =
PE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
2024734720<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>Free =
PE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
2024734568<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>Allocated PE=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
152<o:p></o:p></span></font></p>

<p class=3DMsoNormal><b><font size=3D2 face=3DArial><span lang=3DEN-GB
style=3D'font-size:10.0pt;font-family:Arial;font-weight:bold'>PV
UUID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
none<o:p></o:p></span></font></b></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>--- List of logical volumes =
---<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>Segmentation fault<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>[root@localhost Volume01]# more =
/etc/fstab<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>/dev/Volume00/LogVol00=A0 =
/=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0
ext3=A0=A0=A0 defaults=A0=A0=A0=A0=A0=A0=A0 1 =
1<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>LABEL=3D/boot=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 /boot=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0
ext3=A0=A0=A0 defaults=A0=A0=A0=A0=A0=A0=A0 1 =
2<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>none=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 /dev/pts=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0
devpts=A0 gid=3D5,mode=3D620=A0 0 0<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>none=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 =
/proc=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0
proc=A0=A0=A0 defaults=A0=A0=A0=A0=A0=A0=A0 0 =
0<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>none=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 /dev/shm=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0
tmpfs=A0=A0 defaults=A0=A0=A0=A0=A0=A0=A0 0 =
0<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>#/dev/Volume01/LogVol00=A0 =
/user=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0
ext3=A0=A0=A0 defaults=A0=A0=A0=A0=A0=A0=A0 1 =
2<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>/dev/hda3 =
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0swap=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0
swap=A0=A0=A0 defaults=A0=A0=A0=A0=A0=A0=A0 0 =
0<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'>/dev/cdrom=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
/mnt/cdrom=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 udf,iso9660
noauto,owner,kudzu,ro 0 0<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span =
style=3D'font-size:10.0pt;
font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'>Thanks a lot for your help. I am available to =
give
you more information.<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-GB =
style=3D'font-size:
10.0pt;font-family:Arial'><o:p>&nbsp;</o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;
font-family:"Courier New"'>Best Regards,<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;
font-family:"Courier New"'>Laurent Nguyen<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3D"Courier New"><span =
style=3D'font-size:10.0pt;
font-family:"Courier New"'>9 T=E9l=E9com Quai =
Ouest<o:p></o:p></span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'><o:p>&nbsp;</o:p></span></font></p>

</div>

</body>

</html>

------_=_NextPart_001_01C4F313.92AB8920--
