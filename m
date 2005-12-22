Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBMLXJ108738
	for <linux-lvm@redhat.com>; Thu, 22 Dec 2005 16:33:19 -0500
Received: from strugglers.net (strugglers.net [212.13.198.70])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBMLX7SO002427
	for <linux-lvm@redhat.com>; Thu, 22 Dec 2005 16:33:13 -0500
Received: from andy by strugglers.net with local (Exim 4.50)
	id 1EpY3Z-0001D5-Rx
	for linux-lvm@redhat.com; Thu, 22 Dec 2005 21:33:02 +0000
Date: Thu, 22 Dec 2005 21:33:01 +0000
From: Andy Smith <andy@strugglers.net>
Message-ID: <20051222213301.GA10278@strugglers.net>
References: <20051222131023.2E6280035DF3@relay.vip.sohu.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Xc/daCAYeCLA4DS1"
Content-Disposition: inline
In-Reply-To: <20051222131023.2E6280035DF3@relay.vip.sohu.com>
Subject: Re: [linux-lvm] a question about lvm in linux
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


--Xc/daCAYeCLA4DS1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 22, 2005 at 09:10:12PM +0800, alexli wrote:
>    Hello ,I am a linux user, because I am a Chinese ,so my English is not
>    good ,please forgive me for language mistake. after I used the command
>    ----- lvextend ,I find that the logical volumn space is changed .but
>    after I mount it to the file  system , and use the df command to see
>    the filesystem, I find that the space of the file system is not
>    changed .

You've extended the logical volume but not the filesystem on it.
You now need to use filesystem-specific toold to extend that too.
For example, resize2fs for ext2 and ext3.

--Xc/daCAYeCLA4DS1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFDqxuNIJm2TL8VSQsRAm+wAJ9c2FZqw/9dqVjlAlIFw1v/UKngcACg2L71
N3RV7fsR3p51L25q+cKxLb4=
=hJrQ
-----END PGP SIGNATURE-----

--Xc/daCAYeCLA4DS1--
