Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i478nwv23104
	for <linux-lvm@redhat.com>; Fri, 7 May 2004 04:49:58 -0400
Received: from nestor.kbinirsnb.be (nestor.kbinirsnb.be [193.190.234.10])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i478nv0m022289
	for <linux-lvm@redhat.com>; Fri, 7 May 2004 04:49:57 -0400
Received: from bernie.kbinirsnb.be (root@bernie.kbinirsnb.be [192.168.20.4])
	by nestor.kbinirsnb.be (8.12.11.Beta0/8.12.11.Beta0/Debian-1) with
	ESMTP id i478meqj027103
	for <linux-lvm@redhat.com>; Fri, 7 May 2004 10:48:40 +0200
Received: from naturalsciences.be (PC20_115 [192.168.20.115])
	by bernie.kbinirsnb.be (8.12.11.Beta0/8.12.11.Beta0/Debian-1) with
	ESMTP id i478mf8j016929
	for <linux-lvm@redhat.com>; Fri, 7 May 2004 10:48:41 +0200
Message-ID: <409B4D56.90200@naturalsciences.be>
Date: Fri, 07 May 2004 10:48:22 +0200
From: Paul Libert <Paul.Libert@naturalsciences.be>
MIME-Version: 1.0
References: <20040506112914.9D30A740E3@hormel.redhat.com>
In-Reply-To: <20040506112914.9D30A740E3@hormel.redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig499BD1DD22C479B85429A183"
Subject: [linux-lvm] Re: Problem with EXT filesystem on LVM2
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

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig499BD1DD22C479B85429A183
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Heinz,

Thanks for the feedback.
I will try what you suggest when I will have a bit more time.
This can be slightly long ...

I keep the list updated.

Regards.

Paul

Heinz Mauelshagen wrote:

> Subject:
> Re: [linux-lvm] Problem with EXT filesystem on LVM2
> From:
> Heinz Mauelshagen <mauelshagen@redhat.com>
> Date:
> Thu, 6 May 2004 13:29:07 +0200
> To:
> LVM general discussion and development <linux-lvm@redhat.com>
> 
> To:
> LVM general discussion and development <linux-lvm@redhat.com>
> 
> 
> Paul,
> 
> looks like the heavier io load mkfs.ext3/resize2fs exposes a problem
> with your system (hw) which isn't the case with the leighter load
> mkreiserfs causes. A bunch of changes to device-mapper were needed because
> of block device changes by Andrew Morton in the early 2.6 series which are
> missing and likely causing your problem.
> 
> Could you try Linux 2.6.6, apply
> http://people.sistina.com/~thornber/dm/patches/2.6-unstable/2.6.6-rc2/2.6.6-rc2-udm1.tar.bz2 and test again, please.
> 
> Regards,
> Heinz    -- The LVM Guy --
> 
> 
> 


--------------enig499BD1DD22C479B85429A183
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1-nr1 (Windows XP)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFAm01f9IdyKWFcSoYRAribAKCYU+OtTIZMs7aCI5QxiKWwfBGqDACgvHP8
/qseNrQ50VNa04Gxq+dGZYI=
=xaN0
-----END PGP SIGNATURE-----

--------------enig499BD1DD22C479B85429A183--
