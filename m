Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E7CCD3CC8
	for <linux-lvm@redhat.com>; Tue, 22 Oct 2019 21:38:44 +0000 (UTC)
Received: from mr011msb.fastweb.it (mr011msb.fastweb.it [85.18.95.108])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2235C3082135
	for <linux-lvm@redhat.com>; Tue, 22 Oct 2019 21:38:41 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Tue, 22 Oct 2019 23:38:34 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <alpine.LRH.2.21.1910221142290.1156@fairfax.gathman.org>
References: <c1598cf7-442e-13c5-5877-c6e2667bb4bd@gmail.com>
	<909d4cae-ddd2-3951-eee8-8dec8faa6f22@redhat.com>
	<def626d9-52ef-4761-ebe0-3a29bd664bb1@gmail.com>
	<f1f7dfc1-dfd8-a023-5305-2065446a890e@redhat.com>
	<alpine.LRH.2.21.1910221142290.1156@fairfax.gathman.org>
Message-ID: <9e58accdc28692b3c8b2b09f37bce57c@assyoma.it>
Subject: Re: [linux-lvm] exposing snapshot block device
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: =?UTF-8?Q?Dalebj=C3=B6rk=2C_Tomas?= <tomas.dalebjork@gmail.com>

Hi,

Il 22-10-2019 18:15 Stuart D. Gathman ha scritto:
> "Old" snapshots are exactly as efficient as thin when there is exactly
> one.  They only get inefficient with multiple snapshots.  On the other
> hand, thin volumes are as inefficient as an old LV with one snapshot.
> An old LV is as efficient, and as anti-fragile, as a partition.  Thin
> volumes are much more flexible, but depend on much more fragile 
> database
> like meta-data.

this is both true and false: while in the single-snapshot case 
performance remains acceptable even from fat snapshots, the btree 
representation (and more modern code) of the "new" (7+ years old now) 
thin snapshots gurantees significantly higher performance, at least on 
my tests.

Note #1: I know that the old snapshot code uses 4K chunks by default, 
versus the 64K chunks of thinsnap. That said, I recorded higher thinsnap 
performance even when using a 64K chunk size for old fat snapshots.
Note #2: I generally disable thinpool zeroing (as I use a filesystem 
layer on top of thin volumes).

I 100% agree that old LVM code, with its plain text metadata and 
continuous plain-text backups, is extremely reliable and easy to 
fix/correct.

> For this reason, I always prefer "old" LVs when the functionality of
> thin LVs are not actually needed.  I can even manually recover from
> trashed meta data by editing it, as it is human readable text.

My main use of fat logical volumes is for boot and root filesystems, 
while thin vols (and zfs datasets, but this is another story...) are 
used for data partitions.

The main thing that somewhat scares me is that (if things had not 
changed) thinvol uses a single root btree node: losing it means losing 
*all* thin volumes of a specific thin pool. Coupled with the fact that 
metadata dump are not as handy as with the old LVM code (no 
vgcfgrestore), it worries me.

> The "rollforward" must be applied to the backup image of the snapshot.
> If the admin gets it paired with the wrong backup, massive corruption
> ensues.  This could be automated.  E.g. the full image backup and
> external cow would have unique matching names.  Or the full image 
> backup
> could compute an md5 in parallel, which would be store with the cow.
> But none of those tools currently exist.

This is the reason why I have not used thin_delta in production: an 
error from my part in recovering the volume (ie: applying the wrong 
delta) would cause massive data corruption. My current setup for instant 
recovery *and* added resiliance is somewhat similar to that: RAID -> 
DRBD -> THINPOOL -> THINVOL w/periodic snapshots (with the DRBD layer 
replicating to a sibling machine).

Regards.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
