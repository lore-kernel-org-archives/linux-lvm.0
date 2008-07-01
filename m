Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m61Gn2Br016492
	for <linux-lvm@redhat.com>; Tue, 1 Jul 2008 12:49:02 -0400
Received: from nlpi025.prodigy.net (nlpi025.sbcis.sbc.com [207.115.36.54])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m61Gmo2S006918
	for <linux-lvm@redhat.com>; Tue, 1 Jul 2008 12:48:51 -0400
Received: from mail.kdzbn.homelinux.net
	(adsl-75-40-253-44.dsl.klmzmi.sbcglobal.net [75.40.253.44])
	(authenticated bits=0)
	by nlpi025.prodigy.net (8.13.8 smtpauth/dk/8.13.8) with ESMTP id
	m61Gmif0007676
	for <linux-lvm@redhat.com>; Tue, 1 Jul 2008 11:48:45 -0500
Received: from bilbo by mail.kdzbn.homelinux.net with local (Exim 4.62)
	(envelope-from <bryan@kadzban.is-a-geek.net>) id 1KDj24-0000BY-Ql
	for linux-lvm@redhat.com; Tue, 01 Jul 2008 12:48:44 -0400
Date: Tue, 1 Jul 2008 12:48:44 -0400
From: Bryan Kadzban <bryan@kadzban.is-a-geek.net>
Subject: Re: [linux-lvm] Backup of ROOT Partition.
Message-ID: <20080701164844.GA5614@kadzban.is-a-geek.net>
References: <48694ABE.2080307@globetrotter.net>
	<486A0EFE.8020805@kadzban.is-a-geek.net>
	<20080701111332.GG7369@erizo.shearer.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Content-Disposition: inline
In-Reply-To: <20080701111332.GG7369@erizo.shearer.org>
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


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 01, 2008 at 08:43:32PM +0930, Dan Shearer wrote:
> http://code.google.com/p/zumastor/source/browse

The "zumastor" name rings a few bells, so I do believe that's what I was
thinking of, yes.

> there doesn't seem to be disagreement between the people who maintain
> ddsnap and the people who maintain lvm2, but I haven't found any
> statements about what the way forward is.

As a user, I'm just waiting to see what happens, and using the plain old
LVM code in the meantime.  That works out well enough, as long as I'm
aware of its limitations, which is the only reason I mentioned the poor
write performance with large numbers of snapshots.  :-)

So we'll see.


--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIal/sS5vET1Wea5wRAqKwAJ9KPcXAw/0G/DefROL06H0OpzAX+ACghSg0
zIkq1cJAdeMnWypm5UDBHYM=
=6y3C
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
