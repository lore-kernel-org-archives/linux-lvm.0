Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8BBZAr00365
	for <linux-lvm@redhat.com>; Sat, 11 Sep 2004 07:35:10 -0400
Received: from copilotconsulting.com (ip-66-181-5-46.cust.i2bnetworks.com
	[66.181.5.46])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8BBZA8u004075
	for <linux-lvm@redhat.com>; Sat, 11 Sep 2004 07:35:10 -0400
Received: from localhost (copilotconsulting.com [127.0.0.1])
	by copilotconsulting.com (Postfix) with ESMTP id 8B66DA936C
	for <linux-lvm@redhat.com>; Sat, 11 Sep 2004 04:25:35 -0700 (PDT)
Received: from copilotconsulting.com ([127.0.0.1])
	by localhost (copilotconsulting.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 12988-05 for <linux-lvm@redhat.com>;
	Sat, 11 Sep 2004 04:25:34 -0700 (PDT)
Date: Sat, 11 Sep 2004 04:25:34 -0700
From: Tracy R Reed <treed@copilotconsulting.com>
Subject: Re: [linux-lvm] massive LV corruption
Message-ID: <20040911112534.GD32306@copilotconsulting.com>
References: <20040911110830.GC32306@copilotconsulting.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eheScQNz3K90DVRs"
Content-Disposition: inline
In-Reply-To: <20040911110830.GC32306@copilotconsulting.com>
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
To: linux-lvm@redhat.com


--eheScQNz3K90DVRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 11, 2004 at 04:08:30AM -0700, Tracy R Reed spake thusly:
> after I made the change which probably caused the damage in case they are
> of use to someone. They can be found here:
> =20
> http://ultraviolet.org/tmp

I just added system.conf.4.old so you can see the lvm config from before I
executed the lvextend commands.=20

--=20
Tracy Reed                     The attachment is a digital signature.
http://copilotconsulting.com   More info: http://copilotconsulting.com/sig

--eheScQNz3K90DVRs
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFBQuCt9PIYKZYVAq0RAk5UAJ94lYNCua13ZRBst6Hlj97JPrcFMQCcC4gI
vl6Q+/3zF6xtY2VdwRDQ3rs=
=sGSg
-----END PGP SIGNATURE-----

--eheScQNz3K90DVRs--
