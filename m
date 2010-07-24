Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6O3SSlY024482
	for <linux-lvm@redhat.com>; Fri, 23 Jul 2010 23:28:28 -0400
Received: from out1.smtp.messagingengine.com (out1.smtp.messagingengine.com
	[66.111.4.25])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o6O3SHDW019205
	for <linux-lvm@redhat.com>; Fri, 23 Jul 2010 23:28:18 -0400
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 19F3116F720
	for <linux-lvm@redhat.com>; Fri, 23 Jul 2010 23:28:16 -0400 (EDT)
Message-Id: <1279942095.12963.1386480183@webmail.messagingengine.com>
From: "giovanni_re" <john_re@fastmail.us>
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Date: Fri, 23 Jul 2010 20:28:15 -0700
Subject: [linux-lvm] Disk Partitioning tools, GUI preferably- best for LVM
 Logical Volume Management ; jor
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

What are the best tools (ie sw) for doing disk partitioning?  Preferably
GUI. but, console mode suggestions welcome if that's best, or all there
is.

For use in KUbuntu 10.4.

[This list is for all LVM questions, not just RedHat distro questions,
yes?]


==
KDE 3 used to have qtPartEd, which used to be able to actually _create_
partitions. That's not in KDE4, ie in KUbuntu 10.4.  

I've installed GPartEd, but it can't see into LVs - Logical volumes. 
Thus, it can't _create_ anything there.

I'd greatly appreciate a competent GUI partitioner.  I only partition
disks a few times per year, & it's great to have the GUI have the
commands available to do the partitions, so one doesn't have to spend
the time to keep up on the specifics of commands to deal with new disk
formats & partitioning methods, & do hand calculations of partitions
sizes, etc.


==
I installed KU 10.4 with the alternate installer.  I've used the console
mode installer for many years, probably because it gives me the ability
to partition my disks well.

I usually put, in order from the beginning, two Linux partititions, a
swap partition, then make a LVM for the 4th partition. & put a "/home"
partition there, then leave space for further partitions - like, if i
want to add another linux partition - so I can set up different distros
& boot into them.


[BTW, is making that 4th partition a logical one, & putting more
partitions in there necessary anymore? Used to be that disks were
limited at 4 partitions, & one had to make a big 4th partition & put sub
partitions inside that.  After all these years - in Linux, can we yet
put as many partitions as we want without making a logical partition?  I
think there was a limit of 16 partitions before.  Can more than that be
done now?]


==
So, I've got that big LV 4th partition, with empty space (2TB drive),
and now I want to create some more linux partitions so I can install
some other distros.

But, GPartEd doesn't show what's in the LVM.  And, thus it further can't
create any partions there.  - It's a tragedy GPartEd isn't better
maintained.  :(


==
So, what are the easiest tools to create additional partions in Logical
Volumes?

Thanks :)

==  Join in the Global weekly meetings, via VOIP, about all Free SW HW & Culture
http://sites.google.com/site/berkeleytip/
