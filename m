Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6OGtEDF017489
	for <linux-lvm@redhat.com>; Sat, 24 Jul 2010 12:55:15 -0400
Received: from mail.gmx.net (mailout-de.gmx.net [213.165.64.23])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id o6OGt5XM024524
	for <linux-lvm@redhat.com>; Sat, 24 Jul 2010 12:55:06 -0400
From: "Harald Heigl" <Harald_Heigl@gmx.at>
References: <1279942095.12963.1386480183@webmail.messagingengine.com>
In-Reply-To: <1279942095.12963.1386480183@webmail.messagingengine.com>
Date: Sat, 24 Jul 2010 18:54:53 +0200
Message-ID: <001601cb2b50$f13ee4c0$d3bcae40$@at>
MIME-Version: 1.0
Content-Language: de-at
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Disk Partitioning tools, GUI preferably- best for
	LVM Logical Volume Management ; jor
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
Content-Type: text/plain; charset="utf-8"
To: 'LVM general discussion and development' <linux-lvm@redhat.com>


Hi!
>[This list is for all LVM questions, not just RedHat distro questions,
>yes?]

Yes this list is for lvm in general ...

>[BTW, is making that 4th partition a logical one, & putting more
>partitions in there necessary anymore?

The limitation of the 4 partitions is not a linux thing, the "Master Boot
Record" (MBR) is on a single sector on your disk (sectors are usually
512Bytes big), it's a historical thing. The MBR can hold 4 entries and not
more.

>I'd greatly appreciate a competent GUI partitioner.  I only partition
>disks a few times per year, & it's great to have the GUI have the
>commands available to do the partitions ...

As said you may use one drive as pv and divide that into lvs. In Fedora
there is also a gui for lvm, but I didn't use it really, so I can't
recommend it. I always use command-line for this (partitioning (if ever
necessary) with fdisk and lv-commands)

The reasons for dos-partiton as Stuart said:
>3) you are using the grub boot loader, which doesn't speak LVM yet
3) If you have kubuntu 10.04 (I suggest 10.4 is a spell error) you should
have grub2 and therefore it should be lvm-aware even on your boot disk (but
not every distro can handle this, that�s true ...)

Greetings,
Harald Heigl

>-----Urspr�ngliche Nachricht-----
>Von: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
>Im Auftrag von giovanni_re
>Gesendet: Samstag, 24. Juli 2010 05:28
>An: linux-lvm@redhat.com
>Betreff: [linux-lvm] Disk Partitioning tools, GUI preferably- best for
>LVM Logical Volume Management ; jor
>
>What are the best tools (ie sw) for doing disk partitioning?  Preferably
>GUI. but, console mode suggestions welcome if that's best, or all there
>is.
>
>For use in KUbuntu 10.4.
>
>[This list is for all LVM questions, not just RedHat distro questions,
>yes?]
>
>
>==
>KDE 3 used to have qtPartEd, which used to be able to actually _create_
>partitions. That's not in KDE4, ie in KUbuntu 10.4.
>
>I've installed GPartEd, but it can't see into LVs - Logical volumes.
>Thus, it can't _create_ anything there.
>
>I'd greatly appreciate a competent GUI partitioner.  I only partition
>disks a few times per year, & it's great to have the GUI have the
>commands available to do the partitions, so one doesn't have to spend
>the time to keep up on the specifics of commands to deal with new disk
>formats & partitioning methods, & do hand calculations of partitions
>sizes, etc.
>
>
>==
>I installed KU 10.4 with the alternate installer.  I've used the console
>mode installer for many years, probably because it gives me the ability
>to partition my disks well.
>
>I usually put, in order from the beginning, two Linux partititions, a
>swap partition, then make a LVM for the 4th partition. & put a "/home"
>partition there, then leave space for further partitions - like, if i
>want to add another linux partition - so I can set up different distros
>& boot into them.
>
>
>[BTW, is making that 4th partition a logical one, & putting more
>partitions in there necessary anymore? Used to be that disks were
>limited at 4 partitions, & one had to make a big 4th partition & put sub
>partitions inside that.  After all these years - in Linux, can we yet
>put as many partitions as we want without making a logical partition?  I
>think there was a limit of 16 partitions before.  Can more than that be
>done now?]
>
>
>==
>So, I've got that big LV 4th partition, with empty space (2TB drive),
>and now I want to create some more linux partitions so I can install
>some other distros.
>
>But, GPartEd doesn't show what's in the LVM.  And, thus it further can't
>create any partions there.  - It's a tragedy GPartEd isn't better
>maintained.  :(
>
>
>==
>So, what are the easiest tools to create additional partions in Logical
>Volumes?
>
>Thanks :)
>
>==  Join in the Global weekly meetings, via VOIP, about all Free SW HW &
>Culture
>http://sites.google.com/site/berkeleytip/
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
