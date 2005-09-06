Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j86LLvV14286
	for <linux-lvm@redhat.com>; Tue, 6 Sep 2005 17:21:57 -0400
Received: from host1.appws.com (host1.appws.com [216.136.72.3])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j86LLkW4007279
	for <linux-lvm@redhat.com>; Tue, 6 Sep 2005 17:21:51 -0400
Received: from grandmother.littlebald.com (localhost.localdomain [127.0.0.1])
	by grandmother.littlebald.com (8.13.1/8.13.1) with ESMTP id
	j86LL1Lu022636
	for <linux-lvm@redhat.com>; Tue, 6 Sep 2005 17:21:02 -0400
Received: (from david@localhost)
	by grandmother.littlebald.com (8.13.1/8.13.1/Submit) id j86LL0ot022634
	for linux-lvm@redhat.com; Tue, 6 Sep 2005 17:21:01 -0400
Subject: RE: [linux-lvm] Moving space between logical volumes?
From: David Johnston <david@littlebald.com>
In-Reply-To: <3BED18D345FC9245B8B26F4273CFFBAF033FBADA@IOWAEVS02.iowa.uiowa.edu>
References: <3BED18D345FC9245B8B26F4273CFFBAF033FBADA@IOWAEVS02.iowa.uiowa.edu>
Content-Transfer-Encoding: 7bit
Date: Tue, 06 Sep 2005 17:20:56 -0400
Message-Id: <1126041656.21583.112.camel@grandmother.littlebald.com>
Mime-Version: 1.0
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 2005-09-06 at 10:18 -0500, Meadows, Howard T wrote:
> On Tue, 2005-09-06 at 9:22 AM, David Johnston wrote:
> >e2fsadm is a front end for the LVM tools.  It simplifies things by doing
> >the math for you, and by doing the steps in the correct order (which
> >changes depending on whether you are growing or shrinking).
*snip*

> Thanks very much for the information. 
> To clarify my present configuration, I'm including data from fdisk,
> vgdisplay and lvdisplay for the two logical volumes I want to resize.

Output from "df" is also useful, particularly for lv's you plan to
shrink.

> From what I see, it sounds like I can use the commands you specified and
> all should be well (with no loss of data). If I could take advantage of
> your kindness just a little more, could you look at my information below
> and confirm that those commands are correct?
> Thanks VERY much

I'm glad to try to help.  

Step one: make sure you've got backups.  This is general advice, not
just for this.  What happens if the dog knocks the computer off the
table and out the window?  It's not likely, but things can and do go
wrong sometimes.  MAKE BACKUPS ;-)

> Data reported with fdisk p command:
>    Device Boot    Start       End    Blocks   Id  System
> /dev/sda5           515       770   2048224+  8e  Linux LVM
> /dev/sda6           771     32767 256007965+  8e  Linux LVM
This is less than optimal unless sda5 and sda6 belong to different
volume groups.  It's fine to play around, but on a production server you
should only have one LVM partition per disk.

> Output from vgdisplay command:
> # vgdisplay /dev/storagevg
> --- Volume group ---
> VG Name               storagevg
> Cur PV                2
This tells me that you've got two physical volumes in storagevg. 

> VG Size               585.88 GB
> Alloc PE / Size       18208 / 569 GB
> Free  PE / Size       540 / 16.88 GB
This tells me that your volume group has 585GB of total space, of which
569GB is allocated logical volumes and 16GB is unallocated.

> Output from lvdisplay for the lv I want to reduce by 100 GB:
> --- Logical volume ---
> LV Name                /dev/storagevg/atdevel

I'd be interested to see "df -h | grep atdevel" as well; that will tell
us how much of the 505GB allocated to this lv is actually used.  You
will get something like this:
/dev/mapper/storagevg-atdevel   505.0G  100.5G  404.5G  20% /atdevel

Make certain that you've got at least 110GB of free space in that
filesystem.  Once you're sure, shrink it:
	# umount /dev/storagevg/atdevel
	# e2fsadm -L -100G /dev/storagevg/atdevel

> Output from lvdisplay for lv I want to increase by 100 GB:
> --- Logical volume ---
> LV Name                /dev/storagevg/gcg

Now, expand gcg.
	# umount /dev/storagevg/gcg
	# e2fsadm -L +100G /dev/storagevg/gvg

In both cases, e2fsadm should stop and complain if you've asked it to do
something that might loose data, but again, make sure you've got good
backups of anthing important.  If you get an error, STOP AND ASK FOR
HELP.  It's a lot easier to fix one problem than it is to fix 6 or 7
compounded errors.

You've still got 16GB of free space.  That's not necessarily a bad
thing, you never know when or where you might need it.

Good luck!
