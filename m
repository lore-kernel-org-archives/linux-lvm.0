Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102071815.f17IFtN14302@webber.adilger.net>
Subject: Re: [linux-lvm] lvm buglet in 0.9.1_beta
In-Reply-To: <20010207134549.E525@tykepenguin.com> from Patrick Caulfield at
 "Feb 7, 2001 01:45:49 pm"
Date: Wed, 7 Feb 2001 11:15:55 -0700 (MST)
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

Patrick, you write:
> On Wed, Feb 07, 2001 at 01:45:32AM -0700, Andreas Dilger wrote:
> > It may not be exactly this.  AFAIK, when we call lvm_check_partitioned_dev()
> > when we are scanning disks, I think this determines if LVM will start doing
> > the gross DOS partition stuff.  Is it the case with these COMPAQ devices
> > that they use DOS partitions?
> 
> I'm not sure - that's why I asked the user to test it for me! Anyway you can
> partition any block device you like - or even a file :-)

Sure you can run fdisk on just about anything, but you can't access the
partitions unless it is a partitioned device (i.e. the minor numbers
mean "look at a partition").

> > In any case, while you are in there, can you add COMPAQ_CISS_MAJOR + [1-7]
> > also.  This is basically the same thing as COMPAQ_SMART_MAJOR.  It will
> > avoid yet another similar bug report on this in the future.
> 
> OK.

You also need to add "/dev/cciss" to lvm_dir_cache.c"

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
