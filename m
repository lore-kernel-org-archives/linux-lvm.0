Subject: Re: [linux-lvm] Re: [RFLART] kdev_t in ioctls
Message-Id: <20020113171746.A10429@btconnect.com>
References: <Pine.GSO.4.21.0201141227260.224-100000@weyl.math.psu.edu>
    <Pine.LNX.4.33.0201140957040.15128-100000@penguin.transmeta.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0201140957040.15128-100000@penguin.transmeta.com>;
    from torvalds@transmeta.com on Mon, Jan 14, 2002 at 10:01:25AM -0800
From: Joe Thornber <thornber@btconnect.com>
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
Date: Tue Jan 15 06:27:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: Alexander Viro <viro@math.psu.edu>, linux-kernel@vger.kernel.org

On Mon, Jan 14, 2002 at 10:01:25AM -0800, Linus Torvalds wrote:
> Consider that done. ANYTHING that exports kdev_t to user space is
> incredibly broken, and will not work in a few months when the actual bit
> representation (and size) will change.

The kdev_t's in the driver interface are just one of the *minor*
problems with the LVM driver.

I came to the conclusion last summer that a rewrite was in order, of
both the kernel driver and the userland tools.  The new driver is
called 'device-mapper', and has been discussed briefly on this list.
It aims to support volume management in general, ie. not be LVM
specific.

The userland tools (known as LVM2), will go into beta this week.
Initially they will just replicate the functionality of LVM1, but we
do have a lot of extra features queued which will go in subsequent
releases.

Of course Sistina will continue to support the existing LVM1 driver
for the 2.4 series.

As far as the 2.5 series is concerned, I would much rather see people
embracing the new architecture (or telling me why it sucks).  Rather
than trying to hack the LVM1 driver so it works.  People have been
complaining for the last year about LVM, we weren't able to do much
about it since we were in a stable kernel and couldn't change any
interfaces.  Now that 2.5 is finally here it is time for people to
address the real problems - kdev_t's only scratch the surface.

- Joe
