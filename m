Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3TG0tO16216
	for <linux-lvm@redhat.com>; Fri, 29 Apr 2005 12:00:55 -0400
Received: from basie.internet2.edu (basie.internet2.edu [207.75.164.22])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j3TG0kow014991
	for <linux-lvm@redhat.com>; Fri, 29 Apr 2005 12:00:46 -0400
Received: from localhost (unknown [127.0.0.1])
	by basie.internet2.edu (Postfix) with ESMTP id 667C41CDC75
	for <linux-lvm@redhat.com>; Fri, 29 Apr 2005 12:00:45 -0400 (EDT)
Received: from basie.internet2.edu ([127.0.0.1])
	by localhost (basie.internet2.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13828-03 for <linux-lvm@redhat.com>;
	Fri, 29 Apr 2005 12:00:45 -0400 (EDT)
Date: Fri, 29 Apr 2005 12:00:45 -0400
From: Dan Pritts <danno@internet2.edu>
Subject: Re: [linux-lvm] Data corruption on large, multi-device filesystem
Message-ID: <20050429160045.GA11717@internet2.edu>
References: <20050118091059.GC27553@pcnocjb.dlan.cinetic.de>
	<1106172883.41eedbd386498@www.eiler.net>
	<20050120165317.GA14093@agk.surrey.redhat.com>
	<1106275121.41f06b3135b75@www.eiler.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1106275121.41f06b3135b75@www.eiler.net>
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

Hi folks - I'm new to the list and to the Linux LVM.

I believe I've just run into the same problem described in this thread from 
back in January. 

x86_64 dell, redhat AS 4, kernel 2.6.9 (redhat source, self-compiled to
add xfs) with two ~5TB RAIDs that I'm striping with LVM.  
(it's really the same RAID presenting two LUNs over two parallel fibre
channel busses.)

About 4TB into a "dd if=/dev/zero of=testfile" the filesystem (XFS) started
complaining bitterly of errors.

On the other hand I can write a full 5TB of zero into an XFS created on
one of the raw devices with no errors.

Both XFS & the dm code in the kernel seem to have had some non-trivial updates
between 2.6.9 from redhat and 2.6.11.7, so i'm compiling that now.

Is it believed that this problem should be fixed in the mainline kernel
or are there other LVM patches I should apply?

Also, seems to be a FAQ on this list but my search of the archives didn't
show any definitive answer - is it true that there are no large device
limits with LVM2/device mapper?  

thanks
danno

On Thu, Jan 20, 2005 at 06:38:41PM -0800, joe@eiler.net wrote:
> Thanks, I'll give it(the patch you sent) a try and let you know what I see.
> 
> When you say "chunk size" what lvcreate arg does that map to? the stripe
> size(-I) or the chunk size(-c) that goes along with snapshots?
> 
> Joe
> 
> Quoting Alasdair G Kergon <agk@redhat.com>:
> 
> > On Wed, Jan 19, 2005 at 02:14:43PM -0800, joe@eiler.net wrote:
> > > I don't see any corruption on the files unless I specify the -i option to
> > > lvcreate.
> >
> > That's a useful observation: different code gets run when -i is used, and
> > I've taken a look and there are two 32-bit limits in that code.
> >
> > One appears to be intentional for performance reasons and can be worked
> > around by increasing the chunk size (default 64K), though it really should
> > detect when the limit is exceeded and tell you!
> >
> > The other unintentional limit (which is the one affecting you I think)
> > leads to wrap-around at striped device offsets beyond ~2^32 sectors
> > i.e. 2^39 bytes into a PV, or ~2^40 bytes (2TB) into an LV in your
> > case of 2 stripes.  The fix for that is a basic exercise in C.
> > [Ref.  stripe_map() in drivers/md/dm-stripe.c]
> >
> > Alasdair
> > --
> > agk@redhat.com
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >
> 
> 


danno
--
dan pritts - systems administrator - internet2
734/352-4953 office        734/834-7224 mobile
