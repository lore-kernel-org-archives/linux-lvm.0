Return-Path: <andrewm@uow.edu.au>
Message-ID: <3B4FBB36.1F692780@uow.edu.au>
Date: Sat, 14 Jul 2001 13:23:34 +1000
From: Andrew Morton <andrewm@uow.edu.au>
MIME-Version: 1.0
References: <200107132041.f6DKfqM8013404@webber.adilger.int> from "Andreas Dilger" at Jul 13, 2001 02:41:52 PM <E15LAGR-0000HX-00@the-village.bc.nu>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: [PATCH] 64 bit scsi read/write
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Andreas Dilger <adilger@turbolinux.com>, "Albert D. Cahalan" <acahalan@cs.uml.edu>, Ben LaHaise <bcrl@redhat.com>, Ragnar Kjxrstad <kernel@ragnark.vestdata.no>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, mike@bigstorage.com, kevin@bigstorage.com, linux-lvm@sistina.com

Alan Cox wrote:
> 
> > RAID 5 throws a wrench into this by not guaranteeing that all of the
> > blocks in a stripe are consistent (you don't know which blocks and/or
> > parity were written and which not).  Ideally, you want a multi-stage
> > commit for RAID as well, so that you write the data first, and the
> > parity afterwards (so on reboot you trust the data first, and not the
> > parity).  You have a problem if there is a bad disk and you crash.
> 
> Well to be honest so does most disk firmware. IDE especially. For one thing
> the logical sector size the drives writes need not match the illusions
> provided upstream, and the write flush commands are frequently not implemented
> because they damage benchmarketing numbers from folks like Zdnet..

If, after a power outage, the IDE disk can keep going for long enough
to write its write cache out to the reserved vendor area (which will
only take 20-30 milliseconds) then the data may be considered *safe*
as soon as it hits writecache.

In which case it is perfectly legitimate and sensible for the drive
to ignore flush commands, and to ack data as soon as it hits cache.

Yes?

If I'm right then the only open question is: which disks do and
do not do the right thing when the lights go out.

-
