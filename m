From: Andreas Dilger <adilger@turbolabs.com>
Date: Thu, 30 Aug 2001 03:23:21 -0600
Subject: Re: [linux-lvm] A Caldera related bug?
Message-ID: <20010830032321.I541@turbolinux.com>
References: <OF8D6ACD21.34A36C6E-ON87256AB7.007C475A@sc.blm.gov> <20010830090848.A27345@caldera.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010830090848.A27345@caldera.de>
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
To: Christoph Hellwig <hch@caldera.de>, linux-lvm@sistina.com

On Aug 30, 2001  09:08 +0200, Christoph Hellwig wrote:
> This is because LVM is _completly_ broken by including kernel headers all
> over theplace, and - even worse - sometimes even defining __KERNEL__ and
> using kernel-only datatypes.

Yes, it is going to be ugly when kdev_t is no longer == dev_t.

> --- LVM/1.0.1-rc1/kernel/lvm.h~	Thu Aug 30 09:00:30 2001
> +++ LVM/1.0.1-rc1/kernel/lvm.h	Thu Aug 30 09:02:47 2001
> @@ -110,10 +110,7 @@
>  #include <linux/kdev_t.h>
>  #include <linux/list.h>
>  #else
> -#define __KERNEL__
>  #include <linux/kdev_t.h>
> -#include <linux/list.h>
> -#undef __KERNEL__
>  #endif				/* #ifndef __KERNEL__ */

In this case, you may as well just remove the whole "#ifdef __KERNEL__"
part of the header here.

>  /* remap physical sector/rdev pairs including hash */
>  typedef struct lv_block_exception_v1 {
> +#ifdef __KERNEL__
>  	struct list_head hash;
> +#else
> +	uint64_t hash;			/* XXX b0rken on 64bit plattforms */
> +#endif

Maybe the non-kernel part can be considered as two void * pointers?
I'm not sure if that will work on sparc64, if the kernel and user
pointer sizes are not the same.

In the end, what is really needed is a well-defined LVM API between
kernel and user-space that doesn't pass this kind of stuff.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
