Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102081838.f18Icgf11614@webber.adilger.net>
Subject: Re: [linux-lvm] lvm buglet in 0.9.1_beta
In-Reply-To: <20010208091418.A529@tykepenguin.com> from Patrick Caulfield at
 "Feb 8, 2001 09:14:18 am"
Date: Thu, 8 Feb 2001 11:38:42 -0700 (MST)
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
> On Wed, Feb 07, 2001 at 11:15:55AM -0700, Andreas Dilger wrote:
> > Sure you can run fdisk on just about anything, but you can't access the
> > partitions unless it is a partitioned device (i.e. the minor numbers
> > mean "look at a partition").
> 
> I wasn't being entirely serious here, but the original bug report had 
> a /proc/partitions file showing several minors attached to major 72 so
> it seemed reasonable to me that it was partitioned.

There is a problem, IMHO, that LVM assumes a partitioned device is the
same thing as a DOS partitioned device.  I'm sure that anyone using
BSD/Sun/SGI/etc disklabels can not use LVM for this reason.  The only
reason LVM does this is to check the partition type (not very important
IMO), otherwise we could just check /proc/partitions and be done, like
the #ifdef __alpha__ code.

> It would be nice to know if adding the entries into lvm_check_partitioned_dev
> did actually fix the problem.

I would like to know as well.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
