Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1S6rMK23551
	for <linux-lvm@redhat.com>; Mon, 28 Feb 2005 01:53:22 -0500
Received: from Datawav.net ([63.228.244.4])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j1S6rJEf028037
	for <linux-lvm@redhat.com>; Mon, 28 Feb 2005 01:53:20 -0500
Message-ID: <4222BFD9.7010808@theserrs.net>
Date: Sun, 27 Feb 2005 23:53:13 -0700
From: Scott Serr <serrs@theserrs.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm over raid5 - sizes
References: <4222541B.40206@theserrs.net> <4222A7CA.8020508@vilain.net>
In-Reply-To: <4222A7CA.8020508@vilain.net>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Sam Vilain wrote:

> Scott Serr wrote:
> > I have alot of ideas going through my head.  Here is my situation:
> >
> > I've had 5 IDEs with 4 partitions each.  Each partition is in a RAID5
> > md:stripped.
> > md0 = hda5, hdb5, hdc5, hdd5, hde5
> > md1 = hda6, hdb6, hdc6, hdd6, hde6
> > md2 = hda7, hdb7, hdc7, hdd7
> > md3 = hda8, hdb8, hdc8, hdd8
> >
> > md0-3 are in an LVM2 volume group.  This makes it really nice when
> > expanding or adding another disk because I just pull say md3 out of the
> > volume group... rebuild md3 bigger and then add it back.
> > I just upgraded, replacing hde with a bigger disk and while the pvmoves
> > are taking FOREVER...  I thought what is the right size for the RAID5
> > chunk-size?
> >
> > I have chunk-size = 128k right now.
> >
> > The pv extents size is (always?) 4MB.
> >
> > Am I just shooting myself in the foot by not making my RAID chunk size
> > atleast 1MB?  Can someone give me a reason to increase it?
>
>
> You're shooting yourself in the foot with RAID 5 and a crazy setup like
> this in the first place.  I sure hope this isn't for a production box :)
>
> Just get more disks and use RAID 1.  It's faster, simpler, and more
> robust.  You can still do all of the tricks that you're looking for.
>
> Hey, maybe one of the disks has failed.  Standard RAID 5 behaviour as
> designed in this case is to slow to a crawl.  Alternatively maybe you're
> just experiencing what is known in the 'biz as "The Butterfly Effect".
>
> With most striping, keep the chunk size as large as possible.  It's a
> real waste to spend 10ms waiting for the disk platter to rotate, and then
> only read 128kB of data.  Set it as high as possible.

It's just a home server.  I don't need alot of speed, but I rather have 
it sorta optimized.  This is as many disks that will fit in my PowerEdge 
400SC, and it's my own money... so these are the reasons for not having 
RAID1 with more disks.  Thanks for the tips though, I will try to up the 
size.  I couldn't find anything on google about Butterfly Effect - do 
you have any links?

The disks (during the pvmove) sound like they sketch around ALOT.  I 
suppose if I had 1MB chunks this would cut down the seeks by 1/8th.  ;)

My requirements for this disk system:
- not loose data if one disk goes south.
- expand filesystems as I get bigger disks. 
- maximize available disk space, limit cost.
- room for 5 disks

I'm open to suggestions that are less complicated.
