Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k358n4uO028825
	for <linux-lvm@redhat.com>; Wed, 5 Apr 2006 04:49:04 -0400
Received: from fs.bj-ig.de (tower.bj-ig.de [194.127.182.2])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k358n3FV030130
	for <linux-lvm@redhat.com>; Wed, 5 Apr 2006 04:49:03 -0400
Received: from localhost (localhost [127.0.0.1])
	by fs.bj-ig.de (Postfix) with ESMTP id A70238517
	for <linux-lvm@redhat.com>; Wed,  5 Apr 2006 10:49:02 +0200 (CEST)
Received: from fs.bj-ig.de ([127.0.0.1])
	by localhost (fs [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 27762-06 for <linux-lvm@redhat.com>;
	Wed,  5 Apr 2006 10:48:59 +0200 (CEST)
Received: from ralf.bj-ig.de (ralf.bj-ig.de [192.168.182.13])
	by fs.bj-ig.de (Postfix) with ESMTP id A122588AB
	for <linux-lvm@redhat.com>; Wed,  5 Apr 2006 10:48:59 +0200 (CEST)
From: Ralf =?iso-8859-1?q?M=FCller?= <ralf@bj-ig.de>
Subject: Re: [linux-lvm] pvmove on a root partition
Date: Wed, 5 Apr 2006 10:48:54 +0200
References: <BAY102-F8BC0F278803728236BD67EFCA0@phx.gbl>
In-Reply-To: <BAY102-F8BC0F278803728236BD67EFCA0@phx.gbl>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1750922.x9CVf6o94l";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200604051048.59100@bj-ig.de>
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

--nextPart1750922.x9CVf6o94l
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tuesday 04 April 2006 20:58, Christopher Probst wrote:

> pvmove /dev/hdb1 /dev/hdb2 where /dev/hdb1 is mounted on "/"
>
> makes my system unuseable. I can't log into my machine even in a text
> console. Has anybody tried this before?

Yes - about a year before. And I failed. After asking I have been told=20
there is some locking problem somewhere and there have to be major=20
changes before this would work - if I remember correctly. The answer=20
gave not the impression that this is rated a high priority problem.

Regards
Ralf

=2D-=20
Van Roy's Law: -------------------------------------------------------
       An unbreakable toy is useful for breaking other toys.

--nextPart1750922.x9CVf6o94l
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBEM4R7ZcF+4X5mWz8RAotxAKCFPw96AqXJpJiVYvckiR1ojtiI3wCfYDc1
t9/rQzt9KcpAH41jFwhcG2g=
=TcFD
-----END PGP SIGNATURE-----

--nextPart1750922.x9CVf6o94l--
