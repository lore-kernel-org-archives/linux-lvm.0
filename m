Subject: Re: [linux-lvm] pvmove error
From: Juan Pablo =?ISO-8859-1?Q?Gim=E9nez?= <jpg@rcom.com.ar>
In-Reply-To: <sf152e81.098@gwia201.syr.edu>
References: <sf152e81.098@gwia201.syr.edu>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-WKQKo6X+hmG1OPW2Cw6a"
Message-Id: <1058369346.4582.64.camel@hugo>
Mime-Version: 1.0
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
Date: Wed Jul 16 14:38:04 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=-WKQKo6X+hmG1OPW2Cw6a
Content-Type: multipart/alternative; boundary="=-uGqdxIHo8CAG7THgObEg"


--=-uGqdxIHo8CAG7THgObEg
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

El mi=C3=A9, 16-07-2003 a las 11:52, Stephen Fralich escribi=C3=B3:

> I'm not using the redhat pvmove (v1.0.3).  I'm using pvmove 1.0.7 which I=
 downloaded from the Sistina site.  I updated the rc scripts to use 1.0.7. =
 The volume was created totally under 1.0.7.  I'm using a plain kernel (fro=
m kernel.org) 2.4.21 patched with LVM 1.0.7 (from Sistina).

But may be you are using the redhat liblvm

>=20
> [root@sauron root]# /sbin/pvmove --version
> pvmove: Logical Volume Manager 1.0.3
> Heinz Mauelshagen, Sistina Software  19/02/2002 (IOP 10)
> [root@sauron root]# pvmove --version
> pvmove: Logical Volume Manager 1.0.7


Where is the second pvmove? Please try,

        ldd /sbin/pvmove
        ldd pvmove
        LD_PRELOAD=3D<unpatchedlvmliblocation> pvmove ...
       =20





Juan Pablo Gim=C3=A9nez=20

http://www.rcom.com.ar/
http://www.rcom.com.ar/comunidad/
Llave GnuPG:
MIT keyserver=20
Web Rcom=20

GnuPG fingerprint: ED97 6FB8 A9BE
26A6 789B 6657 0A15 EC2B D3D8 FD2B=20

http://www.greenpeace.org.ar/secciones/cyberactivismo/nuclear.php3

--=-uGqdxIHo8CAG7THgObEg
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; CHARSET=3DUTF-8">
  <META NAME=3D"GENERATOR" CONTENT=3D"GtkHTML/3.0.5">
</HEAD>
<BODY>
El mi&#233;, 16-07-2003 a las 11:52, Stephen Fralich escribi&#243;:
<BLOCKQUOTE TYPE=3DCITE>
<PRE><FONT COLOR=3D"#737373"><I>I'm not using the redhat pvmove (v1.0.3).&n=
bsp; I'm using pvmove 1.0.7 which I downloaded from the Sistina site.&nbsp;=
 I updated the rc scripts to use 1.0.7.&nbsp; The volume was created totall=
y under 1.0.7.&nbsp; I'm using a plain kernel (from kernel.org) 2.4.21 patc=
hed with LVM 1.0.7 (from Sistina).</I></FONT></PRE>
</BLOCKQUOTE>
But may be you are using the redhat liblvm
<BLOCKQUOTE TYPE=3DCITE>
<PRE><FONT COLOR=3D"#737373"><I>
[root@sauron root]# /sbin/pvmove --version
pvmove: Logical Volume Manager 1.0.3
Heinz Mauelshagen, Sistina Software  19/02/2002 (IOP 10)
[root@sauron root]# pvmove --version
pvmove: Logical Volume Manager 1.0.7</I></FONT></PRE>
</BLOCKQUOTE>
<BR>
Where is the second pvmove? Please try,
<BLOCKQUOTE>
    ldd /sbin/pvmove<BR>
    ldd pvmove<BR>
    LD_PRELOAD=3D&lt;unpatchedlvmliblocation&gt; pvmove ...<BR>
    <BR>
</BLOCKQUOTE>
<BR>
<PRE><TABLE CELLSPACING=3D"0" CELLPADDING=3D"0" WIDTH=3D"100%">
<TR>
<TD>
<TABLE>
<TR>
<TD>
<A HREF=3D"http://www.rcom.com.ar/phpAdsNew/adclick.php?what=3Dbannerid:4">=
<IMG SRC=3D"http://www.rcom.com.ar/phpAdsNew/adview.php?what=3Dbannerid:4" =
ALIGN=3D"bottom" BORDER=3D"0"></A>
<H2><A HREF=3D"http://www.rcom.com.ar/comunidad/tiki-index.php?page=3DUserP=
agejpg"><U>Juan Pablo Gim&#233;nez </A></H2>
<A HREF=3D"http://www.rcom.com.ar/">http://www.rcom.com.ar/</A><BR>
<A HREF=3D"http://www.rcom.com.ar/comunidad/">http://www.rcom.com.ar/comuni=
dad/</U></A><BR>
Llave GnuPG:<BR>
<A HREF=3D"http://pgp.mit.edu:11371/pks/lookup?op=3Dget&search=3D0xD3D8FD2B=
"><U>MIT keyserver </A><BR>
<A HREF=3D"http://www.rcom.com.ar/GPG_keys/D3D8FD2B">Web Rcom </U></A><BR>
<BR>
GnuPG fingerprint: ED97 6FB8 A9BE 26A6 789B 6657 0A15 EC2B D3D8 FD2B <BR>
<BR>
</TD>
<TD BGCOLOR=3D"#98ccf8" ALIGN=3D"center" VALIGN=3D"top">
<A HREF=3D"http://www.greenpeace.org.ar/secciones/cyberactivismo/nuclear.ph=
p3"><IMG SRC=3D"http://www.rcom.com.ar/phpAdsNew/adview.php?what=3Dbannerid=
:6" WIDTH=3D"70" HEIGHT=3D"70" ALIGN=3D"bottom" ALT=3D"http://www.greenpeac=
e.org.ar/secciones/cyberactivismo/nuclear.php3" BORDER=3D"0"></A>
</TD>
</TR>
</TABLE>

</TD>
</TR>
</TABLE>
</PRE>
</BODY>
</HTML>

--=-uGqdxIHo8CAG7THgObEg--

--=-WKQKo6X+hmG1OPW2Cw6a
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Esta parte del mensaje =?ISO-8859-1?Q?est=E1?= firmada
	digitalmente

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA/FW9CmwwiUvOlMjQRAmt4AJ4o5kcQULjwifYg8raLZNjZAbHcmwCgiMX6
VWQoACPwABps4sUyIJjiJkc=
=NYD9
-----END PGP SIGNATURE-----

--=-WKQKo6X+hmG1OPW2Cw6a--
