Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i66M1E014157
	for <linux-lvm@redhat.com>; Tue, 6 Jul 2004 18:01:14 -0400
Received: from e6.ny.us.ibm.com (e6.ny.us.ibm.com [32.97.182.106])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i66M18Xn001679
	for <linux-lvm@redhat.com>; Tue, 6 Jul 2004 18:01:08 -0400
From: Kevin Corry <kevcorry@us.ibm.com>
Subject: Re: [linux-lvm] dm kernel patch size
Date: Tue, 6 Jul 2004 17:01:22 -0500
References: <20040706191502.GL11597@polop.usc.edu>
	<20040706211738.GM30186@agk.surrey.redhat.com>
	<20040706214428.GW11597@polop.usc.edu>
In-Reply-To: <20040706214428.GW11597@polop.usc.edu>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Message-Id: <200407061701.22476.kevcorry@us.ibm.com>
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

On Tuesday 06 July 2004 4:44 pm, Garrick Staples wrote:
> On Tue, Jul 06, 2004 at 10:17:38PM +0100, Alasdair G Kergon alleged:
> > On Tue, Jul 06, 2004 at 01:56:23PM -0700, Garrick Staples wrote:
> > > Do the dm targets require the mm patchset?  Is it possible to get
> > > _just_ the new dm targets?
> >
> > Yes - instead of applying the entire included -mm patch, take the dm
> > patches from the "broken out" version on his website:
> >
> >   http://www.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/
> >
> > [Or work from Linus's bk tree, if you just want snapshot and pvmove.]
>
> The only dm-related patch in 2.6.7-mm6 that I can see is the new IO barrier
> patch.

It's all part of the "linus.patch", which is most likely a recent -bk patch.

> I don't want to follow any development trees, including Linus'.  Can I get
> just the dm targets for 2.6.7 vanilla kernel.org?

You might be able to patch a temporary 2.6.7 kernel with 2.6.7-udm1, and then 
copy over the contents of drivers/md/ to your non-mm tree. I don't *think* 
there are any affected files outside of drivers/md/ (maybe 
include/linux/device-mapper.h and dm-ioctl.h), but don't quote me on that. :)

-- 
Kevin Corry
kevcorry@us.ibm.com
http://evms.sourceforge.net/
