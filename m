Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0OHrCO26762
	for <linux-lvm@redhat.com>; Mon, 24 Jan 2005 12:53:12 -0500
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.206])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0OHr6UB008734
	for <linux-lvm@redhat.com>; Mon, 24 Jan 2005 12:53:07 -0500
Received: by wproxy.gmail.com with SMTP id 67so179707wri
	for <linux-lvm@redhat.com>; Mon, 24 Jan 2005 09:53:01 -0800 (PST)
Message-ID: <87f94c37050124095332866424@mail.gmail.com>
Date: Mon, 24 Jan 2005 12:53:01 -0500
From: Greg Freemyer <greg.freemyer@gmail.com>
Subject: Re: [linux-lvm] Why the dramatic increase in filesystem performance
	when usingxfs????
In-Reply-To: <20050124113204.B1604791@wobbly.melbourne.sgi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <1106304669.3943.14.camel@grma-lap>
	<87f94c3705012108241f812e0e@mail.gmail.com>
	<20050124113204.B1604791@wobbly.melbourne.sgi.com>
Reply-To: Greg Freemyer <greg.freemyer@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: Nathan Scott <nathans@sgi.com>
Cc: Gary.Mansell@ricardo.com, LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 24 Jan 2005 11:32:05 +1100, Nathan Scott <nathans@sgi.com> wrote:
> On Fri, Jan 21, 2005 at 11:24:29AM -0500, Greg Freemyer wrote:
> > Specifically, I would not recommend XFS for the core filesystems.  i.e
> > /, /var, /usr, etc.  A lot of debug tools still don't support XFS and
> > XFS brings no value to the party.
> 
> Which debug tools are you referring to there?  I've found XFS
> to be an excellent "core" filesystem, but I may be biased. :)
> 
> cheers.
> 
> --
> Nathan
> 
Nathan,

You biased, never.  

One issue I recently saw (last summer) was SUSE 9.1 QC testing failed
to test for XFS capability.

That resulted in a full distro release with no XFS support.  Work
arounds were immediately provided, but none of the CDs that came with
the distro allowed you to boot from the CD and access a XFS
filesystem.

For the test system I was upgrading it was not too bad because XFS was
purely on my data partitions.  (ie. I upgraded the OS and core
filesystems, used YOU to get the online updates, then accessed my
fliesystems.)

If I had my core filesystems under XFS, I'm not sure what the fix
would have been.  Further booting SUSE 9.1 into rescue mode created an
environment that could not mount any of the XFS partitions.

Also, last springs release of Knoppix may have XFS support (I don't
know), but it is so unreliable, I still use the 2-year old version. 
No XFS support there.

Another problem I've recently read about is that XFS on / and software
RAID5 are incompatible.  (I have not tried this.)

Basically, I just don't think the various distros get enough testing
of XFS to use it for core filesystems and if you need to use
distros/repair CDs from 12+ months ago you also have problems with
XFS.

Now a question for you:

I have not read a status update of XFS/snapshots/2.6.x.   Can you tell
me if this is expected to work or not?  (Obviously, I don't care about
'/').

This issue and my percieved lack of confidence in its suppport is one
of the prime reasons my production fileservers are still running 2.4
kernels.

If you think it is working, I'm ready to load SUSE 9.2 onto one of my
test platforms and test the above.  It is easy enough to compile a
2.6.10 vanilla kernel if that is likely to be better than the 2.6.8+
kernel that SUSE distributes.

Thanks
Greg
-- 
Greg Freemyer
