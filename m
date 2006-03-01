Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k21D3e131196
	for <linux-lvm@redhat.com>; Wed, 1 Mar 2006 08:03:40 -0500
Received: from mail.telecyl.com (www.comarcasdeinterior.com [212.22.34.136])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k21D3cB5014939
	for <linux-lvm@redhat.com>; Wed, 1 Mar 2006 08:03:39 -0500
Message-ID: <44059BAB.6020307@telecyl.com>
Date: Wed, 01 Mar 2006 14:03:39 +0100
From: Alejandro Alfonso <alejandro.alfonso@telecyl.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="------------020301080607090801050604"
Subject: [linux-lvm] Create a Logical volume with 100% of Volume groups size?
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

This is a multi-part message in MIME format.
--------------020301080607090801050604
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi everybody!

we only want to use LVM with one Logical volume, and want to use the
100% of available space.
is there any way to create it? Look:

acrol ~ # vgdisplay
  --- Volume group ---
  VG Name               mirror
[...]
  VG Size               232.88 GB
  PE Size               32.00 MB
  Total PE              7452
  Alloc PE / Size       7452 / 232.88 GB
  Free  PE / Size       0 / 0
[...]

acrol ~ # lvcreate -L232.88G -nlv00 mirrorPoe
  Rounding up size to full physical extent 232.91 GB
  Insufficient free extents (7452) in volume group mirrorPoe: 7453 required

How to use all the 7452 PE? Thanks in advance

Best regards!
--=20
------------------------------------------------------------------------
=20
*       Alejandro Alfonso Fern=EF=BF=BDndez
      Dpto de Sistemas. =EF=BF=BDrea Corporativa *
alejandro.alfonso@telecyl.com <mailto:alejandro.alfonso@telecyl.com>
http://www.telecyl.com/
=20
Proci=EF=BF=BDn 7, Portales 1-2 Edificio Am=EF=BF=BDrica II
28023 Madrid
Tfn: 91 452 18 00 - Fax: 91 452 18 08 	Juan Garc=EF=BF=BDa Hortelano, 43
Edificio Telecyl
47014 Valladolid
Tfn: 983 428 200 - Fax: 983 428 223

------------------------------------------------------------------------

--------------020301080607090801050604
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
</head>
<body bgcolor="#ffffff" text="#333333">
<font size="-1"><font face="Trebuchet MS">Hi everybody!<br>
<br>
we only want to use LVM with one Logical volume, and want to use the
100% of available space.<br>
is there any way to create it? Look:<br>
<br>
acrol ~ # vgdisplay<br>
&nbsp; --- Volume group ---<br>
&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mirror<br>
[...]<br>
&nbsp; VG Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 232.88 GB<br>
&nbsp; PE Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 32.00 MB<br>
&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7452<br>
&nbsp; Alloc PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7452 / 232.88 GB<br>
&nbsp; Free&nbsp; PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 / 0<br>
</font></font><font size="-1"><font face="Trebuchet MS">[...]</font></font><br>
<font size="-1"><font face="Trebuchet MS"><br>
acrol ~ # lvcreate -L232.88G -nlv00 mirrorPoe<br>
&nbsp; Rounding up size to full physical extent 232.91 GB<br>
&nbsp; Insufficient free extents (7452) in volume group mirrorPoe: 7453
required<br>
<br>
How to use all the </font></font><font size="-1"><font
 face="Trebuchet MS">7452 PE? </font></font><font size="-1"><font
 face="Trebuchet MS">Thanks in advance<br>
<br>
Best regards!<br>
</font></font>
<div class="moz-signature">-- <br>
<hr>
<table>
  <tbody>
    <tr>
      <td style="font-size: 10px;">&nbsp;</td>
    </tr>
    <tr>
      <td style="font-size: 12px; font-family: Trebuchet MS;"
 width="50%"> <b> &nbsp; &nbsp; &nbsp; Alejandro Alfonso Fern&aacute;ndez <br>
&nbsp; &nbsp; &nbsp; Dpto de Sistemas. &Aacute;rea Corporativa </b>
      </td>
      <td style="font-size: 12px; font-family: Trebuchet MS;"
 width="50%"> <a href="mailto:alejandro.alfonso@telecyl.com">alejandro.alfonso@telecyl.com</a>
      <br>
      <a href="http://www.telecyl.com/">http://www.telecyl.com/</a>
      </td>
    </tr>
    <tr>
      <td style="font-size: 10px;">&nbsp;</td>
    </tr>
    <tr>
      <td style="font-size: 12px; font-family: Trebuchet MS;"
 width="50%"> Proci&oacute;n 7, Portales 1-2 Edificio Am&eacute;rica II <br>
28023 Madrid <br>
Tfn: 91 452 18 00 - Fax: 91 452 18 08
      </td>
      <td style="font-size: 12px; font-family: Trebuchet MS;"
 width="50%"> Juan Garc&iacute;a Hortelano, 43 Edificio Telecyl <br>
47014 Valladolid <br>
Tfn: 983 428 200 - Fax: 983 428 223
      </td>
    </tr>
  </tbody>
</table>
<hr>
</div>
</body>
</html>

--------------020301080607090801050604--
