Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7FFV4b7019463
	for <linux-lvm@redhat.com>; Tue, 15 Aug 2006 11:31:04 -0400
Received: from cobalt0.panici.net (cobalt0.panici.net [207.234.248.139])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7FFV3sL019824
	for <linux-lvm@redhat.com>; Tue, 15 Aug 2006 11:31:03 -0400
Received: (from padski@localhost)
	by cobalt0.panici.net (8.10.2/8.10.2) id k7FFV0C12790
	for linux-lvm@redhat.com; Tue, 15 Aug 2006 16:31:00 +0100
Date: Tue, 15 Aug 2006 16:31:00 +0100
From: paddy <paddy@panici.net>
Subject: Re: [linux-lvm] expanded volume
Message-ID: <20060815153034.GA4048@cobalt0.panici.net>
References: <44E1AB70.8080702@arnet.net.ar>
	<20060815114516.GA16285@cobalt0.panici.net>
	<44E1B9DB.3030403@arnet.net.ar>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <44E1B9DB.3030403@arnet.net.ar>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Aug 15, 2006 at 09:11:07AM -0300, German Staltari wrote:
> paddy wrote:
> >On Tue, Aug 15, 2006 at 08:09:36AM -0300, German Staltari wrote:
> >  
> >>Hi, I've expanded a LV but the disks that I've added to the LV/VG are 
> >>not being used (the I/Os to this disks are almost null and the old ones 
> >>still with high I/Os). Is there a way to force I/O to the new disks?
> >>    
> >
> >did you resize the filesystem? what filesystem(s) are you using?
> >
> >Regards,
> >Paddy
> >  
> Yes, the FS was resized. I'm using ext3.

ok.  I would think that where on the volume the IO goes is a matter of 
the block allocation in ext3.  I'm not intimately familiar with this,
but, IIRC, it is optimised around making files contiguous and keeping
the locality of files and directories that are close together in the
directory tree close together on disk (sort of).

I would guess that the resize2fs program doesn't move the existing 
data about, but simply adds more space at the end, at which point
the allocation pattern that you had is now fairly lop-sided, and
new writes are going to tend to be close to the old ones in a lot
of cases.

I'm not sure on what a good solution for your problem is, and you 
will need to apply your knowledge of what the system is doing, but
one suggestion would be to move stuff about to try to get the
allocation better spread out on the volume.  In order to do that
I would think you're going to need to make copies and then delete
the originals, rather than just changing a few dirents.

It might be that you could usefully apply some defrag utility.
It would depend on whether the defragger is looking at the
overall pattern of allocation or just local contiguity.
I think there may be such for at least ext2, but I have no
experience with any.

Another possibility might be to move LEs from one disk to the
other.  can pvmove be used to do this ? Was your filesystem
formatted with a stripe-size option (and how much does it 
matter) ?

An amount of hand-waving, I know, but I hope it helps :-)

Regards,
Paddy
-- 
Perl 6 will give you the big knob. -- Larry Wall
