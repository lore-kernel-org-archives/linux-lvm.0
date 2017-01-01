Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v01EOJYk011840
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Sun, 1 Jan 2017 09:24:19 -0500
Received: from mail.reox.at (mail.reox.at [88.198.22.87])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 774BAC04B93B
	for <linux-lvm@redhat.com>; Sun,  1 Jan 2017 14:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.reox.at (Postfix) with ESMTP id 5836058CDD0
	for <linux-lvm@redhat.com>; Sun,  1 Jan 2017 15:15:17 +0100 (CET)
Received: from mail.reox.at ([127.0.0.1])
	by localhost (mail.reox.at [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e4xl-br7Ps6E for <linux-lvm@redhat.com>;
	Sun,  1 Jan 2017 15:15:16 +0100 (CET)
Received: from cebalrai (93-82-3-45.adsl.highway.telekom.at [93.82.3.45])
	by mail.reox.at (Postfix) with ESMTPSA id 6298858CDCE
	for <linux-lvm@redhat.com>; Sun,  1 Jan 2017 15:15:16 +0100 (CET)
Date: Sun, 1 Jan 2017 15:15:14 +0100
From: Sebastian Bachmann <me@free-minds.net>
Message-ID: <20170101141514.jnazw5dd4kfpcip4@cebalrai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="76yj7wzi3uforri6"
Content-Disposition: inline
Subject: [linux-lvm] Change stripe cache for lvm raid5
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


--76yj7wzi3uforri6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!
I'm using a LVM RAID5 on a machine but the write performance is pretty poor
(about 20-30MB/s),
where the read performance is quite good (about 280MB/s).
I read about the stripe_cache_size for md raid and as far as I understand LVM
raid, it uses md as well.
In the design document for lvm2-raid
(https://git.fedorahosted.org/cgit/lvm2.git/tree/doc/lvm2-raid.txt) I can find
that a option --stripecache is specified there, but as it seems those options
were never implemented.

Is it possible to set the stripe cache size somewhere else? It seems to me that
lvm2 uses dmsetup to create the raid, where a stripe cache can be set while
creation. But it seems to me there is no interface to change such values
later on?

Thanks in advance!

regards
Sebastian

--76yj7wzi3uforri6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEZFa7XEAmJF3nZlHUb9vYxvk7X4sFAlhpDu8ACgkQb9vYxvk7
X4uC3Q//Se8E/NnZr20MVLeG1Y4WAK/Xk9kiA2gUW5+SsgqxeekOgFyDqidp0r4N
3b8n9guP7TLBCChIovcNyTQ0iaL2aOcdjaXVDxrPnNqY7IukFQ+BNaMQkfagpfMR
Zo5JIr9mgbAK8ATo/l1TgntH/flsZ8bhw85Jjl9bBSzIgRuvFklPB79Uob6yBDRY
f13iz7dCVtWydoG0ismzRA6Q5RJFv9EcTKTCiSSLHAntb3ky5OCLntQuLrqJmwHs
p+LF/XZ6FjVeNZ6ggTTtXDUkpcrgMzpG+s1dkP/kKhqLSSdTbFqdwKVyDgVdnoBg
oeaFOtseYTgy2+hX1eZq2FRAvBfp48dR7k5Bqn91j2J67G1QnLfSW1aoqNriAko6
3muPTVtAeQjzOcadlEKZc1sX6hhV4lvUK6NPopDnUWIOMwMFRpE76ukFbUKz1Eoq
wBE5t2zPg7XScattEo+3mLOYX7SALGmXuD+Tg+3a41RuJtZCP2Obm3lvIRLu/GXR
Ag/GTLrz0sP9SPEdm1f4z0CJo/ddUo1WV0FcIdPiPyl9KHAZEWarf0L17/tuP/nu
NgcVEdc/p8XOOZfe7bvLy7iL5V9uYBg3IJR64/QbJE6sKAm1VmRktf5saYCuTldA
VhVgiELVZD8cuKma65qLlRFYyPPxkoUSs7S+/MjqnB6LqdJwxI0=
=baAb
-----END PGP SIGNATURE-----

--76yj7wzi3uforri6--
