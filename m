Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8E0uBr31423
	for <linux-lvm@redhat.com>; Mon, 13 Sep 2004 20:56:11 -0400
Received: from copilotconsulting.com (ip-66-181-5-46.cust.i2bnetworks.com
	[66.181.5.46])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8E0u3c7011324
	for <linux-lvm@redhat.com>; Mon, 13 Sep 2004 20:56:10 -0400
Received: from localhost (copilotconsulting.com [127.0.0.1])
	by copilotconsulting.com (Postfix) with ESMTP id 325FF9564A
	for <linux-lvm@redhat.com>; Mon, 13 Sep 2004 17:46:09 -0700 (PDT)
Received: from copilotconsulting.com ([127.0.0.1])
	by localhost (copilotconsulting.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 18022-02 for <linux-lvm@redhat.com>;
	Mon, 13 Sep 2004 17:46:07 -0700 (PDT)
Date: Mon, 13 Sep 2004 17:46:07 -0700
From: Tracy R Reed <treed@copilotconsulting.com>
Subject: Re: [linux-lvm] massive LV corruption
Message-ID: <20040914004607.GB9253@copilotconsulting.com>
References: <20040911110830.GC32306@copilotconsulting.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wq9mPyueHGvFACwf"
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


--wq9mPyueHGvFACwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 11, 2004 at 04:08:30AM -0700, Tracy R Reed spake thusly:
> I am running Fedora Core 1 with stock RedHat kernel 2.4.22-1.2188.nptl. I
> filled my /usr/local to 100% and decided I needed some more space so I ran
> the lvextend and resize_reiserfs commands like I have done many times

Nobody has an opinion to offer? I've been a big fan of LVM for ages but
this incident has really shaken my confidence in it. It is my
understanding that all of the software I am using should be pretty solid
by now. I am hesitatnt to allow LVM operations on production systems
anymore if this sort of thing can happen without explanation. :( I would
like to think I did something wrong but I've used lvextend and
resize_reiserfs a number of times before on other machines without
incident.

--=20
Tracy Reed                     The attachment is a digital signature.
http://copilotconsulting.com   More info: http://copilotconsulting.com/sig

--wq9mPyueHGvFACwf
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFBRj9P9PIYKZYVAq0RAv2qAKCDXzzHUtfMved5/1oxjvhXeIr0swCdHbew
1+hXDBvcpsHU0fsxXXu5G1g=
=FZLC
-----END PGP SIGNATURE-----

--wq9mPyueHGvFACwf--
