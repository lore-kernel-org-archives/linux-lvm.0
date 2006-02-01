Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k11Lpx119492
	for <linux-lvm@redhat.com>; Wed, 1 Feb 2006 16:51:59 -0500
Received: from linux.interlinx.bc.ca (linux.interlinx.bc.ca [66.11.173.224])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k11LpobK006451
	for <linux-lvm@redhat.com>; Wed, 1 Feb 2006 16:51:50 -0500
Received: from pc.ilinx (pc.ilinx [10.75.22.1])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by linux.interlinx.bc.ca (Postfix) with ESMTP id 80868CB90D
	for <linux-lvm@redhat.com>; Wed,  1 Feb 2006 16:51:49 -0500 (EST)
Subject: Re: [linux-lvm] 'snapshot' target still experimental :-(
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
In-Reply-To: <1138829354.26648.85.camel@seki.nac.uci.edu>
References: <43E0E3E3.3030407@starnetworks.us>
	<1138829354.26648.85.camel@seki.nac.uci.edu>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-6XMGDxSgBvWqgKGuOJXy"
Date: Wed, 01 Feb 2006 16:51:47 -0500
Message-Id: <1138830708.15727.20.camel@pc.ilinx>
Mime-Version: 1.0
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


--=-6XMGDxSgBvWqgKGuOJXy
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2006-02-01 at 13:29 -0800, Dan Stromberg wrote:
> It just maintains a series of hardlink trees, so any time a file is
> deleted or added, the actual disk usage increase is only due to the
> changes.

Yes, this is quite a popular technique.  To be clear though, a change in
a file does not consume just the amount of the change in the file on the
backup target, but it consumes the entire size of the new file.  A
not-so-insignificant amount for very large files.  This is where a
(block level or filesystem level) snapshotting scheme would excel as it
would likely only consume an amount of space rounded up to the next
"unit" size more even for changes within a file.

Indeed (and to keep quite on topic), perhaps rather than hardlink trees,
LVM snapshots would be even more space efficient.  Maybe that is what
this thread has been about.  I just jumped in.  Apologies if it was.

b.

--=20
My other computer is your Microsoft Windows server.

Brian J. Murrell

--=-6XMGDxSgBvWqgKGuOJXy
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBD4S1zl3EQlGLyuXARAotsAJ9BkC944MEIw5iKHfn0MGk3clVvtACfbLj/
Urwu9TR2ZUT9YV2YOh8bCY0=
=YS/3
-----END PGP SIGNATURE-----

--=-6XMGDxSgBvWqgKGuOJXy--
