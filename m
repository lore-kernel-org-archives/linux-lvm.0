Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4C0fwO19267
	for <linux-lvm@redhat.com>; Wed, 11 May 2005 20:41:58 -0400
Received: from smtp01.maxnet.net.nz (smtp01.maxnet.net.nz [202.89.32.6])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j4C0ftLL024227
	for <linux-lvm@redhat.com>; Wed, 11 May 2005 20:41:56 -0400
Received: from webmaster (unknown [202.89.35.8])
	by smtp01.maxnet.net.nz (Postfix) with ESMTP id 8D302357C56
	for <linux-lvm@redhat.com>; Thu, 12 May 2005 12:41:48 +1200 (NZST)
From: "Geoff" <geoff@gurutoo.com>
Date: Thu, 12 May 2005 12:44:08 +1200
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00AA_01C556F0.4A83F970"
Message-Id: <20050512004148.8D302357C56@smtp01.maxnet.net.nz>
Subject: [linux-lvm] incorrect metadata area header checksum
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

------=_NextPart_000_00AA_01C556F0.4A83F970
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit

Hi,
 
OK, here goes the story, hope someone can help (disclaimer, I am relatively
new to linux and VERY new to LVM).
 
Was using linux kernel 2.4.30 with LVM2 - initialised PV, created VG no
problem. Couldnt create LV due to device mapper. Turns out that for some
reason it didnt compile into the kernel correctly. Tried recompiling a few
times, still no go.
 
Thought, blow it, try 2.6 so compiled and booted off 2.6.11.8. 
 
Everything seemed ok, except I couldnt create the LV due to a read/write
error. Search archives, no luck.
Decided to remove VG and recreate it.
Removed VG got read/write errors.
Now, I cant do anything getting "incorrect metadata area header checksum"
messages.
pvscan says:
"incorrect metadata area header checksum"
"incorrect metadata area header checksum"
"incorrect metadata area header checksum"
"incorrect metadata area header checksum"
PV /dev/sda7                      lvm2 [198.35 GB]
Total: 1 [198.35 GB] / in use: 0 [0  ] /in no VG: 1 [198.35 GB]
 
So, I have 2 problems:
1. resolving this error and initialising the PV and creating the VG again,
2. Creating the LV.
 
help! :P
 
thanks
Geoff
Webmaster
Maxnet Systems Administration
PH 0508 MAXNET
Mobile: 021 919 220
Fax +64-9-3007227
www.maxnet.co.nz <http://www.maxnet.co.nz/> 
 

------=_NextPart_000_00AA_01C556F0.4A83F970
Content-Type: text/html;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<META content=3D"MSHTML 6.00.2900.2627" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D067523100-12052005>Hi,</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D067523100-12052005></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D067523100-12052005>OK, =
here goes the=20
story, hope someone can help (disclaimer, I am relatively new to linux =
and VERY=20
new to LVM).</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D067523100-12052005></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D067523100-12052005>Was =
using linux=20
kernel 2.4.30 with LVM2 - initialised PV, created VG no problem. Couldnt =
create=20
LV due to device mapper. Turns out that for some reason it didnt compile =
into=20
the kernel correctly. Tried recompiling a few times, still no=20
go.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D067523100-12052005></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN =
class=3D067523100-12052005>Thought, blow it,=20
try 2.6 so compiled and booted off 2.6.11.8. </SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D067523100-12052005></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN =
class=3D067523100-12052005>Everything seemed=20
ok, except I couldnt create the LV due to a read/write error. Search =
archives,=20
no luck.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN =
class=3D067523100-12052005>Decided to remove VG=20
and recreate it.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN =
class=3D067523100-12052005>Removed VG got=20
read/write errors.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D067523100-12052005>Now, I =
cant do=20
anything getting "incorrect metadata area header checksum"=20
messages.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D067523100-12052005>pvscan =

says:</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN =
class=3D067523100-12052005>"incorrect metadata=20
area header checksum"</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN =
class=3D067523100-12052005>"incorrect metadata=20
area header checksum"</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN =
class=3D067523100-12052005>"incorrect metadata=20
area header checksum"</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN =
class=3D067523100-12052005>"incorrect metadata=20
area header checksum"</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D067523100-12052005>PV=20
/dev/sda7&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
lvm2 [198.35 GB]</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D067523100-12052005>Total: =
1 [198.35 GB]=20
/ in use: 0 [0&nbsp; ] /in no VG: 1 [198.35 GB]</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D067523100-12052005></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D067523100-12052005>So, I =
have 2=20
problems:</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D067523100-12052005>1. =
resolving this=20
error and initialising the PV and creating the VG =
again,</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D067523100-12052005>2. =
Creating the=20
LV.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D067523100-12052005></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D067523100-12052005>help!=20
:P</SPAN></FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV align=3Dleft><FONT face=3DArial size=3D2>thanks</FONT></DIV>
<DIV align=3Dleft><FONT face=3DArial size=3D2>Geoff</FONT></DIV>
<DIV align=3Dleft><FONT face=3DArial size=3D2>Webmaster</FONT></DIV>
<DIV align=3Dleft><FONT face=3DArial size=3D2>Maxnet Systems=20
Administration</FONT></DIV>
<DIV align=3Dleft><FONT face=3DArial size=3D2>PH 0508 =
MAXNET</FONT></DIV>
<DIV align=3Dleft><FONT face=3DArial size=3D2>Mobile: 021 919 =
220</FONT></DIV>
<DIV align=3Dleft><FONT face=3DArial size=3D2>Fax =
+64-9-3007227</FONT></DIV>
<DIV align=3Dleft><FONT face=3DArial size=3D2><A=20
href=3D"http://www.maxnet.co.nz/">www.maxnet.co.nz</A></FONT></DIV>
<DIV>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_00AA_01C556F0.4A83F970--
