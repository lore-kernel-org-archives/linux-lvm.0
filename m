Message-ID: <001501c2d945$90db30d0$0400a8c0@venkat>
From: "abbireddy venkatram reddy" <venkat@storageone.co.kr>
References: <F119Oc0Ne0PaLI9mK6P0000568f@hotmail.com> <000e01c2d651$a9c4b090$0400a8c0@venkat>
Subject: Re: [linux-lvm] problem in /proc/lvm/global help please..
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0012_01C2D991.00B82A70"
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
Date: Fri Feb 21 09:11:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0012_01C2D991.00B82A70
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all,


 I am reading information of lvms from the /proc/lvm directory.

 but the snapshot size is shown as same size as lv if I create with =
lesses size of lv also.

 can anybody help me please.

 thanks in advance.
 eg.

file information: /proc/lvm/global

VG:  vg01  [2 PV, 2 LV/2 open]  PE Size: 65536 KB
  Usage [KB/PE]: 52232192 /797 total  3866624 /59 used  48365568 /738 =
free
  PVs: [AA] rd/c0d0p5             41091072 /627      3080192 /47      =
38010880 /580
       [AA] rd/c0d0p6             11141120 /170            0 /0       =
11141120 /170
    LVs: [AWDL  ] lv01                       3080192 /47       1x open
         [ARDL  ] lv01_snap0217_1550         3080192 /47       1x open


 output from the lvscan :

lvscan -- ACTIVE   Original "/dev/vg01/lv01" [2.94 GB]
lvscan -- ACTIVE   Snapshot "/dev/vg01/lv01_snap0217_1550" [767.25 MB] =
of /dev/vg01/lv01

Please help me. what is the reason?. is kernel problem?

with regards
venkat.

  ----- Original Message -----=20
  From: abbireddy venkatram reddy=20
  To: linux-lvm@sistina.com=20
  Sent: Monday, February 17, 2003 3:56 PM
  Subject: [linux-lvm] problem in /proc/lvm/global help please..


  Hi all,


   I am reading information of lvms from the /proc/lvm directory.

   but the snapshot size is shown as same size as lv if I create with =
lesses size of lv also.

   can anybody help me please.

   thanks in advance.
   eg.

  file information: /proc/lvm/global

  VG:  vg01  [2 PV, 2 LV/2 open]  PE Size: 65536 KB
    Usage [KB/PE]: 52232192 /797 total  3866624 /59 used  48365568 /738 =
free
    PVs: [AA] rd/c0d0p5             41091072 /627      3080192 /47      =
38010880 /580
         [AA] rd/c0d0p6             11141120 /170            0 /0       =
11141120 /170
      LVs: [AWDL  ] lv01                       3080192 /47       1x open
           [ARDL  ] lv01_snap0217_1550         3080192 /47       1x open


   output from the lvscan :

  lvscan -- ACTIVE   Original "/dev/vg01/lv01" [2.94 GB]
  lvscan -- ACTIVE   Snapshot "/dev/vg01/lv01_snap0217_1550" [767.25 MB] =
of /dev/vg01/lv01

  Please help me. what is the reason?. is kernel problem?

  with regards
  venkat.






------=_NextPart_000_0012_01C2D991.00B82A70
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV>
<DIV><FONT face=3DArial size=3D2>Hi all,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;I am reading information of lvms =
from the=20
/proc/lvm directory.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;but the snapshot size is shown as =
same size=20
as lv if I create with lesses size of lv also.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;can anybody help me =
please.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;thanks in advance.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;eg.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>file information: =
/proc/lvm/global</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>VG:&nbsp; vg01&nbsp; [2 PV, 2 LV/2 =
open]&nbsp; PE=20
Size: 65536 KB<BR>&nbsp; Usage [KB/PE]: 52232192 /797 total&nbsp; =
3866624 /59=20
used&nbsp; 48365568 /738 free<BR>&nbsp; PVs: [AA]=20
rd/c0d0p5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;=20
41091072 /627&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3080192=20
/47&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 38010880=20
/580<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [AA]=20
rd/c0d0p6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;=20
11141120 =
/170&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0 /0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 11141120 =
/170<BR>&nbsp;&nbsp;&nbsp;=20
LVs: [AWDL&nbsp; ]=20
lv01&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<STRONG>=20
3080192</STRONG> /47&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1x=20
open<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ARDL&nbsp; ]=20
lv01_snap0217_1550&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
<STRONG>3080192 </STRONG>/47&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1x=20
open</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;output from the lvscan =
:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>lvscan -- ACTIVE&nbsp;&nbsp; Original=20
"/dev/vg01/lv01" [<STRONG>2.94 GB</STRONG>]<BR>lvscan -- =
ACTIVE&nbsp;&nbsp;=20
Snapshot "/dev/vg01/lv01_snap0217_1550" [<STRONG>767.25 MB</STRONG>] of=20
/dev/vg01/lv01<BR></DIV>
<DIV>Please help me. what is the reason?. is kernel problem?</DIV>
<DIV>&nbsp;</DIV>
<DIV>with regards</DIV>
<DIV>venkat.<BR></DIV></FONT></DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Dvenkat@storageone.co.kr=20
  href=3D"mailto:venkat@storageone.co.kr">abbireddy venkatram reddy</A> =
</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A =
title=3Dlinux-lvm@sistina.com=20
  href=3D"mailto:linux-lvm@sistina.com">linux-lvm@sistina.com</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Monday, February 17, 2003 =
3:56=20
  PM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> [linux-lvm] problem in =

  /proc/lvm/global help please..</DIV>
  <DIV><BR></DIV>
  <DIV><FONT face=3DArial size=3D2>Hi all,</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>&nbsp;I am reading information of =
lvms from the=20
  /proc/lvm directory.</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>&nbsp;but the snapshot size is shown =
as same size=20
  as lv if I create with lesses size of lv also.</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>&nbsp;can anybody help me =
please.</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>&nbsp;thanks in advance.</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>&nbsp;eg.</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>file information: =
/proc/lvm/global</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>VG:&nbsp; vg01&nbsp; [2 PV, 2 LV/2 =
open]&nbsp; PE=20
  Size: 65536 KB<BR>&nbsp; Usage [KB/PE]: 52232192 /797 total&nbsp; =
3866624 /59=20
  used&nbsp; 48365568 /738 free<BR>&nbsp; PVs: [AA]=20
  =
rd/c0d0p5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;=20
  41091072 /627&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3080192=20
  /47&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 38010880=20
  /580<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [AA]=20
  =
rd/c0d0p6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;=20
  11141120=20
  /170&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0=20
  /0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 11141120 =
/170<BR>&nbsp;&nbsp;&nbsp;=20
  LVs: [AWDL&nbsp; ]=20
  =
lv01&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<STRONG>=20
  3080192</STRONG> /47&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1x=20
  open<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ARDL&nbsp; ] =

  lv01_snap0217_1550&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  <STRONG>3080192 </STRONG>/47&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1x=20
  open</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>&nbsp;output from the lvscan =
:</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>lvscan -- ACTIVE&nbsp;&nbsp; Original =

  "/dev/vg01/lv01" [<STRONG>2.94 GB</STRONG>]<BR>lvscan -- =
ACTIVE&nbsp;&nbsp;=20
  Snapshot "/dev/vg01/lv01_snap0217_1550" [<STRONG>767.25 MB</STRONG>] =
of=20
  /dev/vg01/lv01<BR></DIV>
  <DIV>Please help me. what is the reason?. is kernel problem?</DIV>
  <DIV>&nbsp;</DIV>
  <DIV>with regards</DIV>
  <DIV>venkat.<BR></DIV></FONT>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial =
size=3D2></FONT>&nbsp;</DIV></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_0012_01C2D991.00B82A70--
