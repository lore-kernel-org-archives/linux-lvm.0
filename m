Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3RAgWoh022653
	for <linux-lvm@redhat.com>; Thu, 27 Apr 2006 06:42:32 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k3RAg1fD008757
	for <linux-lvm@redhat.com>; Thu, 27 Apr 2006 06:42:02 -0400
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id 1A4EE1F4051
	for <linux-lvm@redhat.com>; Thu, 27 Apr 2006 12:41:55 +0200 (CEST)
Received: from conterra.de ([127.0.0.1])
	by localhost (vvv.conterra.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 30391-01 for <linux-lvm@redhat.com>;
	Thu, 27 Apr 2006 12:41:46 +0200 (CEST)
Message-ID: <44509F61.1010501@conterra.de>
Date: Thu, 27 Apr 2006 12:39:29 +0200
From: =?UTF-8?B?RGlldGVyIFN0w7xrZW4=?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvmove to smaller PVs
References: <1144258458.32119.8.camel@pc7.dolda2000.com>
	<20060405174425.GX4197@agk.surrey.redhat.com>
In-Reply-To: <20060405174425.GX4197@agk.surrey.redhat.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Alasdair G Kergon wrote:
> On Wed, Apr 05, 2006 at 07:34:18PM +0200, Fredrik Tolf wrote:
>> Can pvmove not just divide that storage into three "partitions", 
> 
> There's no logic to do that yet.  It can only move complete sets of
> contiguous extents.
> 
>> Is there a way for me to tell it to do so?
> 
> As you found: break up contiguous extents explicitly on
> the command line by telling it to move smaller parts that it
> can handle.

I run into the same problem: I got a hw-raid controller and merged
all my individual disks into a raid5. Thus I got one big PV instead
of several small one. After moving back and forth some lvs, my PV
gets more and more fragmented. Thus I have to instruct pvmove
explicitly which fragments have to move.

The pvmove manpage explains shortly how pvmove works: Segments to
to move are added to a temporary 'pvmove' lv, but it seems lvmove
won't split any source segment into smaller pieces to fit into
any target segment. I may explicitly express source segments
(using :PE-PE), but this also becomes complicated if my source PV
is fragmented, too. Even if I do so, it is not clear to me, how
to express such a fragmented pvmove with a single command. Else
I have to perform lots of single pvmoves and have to wait for each
to become ready?

Dieter.
