Return-Path: <sct@redhat.com>
Date: Fri, 1 Dec 2000 15:06:31 +0000
From: "Stephen C. Tweedie" <sct@redhat.com>
Subject: Re: [linux-lvm] LVM 0.9 snapshot and ext3
Message-ID: <20001201150631.O4978@redhat.com>
References: <20001130094630.E3027@redhat.com> <200011301948.eAUJm6k01893@webber.adilger.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200011301948.eAUJm6k01893@webber.adilger.net>; from adilger@turbolinux.com on Thu, Nov 30, 2000 at 12:48:06PM -0700
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolinux.com>
Cc: "Stephen C. Tweedie" <sct@redhat.com>, linux-lvm@sistina.com, jweber@valinux.com, "Heinz J. Mauelshagen" <mauelshagen@sistina.com>

Hi,

On Thu, Nov 30, 2000 at 12:48:06PM -0700, Andreas Dilger wrote:
> Stephen writes:
> > So, is somebody else doing a read?  It could be ext3, conceivably, if
> > we had had an IO error previously on the buffer and the BH_uptodate
> > flag had been cleared: a subsequent access to the buffer by another
> > process would try to reread the buffer off disk, locking it
> > temporarily.
> 
> Considering that there was the "Bad lvm_map in ll_rw_block" message just
> before the oops, this would lead to the situation you are talking about.
> In ll_rw_block the error path at "sorry:" clears BH_Dirty and BH_Uptodate,
> and calls b_end_io() but does not necessarily unlock the buffer?

The end-io should do the unlock no matter the value of uptodate.  I
should go and check what ext3 is doing on synchronous IO failures,
though.

> *** Stephen, in case of ANY error inside lvm_map() should it unlock the buffer?

ll_rw_block needs to unlock the buffer after the IO is complete, no
matter what the error.  The LVM people will know better than I whether
the lvm_map() function is the right place to do that.

Cheers,
 Stephen
