Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Wed, 7 Feb 2001 13:45:49 +0000
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] lvm buglet in 0.9.1_beta
Message-ID: <20010207134549.E525@tykepenguin.com>
References: <20010206093700.A528@tykepenguin.com> <200102070845.f178jXs23806@webber.adilger.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200102070845.f178jXs23806@webber.adilger.net>; from adilger@turbolinux.com on Wed, Feb 07, 2001 at 01:45:32AM -0700
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Feb 07, 2001 at 01:45:32AM -0700, Andreas Dilger wrote:
> Patrick Caulfield writes:
> > It probably just needs COMPAQ_SMART2_MAJOR (& COMPAQ_SMART_MAJOR[1-7])
> > adding into the list in lvm_check_partitioned_dev.c. It's already in
> > lvm_check_dev.c so I suspect it's just an oversight.
> 
> It may not be exactly this.  AFAIK, when we call lvm_check_partitioned_dev()
> when we are scanning disks, I think this determines if LVM will start doing
> the gross DOS partition stuff.  Is it the case with these COMPAQ devices
> that they use DOS partitions?

I'm not sure - that's why I asked the user to test it for me! Anyway you can
partition any block device you like - or even a file :-)
 
> IMHO, it should be possible (CONFIG_ flag or so) to simply turn off LVM
> partition grubbing, and stick with what we get from /proc/partitions and
> /dev scanning.  The only reason we do this, AFAIK, is to check the LVM
> partition type in DOS partition table, but it causes bug reports too.

We have some half-formed plans here.
 
> In any case, while you are in there, can you add COMPAQ_CISS_MAJOR + [1-7]
> also.  This is basically the same thing as COMPAQ_SMART_MAJOR.  It will
> avoid yet another similar bug report on this in the future.

OK.

patrick
