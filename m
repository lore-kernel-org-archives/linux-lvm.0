Return-Path: <dalecki@evision-ventures.com>
Message-ID: <3AE42B9D.AAEDD666@evision-ventures.com>
Date: Mon, 23 Apr 2001 15:18:21 +0200
From: Martin Dalecki <dalecki@evision-ventures.com>
MIME-Version: 1.0
References: <Pine.LNX.4.33.0104232109570.326-100000@boston.corp.fedex.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: [BUG] lvm beta7 and ac11 problems
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
To: Jeff Chua <jeffchua@silk.corp.fedex.com>
Cc: Jens Axboe <axboe@suse.de>, Ed Tomlinson <tomlins@cam.org>, linux-kernel@vger.kernel.org, linux-openlvm@nl.linux.org, linux-lvm@sistina.com, Alan Cox <alan@lxorguk.ukuu.org.uk>

Jeff Chua wrote:
> 
> On Mon, 23 Apr 2001, Martin Dalecki wrote:
> 
> > > > depmod: *** Unresolved symbols in /lib/modules/2.4.3-ac11/kernel/drivers/md/lvm-mod.o
> 
> try this (after you have applied the patch for lvm 0.9.1_beta7) ...
> 
> Jeff
> [jchua@fedex.com]
> 
> --- /u2/src/linux/drivers/md/lvm.c.org  Mon Apr 23 21:11:32 2001
> +++ /u2/src/linux/drivers/md/lvm.c      Mon Apr 23 21:12:27 2001
> @@ -1791,7 +1791,7 @@
>         int max_hardblocksize = 0, hardblocksize;
> 
>         for (le = 0; le < lv->lv_allocated_le; le++) {
> -               hardblocksize =
> get_hardblocksize(lv->lv_current_pe[le].dev);
> +               hardblocksize =
> get_hardsect_size(lv->lv_current_pe[le].dev);

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>                 if (hardblocksize == 0)
>                         hardblocksize = 512;
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Those above two code lines can be killed, since get_hardsect_size
is returning the default sector size of Linux (namely 512 bytes)
in case the driver didn't have a chance to set hardsect_size[] array
in time for usage (Which shouldn't happen anyway).


>                 if (hardblocksize > max_hardblocksize)
> @@ -1801,7 +1801,7 @@
>         if (lv->lv_access & LV_SNAPSHOT) {
>                 for (e = 0; e < lv->lv_remap_end; e++) {
>                         hardblocksize =
> -                               get_hardblocksize(
> +                               get_hardsect_size(
> 
> lv->lv_block_exception[e].rdev_new);
>                         if (hardblocksize == 0)
>                                 hardblocksize = 512;
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
