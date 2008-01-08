Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m08I4SWZ012224
	for <linux-lvm@redhat.com>; Tue, 8 Jan 2008 13:04:28 -0500
Message-ID: <4783BB2C.5060803@redhat.com>
Date: Tue, 08 Jan 2008 18:04:28 +0000
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] uuid already in use
References: <20080108175528.GA6100@openlib.org>
In-Reply-To: <20080108175528.GA6100@openlib.org>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Thomas Krichel wrote:
> raneb:/etc/lvm/archive# pvcreate --uuid v3HXpi-d5QN-OGiW-VFBG-TNIY-qTun-bFhlVd  --restorefile vg1_00026.vg /dev/hdb
>   uuid v3HXpi-d5QN-OGiW-VFBG-TNIY-qTun-bFhlVd already in use on "/dev/hdb1"
> 
>   I am puzzled. pvdisplay does not see the uuid value but
>   pvcreate says it is is use?? What am I missing here?

If the command above is exactly what you ran, I'd guess that it is
complaining because you are trying to create the new PV on *hdb* (whole
disk), but there is already a PV with that UUID present on *hdb1*
(partition).

Regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFHg7ss6YSQoMYUY94RAqEwAKCuoqxWBo7EYyae+z/whaa+zBF46wCg0zne
7C9kKnMr8lyk2CYSZ+0LkCQ=
=5qF0
-----END PGP SIGNATURE-----
