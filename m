From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200009010801.CAA05065@lynx.turbolabs.com>
Subject: Re: [linux-lvm] Dazed & Confused
Date: Fri, 1 Sep 2000 02:01:41 -0600 (MDT)
In-Reply-To: <Pine.LNX.4.21.0008311508270.898-100000@freak.distro.conectiva> from "Marcelo Tosatti" at Aug 31, 2000 03:15:16 PM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Marcelo Tosatti <marcelo@conectiva.com.br>
Cc: linux-lvm@msede.com

Marcelo Tosatti, writes:
> While looking at your patch I found something which seems to be wrong. 
> 
> The function lvm_snapshot_COW returns 1 on success. lvm_map() returns  
> lvm_snapshot_COW() return code. ll_rw_block calls lvm_map_ptr() (which is
> lvm_map()) and expects 0 on success: 
> 
> +                       if ((lvm_map_ptr) (bh[i], rw) != 0) {
> +                               printk(KERN_ERR
> +                                      "Bad lvm_map in ll_rw_block\n");
> +                               goto sorry;
> +                       }

You are correct.  I think that I had changed lvm-snap.c at one time so
that lvm_snapshot_COW() returned 0 on success like normal kernel
functions, but those changes were lost.  Just change the "return 1" to
"return 0" on line 290 of lvm-snap.c.

Note however, that this is exactly opposite of what is done in 2.4 code.

Cheers, Andreas
