From: Rene Schumann <Rene@athome.dyndns.org>
Content-Type: multipart/signed; micalg=pgp-sha1;
    protocol="application/pgp-signature";
    boundary="=-/jZsU5he6lew3V9Up3pN"
Message-Id: <1011645757.7846.12.camel@desktop.athome.dyndns.org>
MIME-Version: 1.0
Subject: [linux-lvm] Partitions on same Drive
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
Date: Mon Jan 21 14:42:02 2002
List-Id: <linux-lvm.redhat.com>
To: "linux-lvm@sistina.com" <linux-lvm@sistina.com>

--=-/jZsU5he6lew3V9Up3pN
Content-Type: multipart/alternative; boundary="=-6+p6oRH0RNZTTEMW/3Zd"


--=-6+p6oRH0RNZTTEMW/3Zd
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable



Hello!

I have a Problem and hope someone here can help me.
I have 2 Partitions on a drive.

[root@desktop root]# fdisk -l /dev/sdb

Festplatte /dev/sdb: 255 K=F6pfe, 63 Sektoren, 9730 Zylinder
Einheiten: Zylinder mit 16065 * 512 Bytes

    Ger=E4t Booten  Anfang      Ende   Bl=F6cke   ID  Dateisystemtyp
/dev/sdb1             1      4462  35840983+   c  Win95 FAT32 (LBA)
/dev/sdb2          4463      9730  42315210   8e  Linux LVM

I want to delete sdb1 vfat partition and use it as LVM space.
If i do a "pvcreate vg01 /dev/sdb1" it is ugly for performance because
there are 2 LVM Partions at one drive.
right?
If i do lvm partition on sdb1 and do a pvmove,
Can i resize sdb1 to fit the whole drive and after that lvm use this
full space?=20

thx you
mfg
Rene

--=-6+p6oRH0RNZTTEMW/3Zd
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; CHARSET=3DUTF-8">
  <META NAME=3D"GENERATOR" CONTENT=3D"GtkHTML/1.0.0">
</HEAD>
<BODY>

<BR>

<BR>
Hello!
<BR>

<BR>
I have a Problem and hope someone here can help me.
<BR>
I have 2 Partitions on a drive.
<BR>

<BR>
[root@desktop root]# fdisk -l /dev/sdb
<BR>

<BR>
Festplatte /dev/sdb: 255 K&#246;pfe, 63 Sektoren, 9730 Zylinder
<BR>
Einheiten: Zylinder mit 16065 * 512 Bytes
<BR>

<BR>
&nbsp;&nbsp;&nbsp; Ger&#228;t Booten&nbsp; Anfang&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; Ende&nbsp;&nbsp; Bl&#246;cke&nbsp;&nbsp; ID&nbsp; Dateisystemtyp
<BR>
/dev/sdb1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4462&nbsp; 35840983+&nbsp;&nbsp; c&n=
bsp; Win95 FAT32 (LBA)
<BR>
/dev/sdb2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4463&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 9730&nbsp; 42315210&nbsp;&nbsp; 8e&nbsp; Linux LVM
<BR>

<BR>
I want to delete sdb1 vfat partition and use it as LVM space.
<BR>
If i do a &quot;pvcreate vg01 /dev/sdb1&quot; it is ugly for performance be=
cause there are 2 LVM Partions at one drive.
<BR>
right?
<BR>
If i do lvm partition on sdb1 and do a pvmove,
<BR>
Can i resize sdb1 to fit the whole drive and after that lvm use this full s=
pace?=20
<BR>

<BR>
thx you
<BR>
mfg
<BR>
Rene
</BODY>
</HTML>

--=-6+p6oRH0RNZTTEMW/3Zd--

--=-/jZsU5he6lew3V9Up3pN
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: Weitere Infos: siehe http://www.gnupg.org

iD8DBQA8TH098DAU7YSZUNERAvsyAJ9WFlVnkfPjsGFzN+RUzp0aEV7LawCfbS66
M1J6/lCdlo4x7NfspUKZRDQ=
=wmWX
-----END PGP SIGNATURE-----

--=-/jZsU5he6lew3V9Up3pN--
