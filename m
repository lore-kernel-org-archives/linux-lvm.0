Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iADB3Br26554
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2004 06:03:11 -0500
Received: from mta2.cl.cam.ac.uk
	(IDENT:z27XPeY+n6ct+vMM6SOtIYluhsb3HksF@mta2.cl.cam.ac.uk
	[128.232.0.14])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iADB34Ne028966
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2004 06:03:09 -0500
Subject: Re: [linux-lvm] Re: raid 1 on a single disk 
In-Reply-To: Message from ashwin chaugule <ashwin.chaugule@gmail.com> of "Sat,
	13 Nov 2004 16:11:08 +0530." <89af10f90411130241e20e2c2@mail.gmail.com>
References: <89af10f90411130217467c439@mail.gmail.com> 
	<lg4h62-8vg.ln1@news.it.uc3m.es>
	<89af10f90411130241e20e2c2@mail.gmail.com>
Mime-Version: 1.0
Date: Sat, 13 Nov 2004 11:03:00 +0000
From: Piete Brooks <Piete.Brooks@cl.cam.ac.uk>
Message-Id: <E1CSvgK-0005J4-00@mta2.cl.cam.ac.uk>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ashwin chaugule <ashwin.chaugule@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>

> yes i know its silly ... im doing what im told to do :p

Don't.

Part of your job is to try to work out what they *meant* to tell you.

Explain what they are asking you to do (I've not yet grasped it), explain the 
problems with it (e.g. if the disk fails, all is lost), and offer suggestions 
as to what they might have wanted.

> ok so, i also do know, its performance is going to suck !

Yes.

And what's the point?
It will protect against a single bad block, but not a disc failure.

> but i was under the impression that RAID 1 works on more that one disks only.

RAID doesn't know about discs (much -- it does try not to RESYNC multiple 
partitions on a single disc at once, as it causes head thrashing) -- it just 
deals in partitions. It doesn't care where they are.

But regardless of that, RAID1 is quite happy to run using a single partition

	mdadm -C -l1 -n2 /dev/md1 /dev/hda1 missing

> so you mean to say that, the linux RAID / md tools support raid 1 on
> multiple partitiions of the same disk ?

It doesn't care!
