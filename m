Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5CK3i9o010243
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 12 Jun 2015 16:03:44 -0400
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mx1.redhat.com (Postfix) with ESMTPS id 56BD72EB679
	for <linux-lvm@redhat.com>; Fri, 12 Jun 2015 20:03:43 +0000 (UTC)
Received: by wgzl5 with SMTP id l5so6021384wgz.3
	for <linux-lvm@redhat.com>; Fri, 12 Jun 2015 13:03:42 -0700 (PDT)
Received: from ?IPv6:2001:a60:f000:de::2? (cl-223.muc-02.de.sixxs.net.
	[2001:a60:f000:de::2])
	by mx.google.com with ESMTPSA id n1sm4183252wix.0.2015.06.12.13.03.40
	for <linux-lvm@redhat.com>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Jun 2015 13:03:40 -0700 (PDT)
Message-ID: <557B3B0E.4050009@gmail.com>
Date: Fri, 12 Jun 2015 22:03:26 +0200
From: Klaus Lichtenwalder <lichtenwalder@gmail.com>
MIME-Version: 1.0
References: <20150530054508.Horde.UHD8nrE6gSp5bNvnIOGDQA5@webmail.df.eu>
In-Reply-To: <20150530054508.Horde.UHD8nrE6gSp5bNvnIOGDQA5@webmail.df.eu>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="0BVPSRWSVlvGhBI82fCSVi6IDOVfO1HRS"
Subject: Re: [linux-lvm] LVM problem: Unable to mount encrypted Luks HDs
 after reinstalling Ubuntu; Error: unknown filesystem type 'LVM2_member'
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0BVPSRWSVlvGhBI82fCSVi6IDOVfO1HRS
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 30.05.2015 um 05:45 schrieb st@ateneto.com:
> Hallo,
>=20
> thank you very much for anyone taking the time to read this.
>=20
> I am using a Thinkpad Edge E145 with Ubuntu 14.04 installed.
> I have recently reinstalled Ubuntu to a new HD. This installation is
> LUKS encrypted LVM and works without problems.
>=20
> My old installation on a LVM Luks encrypted drive would no longer start=
 up.
> I had deleted old kernels. Maybe the problems are related to that.
> ...
> sog@sog-workstation:~$ sudo mount /dev/mapper/encrypted
> /media/encryptedmount: unknown filesystem type 'LVM2_member'
> sog@sog-workstation:~$
>=20

Hi,

this looks like there's a vg and/or a lv in your encrypted partition also=
=2E

You might check with pvscan, vgscan, lvscan, whether there's anything of
interest.

Because "unknown filesystem type "LVM2_member"" seems to imply this is a
LV instead of a "pure" filesystem.

Klaus
--=20
------------------------------------------------------------------------
 Klaus Lichtenwalder, Dipl. Inform.,  http://www.lichtenwalder.name/
 PGP Key fingerprint: 0CF4 4A47 355A DD36 65B3  56F3 2696 79B2 7F3D 1020


--0BVPSRWSVlvGhBI82fCSVi6IDOVfO1HRS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCgAGBQJVezsUAAoJECaWebJ/PRAgXbsP/Rexh0zLnnfoU9AKT4misBE6
l9UK1ZGRMT+rHTsceSnEC8KzZi/srOoRgiTv0FZEDQNltPrDd+AwR7k4toE5rFHZ
GNpITS4wdTtStF0Vi1TfFzE5pRMr4ruyfY/gj9bsXlwjTQQ8v8+Rwg8Wwaayg8UN
6tEOv8/tLKFKLJ4WJNF40MKRc2sqY6gNxg+XxU6Xfws6BYykV8OsTL4PERe1j8hI
A66kTOsktSk2vRhjzJI3IIt2RuwxfJIHBnQ+CTClgnvEET5BhSpiSgpq6g52HcpR
JnCyUfhbHfnyKIWRWWc/SktkDvkMRFHlfka06IYdyq7DOkCB8x4K8cbPujyjAM26
s8dPydLtX7FEbfYPfWZ0Y3T2UQfUcJaHIlpm7z6zxWnaLEcjR7ARrNW4MzK/xo+Z
tDFE7tyIOMx+HnpAJJUDs1FB33EMenbwHXoYWsTgJNXM7SezOWD+rqCwx9sDTcXc
Z5mBxcNMRVh9gKgnuym6AiiNmbS2S8fiFvA0QcY+op1AFLc5YAsyKlmQfQyTeRmz
w/Vh7ALRVa5ivqdQNAb0tp+txcRvMdVREZdp0+4oS6NCiXUERof/Io+FkcLj0H/k
Os3gVaNDvMH0zPmGTM3EJMizXjT4RBmJ57TSbiikCm6o0wlAg7nN6uh6+BqBsqVN
gRQ1g28ABx8ulItKGL4L
=MBnt
-----END PGP SIGNATURE-----

--0BVPSRWSVlvGhBI82fCSVi6IDOVfO1HRS--
