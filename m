Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l93JILKS004538
	for <linux-lvm@redhat.com>; Wed, 3 Oct 2007 15:18:21 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1Id9jh-0007Ef-79
	for linux-lvm@redhat.com; Wed, 03 Oct 2007 20:18:21 +0100
Date: Wed, 3 Oct 2007 20:18:21 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Where to report bugs?
Message-ID: <20071003191821.GO18444@agk.fab.redhat.com>
References: <4703B2CD.9050206@theendofthetunnel.de>
	<20071003171552.GL18444@agk.fab.redhat.com>
	<4703E000.4050307@theendofthetunnel.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4703E000.4050307@theendofthetunnel.de>
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

On Wed, Oct 03, 2007 at 08:31:28PM +0200, Hannes Dorbath wrote:
> 8. Use vgreduce --removemissing to get VG data up again
> LV origin is gone and can only be brought back from backup with
> vgcfgrestore.
 
Right.  So you're asking for vgreduce --removemissing to be enhanced
to consider just removing the snapshot and leaving behind the LV if
it possible.  Seems reasonable.

The logic that needs improving is in _remove_lv() in tools/vgreduce.c
if anyone wants to have a go at fixing it.

                /* Use the origin LV */
                lv = snap_seg->origin;

Perhaps it should have a second variable to hold the origin, and in the
following loop only deal with the current cow instead of all of them.

(It needs to handle two cases: origin LV is gone=>loop and remove all snapshots
as well as the origin; snapshot LV only is gone=>only remove this snapshot.
Maybe push the remove_snapshot code into a separate function then call
it from two places for the two different cases, avoiding the loop for the
one snapshot only case.)

Alasdair
-- 
agk@redhat.com
