From: Andreas Dilger <adilger@turbolabs.com>
Date: Thu, 11 Oct 2001 14:56:11 -0600
Subject: Re: [linux-lvm] [PATCH] snapshots on unaligned lvs
Message-ID: <20011011145611.H8382@turbolinux.com>
References: <1383150000.1002824196@tiny>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1383150000.1002824196@tiny>
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

On Oct 11, 2001  14:16 -0400, Chris Mason wrote:
> @@ -360,8 +361,14 @@
>  
>  	iobuf = lv_snap->lv_iobuf;
>  
> -	blksize_org = lvm_get_blksize(org_phys_dev);
> -	blksize_snap = lvm_get_blksize(snap_phys_dev);
> +	blksize_org = get_hardsect_size(org_phys_dev);
> +	blksize_snap = get_hardsect_size(snap_phys_dev);

FYI - there is now a helper function "lvm_sectsize()" which is defined
appropriately for a given kernel version to call get_hardsect_size()
or get_hardblock_size().  I originally put it directly in lvm.c because
that was the only place we used it, but it should move to lvm-internal.h
instead.

I won't check in this patch until I at least hear some Yea's as I can't
do any testing on it myself right now.  Of course the Sistina folks are
free to test/commit it as well.

Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
