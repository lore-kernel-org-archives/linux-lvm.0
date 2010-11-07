Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oA7MS9ef029936
	for <linux-lvm@redhat.com>; Sun, 7 Nov 2010 17:28:09 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oA7MRvrL027454
	for <linux-lvm@redhat.com>; Sun, 7 Nov 2010 17:27:57 -0500
Date: Sun, 7 Nov 2010 17:27:53 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4CD5F804.3040906@cfl.rr.com>
Message-ID: <Pine.LNX.4.64.1011071710110.20225@bmsred.bmsi.com>
References: <4CD35D3E.5030200@cfl.rr.com>
	<Pine.LNX.4.64.1011050022550.31032@bmsred.bmsi.com>
	<4CD5F804.3040906@cfl.rr.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM + raid + san
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Phillip Susi <psusi@cfl.rr.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, 6 Nov 2010, Phillip Susi wrote:

> My understanding of a SAN is where you get a few drive enclosures and a few
> servers and plug them all into a sas expander so all of the servers can see
> all of the disks.  You seem to be talking about having all of the disks on one
> server that then serves them over ethernet with iscsi.  I wouldn't want to do
> that because it adds a good deal of overhead to the disk access and introduces
> a single point of failure.

Your idea is not typical for SAN, where the point is to centralize dealing with
physical disks. The SAN server can be internally highly redundant, addressing
the single point of failure issue.  

However, thinking how to do what you want, how about getting enclosures with
built in RAID?  For instance, There are low cost NAS and USB enclosures with
built in RAID-1.  Perhaps there are some more expensive ones with RAID 10.
(I still wouldn't use RAID5).  Then you can just use them with LVM without
as much worry about disk failure.  If an enclosure fails, however, that
PV will be offline (disrupting your service) until you replace it (moving
disks to new enclosure - so you don't lose data, other than the chaos from
any LVs that are partially offline).

> I'd rather just use LVM to manage all of the disks as part of a single volume
> group so you can immediately transfer a lv from one server to another, but I
> can't work out how to still manage to get raid without having lvm do it with
> the dm-raid5 support.

You'd have some serious locking issues.  With RAID5, each server would have to
lock each chunk before writing to it (which involves a read/modify/write
cycle).  This would create serious overhead.  And you were complaining about
SAN server overhead! :-)  RAID5 *must* be centralized.  Your scheme might work
with RAID10, but then you'd still have to ensure that writes to mirror legs
don't get out of order, with updates from multiple servers flying over the
wire.

I still think you want a traditional SAN with an enterprise SAN server with
lots of built in redundancy (or build your own .  You'll help feed the family
of a hard working salesman :-)

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
