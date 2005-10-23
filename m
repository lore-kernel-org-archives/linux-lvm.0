Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9NK4PV24419
	for <linux-lvm@redhat.com>; Sun, 23 Oct 2005 16:04:25 -0400
Received: from simmts8-srv.bellnexxia.net (simmts8.bellnexxia.net
	[206.47.199.166])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j9NK4NRS029192
	for <linux-lvm@redhat.com>; Sun, 23 Oct 2005 16:04:24 -0400
Received: from cruncher ([65.92.98.131]) by simmts8-srv.bellnexxia.net
	(InterMail vM.5.01.06.10 201-253-122-130-110-20040306) with ESMTP
	id <20051023200412.WZFW28065.simmts8-srv.bellnexxia.net@cruncher>
	for <linux-lvm@redhat.com>; Sun, 23 Oct 2005 16:04:12 -0400
Message-ID: <003b01c5d80d$98ec13b0$1b00a8c0@cruncher>
From: "Mike Kirk" <mike.kirk@sympatico.ca>
Date: Sun, 23 Oct 2005 16:08:56 -0400
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0038_01C5D7EC.11C9D1E0"
Subject: [linux-lvm] 2TB partition size limit in LVM2? Or ReiserFS?
Reply-To: Mike Kirk <mike.kirk@sympatico.ca>,
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

------=_NextPart_000_0038_01C5D7EC.11C9D1E0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all,

I've used LVM2 in the past, and have followed the steps in the LVM =
HOWTO, but have run into problems trying to grow a reiser3 filesystem. =
The filesystem has worked fine for several months, but now I'm trying to =
make it larger...

I've added a pv and am showing free PE's:

     --- Volume group ---
      VG Name               vg
      System ID
      Format                lvm2
      Metadata Areas        2
      Metadata Sequence No  11
      VG Access             read/write
      VG Status             resizable
      MAX LV                0
      Cur LV                1
      Open LV               1
      Max PV                0
      Cur PV                2
      Act PV                2
      VG Size               2.44 TB
      PE Size               4.00 MB
      Total PE              639113
      Alloc PE / Size       320597 / 1.22 TB
      Free  PE / Size       318516 / 1.22 TB
      VG UUID               bADYIh-N4mr-LTJS-5h6b-izph-pgpT-exoOTh

....and I can plug those free PE's into lvextend:

    lvextend -l+318516 /dev/vg/lv
    >  Extending logical volume lv to 2.44 TB
    >  Logical volume lv successfully resized

....but resize_reiserfs gives errors:

    resize_reiserfs /dev/vg/lv
    > resize_reiserfs 3.6.19 (2003 www.namesys.com)
    >
    > bread: Cannot read the block (328029183): (Invalid argument).
    >
    > reiserfs_open: Your partition is not big enough to contain the
    > filesystem of (328029183) blocks as was specified in the found =
super block.

Nothing is written to syslog when resize_reiserfs runs. How can I tell =
if this is a LVM2 error providing wrong sizes... or if it's reiserfs =
tools having the problems? If I lvreduce things to the initial size I =
can remount things OK, and reiserfsck reports no errors.

This is an AMD2700+ system running 2.6.13.4, a ReiserFS3 3.6 filesystem =
w/ v3.6.19 reiserfsprogs, and LVM2 v2.01.09 utils

Any suggestions are appreciated.

Thanks!

Mike

------=_NextPart_000_0038_01C5D7EC.11C9D1E0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1522" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi all,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I've used LVM2 in the past, and have =
followed the=20
steps in the LVM HOWTO, but have run into problems trying to grow a =
reiser3=20
filesystem. The filesystem has worked fine for several months, but now =
I'm=20
trying to make it larger...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I've added a pv and am showing free=20
PE's:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;--- Volume =
group=20
---<BR>&nbsp;&nbsp;&nbsp; &nbsp; VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
vg<BR>&nbsp;&nbsp;&nbsp; &nbsp; System ID<BR>&nbsp;&nbsp;&nbsp; &nbsp;=20
Format&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;=20
lvm2<BR>&nbsp;&nbsp;&nbsp; &nbsp; Metadata=20
Areas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2<BR>&nbsp;&nbsp;&nbsp; =
&nbsp;=20
Metadata Sequence No&nbsp; 11<BR>&nbsp;&nbsp;&nbsp; &nbsp; VG=20
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
read/write<BR>&nbsp;&nbsp;&nbsp; &nbsp; VG=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
resizable<BR>&nbsp;&nbsp;&nbsp; &nbsp; MAX=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
0<BR>&nbsp;&nbsp;&nbsp; &nbsp; Cur=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
1<BR>&nbsp;&nbsp;&nbsp; &nbsp; Open=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
1<BR>&nbsp;&nbsp;&nbsp; &nbsp; Max=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
0<BR>&nbsp;&nbsp;&nbsp; &nbsp; Cur=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
2<BR>&nbsp;&nbsp;&nbsp; &nbsp; Act=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
2<BR>&nbsp;&nbsp;&nbsp; &nbsp; VG=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
2.44 TB<BR>&nbsp;&nbsp;&nbsp; &nbsp; PE=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
4.00 MB<BR>&nbsp;&nbsp;&nbsp; &nbsp; Total=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
639113<BR>&nbsp;&nbsp;&nbsp; &nbsp; Alloc PE /=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 320597 / 1.22 =
TB<BR>&nbsp;&nbsp;&nbsp;=20
&nbsp; Free&nbsp; PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 318516 / =
1.22=20
TB<BR>&nbsp;&nbsp;&nbsp; &nbsp; VG=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
bADYIh-N4mr-LTJS-5h6b-izph-pgpT-exoOTh</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>....and I can plug those free PE's into =

lvextend:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; lvextend -l+318516=20
/dev/vg/lv<BR>&nbsp;&nbsp;&nbsp; &gt;&nbsp; Extending logical volume lv =
to 2.44=20
TB<BR>&nbsp;&nbsp;&nbsp; &gt;&nbsp; Logical volume lv successfully=20
resized</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>....but resize_reiserfs gives =
errors:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; resize_reiserfs=20
/dev/vg/lv<BR>&nbsp;&nbsp;&nbsp; &gt; resize_reiserfs 3.6.19 (2003 <A=20
href=3D"http://www.namesys.com">www.namesys.com</A>)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &gt;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &gt; bread: Cannot =
read the=20
block (328029183): (Invalid argument).</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &gt;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &gt; reiserfs_open: =
Your=20
partition is not big enough to contain the<BR>&nbsp;&nbsp;&nbsp; &gt; =
filesystem=20
of (328029183) blocks as was specified in the found super =
block.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Nothing is written to syslog when =
resize_reiserfs=20
runs. How can I tell if this is a LVM2 error providing wrong sizes... or =
if it's=20
reiserfs tools having the problems? If I lvreduce things to the initial =
size I=20
can remount things OK, and reiserfsck reports no errors.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>This is an AMD2700+ system running =
2.6.13.4, a=20
ReiserFS3 3.6 filesystem w/ v3.6.19 reiserfsprogs, and LVM2 v2.01.09=20
utils</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Any suggestions are =
appreciated.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks!</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Mike</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0038_01C5D7EC.11C9D1E0--
