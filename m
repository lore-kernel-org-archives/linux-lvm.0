Date: Thu, 30 Aug 2001 10:37:40 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] A Caldera related bug?
Message-ID: <20010830103740.C3831@tykepenguin.com>
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
To: linux-lvm@sistina.com

On Thu, Aug 30, 2001 at 03:23:21AM -0600, Andreas Dilger wrote:
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

It should be OK because the ioctl32 layer fixes it up anyway.

Patrick
