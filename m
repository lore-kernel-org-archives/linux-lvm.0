Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0AFwmr20866
	for <linux-lvm@redhat.com>; Mon, 10 Jan 2005 10:58:48 -0500
Received: from zippy.toger.us (zippy.toger.us [65.19.178.247])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0AFwg3c000648
	for <linux-lvm@redhat.com>; Mon, 10 Jan 2005 10:58:42 -0500
Date: Mon, 10 Jan 2005 07:58:35 -0800
Subject: Re: [linux-lvm] she-bang doesn't work - bad interpreter: Permission
	denied
Message-ID: <20050110155835.GU1816@zippy.toger.us>
References: <20050109202833.GT1816@zippy.toger.us>
	<20050110125840.55588.qmail@web52707.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YgseLHR9uOh11QTZ"
Content-Disposition: inline
In-Reply-To: <20050110125840.55588.qmail@web52707.mail.yahoo.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>


--YgseLHR9uOh11QTZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 10, 2005 at 04:58:40AM -0800, Patrick Bartkus wrote:
> Jason,
> [Very embarrassed sheepish grin]
> Well, as a matter of fact, it was...
> Thanks! That fixed everything.
I've always thought that the error message generated in that
situation wasn't very helpful. I've hit that a lot with things
stored in /tmp, whomever sees it always goes off on a wild goose
chase checking why perl or sh isn't working.

-Jason Martin
--=20
This message is PGP/MIME signed.

--YgseLHR9uOh11QTZ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: --no-verbose

iD8DBQFB4qYrl2ODWuqVSBMRAtbsAJ47hxEh//ni5oR8CzWw3P9WDeDWfgCeLu/Y
fXFlRiRsJkBw+CkEXu1VrqI=
=ABVe
-----END PGP SIGNATURE-----

--YgseLHR9uOh11QTZ--
