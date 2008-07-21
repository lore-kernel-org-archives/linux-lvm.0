Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6L9WAKx024926
	for <linux-lvm@redhat.com>; Mon, 21 Jul 2008 05:32:11 -0400
Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m6L9WAOb012025
	for <linux-lvm@redhat.com>; Mon, 21 Jul 2008 05:32:10 -0400
Message-ID: <4884579A.6040008@redhat.com>
Date: Mon, 21 Jul 2008 10:32:10 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvconvert alloc policy
References: <bf6f43f40807201108s15b68449yf682d84b919d140a@mail.gmail.com>
In-Reply-To: <bf6f43f40807201108s15b68449yf682d84b919d140a@mail.gmail.com>
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

Levy Abinajm Melero Sant'Anna wrote:
> root@atom:~# lvconvert -v -m 1 /dev/archvg/onhomelv /dev/sdb1
>     Checking for existing volume group "archvg"
>     Archiving volume group "archvg" metadata (seqno 6).
>   Not enough PVs with free space available for parallel allocation.
>   Consider --alloc anywhere if desperate.

Your archvg has two PVs. When you specify -m1 you create a two-sided
mirror with an on-disk persistent log. The log requires a 3rd PV
(although only a very small amount of space on it).

Regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFIhFea6YSQoMYUY94RAmNmAKCddflcLpbj73atKR5sPVYa/1hhsgCfabzF
W9F49OgeSLL+bmnRc44pavU=
=XkjZ
-----END PGP SIGNATURE-----
