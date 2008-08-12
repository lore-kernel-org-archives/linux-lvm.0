Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m7CBV6ih028275
	for <linux-lvm@redhat.com>; Tue, 12 Aug 2008 07:31:06 -0400
Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m7CBV6PU027638
	for <linux-lvm@redhat.com>; Tue, 12 Aug 2008 07:31:06 -0400
Message-ID: <48A1747A.8060808@redhat.com>
Date: Tue, 12 Aug 2008 12:31:06 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Found duplicate PV 7TGP3THphAvROCTtC4OI2gZrvrAGrn15:
	using /dev/sdah not /dev/sdq Found duplicate
	PV	Qbpd3ov1sd3GHCwCQHUzkI00X53lbcDC:
	using /dev/sdai not	/dev/sdr Found duplicate PV
	v0YURmuRm51dfY8br0Bx7XxOOIJyV6oa: using /dev/sdt not /dev/sdc Found
References: <47311dd20808120424w30a33b88uf8418db1f411a52d@mail.gmail.com>
In-Reply-To: <47311dd20808120424w30a33b88uf8418db1f411a52d@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Reply-To: bmr@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Pedro Gonzalez Zamora wrote:
> Hi all,
> 
> I'm new in LVM when I execute the command "vgscan -v" I get a message below
> I don't why this message appear
> 
> 
> Found duplicate PV 7TGP3THphAvROCTtC4OI2gZrvrAGrn15: using /dev/sdah not
> /dev/sdq
> Found duplicate PV Qbpd3ov1sd3GHCwCQHUzkI00X53lbcDC: using /dev/sdai not
> /dev/sdr
> 
> Anyone Can help me to understand what is the problem and How  can I fix it?
> 
> Bests Regards
> 
> Pedro G.

Do you have a SAN/fiber/iSCSI environment with multiple paths to the
storage? If so, then you can configure multipathing and filtering to
allow LVM to take advantage of the redundant paths to the storage.

If you don't have a multipath environment then you need to figure out
why these two devices seem to have the same content. Could they have
been copied (dd, some clever storage mirroring thingamy? broken (split)
RAID1 mirror?).

Regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFIoXR56YSQoMYUY94RAigRAKCIh7YRDyiXjqK0rIxuBRbUbTHTvACbBoAL
WB4BOU4CoOlPxs95s6OvNBg=
=0GU3
-----END PGP SIGNATURE-----
