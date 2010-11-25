Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAP3ZopN002391
	for <linux-lvm@redhat.com>; Wed, 24 Nov 2010 22:35:50 -0500
Received: from smtp12.tagonline.com (nat199.nat.tagonline.com [207.111.79.199])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAP3ZcD2031689
	for <linux-lvm@redhat.com>; Wed, 24 Nov 2010 22:35:38 -0500
Received: from taco.int.tagonline.com (localhost.localdomain [127.0.0.1])
	by localhost.localdomain for (8.13.1/8.12.8/muffin_cf_1.0) with ESMTP
	id oAP3ZbAL020840
	for <linux-lvm@redhat.com>; Wed, 24 Nov 2010 22:35:38 -0500
Received: (from news@localhost)
	by taco.int.tagonline.com (8.13.1/8.13.1/Submit) id oAP3ZbN0020839
	for linux-lvm@redhat.com; Wed, 24 Nov 2010 22:35:37 -0500
From: Andrew Gideon <ag2827189@tagmall.com>
Date: Thu, 25 Nov 2010 03:35:37 +0000 (UTC)
Message-ID: <ickli9$tm$4@taco.int.tagonline.com>
References: <1290639756.1076.20@raydesk1.bettercgi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Solving the "metadata too large for circular
 buffer" condition
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
To: linux-lvm@redhat.com

On Wed, 24 Nov 2010 17:02:36 -0600, Ray Morris wrote:

>     If you have two redundant PVs or free space, one could move LVs in
> order to empty an older PV, then recreate it with larger metadata.
> pvmove can be used to move active LVs, or dd is much faster for inactive
> ones.

I don't have much free space on the storage device.  To get this would 
take a fair bit of time in that I'd need to add new drives and 
incorporate them into the RAID set.

But I do have *some* space thanks to "rounding errors" (or "fudge 
factor").  It's not enough to move much data around, but I could build a 
couple of small PVs for use primarily as metadata repositories.

Does this make sense?

In the long term, as I do add new disks, I can create new "real" PVs with 
the larger metadata segments, increasing the redundancy.  Ultimately, I 
can get ahead of the game and start pvmove-ing segments off the PVs on 
which I'd have disabled the metadata because the space allocated is too 
small.

But, in the short term, I'm looking to see how I can most quickly return 
this device to "full service" (being able to extend or add volumes).  And 
that seems to be using a pair of tiny PVs as metadata-only.  If that 
makes sense.

Does it?

Thanks...

	Andrew
