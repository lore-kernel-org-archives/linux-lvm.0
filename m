Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i9FLnjuA027970
	for <linux-lvm@redhat.com>; Fri, 15 Oct 2004 22:49:45 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CIZxJ-0001YH-6B
	for linux-lvm@redhat.com; Fri, 15 Oct 2004 22:49:45 +0100
Date: Fri, 15 Oct 2004 22:49:45 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Re: [OxLUG] LVM2 problems
Message-ID: <20041015214945.GE24242@agk.surrey.redhat.com>
References: <20041015192848.O30562@sphinx.mythic-beasts.com>
	<20041015185452.GG565@scooby.ox.compsoc.net>
	<20041015201822.B29778@sphinx.mythic-beasts.com>
	<20041015215049.A27758@sphinx.mythic-beasts.com>
	<20041015210917.GD24242@agk.surrey.redhat.com>
	<20041015221807.C27758@sphinx.mythic-beasts.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20041015221807.C27758@sphinx.mythic-beasts.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Oct 15, 2004 at 10:18:07PM +0100, Paul Warren wrote:
> Is there any way around this?  Would growing the partition help?
 
Only some careful calculations and growing it backwards
so there's the right amount of space at the start.

Otherwise you'd have to relocate the first physical extents of
data elsewhere, so you have enough unused space at the beginning 
of the disk, then edit the metadata carefully to remove
the now-unused extents and shift the start of the data to where
LVM1 expects it to be.

The tests in lib/format1/format1.c:_pv_setup() 
  /* Retain existing extent locations exactly */
check for equality because that's all there's been time to test
(and should cover most cases of lvm1->lvm2->lvm1).
Checking instead for no overlap should be sufficient but hasn't been
tested.

Alasdair
-- 
agk@redhat.com
