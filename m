From: Juan Pablo =?ISO-8859-1?Q?Gim=E9nez?= <jpg@rcom.com.ar>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-ZNdSyV98H1dBIRC5pLar"
Message-Id: <1057961544.9804.31.camel@hugo>
Mime-Version: 1.0
Subject: [linux-lvm] pvmove
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
Date: Sat Jul 12 07:44:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=-ZNdSyV98H1dBIRC5pLar
Content-Type: multipart/alternative; boundary="=-EgCdn84+nzd+4xSdeWCI"


--=-EgCdn84+nzd+4xSdeWCI
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

What's more secure, the Redhat patched pvmove or the original one?

BTW, I have a little patch to fix RedHat patched pvmove and make it work
with unpatched kernels...


        --- lib/pv_move.c	2003-07-11 19:10:26.000000000 -0300
        +++ lib/pv_move.c.rcom	2003-07-11 19:09:35.000000000 -0300
        @@ -916,7 +916,7 @@
         	ret =3D ioctl(group, PE_LOCKED_COPY, &pe_copy_req);
         	if (ret < 0)
         		ret =3D -errno;
        -	if (ret =3D=3D -EINVAL)
        +	if (ret =3D=3D -EINVAL || ret =3D=3D -ENOTTY)
         		ret =3D -LVM_EPV_LOCKED_COPY_EINVAL;
         =09
         	close(group);
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

--=-EgCdn84+nzd+4xSdeWCI
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; CHARSET=3DUTF-8">
  <META NAME=3D"GENERATOR" CONTENT=3D"GtkHTML/3.0.5">
</HEAD>
<BODY>
What's more secure, the Redhat patched pvmove or the original one?<BR>
<BR>
BTW, I have a little patch to fix RedHat patched pvmove and make it work wi=
th unpatched kernels...<BR>
<BR>
<BLOCKQUOTE>
<PRE>--- lib/pv_move.c	2003-07-11 19:10:26.000000000 -0300
+++ lib/pv_move.c.rcom	2003-07-11 19:09:35.000000000 -0300
@@ -916,7 +916,7 @@
 	ret =3D ioctl(group, PE_LOCKED_COPY, &amp;pe_copy_req);
 	if (ret &lt; 0)
 		ret =3D -errno;
-	if (ret =3D=3D -EINVAL)
+	if (ret =3D=3D -EINVAL || ret =3D=3D -ENOTTY)
 		ret =3D -LVM_EPV_LOCKED_COPY_EINVAL;
 =09
 	close(group);
</PRE>
</BLOCKQUOTE>
<BR>
<TABLE CELLSPACING=3D"0" CELLPADDING=3D"0" WIDTH=3D"100%">
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

</BODY>
</HTML>

--=-EgCdn84+nzd+4xSdeWCI--

--=-ZNdSyV98H1dBIRC5pLar
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Esta parte del mensaje =?ISO-8859-1?Q?est=E1?= firmada
	digitalmente

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA/DzZHmwwiUvOlMjQRAm8fAKDI9ym50Y4Xgbnoke0WoGpDOBWTnQCbB5jt
fSyfB/7DctaCKooIvR4XxlQ=
=7TPF
-----END PGP SIGNATURE-----

--=-ZNdSyV98H1dBIRC5pLar--
