Received: from [127.0.0.1] (sebastian-int.corp.redhat.com [172.16.52.221])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l4E8iGr1001085
	for <linux-lvm@redhat.com>; Mon, 14 May 2007 04:44:17 -0400
Message-ID: <46481FEF.802@redhat.com>
Date: Mon, 14 May 2007 09:38:07 +0100
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM on SATA/PATA disks
References: <Pine.LNX.4.44.0705131307080.6567-100000@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.44.0705131307080.6567-100000@bmsred.bmsi.com>
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

Stuart D. Gathman wrote:
> If out of order writes are enabled, then your server should hold power
> to the disk drives for part of a second after disabling further writes
> in software.  LVM is a low risk because LVM changes are comparatively
> rare, and the modification window is small.  But, theoretically, if
> you lost power right at the instant you pressed return on lvcreate,
> lvextend, or lvremove, on a system with busy disk io, you could corrupt
> the LVM metadata.

LVM metadata I/O does not pass through device-mapper unless you are
stacking volume groups so I'm not sure how your comment regarding
barriers is relevant here. It's also only going to affect devices under
snapshot and multipath mappings.

How does this differ from updating an MSDOS or GPT partition table, for
example?

Kind regards,

Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFGSB/v6YSQoMYUY94RAubIAJ4vcB/tqherGhmW/M6n1wcO5KGungCffw1w
ISfLoRVk6CP3EryIzHTolXA=
=g18w
-----END PGP SIGNATURE-----
