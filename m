Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAOKSM8W029310
	for <linux-lvm@redhat.com>; Wed, 24 Nov 2010 15:28:22 -0500
Received: from smtp12.tagonline.com (nat199.nat.tagonline.com [207.111.79.199])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAOKSC5n001540
	for <linux-lvm@redhat.com>; Wed, 24 Nov 2010 15:28:12 -0500
Received: from taco.int.tagonline.com (localhost.localdomain [127.0.0.1])
	by localhost.localdomain for (8.13.1/8.12.8/muffin_cf_1.0) with ESMTP
	id oAOKSB56009939
	for <linux-lvm@redhat.com>; Wed, 24 Nov 2010 15:28:11 -0500
Received: (from news@localhost)
	by taco.int.tagonline.com (8.13.1/8.13.1/Submit) id oAOKSBfv009938
	for linux-lvm@redhat.com; Wed, 24 Nov 2010 15:28:11 -0500
From: Andrew Gideon <ag2827189@tagmall.com>
Date: Wed, 24 Nov 2010 20:28:11 +0000 (UTC)
Message-ID: <icjsgr$tm$1@taco.int.tagonline.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Solving the "metadata too large for circular buffer"
	condition
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


We've just hit this error, and it is blocking any expansion of existing 
or creation of new volumes.  

We found: 

http://readlist.com/lists/redhat.com/linux-lvm/0/2839.html

which appears to describe a solution.  I'm doing some reading, and I've 
set up a test environment to try things out (before doing anything risky 
to production).  But I'm hoping a post here can save some time (and 
angst).

First: The referenced thread is two years old.  I don't suppose there's a 
better way to solve this problem today?

Assuming not...

I'm not sure how metadata is stored.  It seems like, by default, it is 
duplicated on each PV.  I'm guessing this because one can't just add new 
PVs (with larger metadatasize values), but one must also remove the old 
metadata.  Is that right?

Are there are consequences to removing the metadata from most of the 
physical volumes?  I've six, so I'd be adding a seventh and eighth (two 
for redundancy, though the PVs are all built on RAID sets).

The "pvcreate --restorefile ... --uuid ... --metadatacopies 0" command 
would be executed on the existing 6 physical volumes?  No data would be 
lost?  I want to be *very* sure of this (so I'm not trashing an existing 
PV).

What is the default metadatasize?  Judging from lvm.conf, it may be 255.  
255 Megabytes?  Is there some way to guestimate how much space I should 
expect to be using?  I thought perhaps pvdata would help, but this is 
apparently LVMv1 only.

[Unfortunately, 'lvm dumpconfig' isn't listing any data in the metadata 
block.]

There's also mention in the cited thread of reducing fragmentation using 
pvmove.  How would that work?  From what I can see, pvmove will move 
segments.  But even if two segments are moved from dislocated locations 
to immediately adjacent locations, I see nothing which says that these 
two segments would be combined into a single segment.  So I'm not clear 
how fragmentation can be reduced.

Finally, there was mention of changing lvm.conf - presumably, 
metadata.dirs - to help make more space.  Once lvm.conf is changed, how 
is that change made live?  Is a complete reboot required, or is there a 
quicker way?

Thanks for any and all help...

	Andrew
