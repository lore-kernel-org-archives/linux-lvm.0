Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9EKB6r14983
	for <linux-lvm@redhat.com>; Thu, 14 Oct 2004 16:11:06 -0400
Received: from webmail-outgoing.us4.outblaze.com
	(webmail-outgoing.us4.outblaze.com [205.158.62.67])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i9EKB0aI007057
	for <linux-lvm@redhat.com>; Thu, 14 Oct 2004 16:11:00 -0400
Received: from wfilter.us4.outblaze.com (wfilter.us4.outblaze.com
	[205.158.62.180])
	by webmail-outgoing.us4.outblaze.com (Postfix) with QMQP id
	781B01805948
	for <linux-lvm@redhat.com>; Thu, 14 Oct 2004 20:10:49 +0000 (GMT)
Content-Disposition: inline
MIME-Version: 1.0
From: "Daniel ." <constantine@soon.com>
Date: Thu, 14 Oct 2004 15:10:48 -0500
Subject: Re: [linux-lvm] How can I restripe LVs on addition of extra PVs?
Message-Id: <20041014201048.C4DED101C9@ws1-3.us4.outblaze.com>
Content-Transfer-Encoding: 8bit
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
To: linux-lvm@redhat.com

 
----- Original Message ----- 
From: AJ Lewis <alewis@redhat.com> 
To: LVM general discussion and development <linux-lvm@redhat.com> 
Subject: Re: [linux-lvm] How can I restripe LVs on addition of extra PVs? 
Date: 14 Oct 2004 08:52:36 -0500 
 
>  
> Clint Byrum <cbyrum@spamaps.org> writes: 
>  
> > On Wednesday, October 13, 2004, at 06:12 PM, Daniel . wrote: 
> >  
> > > Hi, 
> > > 
> > > [I'm only familiar with LVM1, so that's what I'm referring to in the 
> > > rest of the mail.  I probably could move to LVM2 if it solves my 
> > > problems.] 
> > > 
> > > I'm planning on using LVM to create LVs striped across multiple PVs 
> > > (which, incidentally, are RAID 1 mirrorred partitions). 
> > > In the future I will need to add extra PVs to the VG and extend the 
> > > LVs. 
> > > 
> >  
> > This just came up in #lvm on freenode today. I don't think this is at 
> > all possible with LVM1. Once the striping is done for an LV, that LV 
> > cannot be extended past the physical extents that were allocated at 
> > that time. 
> >  
> > However, with LVM2, you could write a script to do this by manually 
> > running pvmove over and over, doing something like "pvmove dev:1-8 
> > otherdev;pvmove otherdev:1-8 dev;" .. It gets rather complex to figure 
> > this out on the cmdline, but I do believe it can be done and you would 
> > end up with PE's evenly spread out over all PVs. 
> >  
> > Somebody tell me this is wrong and stupid before I try it. ;) 
>  
> One problem I see with doing this is that your LVM metadata is going 
> to get rather large after you've done this.  Because you're mucking 
> with the segments through pvmove, lvm doesn't know that you're trying 
> to convert a stripe set of 2 to a stripe set of 4 or whatever.  I'm 
> not positive, but it seems like this could be a problem. 
 
Can't comment on the metadata issues... 
Being able to change a LV to stripe across a different number of PVs seems a necessity to me, and impossible to do (at least with LVM1). 
 
>  
> Also, remember that stripe size is different then segment size, and 
> segment size is the level at which pvmove manipulates things.  So 
> that's probably not going to do what you want it to. 
 
Though, as I understand it, any extents allocated from within the segments being moved are reallocated according to the allocation policy of the LV to which they 
belong.  So, putting aside the inablity to change the stripe set size, pvmoving repeatedly should end up with the LVs extents allocated roughly evenly over all the PVs 
(maybe all-1 PVs?).  Though the extents will probably be scattered more than striped. 
 
In any event, it all sounds a bit dodgy, especially seen I was going to do the striping with LVM to make management easier. 
It sounds like using EVMS to manage mirroring through md, then striping through md, then sizing through LVM will be less of a headache.  And md allows stripe sizes 
greater than 512KB which I'd prefer. 
 
Thanks for you comments, all. 
 
Daniel 
-- 
___________________________________________________________
Sign-up for Ads Free at Mail.com
http://promo.mail.com/adsfreejump.htm
