Message-ID: <000801c3205a$31d69dc0$ebbba5cc@patni.com>
From: "Sachin (Patni)" <sachin.gupta@patni.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0005_01C32088.3995DE30"
Subject: [linux-lvm] Defect in vgchange
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Thu May 22 09:40:12 2003
List-Id: <linux-lvm.redhat.com>
To: Linux-LVM@Sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0005_01C32088.3995DE30
Content-Type: text/plain;
	charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

hi=20

I am a software engineer working in the area of Storage Area Networks .=20

But whenever I give the following command

vgchange -l 128 test_vg=20

test_vg being a volume group on physical volumes created on sd device =
partitions (type 8e)=20

It results in segmentation fault.  (I am working on a multi path system =
;  lvm version : lvm-1.0.3-4 )

Kindly give me the reason for this , whether this version is not suited =
for multi-path or this is a defect.=20
=20


Thanks and regards=20


Sachin Gupta


------=_NextPart_000_0005_01C32088.3995DE30
Content-Type: text/html;
	charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-2022-jp" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.2314.1000" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>hi </FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I am a software engineer working in the =
area of=20
Storage Area Networks . </FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>But whenever I give the following=20
command</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>vgchange -l 128 test_vg </FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>test_vg being a volume group on =
physical volumes=20
created on sd device partitions (type 8e) </FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>It results in segmentation fault.&nbsp; =
(I am=20
working on a multi path system ;&nbsp; lvm version : lvm-1.0.3-4 =
)</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Kindly give me the reason for this , =
whether this=20
version is not suited for multi-path or this is a defect. </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks and regards </FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Sachin =
Gupta<BR></FONT></DIV></BODY></HTML>

------=_NextPart_000_0005_01C32088.3995DE30--
