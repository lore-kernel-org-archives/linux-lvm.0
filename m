Subject: Re: [linux-lvm] pvmove error
From: Juan Pablo =?ISO-8859-1?Q?Gim=E9nez?= <jpg@rcom.com.ar>
In-Reply-To: <sf12bd11.080@gwia201.syr.edu>
References: <sf12bd11.080@gwia201.syr.edu>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-5vfD6zcIEGxGFPGRt9G8"
Message-Id: <1058364567.4583.50.camel@hugo>
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
Date: Wed Jul 16 14:38:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com, sjfralic@syr.edu

--=-5vfD6zcIEGxGFPGRt9G8
Content-Type: multipart/alternative; boundary="=-3K1Gi9lP6+w4E3I/H20o"


--=-3K1Gi9lP6+w4E3I/H20o
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

El lun, 14-07-2003 a las 15:23, Stephen Fralich escribi=C3=B3:

> I'm running RedHat 9.  pvmove works fine with the LVM and kernel that com=
e with RH9.  I would like to use XFS in place of ext3 though, which means p=
atching the kernel.  I'm using the vanilla kernel 2.4.21 and lvm 1.0.7 (too=
ls and driver).  Everything goes fine until I use pvmove.  I haven't patche=
d the kernel for XFS yet, so the LVM patch is the only change to the kernel=
.   I'm using an IBM ServeRAID-4H card with the ips driver v6.00.31.  Any s=
uggestions?  Thanks.
>=20
> pvmove -- ERROR "Inappropriate ioctl for device" copying extent from "/de=
v/sdb"
>=20
> pvmove -- ERROR "Inappropriate ioctl for device" moving physical extents
>=20
> This appears on the console as well ::=20
> lvm -- lvm_chr_ioctl: unknown command 0x4004fe51


The pvmove you are using is the redhat patched. The redhat pvmove use a
ioctl call to move physical extends, ioctl(group, PE_LOCKED_COPY,
&pe_copy_req);. You could patch the kernel to implement that call or
install an unpatched pvmove.





Juan Pablo Gim=C3=A9nez=20

http://www.rcom.com.ar/
http://www.rcom.com.ar/comunidad/
Llave GnuPG:
MIT keyserver=20
Web Rcom=20

GnuPG fingerprint: ED97 6FB8 A9BE
26A6 789B 6657 0A15 EC2B D3D8 FD2B=20

http://www.greenpeace.org.ar/secciones/cyberactivismo/nuclear.php3

--=-3K1Gi9lP6+w4E3I/H20o
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; CHARSET=3DUTF-8">
  <META NAME=3D"GENERATOR" CONTENT=3D"GtkHTML/3.0.5">
</HEAD>
<BODY>
El lun, 14-07-2003 a las 15:23, Stephen Fralich escribi&#243;:
<BLOCKQUOTE TYPE=3DCITE>
<PRE><FONT COLOR=3D"#737373"><I>I'm running RedHat 9.  pvmove works fine wi=
th the LVM and kernel that come with RH9.  I would like to use XFS in place=
 of ext3 though, which means patching the kernel.  I'm using the vanilla ke=
rnel 2.4.21 and lvm 1.0.7 (tools and driver).  Everything goes fine until I=
 use pvmove.  I haven't patched the kernel for XFS yet, so the LVM patch is=
 the only change to the kernel.   I'm using an IBM ServeRAID-4H card with t=
he ips driver v6.00.31.  Any suggestions?  Thanks.

pvmove -- ERROR &quot;Inappropriate ioctl for device&quot; copying extent f=
rom &quot;/dev/sdb&quot;

pvmove -- ERROR &quot;Inappropriate ioctl for device&quot; moving physical =
extents

This appears on the console as well ::=20
lvm -- lvm_chr_ioctl: unknown command 0x4004fe51</I></FONT></PRE>
</BLOCKQUOTE>
<BR>
The pvmove you are using is the redhat patched. The redhat pvmove use a ioc=
tl call to move physical extends, ioctl(group, PE_LOCKED_COPY, &amp;pe_copy=
_req);. You could patch the kernel to implement that call or install an unp=
atched pvmove.<BR>
<BR>
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

--=-3K1Gi9lP6+w4E3I/H20o--

--=-5vfD6zcIEGxGFPGRt9G8
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Esta parte del mensaje =?ISO-8859-1?Q?est=E1?= firmada
	digitalmente

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA/FVyXmwwiUvOlMjQRAnE5AJ94d3NglVVtxH0ZoL2fripYRc0nvgCeL/CK
o3qnlNVngnqRZEVHi/Dqkbg=
=RjHn
-----END PGP SIGNATURE-----

--=-5vfD6zcIEGxGFPGRt9G8--
