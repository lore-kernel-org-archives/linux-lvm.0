Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i81Htp307325
	for <linux-lvm@redhat.com>; Wed, 1 Sep 2004 13:55:51 -0400
Received: from ripple.fruitbat.org (ip-66-80-62-153.dsl.sca.megapath.net
	[66.80.62.153])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i81HtnS0010400
	for <linux-lvm@redhat.com>; Wed, 1 Sep 2004 13:55:50 -0400
Received: (from daemon@localhost)
	by ripple.fruitbat.org (8.10.2/8.8.8/PAC-1.3) id i81HsOk24687
	for <linux-lvm@redhat.com>; Wed, 1 Sep 2004 10:54:24 -0700
Received: from ming.fruitbat.org (IDENT:202@ming.fruitbat.org [192.168.1.2])
	by ming.fruitbat.org (8.12.10/8.10.2/PAC-1.6) with ESMTP id
	i81HsDE8010753
	for <linux-lvm@redhat.com>; Wed, 1 Sep 2004 10:54:13 -0700
Date: Wed, 1 Sep 2004 10:54:13 -0700 (PDT)
From: "Peter A. Castro" <doctor@fruitbat.org>
Subject: Re: [linux-lvm] LVM2 and Software RAID
In-Reply-To: <63BAEF7DCB973A469B1A60CBE113C1650872A631@cmss-mail.Tickets.com>
Message-ID: <Pine.LNX.4.58.0409011018470.4635@ming.fruitbat.org>
References: <63BAEF7DCB973A469B1A60CBE113C1650872A631@cmss-mail.Tickets.com>
MIME-Version: 1.0
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
Content-Type: TEXT/Plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 31 Aug 2004, Yang, Daniel wrote:

> What information can you give on the reliability of using LVM2 w/ Software
> RAID?  I've done some reading that stated that LVM and Software RAID on
> Linux is not a good combination.  Especially b/c the combination does not
> allow for adding or removing hard drives. Also, LVM does not allow for
> mirroring capabilities so there is no way to mirror w/o the software RAID.
> Finally, the combination does not support bad-block replacement mechanisms.
> What can one do if a bad-block occurs in this type of setup?

There are always pros and cons for using RAID and LVM.  For my money,
software raid is more flexible and more managable than hardware raid.
Others may disagree, of course :)

RAID is mostly about planning how you want your disks to be spliced
together and what kind of reliability over failure you are willing to
live with.  This is true for software and hardware RAID.  Most hardware
RAID adapters do not allow for resizing an existing array.  It is
possible to resize a software RAID, but there is the potential for data
loss.  The Software-RAID HOWTO has a quick section on RAID resizing which
might interested you.

See: http://tldp.org/HOWTO/Software-RAID-HOWTO.html

Software RAID, as you are aware, uses the computers processor to perform
the raid functions, where as hardware RAID has a separate processor on
the RAID adapter to perform these functions.  If you have a sufficiently
fast computer, the overhead of raid will hardly be noticed.

LVM, by contrast, is geared for adding and removing physical drives from
a volume group allowing one to add more storage or replace smaller drives
with larger ones.  The problem most people have is that they create one
big raid array and thus have only one volume group with only one physical
device in it.  Kinda hard to remove a device and retain your data in this
configuration :)

Most modern drives have automatic bad-block replacement internally.  If
the drive has more bad-blocks than available replacement blocks, then
likely the drive is header for failure anyways and should be replaced.

Perhaps you should consider what you want to do with your arrays.  If you
expect to be needing to add more redundant storage over time, then
perhaps a solution would be to create several small raid arrays on
several drives.  Each array appears as a single "drive" to the system.
This way, you can group several "drives" together in a volume group.  If
you need to add storage, you simple replace one arrays' set of drives.
With LVM, you can move data off of that "drive", remove it from the
volume group, change out the physical drives, create the new array on
these drives, then add it back into the volume group, or simply add new
disks, create a new array and add it to the volume group.

Again, it's all about planning.  With Software RAID and LVM you have more
flexibility, and the above can be done while the system is live.  Most
hardware raids have to be setup from the adapters bios.

Good luck, whichever you choose.

> Thanks,
> DY

-- 
Peter A. Castro <doctor@fruitbat.org> or <Peter.Castro@oracle.com>
	"Cats are just autistic Dogs" -- Dr. Tony Attwood
