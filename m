Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6N2SaV23879
	for <linux-lvm@redhat.com>; Fri, 22 Jul 2005 22:28:36 -0400
Received: from strugglers.net (strugglers.net [212.13.198.70])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j6N2SXxL004968
	for <linux-lvm@redhat.com>; Fri, 22 Jul 2005 22:28:33 -0400
Received: from andy by strugglers.net with local (Exim 4.50)
	id 1Dw9kV-0000en-7x
	for linux-lvm@redhat.com; Sat, 23 Jul 2005 02:28:23 +0000
Date: Sat, 23 Jul 2005 02:28:23 +0000
From: Andy Smith <andy@strugglers.net>
Message-ID: <20050723022823.GZ8874@strugglers.net>
References: <20050721143622.GC8874@strugglers.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IPdQykuREcSDvnYD"
Content-Disposition: inline
In-Reply-To: <20050721143622.GC8874@strugglers.net>
Subject: Re: [linux-lvm] Unusable LV, how to unlock it?
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


--IPdQykuREcSDvnYD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2005 at 02:36:22PM +0000, Andy Smith wrote:
> I believe the "stuck" LV is /dev/mapper/mainvg-adminroot.
>=20
> Anyone have any suggestions how I can get use of this LV again
> without rebooting?  Here is the output from "dmsetup info -c":

OK, so after removing a lock file I can run lvs again:

$ sudo lvs -v mainvg/adminroot
    Finding all logical volumes
  LV                VG     #Seg Attr   LSize   Maj Min KMaj KMin Origin Sna=
p%  Move Copy%  LV UUID                           =20
  admindata         mainvg    1 -wi-a-   5.86G  -1  -1 254  42             =
                cCHdlP-bllQ-Nt50-aJAN-hLrq-bjUk-K7jCsP
  adminroot         mainvg    1 -wi-ao 500.00M  -1  -1 254  38             =
                CjHGy8-QpGK-oH35-P5U5-8Di1-NKeY-speIR2
  adminswap         mainvg    1 -wi-a- 256.00M  -1  -1 254  43             =
                8Q2Z20-jIew-K2Vd-t47K-n4IO-6KBI-28PIAm

LV 'adminroot' is not mounted anywhere, yet it is marked as open.
Any time I do try to mount it, the mount process gets stuck in stat
D+.  Neither lvs nor dmsetup info show any snapshots of this LV.
lvchange gives the following:

$ sudo lvchange -v --refresh mainvg/adminroot
    Using logical volume(s) on command line
    Refreshing logical volume "adminroot" (if active)
    Found volume group "mainvg"
  device-mapper ioctl cmd 6 failed: Invalid argument
  Couldn't suspend device 'mainvg-adminroot'

I've scheduled a reboot in about 4 hours anyway.

Thanks,
Andy

--IPdQykuREcSDvnYD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFC4atHIJm2TL8VSQsRArUSAKD+vMgvhkHDWAIlZU4WZkF6ARrYOACgiZev
GlSBngqqv9GExVBq1dKlpgE=
=loHi
-----END PGP SIGNATURE-----

--IPdQykuREcSDvnYD--
