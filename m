Date: Thu, 30 Aug 2001 18:11:47 +0200
From: Christoph Hellwig <hch@ns.caldera.de>
Subject: Re: [linux-lvm] A Caldera related bug?
Message-ID: <20010830181147.A22657@caldera.de>
References: <OF8D6ACD21.34A36C6E-ON87256AB7.007C475A@sc.blm.gov> <20010830090848.A27345@caldera.de> <20010830032321.I541@turbolinux.com> <20010830114613.B12766@caldera.de> <20010830120929.A541@btconnect.com> <20010830141631.A27638@caldera.de> <20010830160347.A700@btconnect.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010830160347.A700@btconnect.com>; from thornber@btconnect.com on Thu, Aug 30, 2001 at 04:03:48PM +0100
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

On Thu, Aug 30, 2001 at 04:03:48PM +0100, Joe Thornber wrote:
> On Thu, Aug 30, 2001 at 02:16:31PM +0200, Christoph Hellwig wrote:
> > On Thu, Aug 30, 2001 at 12:09:29PM +0100, Joe Thornber wrote:
> > > On Thu, Aug 30, 2001 at 11:46:13AM +0200, Christoph Hellwig wrote:
> > > > On Thu, Aug 30, 2001 at 03:23:21AM -0600, Andreas Dilger wrote:
> > > > > In the end, what is really needed is a well-defined LVM API between
> > > > > kernel and user-space that doesn't pass this kind of stuff.
> > > > 
> > > > Completly agreed.
> > > 
> > > I think every one is aware of this, but we can't change the interface during
> > > the 2.4 series.
> > 
> > Well, you change it all over the time..
> > IMHO replacing all these kernel types in the structures also used by the
> > tools to others that have the same size but do not depend on kernel headers
> > would be a very good thing for 1.0.2.
> 
> ok, I'll look at them.  I can't see how we can get rid of the kdev_t's
> though.

#ifdef __KERNEL__
#include <linux/kdev_t.h>
typedef kdev_t lvm_dev_t;
#else
typedef uint16_t lvm_dev_t;
#endif

and s/kdev_t/lvm_dev_t/g in lvm.h.

	Christoph

-- 
Of course it doesn't work. We've performed a software upgrade.
