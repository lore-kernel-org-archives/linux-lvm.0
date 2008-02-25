Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m1PGAs7i028101
	for <linux-lvm@redhat.com>; Mon, 25 Feb 2008 11:10:55 -0500
Received: from relais-inet.francetelecom.com (relais-ias91.francetelecom.com
	[193.251.215.91])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m1PGAJGO023576
	for <linux-lvm@redhat.com>; Mon, 25 Feb 2008 11:10:20 -0500
Received: from omfedm05.si.francetelecom.fr (unknown [xx.xx.xx.1])
	by omfedm10.si.francetelecom.fr (ESMTP service) with ESMTP id
	DE876680BF
	for <linux-lvm@redhat.com>; Mon, 25 Feb 2008 17:10:08 +0100 (CET)
Received: from fr-ces-dms4.domino.globalone.net (unknown [10.238.3.38])
	by omfedm05.si.francetelecom.fr (ESMTP service) with ESMTP id
	B5FFE6800F
	for <linux-lvm@redhat.com>; Mon, 25 Feb 2008 17:10:08 +0100 (CET)
MIME-Version: 1.0
Message-ID: <OFE8868DAD.F9BBE782-ONC12573FA.00583B8A-C12573FA.0058D16E@domino.globalone.net>
From: laurent.nicol@orange-ftgroup.com
Date: Mon, 25 Feb 2008 17:09:49 +0100
Content-Type: multipart/alternative;
	boundary="=_alternative 0058D16BC12573FA_="
Subject: [linux-lvm] Is it possible to split a mirrored logical volumes in
	two differents VG 
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a multipart message in MIME format.
--=_alternative 0058D16BC12573FA_=
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

        Hi,

        I try to split a mirrorred logical volume in two diff=E9rents=20
volumes groups either by using directly vgsplit or by using lvconvert. In=20
each cas i have problems.

        using vgsplit directly, (vgsplit myvg mynewvg /dev/sdd /dev/sde),=20
the mynewvg is not good and no Lv can be access on it.
        If i use lvconvert -m0 /dev/vgtest/myvg, then i get linear logical =

volume on /dev/sdb /dev/sdc and free PE on /dev/sdd /dev/sde.

        Is it possible to do it as we do on HpUx LVM ?

Cdlt / Regards,
Laurent NICOL
Orange Business Services
MHS Engineering&Tools - Server Management
BP80 rue de la Touche LAMBERT
35512 Cesson S=E9vign=E9 cedex FRANCE
Phone:             +33.2.23.28.62.52
Mobile Phone:     +33 6 08 99 45 70
http://www.equant.com


--=_alternative 0058D16BC12573FA_=
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable


<br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; Hi,</fon=
t>
<br>
<br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; I
try to split a mirrorred logical volume in two diff=E9rents volumes groups
either by using directly vgsplit or by using lvconvert. In each cas i have
problems.</font>
<br>
<br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; using
vgsplit directly, (vgsplit myvg mynewvg /dev/sdd /dev/sde), the mynewvg
is not good and no Lv can be access on it.</font>
<br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; If
i use lvconvert -m0 /dev/vgtest/myvg, then i get linear logical volume
on /dev/sdb /dev/sdc and free PE on /dev/sdd /dev/sde.</font>
<br>
<br><font size=3D2 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; Is
it possible to do it as we do on HpUx LVM ?</font>
<br><font size=3D2 face=3D"sans-serif"><br>
Cdlt / Regards,<br>
Laurent NICOL<br>
Orange Business Services<br>
MHS Engineering&amp;Tools - Server Management<br>
BP80 rue de la Touche LAMBERT<br>
35512 Cesson S=E9vign=E9 cedex FRANCE<br>
Phone: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; +33.2.23.28.62.52<br>
Mobile Phone: &nbsp; &nbsp; +33 6 08 99 45 70<br>
http://www.equant.com<br>
<br>
</font>
--=_alternative 0058D16BC12573FA_=--
