Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j7VMTlHQ028606
	for <linux-lvm@redhat.com>; Wed, 31 Aug 2005 23:29:47 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1EAb5X-0004n6-4m
	for linux-lvm@redhat.com; Wed, 31 Aug 2005 23:29:47 +0100
Date: Wed, 31 Aug 2005 23:29:47 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] pvmove is stuck
Message-ID: <20050831222947.GL15141@agk.surrey.redhat.com>
References: <1125522968.11068.9.camel@avenin.ebourne.me.uk>
	<20050831213759.GI15141@agk.surrey.redhat.com>
	<1125525121.11068.12.camel@avenin.ebourne.me.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1125525121.11068.12.camel@avenin.ebourne.me.uk>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Aug 31, 2005 at 10:52:01PM +0100, Martin Ebourne wrote:
>   pvmove0   vg_hordein        4 p-C-ao 372.56G  -1  -1 253  10                 /dev/hda1  75.14 247BqL-aEnl-ApBy-bLCf-W2Cs-1spS-GFfERx

> vg_hordein-pvmove0: 0 356515840 linear 22:64 384
> vg_hordein-pvmove0: 356515840 20971520 linear 22:64 356516224
> vg_hordein-pvmove0: 377487360 209715200 mirror core 1 1024 2 3:1 356516224 22:64 377487744 
> vg_hordein-pvmove0: 587202560 194117632 linear 3:1 587202944

So pvmove split into 4 parts and it's currently doing the 3rd one.  [See man page]

> vg_hordein-pvmove0: 377487360 209715200 mirror 2 3:1 22:64 204799/204800

Look at the last fraction saying how far it got: it suggests you got a 
bad sector.  Check your system log to see if it reported this (and says 
which sector).

The tools don't handle this yet - all they let you do is 'pvmove --abort'
which commits parts 1 and 2 but will abandon part 3.

Several ways to workaround it - none of them trivial.

If you're familiar with gdb, the simplest way would be to use it to
override the status information returned and trick pvmove into 
thinking it's reached 204800/204800.

Or compile up a one-off version of pvmove that says in _target_percent()
in lib/mirror/mirrored.c:  [this code has moved file recently - lib/activate/]

  if (numerator == 204799)
        numerator = 204800;

before the existing lines:
        if (seg)
                seg->extents_copied = seg->area_len * numerator / denominator;
                                                                                
        return 1;



There are other options involving editing metadata, but they're harder to
explain.


A way for the system to cope with situations like this automatically is
being worked upon.

Alasdair
-- 
agk@redhat.com
