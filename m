From: Andrew Clausen <clausen@gnu.org>
Subject: Re: [Evms-devel] Re: [linux-lvm] Re: [lvm-devel] [ANNOUNCE] LVM
    reimplementation ready for beta testing
Message-Id: <20020201081816.B27865@gnu.org>
References: <OFBCE93B66.F7B9C14E-ON85256B52.006B8AB3@raleigh.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OFBCE93B66.F7B9C14E-ON85256B52.006B8AB3@raleigh.ibm.com>;
    from slpratt@us.ibm.com on Thu, Jan 31, 2002 at 01:52:29PM -0600
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
Date: Thu Jan 31 15:19:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Pratt <slpratt@us.ibm.com>
Cc: lvm-devel@sistina.com, Jim McDonald <Jim@mcdee.net>, Andreas Dilger <adilger@turbolabs.com>, linux-lvm@sistina.com, linux-kernel@vger.kernel.org, evms-devel@lists.sourceforge.net

On Thu, Jan 31, 2002 at 01:52:29PM -0600, Steve Pratt wrote:
> Joe Thornber wrote:
> >On Wed, Jan 30, 2002 at 10:03:40PM +0000, Jim McDonald wrote:
> >> Also, does/where does this fit in with EVMS?
> 
> >EVMS differs from us in that they seem to be trying to move the whole
> >application into the kernel,
> 
> No, not really.  We only put in the kernel the things that make sense to be
> in the kernel, discovery logic, ioctl support, I/O path.  All configuration
> is handled in user space.

The notion of "volume group" and "physical volume", etc. does
not exist in the device mapper.

It is really much lower-level.

As it is, it could be used for partitioning as well, with a single
LOC changed.  In fact, I imagine it's a 100 LOC or so in libparted to
get partprobe to use it.  Then we could retire all partition code
from the kernel :)

> > whereas we've taken the opposite route
> >and stripped down the kernel side to just provide services.
> 
> Then why does snapshot.c in device mapper have a read_metadata function
> which populates the exception table from on disk metadata?  Seems like you
> agree with us that having metadata knowledge in the kernel is a GOOD thing.

It's good to *support* reading metadata, but better to not require it.

> Since device_mapper does not support in kernel discovery, and EVMS relies
> on this, it would be very difficult to change EVMS to use device_mapper.

Why?  Just because device_mapper itself doesn't support discovery
doesn't mean you can't do the discovery for it, and setup the
devices in-kernel.

I think a bigger issue will be the difference in interface for
EVMS stuff, like all the plugin ioctls... it would be great if
you could:
* decouple the evms runtime (kernel code) from the evms
engine (userland).  Something like libparted's PedArchitecture
would be nice.
* get everyone in the linux community to agree on some standard
ioctl's that provide an interface for everything that evms
(and everyone else) needs.

How hard is this to do?

Andrew
