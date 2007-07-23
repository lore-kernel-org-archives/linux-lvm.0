Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6NGhP0c003274
	for <linux-lvm@redhat.com>; Mon, 23 Jul 2007 12:43:25 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l6NGhNNj023378
	for <linux-lvm@redhat.com>; Mon, 23 Jul 2007 12:43:23 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l6NGhHk8003146
	for <linux-lvm@redhat.com>; Mon, 23 Jul 2007 12:43:17 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l6NGhH79004870
	for <linux-lvm@redhat.com>; Mon, 23 Jul 2007 12:43:17 -0400
Date: Mon, 23 Jul 2007 12:43:17 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Flexible storga: LVM setup on top of mdadm sets.
	Good idea or not?
In-Reply-To: <20070723072320.GB30790@percy.comedia.it>
Message-ID: <Pine.LNX.4.44.0707231231340.4791-100000@bmsred.bmsi.com>
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

On Mon, 23 Jul 2007, Luca Berra wrote:

> On Sun, Jul 22, 2007 at 02:57:33PM -0400, Stuart D. Gathman wrote:
> >The main drawback to md raid1 is that it always resynchronizes
> >the *entire* partition when a disk goes offline temporarily.  I also
> False. md uses bitmaps to avoid this.

I am using md on dozens of systems up through Centos-5.  If there are any
bitmaps, they don't work.  Or maybe they are a new feature not in kernel
2.6.18.  The only change I've noticed since RH7.3 is that sync speed is no
longer limited to 10K.  Or maybe I'm not looking at the right thing.

When replacing a disk, a full resync is required anyway - so no problem.
Where it is a problem is when there is an abnormal system shutdown,
so that md devices are not closed properly.  The system boots immediately,
but performance is slow until the mirror have been resynced.  This can
take hours.  And the system is vulnerable to single disk failure in the source
drive for those hours.

How would I see these bitmaps in action?

BTW, to upgrade a 7.2 system to Centos5, I plan to install on a disk
with matching partition sizes and replace boot drive.  Is there any
chance that md raid1 will sync from the old system overtop the new?
(Because the new wouild have lower sequence numbers?)  Or is there some
kind of UUID in the raid superblock to prevent this?  (Of course I plan
to change partition types away from RAID Auto just to be safe...)

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
