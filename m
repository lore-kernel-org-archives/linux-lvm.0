From: Andreas Dilger <adilger@turbolabs.com>
Date: Thu, 11 Oct 2001 15:37:24 -0600
Subject: Re: [linux-lvm] [PATCH] fix oops when snapshots get full
Message-ID: <20011011153724.J8382@turbolinux.com>
References: <1373740000.1002822576@tiny> <20011011135715.G8382@turbolinux.com> <1532480000.1002834194@tiny>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1532480000.1002834194@tiny>
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

On Oct 11, 2001  17:03 -0400, Chris Mason wrote:
> > 3) The alternative would be to check lv->lv_block_exception inside
> >    lvm_snapshot_remap_block() instead of in the callers (returning "1"
> >    if it is NULL, and we don't want to do remap).  This would avoid any
> >    problems in the future if someone else calls lvm_snapshot_remap_block()
> >    without checking lv_block_exception first.  Untested patch below which
> >    should be equivalent to your previous patch.
> 
> The only thing I don't like about this is that it makes it hides
> the fact that lvm_snapshot_COW and a few other calls depend on 
> block_exception being valid.  The code certainly looks right though,
> just a matter of style.

Well, lvm_snapshot_COW() is only called from one place, AFAICS, which
is in __remap_snapshot() after we call lvm_snapshot_remap_block(), so
we should be OK (could add a comment about this, and also the fact that
you need to hold the lv_lock to call this function in the first place.

Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
