Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBLBab110059
	for <linux-lvm@redhat.com>; Wed, 21 Dec 2005 06:36:37 -0500
Received: from strugglers.net (strugglers.net [212.13.198.70])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBLBaUPU027696
	for <linux-lvm@redhat.com>; Wed, 21 Dec 2005 06:36:30 -0500
Received: from andy by strugglers.net with local (Exim 4.50)
	id 1Ep2GQ-0001vf-Hw
	for linux-lvm@redhat.com; Wed, 21 Dec 2005 11:36:11 +0000
Date: Wed, 21 Dec 2005 11:36:10 +0000
From: Andy Smith <andy@strugglers.net>
Message-ID: <20051221113610.GX10278@strugglers.net>
References: <AED6CFAFF9F260323C3E5890@d216-220-25-20.dynip.modwest.com>
	<20051221011236.10857.qmail@web80907.mail.scd.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fxB3hi9J0bo07GMp"
Content-Disposition: inline
In-Reply-To: <20051221011236.10857.qmail@web80907.mail.scd.yahoo.com>
Subject: Re: [linux-lvm] Recovery of data in LVM from a corrupt disk
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


--fxB3hi9J0bo07GMp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 20, 2005 at 05:12:36PM -0800, mymail mymail wrote:
>    Thanks.
>    I realise this. But the disk I'm trying to mount is built the same way
>    as the new disk I've built. So the both have a VolGroup00. What I
>    would like to do is to either understand how I can change the volume
>    group info so it will become a distinct volume group, and then I can
>    'import' this into my new environment, or how I can get into the block
>    system so I can access the filesystem structure it embeds.

Perhaps you could boot off a rescue cd or knoppix or something, edit
the lvm.conf to tell it to only consider /dev/hdc or wherever you
have the old disk connected, do the vgscan to pick up the old vg,
and then vgrename to try and rename it.

If the disk is damaged enough not to boot then you might find that
you can't recover from this however.

LVM is not for redundancy, use RAID for that.

--fxB3hi9J0bo07GMp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFDqT4qIJm2TL8VSQsRAqU/AKDDrK7nqjUxDjzr/ovRQ5zU02oSdwCgkyY9
sL4Bw2dcZKgeOZ1WjnOT5iE=
=dOXl
-----END PGP SIGNATURE-----

--fxB3hi9J0bo07GMp--
