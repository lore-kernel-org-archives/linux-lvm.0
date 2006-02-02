Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k12H46113108
	for <linux-lvm@redhat.com>; Thu, 2 Feb 2006 12:04:06 -0500
Received: from strugglers.net (strugglers.net [212.13.198.70])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k12H3s6H016580
	for <linux-lvm@redhat.com>; Thu, 2 Feb 2006 12:03:54 -0500
Received: from andy by strugglers.net with local (Exim 4.50)
	id 1F4hs2-0001vK-4M
	for linux-lvm@redhat.com; Thu, 02 Feb 2006 17:03:46 +0000
Date: Thu, 2 Feb 2006 17:03:46 +0000
From: Andy Smith <andy@strugglers.net>
Message-ID: <20060202170346.GV7017@strugglers.net>
References: <D3DC8F9206F0D24085E459720ECDF3EDC3FC34@mail-18ps.atlarge.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="I6qaxAmZPl8kCtac"
Content-Disposition: inline
In-Reply-To: <D3DC8F9206F0D24085E459720ECDF3EDC3FC34@mail-18ps.atlarge.net>
Subject: Re: [linux-lvm] raidtools/mdadm stability
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


--I6qaxAmZPl8kCtac
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 02, 2006 at 10:15:52AM -0600, Don Shesnicky wrote:
> Couple of quick questions on raidtools/mdadm if anyone cares to comment:
>=20
> 1. In the raid faq it states "However, if you find raidtools cumbersome=
=20
> or limited, mdadm (multiple devices admin) is an extremely useful tool=20
> for running RAID systems. It can be used as a replacement for the=20
> raidtools, or as a supplement." I want to mirror the root drives of a=20
> RHEL4 ES U2 system, what's the prefered method for stability -
> raidtools,=20
> mdadm or mdadm with raidtools.=20

raidtools is obsolete, so mdadm.

> 2. I take it from a previous posting I can mirror my two root drives,=20
> installed the MBRs and be good to go to boot off either drive, that=20
> the mirror is not at the bit level and does not include the MBR?

The mirror is at the block device level, e.g. if your root fs is
/dev/sda1 then that's what you mirror.  So you could install an MBR
on sda and sdb for example.

> 3. Is RHEL4 ES Update2 generally stable or is there something that=20
> could burn us here?

I have had no issues whatsoever with LVM or mdadm in RHEL3 or 4.
Apart from LVM snapshots, of course.

--=20
http://strugglers.net/wiki/Xen_hosting -- A Xen VPS hosting hobby
Encrypted mail welcome - keyid 0x604DE5DB

--I6qaxAmZPl8kCtac
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFD4jtyIJm2TL8VSQsRAs6VAKDORrJDG4W2WEJUGGrybfxWN5mcKACfYG4O
Nzvqih7HEQ3B4QDQUbXMeeo=
=nfrf
-----END PGP SIGNATURE-----

--I6qaxAmZPl8kCtac--
