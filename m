From: "Edwin Galang" <egalang@mrhm.net>
Subject: [linux-lvm] unresolved symbol
Date: Tue, 19 Oct 1999 18:05:11 -0700
Message-ID: <001201bf1a97$28a132a0$103920d8@waldo.mrhm.net>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0013_01BF1A5C.7C425AA0"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com

This is a multi-part message in MIME format.

------=_NextPart_000_0013_01BF1A5C.7C425AA0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

I am currently running LinuxPPC.  I patched the 2.2.11 kernel and added LVM
as a module.  I recompiled the kernel and then installed LVM.  After reboot,
I tried 'insmod lvm' and I get the following errors:

/lib/modules/2.2.11/block/lvm.o: unresolved symbol lvm_hd_name_ptr_R30b64246
/lib/modules/2.2.11/block/lvm.o: unresolved symbol lvm_map_ptr_R3b91a27d

Any suggestions  ..

Thanks,

Edwin

------=_NextPart_000_0013_01BF1A5C.7C425AA0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.2314.1000" name=3DGENERATOR></HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D640035900-20101999>I am =
currently=20
running LinuxPPC.&nbsp; I patched the 2.2.11 kernel and added LVM as a=20
module.&nbsp; I recompiled the kernel and then installed LVM.&nbsp; =
After=20
reboot, I tried 'insmod lvm' and I get the following =
errors:</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D640035900-20101999></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D640035900-20101999>/lib/modules/2.2.11/block/lvm.o: unresolved =
symbol=20
lvm_hd_name_ptr_R30b64246</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D640035900-20101999>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D640035900-20101999>/lib/modules/2.2.11/block/lvm.o: unresolved =
symbol=20
lvm_map_ptr_R3b91a27d</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D640035900-20101999></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D640035900-20101999>Any=20
suggestions&nbsp; ..</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D640035900-20101999></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D640035900-20101999>Thanks,</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D640035900-20101999></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D640035900-20101999>Edwin</SPAN></FONT></DIV></SPAN></FONT></DIV><=
/BODY></HTML>

------=_NextPart_000_0013_01BF1A5C.7C425AA0--
