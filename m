Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8EKGVr04068
	for <linux-lvm@redhat.com>; Tue, 14 Sep 2004 16:16:31 -0400
Received: from copilotconsulting.com (ip-66-181-5-46.cust.i2bnetworks.com
	[66.181.5.46])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8EKGVA9026908
	for <linux-lvm@redhat.com>; Tue, 14 Sep 2004 16:16:31 -0400
Received: from localhost (copilotconsulting.com [127.0.0.1])
	by copilotconsulting.com (Postfix) with ESMTP id A4699A902F
	for <linux-lvm@redhat.com>; Tue, 14 Sep 2004 13:06:25 -0700 (PDT)
Received: from copilotconsulting.com ([127.0.0.1])
	by localhost (copilotconsulting.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 32649-08 for <linux-lvm@redhat.com>;
	Tue, 14 Sep 2004 13:06:24 -0700 (PDT)
Date: Tue, 14 Sep 2004 13:06:24 -0700
From: Tracy R Reed <treed@copilotconsulting.com>
Subject: Re: [linux-lvm] massive LV corruption
Message-ID: <20040914200624.GE13649@copilotconsulting.com>
References: <20040914124540.GA13649@copilotconsulting.com>
	<51D9A0D8-065D-11D9-BB02-000A95730E92@spamaps.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ryJZkp9/svQ58syV"
Content-Disposition: inline
In-Reply-To: <51D9A0D8-065D-11D9-BB02-000A95730E92@spamaps.org>
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


--ryJZkp9/svQ58syV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 14, 2004 at 07:49:45AM -0700, Clint Byrum spake thusly:
> Hans Reiser has stated that this is because each filesystem has a lock=20
> on it, so while writing to, say, /home/cvs, anybody else who wants to=20
> write to /home/cvs will have to wait. We have a CVS server where the=20

That's odd given that each hard drive can only physically write to one
place on the disk at a time anyhow due to head movement and that the
kernel caches the writes and lays them back out on the disk with some sort
of elevator algorithm.

> You said you were running 2.4.22.nptl or something.

Oops, right you are. That is what the box in question was and is running.
I was thinking of a different box with FC2 on it.

--=20
Tracy Reed                     The attachment is a digital signature.
http://copilotconsulting.com   More info: http://copilotconsulting.com/sig

--ryJZkp9/svQ58syV
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFBR09A9PIYKZYVAq0RAmuWAJoD6sht3icNheXLXJzAahs6/bhOLACghKyv
jIdc2FMeLzIANMXzidsQIfk=
=1pFy
-----END PGP SIGNATURE-----

--ryJZkp9/svQ58syV--
