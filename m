content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C33207.4B86ECCF"
Subject: RE:  [linux-lvm]  read-only media in a LVM? 
Message-ID: <C42D120999B1CC4C886B6BB2832F356019BF6D@hermes.genomatica.com>
From: "Sean P. Kane" <spkane@genomatica.com>
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
Date: Mon Jun 16 08:35:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com
Cc: "Sean P. Kane" <spkane@genomatica.com>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C33207.4B86ECCF
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

I saw this email below and was wondering if this is supported in both dm
and the LVM2 tools now. I am trying to setup a bootable cd, that can be
written to during that session and this would be a god send, since as
the last person points out there really isn't a mature way to do this in
the 2.4/2.5 kernels. 2.6 is suppose to have a unionfs sometime after
release, but this is an immediate project.
=20
Thanks,
Sean
=20
------------------------------------------------------------------------
Sean P. Kane
spkane@genomatica.com
Lead Infrastructure Architect
Genomatica, Inc. <http://www.genomatica.com/>=20
------------------------------------------------------------------------
"When we destroy something man has created we call it vandalism......
 When we destroy something that Gaia
<http://dictionary.reference.com/search?q=3Dgaia>  has created we call =
it
progress."

=20

[linux-lvm] read-only media in a LVM?=20
Joe Thornber linux-lvm@sistina.com <mailto:linux-lvm%40sistina.com>=20
Tue May 28 03:44:01 2002=20
=20
Previous message: [linux-lvm] read-only media in a LVM?
<https://lists.sistina.com/pipermail/linux-lvm/2002-May/011529.html>=20
Next message: [linux-lvm] errors compiling on redhat 7.3
<https://lists.sistina.com/pipermail/linux-lvm/2002-May/011528.html>=20
Messages sorted by: [ date ]
<https://lists.sistina.com/pipermail/linux-lvm/2002-May/date.html#11530>
[ thread ]
<https://lists.sistina.com/pipermail/linux-lvm/2002-May/thread.html#1153
0>  [ subject ]
<https://lists.sistina.com/pipermail/linux-lvm/2002-May/subject.html#115
30>  [ author ]
<https://lists.sistina.com/pipermail/linux-lvm/2002-May/author.html#1153
0> =20
  _____ =20

On Mon, May 27, 2002 at 04:37:49PM -0700, Ami Fischman wrote:
> Hi there,
> I am wondering whether it is possible to have a read-only fs (CDROM,
image,
> etc) as part of an LVM-managed volume. I see references to COW
> (copy-on-write, I'm hoping :)) in the kernel drivers/md/ files, but
it's not
> at all clear to me whether or not the current drivers can be used to
> implement a "translucent" or "inheriting" file system (one where a
base fs
> is given, on r-o media, and changes to it get recorded on another
device,
> presumabely a r-w fs). Please let me know whether this is currently
> possible, being planned for the future, or if I'm making no sense
above &
> you want me to clarify :). For a not-quite-mature example of what I'm
> talking about, see translucency.sf.net.
=20
In fact you can do this now if you use just device-mapper/dmsetup :)
It's just the LVM2 tools that don't support it yet.- Joe=20
=20

------_=_NextPart_001_01C33207.4B86ECCF
Content-Type: text/html;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>Message</TITLE>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<META content=3D"MSHTML 6.00.2800.1170" name=3DGENERATOR></HEAD>
<BODY>
<DIV><SPAN class=3D744285023-13062003><FONT face=3DArial size=3D2>I saw =
this email=20
below and was wondering if this is supported in both dm and the LVM2 =
tools now.=20
I am trying to setup a bootable cd, that can be written to during that =
session=20
and this would be a god send, since as the last person points out there =
really=20
isn't a mature way to do this in the 2.4/2.5 kernels. 2.6 is suppose to =
have a=20
unionfs sometime after release, but this is an immediate=20
project.</FONT></SPAN></DIV>
<DIV><SPAN class=3D744285023-13062003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D744285023-13062003><FONT face=3DArial=20
size=3D2>Thanks,</FONT></SPAN></DIV>
<DIV><SPAN class=3D744285023-13062003><FONT face=3DArial=20
size=3D2>Sean</FONT></SPAN></DIV>
<DIV><SPAN class=3D744285023-13062003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D744285023-13062003>
<DIV=20
align=3Dleft>------------------------------------------------------------=
------------<BR>Sean=20
P. Kane&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <A=20
href=3D"mailto:spkane@genomatica.com">spkane@genomatica.com</A><BR>Lead=20
Infrastructure Architect&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =

&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
<A href=3D"http://www.genomatica.com/">Genomatica,=20
Inc.</A><BR>-------------------------------------------------------------=
-----------<BR>"When=20
we destroy something man has created we call it =
vandalism......<BR>&nbsp;When we=20
destroy something that <A=20
href=3D"http://dictionary.reference.com/search?q=3Dgaia">Gaia</A> has =
created we=20
call it progress."</DIV></SPAN></DIV>
<H1>&nbsp;</H1>
<DIV><FONT face=3DArial>[linux-lvm] read-only media in a LVM? =
</FONT></DIV>
<DIV><B><FONT face=3DArial>Joe Thornber </FONT></B><A=20
title=3D"[linux-lvm] read-only media in a LVM?"=20
href=3D"mailto:linux-lvm%40sistina.com"><FONT =
face=3DArial>linux-lvm@sistina.com=20
</FONT></A><BR><FONT face=3DArial><I>Tue May 28 03:44:01 2002</I> =
</FONT></DIV>
<DIV><FONT face=3DArial></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial>Previous message: </FONT><A=20
href=3D"https://lists.sistina.com/pipermail/linux-lvm/2002-May/011529.htm=
l"><FONT=20
face=3DArial>[linux-lvm] read-only media in a LVM? </FONT></A></DIV>
<DIV><FONT face=3DArial>Next message: </FONT><A=20
href=3D"https://lists.sistina.com/pipermail/linux-lvm/2002-May/011528.htm=
l"><FONT=20
face=3DArial>[linux-lvm] errors compiling on redhat 7.3 =
</FONT></A></DIV>
<DIV><FONT face=3DArial><B>Messages sorted by:</B> </FONT><A=20
href=3D"https://lists.sistina.com/pipermail/linux-lvm/2002-May/date.html#=
11530"><FONT=20
face=3DArial>[ date ]</FONT></A><FONT face=3DArial> </FONT><A=20
href=3D"https://lists.sistina.com/pipermail/linux-lvm/2002-May/thread.htm=
l#11530"><FONT=20
face=3DArial>[ thread ]</FONT></A><FONT face=3DArial> </FONT><A=20
href=3D"https://lists.sistina.com/pipermail/linux-lvm/2002-May/subject.ht=
ml#11530"><FONT=20
face=3DArial>[ subject ]</FONT></A><FONT face=3DArial> </FONT><A=20
href=3D"https://lists.sistina.com/pipermail/linux-lvm/2002-May/author.htm=
l#11530"><FONT=20
face=3DArial>[ author ]</FONT></A><FONT face=3DArial> </FONT></DIV>
<DIV><FONT face=3DArial>
<HR>
</FONT></DIV><!--beginarticle-->
<DIV><FONT face=3DArial>On Mon, May 27, 2002 at 04:37:49PM -0700, Ami =
Fischman=20
wrote:</FONT></DIV>
<DIV><FONT face=3DArial>&gt;</FONT><FONT face=3DArial><I> Hi =
there,</I></FONT></DIV>
<DIV><FONT face=3DArial><I></I>&gt;</FONT><FONT face=3DArial><I> I am =
wondering=20
whether it is possible to have a read-only fs (CDROM, =
image,</I></FONT></DIV>
<DIV><FONT face=3DArial><I></I>&gt;</FONT><FONT face=3DArial><I> etc) as =
part of an=20
LVM-managed volume.  I see references to COW</I></FONT></DIV>
<DIV><FONT face=3DArial><I></I>&gt;</FONT><FONT face=3DArial><I> =
(copy-on-write, I'm=20
hoping :)) in the kernel drivers/md/ files, but it's =
not</I></FONT></DIV>
<DIV><FONT face=3DArial><I></I>&gt;</FONT><FONT face=3DArial><I> at all =
clear to me=20
whether or not the current drivers can be used to</I></FONT></DIV>
<DIV><FONT face=3DArial><I></I>&gt;</FONT><FONT face=3DArial><I> =
implement a=20
"translucent" or "inheriting" file system (one where a base =
fs</I></FONT></DIV>
<DIV><FONT face=3DArial><I></I>&gt;</FONT><FONT face=3DArial><I> is =
given, on r-o=20
media, and changes to it get recorded on another =
device,</I></FONT></DIV>
<DIV><FONT face=3DArial><I></I>&gt;</FONT><FONT face=3DArial><I> =
presumabely a r-w=20
fs).  Please let me know whether this is currently</I></FONT></DIV>
<DIV><FONT face=3DArial><I></I>&gt;</FONT><FONT face=3DArial><I> =
possible, being=20
planned for the future, or if I'm making no sense above =
&amp;</I></FONT></DIV>
<DIV><FONT face=3DArial><I></I>&gt;</FONT><FONT face=3DArial><I> you =
want me to=20
clarify :).  For a not-quite-mature example of what I'm</I></FONT></DIV>
<DIV><FONT face=3DArial><I></I>&gt;</FONT><FONT face=3DArial><I> talking =
about, see=20
translucency.sf.net.</I><EM></EM></FONT></DIV>
<DIV><FONT face=3DArial><EM></EM></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial><EM></EM>In fact you can do this now if you use =
just=20
device-mapper/dmsetup :)</FONT></DIV>
<DIV><FONT face=3DArial>It's just the LVM2 tools that don't support it =
yet.- Joe
</FONT></DIV>
<DIV><FONT face=3DArial></FONT>&nbsp;</DIV></BODY></HTML>
=00
------_=_NextPart_001_01C33207.4B86ECCF--
