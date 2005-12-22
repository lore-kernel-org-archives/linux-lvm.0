Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBMAac119181
	for <linux-lvm@redhat.com>; Thu, 22 Dec 2005 05:36:38 -0500
Received: from strugglers.net (strugglers.net [212.13.198.70])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jBMAab7V027102
	for <linux-lvm@redhat.com>; Thu, 22 Dec 2005 05:36:37 -0500
Received: from andy by strugglers.net with local (Exim 4.50)
	id 1EpNoF-0000Jy-Sk
	for linux-lvm@redhat.com; Thu, 22 Dec 2005 10:36:32 +0000
Date: Thu, 22 Dec 2005 10:36:31 +0000
From: Andy Smith <andy@strugglers.net>
Message-ID: <20051222103631.GJ10278@strugglers.net>
References: <1135190468.1122.394.camel@seki.nac.uci.edu>
	<20051222072735.85108.qmail@web36208.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ua8iSVM1QPEF/ktp"
Content-Disposition: inline
In-Reply-To: <20051222072735.85108.qmail@web36208.mail.mud.yahoo.com>
Subject: Re: [linux-lvm] Recovery of data in LVM from a corrupt disk
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


--Ua8iSVM1QPEF/ktp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 21, 2005 at 11:27:35PM -0800, Hale India wrote:
>    What I was talking about is a problem for recovery specific to LVM :
>    If you machine crash, (not your disk) with ext2, ext3, reiserfs, JFS
>    you can put your disk in any other machine as second or third disk
>    etc.. and access your data's.

If my machines crash often enough that I am regularly juggling disks
I consider this a problem beyond the scope of LVM (unless they're
crashing in LVM).

Anytime I *have* had to move LVM setups to other machines I have had
no issues.

I'm confused why you continually compare LVM to various filesystems
when it isn't a filesystem.  It has different challenges and use
cases.

>    I consider that a good disk system should allow to get back data if
>    disk is good working. Not only if the whole machine is good working.
>    If any people has a good solution they are welcome and I would
>    appologize.

If you could go into more detail regarding incidents where you have
lost data on otherwise working disks then perhaps you could get more
help.

--Ua8iSVM1QPEF/ktp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFDqoGvIJm2TL8VSQsRAuKtAKC5f7MziNFfr4JbO+H0GVwjexbKbQCfYvyD
MsCT0lcxqpLsVrl6JKnej+8=
=zNyS
-----END PGP SIGNATURE-----

--Ua8iSVM1QPEF/ktp--
