Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1GJJWO20962
	for <linux-lvm@redhat.com>; Wed, 16 Feb 2005 14:19:32 -0500
Received: from zippy.toger.us (zippy.toger.us [65.19.178.247])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j1GJJQF7002752
	for <linux-lvm@redhat.com>; Wed, 16 Feb 2005 14:19:27 -0500
Date: Wed, 16 Feb 2005 11:19:23 -0800
Subject: Re: [linux-lvm] vgscan changing/resetting perms?
Message-ID: <20050216191923.GD12420@zippy.toger.us>
References: <421392D6.4070405@avondalenetworks.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YToU2i3Vx8H2dn7O"
Content-Disposition: inline
In-Reply-To: <421392D6.4070405@avondalenetworks.com>
From: Jason Martin <jhmartin@toger.us>
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


--YToU2i3Vx8H2dn7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 16, 2005 at 01:37:10PM -0500, Jeff Bethke wrote:
> Then I go ahead and reboot the host or someone comes along and runs a=20
> vgscan.  VOILA!  The perms for those files reset to root:root.   How do=
=20
> I prevent that from happeneing?  I want it so that I can make a device=20
> and set its perms to some user, and forget about it.   Is that even=20
> possible? If so, how? Or, what am I doing wrong in setting up the lv/vg's?
One generally doesn't let non-root users have direct access to
devices. Instead you should format and mount the filesystems on
those drives and give users access to that.

-JM
--=20
Keep London tidy... Shoot a pigeon.
This message is PGP/MIME signed.

--YToU2i3Vx8H2dn7O
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: --no-verbose

iD8DBQFCE5y7l2ODWuqVSBMRAmWZAJ9m6spVdeM/CldWAQliboiXOJy9VQCeOGcY
iaONm2N+5FadBu0eN6lcZ/g=
=FfHm
-----END PGP SIGNATURE-----

--YToU2i3Vx8H2dn7O--
