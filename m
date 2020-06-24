From: Vojtech Juranek <vjuranek@redhat.com>
Date: Wed, 24 Jun 2020 09:46:52 +0200
Message-ID: <2500156.q0ZmV6gNhb@localhost.localdomain>
In-Reply-To: <dff2c51f-70a9-3339-6fe8-06091608b572@redhat.com>
References: <1643811.X513TT2pbd@localhost.localdomain>
	<dff2c51f-70a9-3339-6fe8-06091608b572@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2185485.n0HT0TaD9V";
	micalg="pgp-sha256"; protocol="application/pgp-signature"
Subject: Re: [linux-lvm] Removing VG mappings using dmsetup tool
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>
Cc: nsoffer@redhat.com

--nextPart2185485.n0HT0TaD9V
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

> BUT I'd probably focus rather on fixing your oVirt workflow - you should
> not be 'losing' devices while you have activate mappings on them - that's
> IMHO major desing flaw - you can very easily cause very SERIOUS damages
> to your on disk data consistency - so disk would require serious fsck before
> reuse...

Thanks for your answer. Just to clarify - we are not going to loose devices 
intentionally, we are considering this option only for recovery from situation 
when storage is suddenly lost (e.g. broken network, storage sever crashed 
etc.). In these situations disk data consistency would be an issue anyway.

Thanks
Vojta
--nextPart2185485.n0HT0TaD9V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEp6bZMIUgcejwGV0/ep5DIt+WOWsFAl7zBOwACgkQep5DIt+W
OWvb0ggAtO+ETWwgRzPkl8dFACeqoBz3x1DtoBjT6PWAkUtFuxboyW0eK6q3VT93
1ZQlVpHPj5A0Pc4zbItpJyeERx4xPZP72TbX3A8PS/Qj01v2N//WwUlCPCrYOzey
4QH18jntCJW5N7mjG5uQ6UNtvvX8xHBhOoZtpc962FkJ1bnd0YIULoBZj+FO2FJ0
lE4+LAZ52DmDQFw5nmTdRmF/COghXx5wYRJHIGXyxPTM+b1cePmLdVeVrT5fbvst
XYWuRArZhyO7AB58iMZrsHoEVNvNzElO8lho7Cm6uokF6xOddMQisfHjaINR+Lo+
fr5nqIcYaHENMYZmpR7r+aV8ltELCA==
=Bi9v
-----END PGP SIGNATURE-----

--nextPart2185485.n0HT0TaD9V--
