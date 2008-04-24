Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3OFxtwq029730
	for <linux-lvm@redhat.com>; Thu, 24 Apr 2008 11:59:55 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3OFxjLB018522
	for <linux-lvm@redhat.com>; Thu, 24 Apr 2008 11:59:45 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m3OFxe16026798
	for <linux-lvm@redhat.com>; Thu, 24 Apr 2008 11:59:40 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m3OFxeHH030539
	for <linux-lvm@redhat.com>; Thu, 24 Apr 2008 11:59:40 -0400
Date: Thu, 24 Apr 2008 11:59:40 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Snapshot question... [scaling problem]
In-Reply-To: <1c748a490804240721g639303d8g5b5071dea15332bb@mail.gmail.com>
Message-ID: <Pine.LNX.4.44.0804241151140.30374-100000@bmsred.bmsi.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 24 Apr 2008, Larry Dickson wrote:

> There's an almost trivial variant on this, where you keep the
> (read-only) snapshots in a time-ordered sequence, and freeze the last
> snapshot COW at the same moment as you start the next snapshot. Then writing
> only ever hits the new snapshot COW, and reading from any older snapshot
> (virtual) volume involves figuring out which is the first after that to hold
> the block, but still involves reading only one block. I wonder why LVM does
> not do this. Perhaps Zumastor does? Or somebody else?

Then you can't delete an older snapsnot until you delete all newer ones.

Zumastor works by using one COW table shared between all snapshots
for a volume.  Blocks are added to the COW in time order.  The origin
ignores COW blocks before the last time point (block offset), writing a new COW
block for any modified since that time point.  The snapshots also use
timepoints in a way that is straightforward, but I don't want to think
about it at the moment :-)

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
