Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4ENHmcT014775
	for <linux-lvm@redhat.com>; Fri, 14 May 2010 19:17:48 -0400
Received: from out1.smtp.messagingengine.com (out1.smtp.messagingengine.com
	[66.111.4.25])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4ENHcrx027100
	for <linux-lvm@redhat.com>; Fri, 14 May 2010 19:17:38 -0400
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id DBE3EF7B77
	for <linux-lvm@redhat.com>; Fri, 14 May 2010 19:17:37 -0400 (EDT)
Message-Id: <1273879056.3562.1375146815@webmail.messagingengine.com>
From: "giovanni_re" <john_re@fastmail.us>
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Date: Fri, 14 May 2010 16:17:36 -0700
Subject: [linux-lvm] LVM Logical Volumes viewing partitions, mounting,
 creating, sda moved to sdb. KUbuntu 10.4
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

I got no answer on the Ubuntu list, so trying here.

==
KU 10.4.  Desktop with2 hdisks. 1.5TB has 9.04, was hda/sda. Now install
a 2TB as sda, move old disk to sdb.

Alternate install 10.4 on the 2TB sda.  Grub finds the 9.04 install on
sdb, & installs fine on sda.

Both installs have a /home partition in their sda4 logical partition,
probably sda5 on each drive when they were installed.

10.4 boots fine on the 2tb, but 9.4 refuses to boot off now sdb. 

Less important question:  Suggestions for getting the 9.4 to boot when
that drive has been moved from sda to sdb (data connector on the
motherboard).  It's probably a mount issue? 


==  How does one see the logical partitions??

fdisk -l, & parted -l, & gparted, I have used - a few days ago, so I
don't recall the specifics right now.

IIRC, on 9.04 as sda, gparted would see the LVs, & show some info about
them.

When I boot 10.4, IIRC gparted doesn't pull up any info about the LV's,
even on the sda drive with the 10.4 os it booted from. :(

IIRC, none of those programs show info about the LV's on sdb, which has
the 9.4 install on it.

So, is LVM properly supported in some partition creation/diagnostic
sw??? ex: fdisk, parted, gparted?  Is there some other program that will
at least see, & perhaps show some info about those partitions?

How about creating more LVs in the free space on the drives?  What sw
can do that from the running 10.4 system? (ie, I don't want to have to
use the alternate installer disk to do partitioning, now that the os is
installed.  I'm hoping that is possible - hasn't LVM been out for quite
a while?  Why don't fdisk & parted support it properly yet?  BTW, what
orgs create & support the LVM sw? GNU? Linux Kernel?? Other?

==
Most Important:  How can I get 10.4 to be able to see & mount the 9.4
/home partition which is now on (probably) sdb5?  What info will be
needed by the mount command? UDEV #?  What sw (parted, fdisk,???) will
show the info necessary to use in the mount commnad??


==
Refs:
http://en.wikipedia.org/wiki/Logical_Volume_Manager_%28Linux%29
http://sourceware.org/lvm2/
http://sunoano.name/ws/lvm.html
https://www.redhat.com/mailman/listinfo/linux-lvm

==
Any other suggestions about mail lists or places to get other informed
answers about this?

Thanks for all thoughts/suggestions. :)
