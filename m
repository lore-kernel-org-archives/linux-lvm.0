Message-ID: <001d01c39b4a$0c19abc0$0b01a8c0@lancelot>
From: "Wojtek" <wojciech@btclick.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_001A_01C39B52.6DBC8200"
Subject: [linux-lvm] Can't build  devmapper for LVM2 on Red Hat 9 - kernel 2.4.20-8
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
Date: Mon Oct 27 06:18:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_001A_01C39B52.6DBC8200
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I tried it few times using sketchy instructions in INSTALL file; it's =
not clear how to apply patches=20

Do I apply them first from patches/common then from patches?
I tried make apply-patches it did only two from patches (devmapper & =
vfat) after changing Makefile (didn't like '-8' on my kernel dir)
It didn't seem to touch those in common.
Then I tried doing them one by one according to README in common ie:

patch -d /usr/src/linux-2.4.20-8 -p1 -i /....../......patch
It spitted out various messages about patch applied ..... -R (n):=20
I tried replying yes it sort of worked=20

So I went to make menuconfig and was able to see devmapper and mirroring =
option
Next make dep

I'm getting no rule to make target mempool.c

I tried other permutations where I get further along by hacking Makefile =
in /root/devmapper-1.00.05/kernel directory but the whole process seems =
to be really messy.=20
I realize that it could be due to my inexperience but was wondering if =
somebody has gone thru' with that install (incl LVM2) and can share =
his/her experience with me.

I appreciate any help you can provide
Wojtek
------=_NextPart_000_001A_01C39B52.6DBC8200
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
<DIV><FONT face=3DArial size=3D2>I tried it few times using sketchy =
instructions in=20
INSTALL file; it's not clear how to apply patches </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Do I apply them first from =
patches/common then from=20
patches?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I tried make apply-patches it did only =
two from=20
patches (devmapper &amp; vfat) after changing Makefile (didn't like '-8' =
on my=20
kernel dir)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>It didn't seem to touch those in=20
common.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Then I tried doing them one by one =
according to=20
README in common ie:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>patch -d /usr/src/linux-2.4.20-8 -p1 -i =

/....../......patch</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>It spitted out various messages about =
patch applied=20
..... -R (n): </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I tried replying yes it sort of worked=20
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>So I went to make menuconfig and was =
able to see=20
devmapper and mirroring option</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Next make dep</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I'm getting no rule to make target=20
mempool.c</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I tried other permutations where I get =
further=20
along by hacking Makefile in /root/devmapper-1.00.05/kernel directory =
but the=20
whole process seems to be really messy. </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I realize that it could be due to my =
inexperience=20
but was wondering if somebody has gone thru' with that install (incl =
LVM2) and=20
can share his/her experience with me.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I appreciate any help you can =
provide</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Wojtek</FONT></DIV></BODY></HTML>

------=_NextPart_000_001A_01C39B52.6DBC8200--
