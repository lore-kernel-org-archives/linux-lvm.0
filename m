Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s540JIx4016673
	for <linux-lvm@redhat.com>; Tue, 3 Jun 2014 20:19:19 -0400
Received: from zimbra13.linbit.com (zimbra13.linbit.com [212.69.166.240])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s540JGat020759
	for <linux-lvm@redhat.com>; Tue, 3 Jun 2014 20:19:17 -0400
Received: from localhost (localhost [127.0.0.1])
	by zimbra13.linbit.com (Postfix) with ESMTP id 0EDC2390D20
	for <linux-lvm@redhat.com>; Wed,  4 Jun 2014 02:19:15 +0200 (CEST)
Received: from zimbra13.linbit.com ([127.0.0.1])
	by localhost (zimbra13.linbit.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id paYTLlezMlHB for <linux-lvm@redhat.com>;
	Wed,  4 Jun 2014 02:19:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra13.linbit.com (Postfix) with ESMTP id E2B59390D3F
	for <linux-lvm@redhat.com>; Wed,  4 Jun 2014 02:19:14 +0200 (CEST)
Received: from zimbra13.linbit.com ([127.0.0.1])
	by localhost (zimbra13.linbit.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id cUleqT_7TXX1 for <linux-lvm@redhat.com>;
	Wed,  4 Jun 2014 02:19:14 +0200 (CEST)
Received: from soda.linbit (tuerlsteher.linbit.com [86.59.100.100])
	by zimbra13.linbit.com (Postfix) with ESMTPS id A1164390D20
	for <linux-lvm@redhat.com>; Wed,  4 Jun 2014 02:19:14 +0200 (CEST)
Date: Wed, 4 Jun 2014 02:19:14 +0200
From: Lars Ellenberg <lars.ellenberg@linbit.com>
Message-ID: <20140604001914.GO12754@soda.linbit>
References: <20140603152209.GA13815@k2>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20140603152209.GA13815@k2>
Subject: Re: [linux-lvm] Thin snapshot caching behaviour
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
To: linux-lvm@redhat.com

On Tue, Jun 03, 2014 at 03:22:09PM +0000, dw+linux-lvm@hmmz.org wrote:
> Hi there,
> 
> While playing with LVM thin provisioning, I've noticed that snapshots
> seem to have different caching semantics compared to their original thin
> LV.
> 
> I've hunted everywhere for documentation that describes this difference,
> or even an indication of on what layer it occurs, but I can find none.
> Perhaps someone here could shed some light?
> 
> Thin volume behaves like a regular drive:
> 
>     # echo 1 > /proc/sys/vm/drop_caches
> 
>     # dd if=/dev/vg0/tv0 of=/dev/null bs=64k count=1000
>     65536000 bytes (66 MB) copied, 0.946389 s, 69.2 MB/s
> 
>     # dd if=/dev/vg0/tv0 of=/dev/null bs=64k count=1000
>     65536000 bytes (66 MB) copied, 0.00810655 s, 8.1 GB/s
> 
> Create activated snapshot:
> 
>     # lvcreate -kn -s -n tv0s /dev/vg0/tv0
>       Logical volume "tv0s" created
> 
>     # dd if=/dev/vg0/tv0s of=/dev/null bs=64k count=1000
>     65536000 bytes (66 MB) copied, 1.00061 s, 65.5 MB/s
> 
> Second dd shows no/very little speedup:
> 
>     # time dd if=/dev/vg0/tv0s of=/dev/null bs=64k count=1000
>     65536000 bytes (66 MB) copied, 0.921402 s, 71.1 MB/s

# echo 3 > /proc/sys/vm/drop_caches
# free -m
# exec 77< /dev/vg0/tv0s
# time dd if=/dev/vg0/tv0s of=/dev/null bs=64k count=1000
# free -m
# time dd if=/dev/vg0/tv0s of=/dev/null bs=64k count=1000
# free -m
# exec 77<&-
# free -m


Background:
linux "forgets" the buffer cache for a block device,
if the last opener is gone (no one has it open anymore).

The "main" device has some internal references,
or is mounted... someone has it open, anyways.

At least that's my best guess as to what you are seeing there.

-- 
: Lars Ellenberg
: LINBIT | Your Way to High Availability
: DRBD/HA support and consulting http://www.linbit.com
