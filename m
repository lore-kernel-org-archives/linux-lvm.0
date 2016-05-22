Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4MH7Wjk018402
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sun, 22 May 2016 13:07:32 -0400
Received: from smtp1.dds.nl (smtp1.dds.nl [91.142.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B0A7FC049D4F
	for <linux-lvm@redhat.com>; Sun, 22 May 2016 17:07:29 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id 8F0AE7F955
	for <linux-lvm@redhat.com>; Sun, 22 May 2016 19:07:26 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sun, 22 May 2016 17:07:26 +0000
From: Xen <list@xenhideout.nl>
Message-ID: <d38a602864c07cd1ee5cd4d12a7d0383@dds.nl>
Subject: [linux-lvm] auto umount at thin meta 80%
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
To: Linux lvm <linux-lvm@redhat.com>

I am not sure if, due to my recent posts ;-) I would still be allowed to 
write here. But, perhaps it is important regardless.

I have an embedded LVM. The outer volume is a cached LVM, that is to 
say, two volumes are cached from a different PV. One of the cached 
volumes contains LUKS.

The LUKS, when opened, contains another PV, VG, and a thin pool.

The thin pool contains about 4-5 partitions and is overprovisioned. Only 
one volume is in use now.

This thin volume called "Store" is almost the full size of the thin 
pool, but not quite:

store    vault Vwi-aotz-- 400.00g thin                        40.37

It currently stores a backup, I was writing some backup scripts.

The volume apparently got umounted when the meta of the thinpool reached 
80%.

10:47:21 lvm[4657]: WARNING: Thin pool vault-thin-tpool metadata is now 
80.14% full.
10:47:21 lvm[4657]: Request to lookup VG vault in lvmetad gave response 
Connection reset by peer.
10:47:21 lvm[4657]: Volume group "vault" not found
10:47:21 lvm[4657]: Failed to extend thin pool vault-thin-tpool.

Not sure why the discard is unsupported, but I guess I opened the LUKS 
container without it:

[ 1033.399934] device-mapper: thin: Data device (dm-13) discard 
unsupported: Disabling discard passdown.

[ 1171.656307] device-mapper: thin: 252:14 [ 14 == tpool ]: reached low 
water mark for data device: sending event.

Suddenly my mounted filesystem was gone:

# mount | grep /mnt

....

And VIM reports:

E211: File "update.sh" no longer available

I still have handles open, so the thing must have been lazily umounted.

The meta was created (automatically) with only 112M:

thin                vault twi-aotz-- 437.05g
[thin_tdata]        vault Twi-ao---- 437.05g
[thin_tmeta]        vault ewi-ao---- 112.00m

112M seems low for meta if a proportion of 1:1000 is usually required?

There are hardly any files on the volume(s), just a few archives 
totaling currently 160G.

This is LVM version 2.02.133(2) (2015-10-30) / 1.02.110 (2015-10-30)

The instant umount at 80% seems rather premature.

I will recreate the volume and try to create a larger meta volume for 
it.

I'm not sure if 0.1% of the data size will be enough though, given this 
but wel'll see.

Regards.
