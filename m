Date: Thu, 30 Aug 2001 11:46:13 +0200
From: Christoph Hellwig <hch@caldera.de>
Subject: Re: [linux-lvm] A Caldera related bug?
Message-ID: <20010830114613.B12766@caldera.de>
References: <OF8D6ACD21.34A36C6E-ON87256AB7.007C475A@sc.blm.gov> <20010830090848.A27345@caldera.de> <20010830032321.I541@turbolinux.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010830032321.I541@turbolinux.com>; from adilger@turbolabs.com on Thu, Aug 30, 2001 at 03:23:21AM -0600
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
To: Andreas Dilger <adilger@turbolabs.com>
Cc: linux-lvm@sistina.com

On Thu, Aug 30, 2001 at 03:23:21AM -0600, Andreas Dilger wrote:
> On Aug 30, 2001  09:08 +0200, Christoph Hellwig wrote:
> > This is because LVM is _completly_ broken by including kernel headers all
> > over theplace, and - even worse - sometimes even defining __KERNEL__ and
> > using kernel-only datatypes.
> 
> Yes, it is going to be ugly when kdev_t is no longer == dev_t.

It's not only ugly, it's _broken_.  This means the LVM ABI changes
because of a kernel-internal change.

> 
> > --- LVM/1.0.1-rc1/kernel/lvm.h~	Thu Aug 30 09:00:30 2001
> > +++ LVM/1.0.1-rc1/kernel/lvm.h	Thu Aug 30 09:02:47 2001
> > @@ -110,10 +110,7 @@
> >  #include <linux/kdev_t.h>
> >  #include <linux/list.h>
> >  #else
> > -#define __KERNEL__
> >  #include <linux/kdev_t.h>
> > -#include <linux/list.h>
> > -#undef __KERNEL__
> >  #endif				/* #ifndef __KERNEL__ */
> 
> In this case, you may as well just remove the whole "#ifdef __KERNEL__"
> part of the header here.

It's not that easy.  I still need linux/list.h in case of __KERNEL__.
Maybe the following is better:

#include <linux/kdev_t.h>
#ifdef __KERNEL__
# include <linux/list.h>
#endif

> 
> >  /* remap physical sector/rdev pairs including hash */
> >  typedef struct lv_block_exception_v1 {
> > +#ifdef __KERNEL__
> >  	struct list_head hash;
> > +#else
> > +	uint64_t hash;			/* XXX b0rken on 64bit plattforms */
> > +#endif
> 
> Maybe the non-kernel part can be considered as two void * pointers?
> I'm not sure if that will work on sparc64, if the kernel and user
> pointer sizes are not the same.

I could be made work with the current sparc ioctl translation layer.
I doubt anyone actually wants to do that with the ever-changing LVM
APIs.

> In the end, what is really needed is a well-defined LVM API between
> kernel and user-space that doesn't pass this kind of stuff.

Completly agreed.

	Christoph

-- 
Of course it doesn't work. We've performed a software upgrade.
