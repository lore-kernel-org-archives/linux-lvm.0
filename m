Date: Thu, 11 Oct 2001 17:03:14 -0400
From: Chris Mason <mason@suse.com>
Subject: Re: [linux-lvm] [PATCH] fix oops when snapshots get full
Message-ID: <1532480000.1002834194@tiny>
In-Reply-To: <20011011135715.G8382@turbolinux.com>
References: <1373740000.1002822576@tiny> <20011011135715.G8382@turbolinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
To: linux-lvm@sistina.com


On Thursday, October 11, 2001 01:57:15 PM -0600 Andreas Dilger <adilger@turbolabs.com> wrote:


> I was looking at this, and thought the following:
> 
> 1) Shouldn't we just initialize r=1 in _remap_snapshot(), and then if
>    lv->lv_block_exception is NULL we will not enter __remap_snapshot()
>    at all?  That would remove the need to get the write semaphore for
>    no reason.

Good point.

> 2) Initially, I thought we could just "optimize" the checking of
>    lv->lv_block_exception, but I supposed there are race conditions
>    in dropping the read lock and getting the write lock, so I guess
>    we still need to check lv->lv_block_exception in __remap_snapshot()
>    also?

Yes, I think we do.

> 3) The alternative would be to check lv->lv_block_exception inside
>    lvm_snapshot_remap_block() instead of in the callers (returning "1"
>    if it is NULL, and we don't want to do remap).  This would avoid any
>    problems in the future if someone else calls lvm_snapshot_remap_block()
>    without checking lv_block_exception first.  Untested patch below which
>    should be equivalent to your previous patch.

The only thing I don't like about this is that it makes it hides
the fact that lvm_snapshot_COW and a few other calls depend on 
block_exception being valid.  The code certainly looks right though,
just a matter of style.

thanks,
Chris
