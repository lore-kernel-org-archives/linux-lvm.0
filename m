Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0O0PCO11833
	for <linux-lvm@redhat.com>; Sun, 23 Jan 2005 19:25:12 -0500
Received: from bluebottle-fe0.bluebottle.com (bluebottle-fe0.bluebottle.com
	[67.107.78.242])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0O0P6E2006320
	for <linux-lvm@redhat.com>; Sun, 23 Jan 2005 19:25:06 -0500
Date: Mon, 24 Jan 2005 00:26:32 +0000
From: Robin Green <greenrd@greenrd.org>
Subject: Re: [linux-lvm] Reducing/Resizing LVM where "/" filesystem is
	included in the LVM
Message-ID: <20050124002632.GA23702@pob>
References: <1106517355.26963.213384700@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline
In-Reply-To: <1106517355.26963.213384700@webmail.messagingengine.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 23, 2005 at 01:55:55PM -0800, fromkth+lvm@fastmail.fm wrote:
> Now I want to free some space from the linux LVM(hda6) and create a
> FAT32 partition as hda7.
>=20
> So how to reduce that LVM?

I suggest you use qtparted. Basically you need to:

1. Resize /
2. Move the swap volume back so it is adjacent to / (as it is swap, you cou=
ld just
run swapoff, delete the volume, and then recreate it.)
3. Reduce the physical volume size

I don't know if qtparted can do step 3 but it can do steps 1 and 2, I think.

> one more questions my /boot parition is /dev/hda5 but in fstab it shows
> it as LABEL=3D/boot
> so how is that?

/dev/hda5 contains a label called /boot. That means if you move /boot to a =
different
partition, you don't have to change your fstab, which is useful, but rarely.

However, if you ever insert another Linux-formatted hard drive in your syst=
em,
from a different computer, it can cause the OS to become very confused as i=
t cannot
determine which "/boot"-labelled partition to use! That is the disadvantage=
 of
partition labelling.

--=20
Robin

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQFB9EC4tPCt67UksSYRAqi4AJ9RsYefaHkvamU/JZvFG2OVkgheXwCgt6wE
VNySu5aj3fPDSOt+o5BmF14=
=wZj/
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
