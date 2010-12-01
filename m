Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oB1A54C2020408
	for <linux-lvm@redhat.com>; Wed, 1 Dec 2010 05:05:04 -0500
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oB1A4ssI004663
	for <linux-lvm@redhat.com>; Wed, 1 Dec 2010 05:04:54 -0500
Received: from soda.linbit (unknown [10.9.9.55])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 4CDAB10587C8
	for <linux-lvm@redhat.com>; Wed,  1 Dec 2010 11:04:53 +0100 (CET)
Date: Wed, 1 Dec 2010 11:04:53 +0100
From: Lars Ellenberg <lars.ellenberg@linbit.com>
Message-ID: <20101201100453.GD29358@barkeeper1-xen.linbit>
References: <id4tfc$81m$1@dough.gmane.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <id4tfc$81m$1@dough.gmane.org>
Subject: Re: [linux-lvm] lvm2 and partition shringkin: superblock/filesystem
 size mismatch
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

On Wed, Dec 01, 2010 at 08:28:43AM +0100, Johannes Graumann wrote:
> Hi,
> 
> I'm running debian testing and "/home" is an ext3 fs. I run the following 
> order of commands to shrink the fs and the corresponding partition:
> 
> 	e2fsck -f /dev/mapper/mygroup-home
> 	resize2fs /dev/mapper/mygroup-home 55329357
> 	lvreduce -L 208.5g /dev/mapper/mygroup-home

 """
	The  size  parameter specifies the requested new size of the filesystem.
	If no units are specified, the units of the size parameter shall be the
	filesystem blocksize of the filesystem.
 """

 assuming 4k block size,
  55329357 * 4k Byte == 221317428 kB
221317428 / 1024 / 1024
	==> 211.some GiB

You reduced to 208.5, you truncated the file system.
Unless I did get it wrong myself ;)
		    
> The latter was supposed to be .5g bigger than necessary (paranoia regarding 
> the data integrity kicking in).
> 
> "e2fck /dev/mapper/mygroup-home" now stops with superblock/filesystem size 
> mismatch, but I can't grow the fs into the new partition size, as 
> "resize2fs" wants "e2fsck" (stopping with the mismatch) first.
> 
> The fs is mountable and everything seems allright otherwise. 
> 
> Any pointers on how to update the superblock's size statement?

Resize to >= 212g, preferably with the same logical extents mapping to
the same physical extents (look at your meta data backups).
Then fsck again. You may be lucky enough that nothing really was stored
in those truncated 3Gig, or that the PEs have not yet been recycled,
you are able to map them back, and the data that was there is still
there...

-- 
: Lars Ellenberg
: LINBIT | Your Way to High Availability
: DRBD/HA support and consulting http://www.linbit.com

DRBD� and LINBIT� are registered trademarks of LINBIT, Austria.
