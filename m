Message-ID: <001801c320cd$f1be9750$0400a8c0@venkat>
From: "abbireddy venkatram reddy" <venkat@storageone.co.kr>
References: <000801c3205a$31d69dc0$ebbba5cc@patni.com>
Subject: Re: [linux-lvm] Defect in vgchange
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0015_01C32119.61A1AB70"
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
Date: Tue May 27 06:26:17 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0015_01C32119.61A1AB70
Content-Type: text/plain;
	charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

can you provide more details like your Linux version and lvm commands =
you issued before the vgchange command.
  ----- Original Message -----=20
  From: Sachin (Patni)=20
  To: Linux-LVM@Sistina.com=20
  Sent: Thursday, May 22, 2003 9:03 PM
  Subject: [linux-lvm] Defect in vgchange


  hi=20

  I am a software engineer working in the area of Storage Area Networks =
.=20

  But whenever I give the following command

  vgchange -l 128 test_vg=20

  test_vg being a volume group on physical volumes created on sd device =
partitions (type 8e)=20

  It results in segmentation fault.  (I am working on a multi path =
system ;  lvm version : lvm-1.0.3-4 )

  Kindly give me the reason for this , whether this version is not =
suited for multi-path or this is a defect.=20



  Thanks and regards=20


  Sachin Gupta

------=_NextPart_000_0015_01C32119.61A1AB70
Content-Type: text/html;
	charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-2022-jp">
<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>can you provide more details like your =
Linux=20
version and lvm commands you issued before the&nbsp;vgchange=20
command.</FONT></DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Dsachin.gupta@patni.com =
href=3D"mailto:sachin.gupta@patni.com">Sachin=20
  (Patni)</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A =
title=3DLinux-LVM@Sistina.com=20
  href=3D"mailto:Linux-LVM@Sistina.com">Linux-LVM@Sistina.com</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Thursday, May 22, 2003 =
9:03=20
PM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> [linux-lvm] Defect in=20
  vgchange</DIV>
  <DIV><BR></DIV>
  <DIV><FONT face=3DArial size=3D2>hi </FONT></DIV>
  <DIV>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>I am a software engineer working in =
the area of=20
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
  <DIV><FONT face=3DArial size=3D2>It results in segmentation =
fault.&nbsp; (I am=20
  working on a multi path system ;&nbsp; lvm version : lvm-1.0.3-4=20
)</FONT></DIV>
  <DIV>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Kindly give me the reason for this , =
whether this=20
  version is not suited for multi-path or this is a defect. =
</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV>&nbsp;</DIV>
  <DIV>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Thanks and regards </FONT></DIV>
  <DIV>&nbsp;</DIV>
  <DIV>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Sachin=20
Gupta<BR></FONT></DIV></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_0015_01C32119.61A1AB70--
