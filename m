Return-Path: <paulo_fessel@optiglobe.com.br>
Message-ID: <1D15D20781EB404E9EA6129359E0243909784E@sp1email.optiglobe.com.br>
From: Paulo Fessel <paulo_fessel@optiglobe.com.br>
Subject: RE: [linux-lvm] K=2.4.3 - LVM0.9.1.B7 compiling problem.
Date: Tue, 24 Apr 2001 14:21:54 -0300
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C0CCE3.0ECE56A0"
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
List-Id: <linux-lvm.redhat.com>
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C0CCE3.0ECE56A0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I've run into problems trying to compile 2.4.3 on Mandrake 7.2 with =
2.4.3
(Linus) and 2.4.3-8mdk (Mandrake customized kernel). So I've copied the
files from lvm "kernel" directory to their proper places and everything
worked out smoothly. Try to do the same thing...

HugZ

Paulo Afonso Graner Fessel
Suporte de Sistemas
OptiGlobe Telecom, Ltda. - The Internet Lives Here
R.Bento Branco de Andrade Filho, 621
S=E3o Paulo, SP, 04757-000
Brasil
http://www.optiglobe.com.br

Tel.:+55 11 3365-4478
Fax:+55 11 3365-4445
Cel.:+55 11 9198-9985
E-mail: paulo_fessel@optiglobe.com.br



> -----Original Message-----
> From: Ernesto Silva [mailto:silva@athenea.ort.edu.uy]
> Sent: Tuesday, April 24, 2001 12:20 PM
> To: linux-lvm@sistina.com
> Subject: [linux-lvm] K=3D2.4.3 - LVM0.9.1.B7 compiling problem.
>=20
>=20
> Hi,
>=20
> 	In order to make things right I downloaded the 2.4.3 kernel and
> compiled it (i386).
>=20
> 	With the new kernel running (lvm-mod load ok) I'm=20
> trying to compile lvm
> tools, but there are lots of warinigs, all the same thing,=20
> the first of them is:
> -----------------------------------------------------------
> gcc -c -pipe -g -O2 -Wall -DDEBUG -I ../../tools/lib -I=20
> ../../tools - debug.o
> debug.c
> In file included from ../../tools/lib/liblvm.h:97
> 		from basename.c:34
> ../../tools/lib/lvm_log.h:47:59: warning: nothing can be=20
> pasted after this token
> ../../tools/lib/lvm_log.h:48:59: warning: nothing can be=20
> pasted after this token
> ../../tools/lib/lvm_log.h:49:59: warning: nothing can be=20
> pasted after this token
> ../../tools/lib/lvm_log.h:52:39: warning: nothing can be=20
> pasted after this token
> gasename.c:41:69: warning: pasting would not give a valid=20
> preprocessing token
> gasename.c:59:68: warning: pasting would not give a valid=20
> preprocessing token
> ----------------------------------------------------------
>  This messages repeats several times.
>=20
> Does anyone had a problem like this before???
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
>=20

------_=_NextPart_001_01C0CCE3.0ECE56A0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2653.12">
<TITLE>RE: [linux-lvm] K=3D2.4.3 - LVM0.9.1.B7 compiling =
problem.</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>I've run into problems trying to compile 2.4.3 on =
Mandrake 7.2 with 2.4.3 (Linus) and 2.4.3-8mdk (Mandrake customized =
kernel). So I've copied the files from lvm &quot;kernel&quot; directory =
to their proper places and everything worked out smoothly. Try to do =
the same thing...</FONT></P>

<P><FONT SIZE=3D2>HugZ</FONT>
</P>

<P><FONT SIZE=3D2>Paulo Afonso Graner Fessel</FONT>
<BR><FONT SIZE=3D2>Suporte de Sistemas</FONT>
<BR><FONT SIZE=3D2>OptiGlobe Telecom, Ltda. - The Internet Lives =
Here</FONT>
<BR><FONT SIZE=3D2>R.Bento Branco de Andrade Filho, 621</FONT>
<BR><FONT SIZE=3D2>S=E3o Paulo, SP, 04757-000</FONT>
<BR><FONT SIZE=3D2>Brasil</FONT>
<BR><FONT SIZE=3D2><A HREF=3D"http://www.optiglobe.com.br" =
TARGET=3D"_blank">http://www.optiglobe.com.br</A></FONT>
</P>

<P><FONT SIZE=3D2>Tel.:+55 11 3365-4478</FONT>
<BR><FONT SIZE=3D2>Fax:+55 11 3365-4445</FONT>
<BR><FONT SIZE=3D2>Cel.:+55 11 9198-9985</FONT>
<BR><FONT SIZE=3D2>E-mail: paulo_fessel@optiglobe.com.br</FONT>
</P>
<BR>
<BR>

<P><FONT SIZE=3D2>&gt; -----Original Message-----</FONT>
<BR><FONT SIZE=3D2>&gt; From: Ernesto Silva [<A =
HREF=3D"mailto:silva@athenea.ort.edu.uy">mailto:silva@athenea.ort.edu.uy=
</A>]</FONT>
<BR><FONT SIZE=3D2>&gt; Sent: Tuesday, April 24, 2001 12:20 PM</FONT>
<BR><FONT SIZE=3D2>&gt; To: linux-lvm@sistina.com</FONT>
<BR><FONT SIZE=3D2>&gt; Subject: [linux-lvm] K=3D2.4.3 - LVM0.9.1.B7 =
compiling problem.</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; Hi,</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; In order to make =
things right I downloaded the 2.4.3 kernel and</FONT>
<BR><FONT SIZE=3D2>&gt; compiled it (i386).</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; With the new =
kernel running (lvm-mod load ok) I'm </FONT>
<BR><FONT SIZE=3D2>&gt; trying to compile lvm</FONT>
<BR><FONT SIZE=3D2>&gt; tools, but there are lots of warinigs, all the =
same thing, </FONT>
<BR><FONT SIZE=3D2>&gt; the first of them is:</FONT>
<BR><FONT SIZE=3D2>&gt; =
-----------------------------------------------------------</FONT>
<BR><FONT SIZE=3D2>&gt; gcc -c -pipe -g -O2 -Wall -DDEBUG -I =
../../tools/lib -I </FONT>
<BR><FONT SIZE=3D2>&gt; ../../tools - debug.o</FONT>
<BR><FONT SIZE=3D2>&gt; debug.c</FONT>
<BR><FONT SIZE=3D2>&gt; In file included from =
../../tools/lib/liblvm.h:97</FONT>
<BR><FONT SIZE=3D2>&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from basename.c:34</FONT>
<BR><FONT SIZE=3D2>&gt; ../../tools/lib/lvm_log.h:47:59: warning: =
nothing can be </FONT>
<BR><FONT SIZE=3D2>&gt; pasted after this token</FONT>
<BR><FONT SIZE=3D2>&gt; ../../tools/lib/lvm_log.h:48:59: warning: =
nothing can be </FONT>
<BR><FONT SIZE=3D2>&gt; pasted after this token</FONT>
<BR><FONT SIZE=3D2>&gt; ../../tools/lib/lvm_log.h:49:59: warning: =
nothing can be </FONT>
<BR><FONT SIZE=3D2>&gt; pasted after this token</FONT>
<BR><FONT SIZE=3D2>&gt; ../../tools/lib/lvm_log.h:52:39: warning: =
nothing can be </FONT>
<BR><FONT SIZE=3D2>&gt; pasted after this token</FONT>
<BR><FONT SIZE=3D2>&gt; gasename.c:41:69: warning: pasting would not =
give a valid </FONT>
<BR><FONT SIZE=3D2>&gt; preprocessing token</FONT>
<BR><FONT SIZE=3D2>&gt; gasename.c:59:68: warning: pasting would not =
give a valid </FONT>
<BR><FONT SIZE=3D2>&gt; preprocessing token</FONT>
<BR><FONT SIZE=3D2>&gt; =
----------------------------------------------------------</FONT>
<BR><FONT SIZE=3D2>&gt;&nbsp; This messages repeats several =
times.</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; Does anyone had a problem like this =
before???</FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; =
_______________________________________________</FONT>
<BR><FONT SIZE=3D2>&gt; linux-lvm mailing list</FONT>
<BR><FONT SIZE=3D2>&gt; linux-lvm@sistina.com</FONT>
<BR><FONT SIZE=3D2>&gt; <A =
HREF=3D"http://lists.sistina.com/mailman/listinfo/linux-lvm" =
TARGET=3D"_blank">http://lists.sistina.com/mailman/listinfo/linux-lvm</A=
></FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C0CCE3.0ECE56A0--
