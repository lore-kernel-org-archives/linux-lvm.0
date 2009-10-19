Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9JJq4p4024454
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2009 15:52:04 -0400
Received: from mail-yx0-f183.google.com (mail-yx0-f183.google.com
	[209.85.210.183])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9JJpsWH001540
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2009 15:51:54 -0400
Received: by yxe13 with SMTP id 13so4039197yxe.23
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2009 12:51:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <a5a956f70910191200t340c02c2t28f14d3aef46cfdc@mail.gmail.com>
References: <a5a956f70910190752m19843bc8x264a79c93c0cde41@mail.gmail.com> 
	<c268e4660910191103x606dd07nf89aee516f8756c9@mail.gmail.com> 
	<a5a956f70910191114r3025ec45r5ddb2e02620fb0c0@mail.gmail.com> 
	<c268e4660910191141s5c5f3e1lf422c67f7f8bf423@mail.gmail.com> 
	<a5a956f70910191200t340c02c2t28f14d3aef46cfdc@mail.gmail.com>
From: Drew <drew.kay@gmail.com>
Date: Mon, 19 Oct 2009 12:51:34 -0700
Message-ID: <c268e4660910191251x485888edm470b67a1999d5241@mail.gmail.com>
Subject: Re: [linux-lvm] Total free space using added VGs and LVs
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
Content-Transfer-Encoding: 7bit
To: Lou Arnold <larnolda1@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

>> > 1) Why would you want several logical volumes in one volume group?
>>
>> The same reason(s) you would want to partition a regular hard drive.
>>
>> Maybe you only want /home to have 20GB so your kids can't flood the
>> computer with downloaded music. Maybe you want /var/www to have
>> restricted permissions so your home web server is less vulnerable to
>> hackers. Maybe you're running a PVR application like MythTV and want a
>> high-performance filesystem like XFS for storing recorded shows.
>>
>> All of these can be done with logical volumes, and are often easier under
>> LVM.
>
>
> But then if the above is true, then you may as well simply mount the
> partition as normal and add an entry into the fstab file. You get no
> advantage one way or the other - is that true?

LVM does this better then regular disk partitioning. The fact that it
creates a pool of space is it's power.

Two examples.

Let's say you don't have LVM and partitioned your disk with some
leftover space. What happens if you change your mind and want to
increase the size of a partition? Now you have to juggle the
partitions on the disk while you move that free space around to a
place where the partition can be extended. I've done it before and
it's messy. LVM? Just use the lvextend command with the right
parameters and you're done.

Next. Say you have two 80GB disks each partitioned with two partitions
60GB & 20GB. Now say you need to add an extra partition 30GB in size.
How? With regular disks, you pretty much can't. With LVM, you'd have
40GB free and can just create the 30GB logical volume without worrying
about which disk.

As a side note, can you cc: the LVM list when you reply? I don't think
they're getting your side of this conversation.


-- 
Drew

"Nothing in life is to be feared. It is only to be understood."
--Marie Curie
