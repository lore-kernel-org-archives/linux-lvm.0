Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l6O9EukO006871
	for <linux-lvm@redhat.com>; Tue, 24 Jul 2007 05:14:56 -0400
Message-ID: <46A5C29F.3010407@redhat.com>
Date: Tue, 24 Jul 2007 10:13:03 +0100
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Flexible storga: LVM setup on top of mdadm sets.
	Good idea or not?
References: <Pine.LNX.4.44.0707232143500.7330-100000@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.44.0707232143500.7330-100000@bmsred.bmsi.com>
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
> On Mon, 23 Jul 2007, Luca Berra wrote:
> 
>> On Sun, Jul 22, 2007 at 02:57:33PM -0400, Stuart D. Gathman wrote:
>>> The main drawback to md raid1 is that it always resynchronizes
>>> the *entire* partition when a disk goes offline temporarily.  I also
>> False. md uses bitmaps to avoid this.
> 
> The LVM mirroring uses bitmaps.  Are you sure md raid does?  Since what
> version?
> 

drivers/md/md.c:

   - persistent bitmap code
     Copyright (C) 2003-2004, Paul Clements, SteelEye Technology, Inc.

Cheers,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFGpcKf6YSQoMYUY94RAq4JAKDJYwRqXm3ZsAqLgrhbup4/MEvNNACfauDJ
GNLb7n3pHU55pe+aKXenLAw=
=oj8i
-----END PGP SIGNATURE-----
