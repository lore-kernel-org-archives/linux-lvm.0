Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102070845.f178jXs23806@webber.adilger.net>
Subject: Re: [linux-lvm] lvm buglet in 0.9.1_beta
In-Reply-To: <20010206093700.A528@tykepenguin.com> from Patrick Caulfield at
 "Feb 6, 2001 09:37:00 am"
Date: Wed, 7 Feb 2001 01:45:32 -0700 (MST)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Patrick Caulfield writes:
> It probably just needs COMPAQ_SMART2_MAJOR (& COMPAQ_SMART_MAJOR[1-7])
> adding into the list in lvm_check_partitioned_dev.c. It's already in
> lvm_check_dev.c so I suspect it's just an oversight.

It may not be exactly this.  AFAIK, when we call lvm_check_partitioned_dev()
when we are scanning disks, I think this determines if LVM will start doing
the gross DOS partition stuff.  Is it the case with these COMPAQ devices
that they use DOS partitions?

IMHO, it should be possible (CONFIG_ flag or so) to simply turn off LVM
partition grubbing, and stick with what we get from /proc/partitions and
/dev scanning.  The only reason we do this, AFAIK, is to check the LVM
partition type in DOS partition table, but it causes bug reports too.

In any case, while you are in there, can you add COMPAQ_CISS_MAJOR + [1-7]
also.  This is basically the same thing as COMPAQ_SMART_MAJOR.  It will
avoid yet another similar bug report on this in the future.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
