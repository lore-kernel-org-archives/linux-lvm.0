Received: from null.msp.redhat.com (null.msp.redhat.com [172.16.31.120])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id i9EDqbir024275
	for <linux-lvm@redhat.com>; Thu, 14 Oct 2004 09:52:37 -0400
Sender: alewis@redhat.com
Subject: Re: [linux-lvm] How can I restripe LVs on addition of extra PVs?
References: <mailman.10762.1097732995.3231.linux-lvm@redhat.com>
From: AJ Lewis <alewis@redhat.com>
Date: 14 Oct 2004 08:52:36 -0500
In-Reply-To: <mailman.10762.1097732995.3231.linux-lvm@redhat.com>
Message-ID: <x053c0h4daz.fsf@null.msp.redhat.com>
MIME-Version: 1.0
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Clint Byrum <cbyrum@spamaps.org> writes:

> On Wednesday, October 13, 2004, at 06:12 PM, Daniel . wrote:
> 
> > Hi,
> >
> > [I'm only familiar with LVM1, so that's what I'm referring to in the
> > rest of the mail.  I probably could move to LVM2 if it solves my
> > problems.]
> >
> > I'm planning on using LVM to create LVs striped across multiple PVs
> > (which, incidentally, are RAID 1 mirrorred partitions).
> > In the future I will need to add extra PVs to the VG and extend the
> > LVs.
> >
> 
> This just came up in #lvm on freenode today. I don't think this is at
> all possible with LVM1. Once the striping is done for an LV, that LV
> cannot be extended past the physical extents that were allocated at
> that time.
> 
> However, with LVM2, you could write a script to do this by manually
> running pvmove over and over, doing something like "pvmove dev:1-8
> otherdev;pvmove otherdev:1-8 dev;" .. It gets rather complex to figure
> this out on the cmdline, but I do believe it can be done and you would
> end up with PE's evenly spread out over all PVs.
> 
> Somebody tell me this is wrong and stupid before I try it. ;)

One problem I see with doing this is that your LVM metadata is going
to get rather large after you've done this.  Because you're mucking
with the segments through pvmove, lvm doesn't know that you're trying
to convert a stripe set of 2 to a stripe set of 4 or whatever.  I'm
not positive, but it seems like this could be a problem.

Also, remember that stripe size is different then segment size, and
segment size is the level at which pvmove manipulates things.  So
that's probably not going to do what you want it to.

Regards,
-- 
AJ Lewis                                   Voice:  612-638-0500
Red Hat Inc.                               E-Mail: alewis@redhat.com
720 Washington Ave. SE, Suite 200
Minneapolis, MN 55414
   
Current GPG fingerprint = D9F8 EDCE 4242 855F A03D  9B63 F50C 54A8 578C 8715
Grab the key at: http://people.redhat.com/alewis/gpg.html or one of the
many keyservers out there...
