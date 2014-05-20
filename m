Date: Tue, 20 May 2014 18:16:40 +0200
From: Lennart Poettering <lennart@poettering.net>
Message-ID: <20140520161639.GF25435@tango.0pointer.de>
References: <lktmlp$8nh$1@ger.gmane.org>
	<20140514163304.GG8642@tango.0pointer.de>
	<53740A8A.5080604@gmail.com>
	<20140515162743.GC27565@tango.0pointer.de>
	<53752E6E.2010108@gmail.com>
	<20140515213826.GB13171@tango.0pointer.de>
	<5379BD34.5040202@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5379BD34.5040202@redhat.com>
Subject: Re: [linux-lvm] [systemd-devel] cryptsetup vs. swapon/fsck (some
 kind of race condition)
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Rajnoha <prajnoha@redhat.com>
Cc: Andy Kittner <andy.kittner@gmail.com>, systemd-devel@lists.freedesktop.org, linux-lvm@redhat.com

On Mon, 19.05.14 10:13, Peter Rajnoha (prajnoha@redhat.com) wrote:

> > broken. We start these things in parallel, they create these races
> > without reason. Since ages we don't support non-devtmpfs kernels
> > anymore, so it's *always* wrong to invoke mknod(), since the kernel will
> > create the device nodes. Unless you run an early 2.6 kernels this is
> > completely wrong. I'd recommend filing a bug against the distribution to
> > remove this old crap from libdm. 
> > 
> > What does libdm even check there precisely?
> 
> It uses libudev's udev_queue_get_udev_is_active. So is there a better
> function we should use instead? If not, there should probably be a better
> one provided in libudev to check whether udev is ready to serve on the system
> or not.

Well, whether udev is already running yet or hasn't been started yet
doesn't actually matter much, as udev's APIs are completely safe
regarding that. You can allocate a monitor before udev is up, and it
will work but only start reporting things after udev is up. And you can
enumerate devices, and the API will report with
udev_device_is_initialized() whether that specific device is initialized
yet, and this will return true only if udev not only got started but
also processed the device.

The entire API is hence designed in a way that you don't need to
synchronize against udev in order to use its APIs, hence the idea to
check whether udev is running is completely against the entire design of
it.

> As for devtmpfs, are you sure it's enabled everywhere and always?

Well, udev has been requiring that for a while, there's no code in udev
anymore to even do a mknod() on its own...

If you think it is worth support really old kernels with new LVM (though
I really don't see why you would want that, after all LVM is hardly an
app you install but part of the OS itself), then at least make the mknod
madness a compile-time configurable option, and set it to "off" by
default, so that people understand that this is archaic stuff nobody in
his right mind would ever use when setting up a system today. The Gentoo
developers apparently need holding hands for these kinds of things, and
this is how you can guide them into the right direction.

> It's configurable for the kernel and one does not need to enable it it seems.
> I just need to be sure that if we completely turn this fallback node management
> in libdm, I won't cut someone off in some distro with settings not exactly
> the same as used in Fedora.

Well the kernel wants to support really archaic userspaces. I don't
think that this really applies the same way for LVM.

Also, I am pretty sure that pretty much any distro from the last 2 years
is using devtmpfs, since udev stopped supporting non-devtmpfs systems
from jan 1st 2012 on. And you can be quite sure that actually they
already adopted it much earlier, since that was just the time where we
removed support for it in udev upstream, where we have the
guarantee. Early than that we just strongly recommended it, and it was
merged into the kernel in apr 30th, 2009.

Please, remove the old cruft! Or at least disable it by default int the
code! 

Thanks,

Lennart

-- 
Lennart Poettering, Red Hat
