Message-ID: <001201c263e0$584c1340$db64a8c0@marien>
From: "Marien Tielemans - Van Boxtel Software BV" <mtielemans@van-boxtel-software.nl>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000F_01C263F1.1AD91E20"
Subject: [linux-lvm] cannot mount snapshot volumes
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
Date: Tue Sep 24 10:40:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_000F_01C263F1.1AD91E20
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello ,

I am using a stock RedHat 7.3 server (ext 3 fs) with lvm 1.0.3 installed =
, i upgraded lvm to 1.0.5 ( kernel patch etc.).
LVM works fine however i cannot mount the created snapshot volume.

When doing a mount the server tells me : Wrong fs type , bad option, bas =
superblock on /dev/lvmgroup1/snapshot , or too many mounted file =
systems.

In the mailing list i read that the solution for this problem : patch =
the kernel with  linux-2.4.18-VFS-lock.patch.( applied in the 1.0.5 tar =
file)

However when i apply the patch i get messages about Reverse patches and =
several chunks and files not being patched .So compiling the kernel =
again also gives problems.

I like to know, is there another patch file i have to use , or a better =
solution for this problem ?

Thanks ,

Marien Tielemans



------=_NextPart_000_000F_01C263F1.1AD91E20
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 5.50.4807.2300" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hello ,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I am using a stock RedHat 7.3 server =
(ext 3 fs)=20
with lvm 1.0.3 installed , i upgraded lvm to 1.0.5 ( kernel patch=20
etc.).</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>LVM works fine however i cannot mount =
the created=20
snapshot volume.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>When doing a mount the server tells me =
: Wrong fs=20
type , bad option, bas superblock on /dev/lvmgroup1/snapshot , or too =
many=20
mounted file systems.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>In the mailing list i read that the =
solution for=20
this problem : patch the kernel with &nbsp;linux-2.4.18-VFS-lock.patch.( =
applied=20
in the 1.0.5 tar file)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>However when i apply the patch i get =
messages about=20
Reverse patches and several chunks and files not being patched .So =
compiling the=20
kernel again also gives problems.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I like to know, is there another patch =
file i have=20
to use , or a better solution for this problem ?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks ,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Marien Tielemans</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_000F_01C263F1.1AD91E20--
