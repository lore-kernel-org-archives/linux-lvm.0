Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0OLtnO07700
	for <linux-lvm@redhat.com>; Mon, 24 Jan 2005 16:55:49 -0500
Received: from omx3.sgi.com (omx3-ext.sgi.com [192.48.171.20])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j0OLtmPu026647
	for <linux-lvm@redhat.com>; Mon, 24 Jan 2005 16:55:49 -0500
Date: Tue, 25 Jan 2005 08:55:26 +1100
From: Nathan Scott <nathans@sgi.com>
Subject: Re: [linux-lvm] Why the dramatic increase in filesystem performance
	when usingxfs????
Message-ID: <20050125085526.B1628305@wobbly.melbourne.sgi.com>
References: <1106304669.3943.14.camel@grma-lap>
	<87f94c3705012108241f812e0e@mail.gmail.com>
	<20050124113204.B1604791@wobbly.melbourne.sgi.com>
	<87f94c37050124095332866424@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87f94c37050124095332866424@mail.gmail.com>;
	from greg.freemyer@gmail.com on Mon, Jan 24, 2005 at 12:53:01PM
	-0500
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
To: Greg Freemyer <greg.freemyer@gmail.com>
Cc: Gary.Mansell@ricardo.com, LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Jan 24, 2005 at 12:53:01PM -0500, Greg Freemyer wrote:
> 
> You biased, never.  

;-)

> One issue I recently saw (last summer) was SUSE 9.1 QC testing failed
> to test for XFS capability.

Ugh, don't remind me.  :|

> If I had my core filesystems under XFS, I'm not sure what the fix
> would have been.  Further booting SUSE 9.1 into rescue mode created an
> environment that could not mount any of the XFS partitions.

There'll be a supported patch by nowsure.  It was not an XFS fix,
so lets just leave it there.  You should expect that distribution
to get alot better wrt XFS in upcoming releases, as they actively
work with us on supporting XFS nowadays.

> Also, last springs release of Knoppix may have XFS support (I don't
> know), but it is so unreliable, I still use the 2-year old version. 
> No XFS support there.

Hmm (looks aside into desk draw) - I have Knoppix 1.0 and it's a
wonderful thing with complete XFS support.  Pretty sure thats at
least a couple of years old, so not sure what you've got there?
Knoppix has supported XFS for as long as I can remember.

> Another problem I've recently read about is that XFS on / and software
> RAID5 are incompatible.  (I have not tried this.)

That is not correct.

> Basically, I just don't think the various distros get enough testing
> of XFS to use it for core filesystems and if you need to use
> distros/repair CDs from 12+ months ago you also have problems with
> XFS.

Some are better than others.  :)

FWIW, all systems that SGI ship to customers and support in the
field use XFS as the primary filesystem.

> Now a question for you:
> 
> I have not read a status update of XFS/snapshots/2.6.x.   Can you tell
> me if this is expected to work or not?  (Obviously, I don't care about
> '/').

Hmm, off the top of my head, not sure - does that test you wrote
function on device mapper?; I should find time to look into that.
I remember Christoph doing some work to tie XFS into the 2.6 API
once that was merged, but I haven't needed to look at it since.
If there are problems, send details to us on the linux-xfs list.

cheers.

-- 
Nathan
