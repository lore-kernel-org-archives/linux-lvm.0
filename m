Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i66Kks022578
	for <linux-lvm@redhat.com>; Tue, 6 Jul 2004 16:46:54 -0400
Received: from chaos.ao.net (root@chaos.ao.net [208.5.40.6])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i66KkmXn022579
	for <linux-lvm@redhat.com>; Tue, 6 Jul 2004 16:46:48 -0400
Received: from chaos.ao.net (harik@localhost [127.0.0.1])
	by chaos.ao.net (8.12.9/8.12.9/Debian-5) with ESMTP id i66KkluE001834
	for <linux-lvm@redhat.com>; Tue, 6 Jul 2004 16:46:47 -0400
Received: (from harik@localhost)
	by chaos.ao.net (8.12.9/8.12.9/Debian-5) id i66KklXf001833
	for linux-lvm@redhat.com; Tue, 6 Jul 2004 16:46:47 -0400
Date: Tue, 6 Jul 2004 16:46:47 -0400
From: Dan Merillat <dmerillat@sequiam.com>
Subject: Re: [linux-lvm] dm kernel patch size
Message-ID: <20040706204647.GC1506@chaos.ao.net>
References: <20040706191502.GL11597@polop.usc.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline
In-Reply-To: <20040706191502.GL11597@polop.usc.edu>
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


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, 06 Jul 2004, Garrick Staples wrote:

> Can someone comment on the size of the dm kernel patches?  They seem to be far
> too large and patch far more than just dm.  It appears that they patch between
> different kernel versions.

Last I checked they include the andrew morton -mm patchset as well.

--Dan

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----

iD8DBQFA6w+2kycScExRgsgRApEDAJ9CD0xg3RPMrOSOKcPBtAUBzaCz/wCfZ1vt
iHeRCjswR0FX4ArM9T3jJH0=
=RxLM
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
