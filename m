From: "Jorge Melhado" <jrgmelhado@hotmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0010_01C23C98.105E8280"
Message-ID: <OE254VHAYM9UuonbIMm0000e671@hotmail.com>
Subject: [linux-lvm] lvmcreate_initrd: stripping shared library
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
Date: Mon Aug  5 13:53:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0010_01C23C98.105E8280
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello!

I=B4m using Red Hat 7.3 (kernel 2.4.28) and I=B4m trying to convert may =
root filesystem to LVM.
For that, I followed the chapter 18 in LVM HOWTO. But when it=B4s =
necessary create an LVM RAM disk with the command:
    #  lvmcreate_initrd
I receive a message like this:=20
    lvmcreate_initrd  --  finding required shared library
    lvmcreate_initrd  --  stripping shared library
    /sbin/lvmcreate_initrd  --  ERROR stripping shared library =
/lib/i686/libc.so.6

What can I do to fix it?

Thanks,

Jorge =20

------=_NextPart_000_0010_01C23C98.105E8280
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2600.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hello!</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I=B4m using&nbsp;Red Hat 7.3 (kernel =
2.4.28) and I=B4m=20
trying to convert may root filesystem to&nbsp;LVM.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>For that, I followed the chapter 18 in =
LVM HOWTO.=20
But when it=B4s necessary create an LVM RAM disk with the =
command:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; #&nbsp;=20
lvmcreate_initrd</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I receive a message like this: =
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; =
lvmcreate_initrd&nbsp; --&nbsp;=20
finding required shared library</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; =
lvmcreate_initrd&nbsp; --&nbsp;=20
stripping shared library</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; =
/sbin/lvmcreate_initrd&nbsp;=20
--&nbsp; ERROR stripping shared library /lib/i686/libc.so.6</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>What can I do to =
fix&nbsp;it?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Jorge&nbsp; </FONT></DIV></BODY></HTML>

------=_NextPart_000_0010_01C23C98.105E8280--
