Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8NMPJ1O023595
	for <linux-lvm@redhat.com>; Wed, 23 Sep 2009 18:25:19 -0400
Received: from lo.gmane.org (lo.gmane.org [80.91.229.12])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8NMP7is021415
	for <linux-lvm@redhat.com>; Wed, 23 Sep 2009 18:25:07 -0400
Received: from list by lo.gmane.org with local (Exim 4.50) id 1MqaGn-0002Hs-Hb
	for linux-lvm@redhat.com; Thu, 24 Sep 2009 00:25:05 +0200
Received: from d67-193-217-194.home3.cgocable.net ([67.193.217.194])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 24 Sep 2009 00:25:05 +0200
Received: from brian by d67-193-217-194.home3.cgocable.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 24 Sep 2009 00:25:05 +0200
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Date: Wed, 23 Sep 2009 18:20:54 -0400
Message-ID: <1253744454.22764.55.camel@pc.interlinx.bc.ca>
References: <1189098393.21669.43.camel@pc.ilinx>
	<1189098830.21669.47.camel@pc.ilinx>
	<20070906190902.GX2064@agk.fab.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-HOnSMU3Uv0zRXowfPT74"
In-Reply-To: <20070906190902.GX2064@agk.fab.redhat.com>
Sender: news <news@ger.gmane.org>
Subject: [linux-lvm] Re: collapse (merge) snapshot into origin
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


--=-HOnSMU3Uv0zRXowfPT74
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2007-09-06 at 20:09 +0100, Alasdair G Kergon wrote:
> On Thu, Sep 06, 2007 at 01:13:50PM -0400, Brian J. Murrell wrote:
> > > being considered for an official LVM release?
> =20
> Snapshot merging: yes.
> The patches depended on another change (tracking all snapshot I/O to elim=
inate
> theoretical races) that's still outstanding, but once that's dealt with (=
it's
> tricky - my original proof-of-concept patch was ~800 lines so needed brea=
king
> up and rewriting), I expect them to follow quite quickly.

Any progress on this?

b.


--=-HOnSMU3Uv0zRXowfPT74
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkq6n0YACgkQl3EQlGLyuXABGwCg9XBIzUBkXvCZw1wfDkGMPo8C
1MQAn3CIk+6oEOF7JjxmA1/z5qbBEEET
=uMrR
-----END PGP SIGNATURE-----

--=-HOnSMU3Uv0zRXowfPT74--
