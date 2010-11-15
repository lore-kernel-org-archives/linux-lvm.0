Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oAFKbGwF024225
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 15:37:16 -0500
Received: from nm12-vm0.bullet.mail.ukl.yahoo.com
	(nm12-vm0.bullet.mail.ukl.yahoo.com [217.146.183.246])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id oAFKavHt023780
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 15:37:02 -0500
Date: Mon, 15 Nov 2010 20:37:57 +0000
From: Stephane Chazelas <stephane_chazelas@yahoo.fr>
Message-ID: <20101115203757.GA5876@yahoo.fr>
References: <AANLkTi=+iwZLBxZFzhb++KMevOy55QJrg9xg9Ey2w_kX@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AANLkTi=+iwZLBxZFzhb++KMevOy55QJrg9xg9Ey2w_kX@mail.gmail.com>
Subject: Re: [linux-lvm] advice for curing terrible snapshot performance?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

2010-11-12 13:52:25 -0800, chris (fool) mccraw:
[...]
> no snapshot  = ~11sec (727MB/sec)
> 1 snapshot   = ~102sec (78MB/sec)
> 2 snapshots  = ~144sec (55MB/sec)
> 3 snapshots  = ~313sec (25MB/sec)
> 4 snapshots  = ~607sec (15MB/sec)
[...]

Yes, from 2 snapshots on a volume LVM snapshots become unusable.
Other issues you may have with LVM snapshots with different
versions: some grub versions failing to see LVM volumes once
they have a snapshot, activating a volume group taking several
minutes when there are quite filled up volumes.

ddsnap (zumastor) worked great but is no longer maintained.

So, you have:

- LVM snapshots: poor performace or very few snapshots
- ddsnap: got to stick with an old kernel
- btrfs, not really production ready yet. Probably your best bet
though.
- fuse solutions, with all the fuse related issues.

Quite frustrating as the technolgy is here and has been around
for years.

Sorry for not bringing any good news. I'm all ears for good
alternative solutions though.

Another solution I had looked at at some point:

- qemu-nbd with qcow2: performance not there and a few issues as
well.

-- 
Stephane
