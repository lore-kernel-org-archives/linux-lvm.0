Message-ID: <005501c31ea7$b52505e0$e0bba5cc@patni.com>
From: "Sameer Halgatti" <sameer.halgatti@patni.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0052_01C31ED5.BCE8DA30"
Subject: [linux-lvm] Query For MULTIPATH & LVM
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
Date: Tue May 20 08:28:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0052_01C31ED5.BCE8DA30
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi All,
I am a new user to LVM.
I have a system with Linux RH 7.2 (Kernel version 2.4.7-10)
The version of LVM, I am using is lvm-1.0.3-4.
I have connected a Storage Machine (SAN) to my host. So I could have =
multiple paths to any LUN. (e.g sda & sdb are pointing to the same LUN).
So whenever I do "pvcreate" on /dev/sda, PV gets created on /dev/sdb =
also since they (sda & sdb) are pointing to same disk/LUN.
In such a scenario can I use lvm-1.0.3.4 ??
If not then please give me reasons as well as solution.

Pls REPLY to my QUERY!!!

Thanks & Regards,
Sameer Halgatti


------=_NextPart_000_0052_01C31ED5.BCE8DA30
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.2314.1000" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi All,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I am a new user to LVM.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I have a system with Linux RH 7.2 =
(Kernel version=20
2.4.7-10)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>The version of LVM, I am using is=20
lvm-1.0.3-4.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I have connected a Storage Machine =
(SAN) to my=20
host. So I could have multiple paths to any LUN. (e.g sda &amp; sdb are =
pointing=20
to the same LUN).</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>So whenever I do "pvcreate" on =
/dev/sda, PV gets=20
created on /dev/sdb also since they (sda &amp; sdb) are pointing to same =

disk/LUN.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>In such a scenario can I use =
lvm-1.0.3.4=20
??</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>If not then please give me reasons as =
well as=20
solution.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Pls REPLY to my QUERY!!!</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks &amp; Regards,<BR>Sameer=20
Halgatti<BR></FONT></DIV></BODY></HTML>

------=_NextPart_000_0052_01C31ED5.BCE8DA30--
