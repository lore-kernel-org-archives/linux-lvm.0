Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i57FcK009508
	for <linux-lvm@redhat.com>; Mon, 7 Jun 2004 11:38:20 -0400
Received: from eclectic.kluge.net (eclectic.kluge.net [66.92.69.221])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i57FcEXn006985
	for <linux-lvm@redhat.com>; Mon, 7 Jun 2004 11:38:14 -0400
Date: Mon, 7 Jun 2004 11:38:09 -0400
From: Theo Van Dinter <felicity@kluge.net>
Subject: Re: [linux-lvm] software raid or lvm?
Message-ID: <20040607153809.GM31405@kluge.net>
References: <40C48905.80608@blocked.name>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RLVVO53zhS75EYih"
Content-Disposition: inline
In-Reply-To: <40C48905.80608@blocked.name>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>


--RLVVO53zhS75EYih
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 07, 2004 at 05:25:57PM +0200, philip wrote:
> like to install suse91, which doesn't support siimage chipset, so i've to=
=20
> use software raid or lvm.
> what would be better/faster?

Well, what are you trying to do?  If you want redundancy, go with RAID.
If you want volume management, go with LVM.  I'd say you should do both
(RAID the disks then use LVM on top), but without more data there is no
answer for "better/faster".

--=20
Randomly Generated Tagline:
Why is there a file in the /usr/include/unused directory?

--RLVVO53zhS75EYih
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFAxIvh7tgKAJaXVyoRAp2UAKC07r9l7y6LZWQgwLdDH3vLI9wceQCaAwW3
TSX0UnbFJvqkXmHwYstKCLc=
=wvKV
-----END PGP SIGNATURE-----

--RLVVO53zhS75EYih--
