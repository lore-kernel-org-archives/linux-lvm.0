Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l04BIn32014948
	for <linux-lvm@redhat.com>; Thu, 4 Jan 2007 06:18:49 -0500
Received: from wr-out-0506.google.com (wr-out-0506.google.com [64.233.184.226])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l04BImAh031627
	for <linux-lvm@redhat.com>; Thu, 4 Jan 2007 06:18:48 -0500
Received: by wr-out-0506.google.com with SMTP id i12so2199864wra
	for <linux-lvm@redhat.com>; Thu, 04 Jan 2007 03:18:48 -0800 (PST)
Message-ID: <9b2e66b20701040318y58de1633w1eb0898775f46631@mail.gmail.com>
Date: Thu, 4 Jan 2007 05:18:48 -0600
From: "Adam Tybor" <adam.tybor@gmail.com>
In-Reply-To: <9b2e66b20701031248l405753d5nf811c414ce754f2d@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <9b2e66b20701031248l405753d5nf811c414ce754f2d@mail.gmail.com>
Subject: [linux-lvm] Re: Recovering PV and LG after fdisk or Repartition
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

> I made a huge mistake last night.  I was repartitioning drives in my
> system using fdisk.  I accidentally fdisk the wrong drive, rebooted,
> and lost my lvm2.  In light of this error, I did a dd from the
> original disk to another disk of the exact same geometry before I
> started trying to recover the original.


Just an update, after quotes upwards of $5,000 I decided to call in my
own big guns.  I had one of my friends come over and take a peek.
Within 2 hours he put me in a process to fix the data.

Turns out that metadata which should have resided on sdc1 was actually
at sdc.  This was found after several dd dumps and hexdiffs and the
like.  We were comparing the corrupted disk to good disks which is how
we found the problem.

Lets just say that vgscan
-dvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv provides some very
detailed info which led him in the right direction.

We added new disk, sdb, partitioned it like the previous disk. Then
moved some bits.

dd if=/dev/sdc bs=512 count=6000 of=/dev/sdb1

Upon doing this vgscan found the volume group metadata, but could not
load the vg.  On a side note, using a bs higher than 512 did not work.

Inspecting the logs vgscan found the label at sector 1 but expected it
at sector 2.  Simply adding skip=1 to the dd above did the trick.  The
volume group came up, reiserfs was in shambles, only 3MB of its 100GB
were there, but it was progress :)

Running a final dd of the 130GB of the previous lvm group did the trick.

I am currently copying files off the drive onto another one.  Reiserfs
complains about a couple things, I will need to run a --rebuild-tree
to get at some data, I just want this stuff off of here as soon as
possible.

Cheers,
Adam
