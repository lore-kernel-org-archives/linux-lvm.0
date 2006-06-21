Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5L7A1UL028752
	for <linux-lvm@redhat.com>; Wed, 21 Jun 2006 03:10:01 -0400
Received: from dns.iai.co.il (dns.iai.co.il [194.90.48.5])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5L79xNS022667
	for <linux-lvm@redhat.com>; Wed, 21 Jun 2006 03:10:00 -0400
Received: from mailgwout.iai.co.il (mailrelay.iai.co.il [172.21.4.23])
	by dns.iai.co.il (8.9.3/8.9.3) with SMTP id KAA09565
	for <linux-lvm@redhat.com>; Wed, 21 Jun 2006 10:09:53 +0300 (IDT)
Message-ID: <004001c69509$fa226440$713a14ac@iai.co.il>
From: "Daniel Loney" <dloney@iai.co.il>
Date: Wed, 21 Jun 2006 10:09:10 +0200
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_003D_01C6951A.BD3EB6D0"
Content-Class: urn:content-classes:message
Subject: [linux-lvm] vgchange doesn't activate the  logical volume
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

This is a multi-part message in MIME format.

------=_NextPart_000_003D_01C6951A.BD3EB6D0
Content-Type: text/plain;
	charset="windows-1255"
Content-Transfer-Encoding: quoted-printable

After doing random=20
   vgchange -an /dev/vg02
   vgscan
   vgchange -ay /dev/vg02

vgchange no longer sets the volume to available.  The volume remains in =
a NOT available state.

I am using=20
lvm2-2.01.14-3.6

Here is the output of the vgchange and vgdisplay commands:

suse01:~ # vgchange -vay /dev/vg02
    Using volume group(s) on command line
    Finding volume group "vg02"
  /dev/sda: read failed after 0 of 4096 at 0: Input/output error
    Activated logical volumes in volume group "vg02"
  0 logical volume(s) in volume group "vg02" now active


suse01:~ # vgdisplay -v vg02| more
    Using volume group(s) on command line
    Finding volume group "vg02"
  /dev/sda: read failed after 0 of 4096 at 0: Input/output error
  --- Volume group ---
  VG Name               vg02
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  18
  VG Access             read/write
  VG Status             resizable
  MAX LV                128
  Cur LV                1
  Open LV               0
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               40.00 GB
  PE Size               4.00 MB
  Total PE              10239
  Alloc PE / Size       10000 / 39.06 GB
  Free  PE / Size       239 / 956.00 MB
  VG UUID               2XYqoQ-Ah1U-Aqc3-4beH-mZRM-o5U5-kdEDCE
   =20
  --- Logical volume ---
  LV Name                /dev/vg02/lvol0
  VG Name                vg02
  LV UUID                7HItNY-hmWC-AwLl-lamP-7FWq-G3Ug-irPavo
  LV Write Access        read/write
  LV Status              NOT available
  LV Size                39.06 GB
  Current LE             10000
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
   =20
  --- Physical volumes ---
  PV Name               /dev/sdb
  PV UUID               6mxyu2-1fp0-ziRZ-VNPE-dROT-At0p-dXmFiT
  PV Status             allocatable
  Total PE / Free PE    10239 / 239



Any ideas?=20
 =20
*************************************************************************=
************** =20
The information contained in this communication is proprietary to Israel =
Aircraft Industries Ltd. and/or third parties, may contain confidential =
or privileged information, and is intended only for the use of the =
intended addressee thereof. If you are not the intended addressee, =
please be aware that any use, disclosure, distribution and/or copying of =
this communication is strictly prohibited. If you receive this =
communication in error, please notify the sender immediately and delete =
it from your computer. Thank you.=20

------=_NextPart_000_003D_01C6951A.BD3EB6D0
Content-Type: text/html;
	charset="windows-1255"
Content-Transfer-Encoding: quoted-printable

<HTML xmlns:eXclaimer=3D"http://www.exclaimer.co.uk">
<HEAD>
<META http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3DUTF-16">
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3DUTF-16">
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dwindows-1255">
<META content=3D"MSHTML 6.00.2900.2873" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD><BODY bgColor=3D#ffffff><DIV>
<DIV><FONT face=3DArial color=3D#0000ff>After doing random </FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff>&nbsp;&nbsp; vgchange -an=20
/dev/vg02</FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff>&nbsp;&nbsp; vgscan</FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff>&nbsp;&nbsp; vgchange -ay=20
/dev/vg02</FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#0000ff>vgchange no longer sets the =
volume to=20
available.&nbsp; The volume remains in a <FONT =
color=3D#ff0000><STRONG>NOT=20
available</STRONG></FONT> state.</FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#0000ff>I am using </FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff>lvm2-2.01.14-3.6</FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#0000ff>Here is the output of the =
vgchange and=20
vgdisplay commands:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>suse01:~ # vgchange -vay=20
/dev/vg02<BR>&nbsp;&nbsp;&nbsp; Using volume group(s) on command=20
line<BR>&nbsp;&nbsp;&nbsp; Finding volume group "vg02"<BR>&nbsp; =
/dev/sda: read=20
failed after 0 of 4096 at 0: Input/output error<BR>&nbsp;&nbsp;&nbsp; =
Activated=20
logical volumes in volume group "vg02"<BR>&nbsp; 0 logical volume(s) in =
volume=20
group "vg02" now active<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>suse01:~ # vgdisplay -v vg02|=20
more<BR>&nbsp;&nbsp;&nbsp; Using volume group(s) on command=20
line<BR>&nbsp;&nbsp;&nbsp; Finding volume group "vg02"<BR>&nbsp; =
/dev/sda: read=20
failed after 0 of 4096 at 0: Input/output error<BR>&nbsp; --- Volume =
group=20
---<BR>&nbsp; VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
vg02<BR>&nbsp; System ID<BR>&nbsp;=20
Format&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;=20
lvm2<BR>&nbsp; Metadata Areas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1<BR>&nbsp; Metadata Sequence No&nbsp; 18<BR>&nbsp; VG=20
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
read/write<BR>&nbsp; VG=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
resizable<BR>&nbsp; MAX=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
128<BR>&nbsp; Cur=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
1<BR>&nbsp; Open=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
0<BR>&nbsp; Max=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
0<BR>&nbsp; Cur=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
1<BR>&nbsp; Act=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
1<BR>&nbsp; VG=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
40.00 GB<BR>&nbsp; PE=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
4.00 MB<BR>&nbsp; Total=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
10239<BR>&nbsp; Alloc PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
10000 /=20
39.06 GB<BR>&nbsp; Free&nbsp; PE / =
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 239=20
/ 956.00 MB<BR>&nbsp; VG=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
2XYqoQ-Ah1U-Aqc3-4beH-mZRM-o5U5-kdEDCE<BR>&nbsp;&nbsp;&nbsp; <BR>&nbsp; =
---=20
Logical volume ---<BR>&nbsp; LV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
/dev/vg02/lvol0<BR>&nbsp; VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
vg02<BR>&nbsp; LV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
7HItNY-hmWC-AwLl-lamP-7FWq-G3Ug-irPavo<BR>&nbsp; LV Write=20
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<BR>&nbsp; LV =

Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
NOT available<BR>&nbsp; LV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
39.06 GB<BR>&nbsp; Current=20
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
10000<BR>&nbsp;=20
Segments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
1<BR>&nbsp;=20
Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;=20
inherit<BR>&nbsp; Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp;=20
0<BR>&nbsp;&nbsp;&nbsp; <BR>&nbsp; --- Physical volumes ---<BR>&nbsp; PV =

Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
/dev/sdb<BR>&nbsp; PV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
6mxyu2-1fp0-ziRZ-VNPE-dROT-At0p-dXmFiT<BR>&nbsp; PV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
allocatable<BR>&nbsp; Total PE / Free PE&nbsp;&nbsp;&nbsp; 10239 /=20
239<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#ff0000><STRONG>Any =
ideas?</STRONG></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></DIV>
<DIV>
<FONT FACE=3D"Courier New">
</FONT>&nbsp;</DIV>
<DIV>********************************************************************=
*******************&nbsp;</DIV>
<DIV>The information contained in this communication is proprietary to =
Israel Aircraft Industries Ltd. and/or third parties, may contain =
confidential or privileged information, and is intended only for the use =
of the intended addressee thereof. If you are not the intended =
addressee, please be aware that any use, disclosure, distribution and/or =
copying of this communication is strictly prohibited. If you receive =
this communication in error, please notify the sender immediately and =
delete it from your computer. Thank you.</DIV></BODY></HTML>

------=_NextPart_000_003D_01C6951A.BD3EB6D0--
