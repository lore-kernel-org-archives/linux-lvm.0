Message-ID: <5379BD34.5040202@redhat.com>
Date: Mon, 19 May 2014 10:13:40 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <lktmlp$8nh$1@ger.gmane.org>
	<20140514163304.GG8642@tango.0pointer.de>
	<53740A8A.5080604@gmail.com>
	<20140515162743.GC27565@tango.0pointer.de>
	<53752E6E.2010108@gmail.com>
	<20140515213826.GB13171@tango.0pointer.de>
In-Reply-To: <20140515213826.GB13171@tango.0pointer.de>
Content-Transfer-Encoding: 7bit
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
To: Lennart Poettering <lennart@poettering.net>
Cc: Andy Kittner <andy.kittner@gmail.com>, systemd-devel@lists.freedesktop.org, linux-lvm@redhat.com

On 05/15/2014 11:38 PM, Lennart Poettering wrote:
> On Thu, 15.05.14 23:15, Andy Kittner (andy.kittner@gmail.com) wrote:
> 
>> | May 15 22:06:47 pinky systemd[1]: Mounted Runtime Directory.
>> | May 15 22:06:47 pinky systemd[1]: Mounted Lock Directory.
> 
> This looks like remains from a *really* old systemd version. THis does not
> exist anymore. What distribution is this?
> 
> This used to bind mount /run to /var/run, and similar for /var/lock.
> 
>> | May 15 22:06:47 pinky systemd[1]: Started udev Kernel Device Manager.
>> | May 15 22:06:47 pinky systemd-cryptsetup[2433]: AKI DEBUG udev: open_queue_file failed with errno 2
>> | May 15 22:06:47 pinky systemd-cryptsetup[2433]: AKI DEBUG libdm:_check_udev_is_running: Udev is not running. Not using udev synchronisation code.
>>
>> So the udev queue file does not yet exist, libdm thinks the system is
>> not running udev and things go wrong...
> 
> This really should be turned off in libdm. It's really stupid and
> broken. We start these things in parallel, they create these races
> without reason. Since ages we don't support non-devtmpfs kernels
> anymore, so it's *always* wrong to invoke mknod(), since the kernel will
> create the device nodes. Unless you run an early 2.6 kernels this is
> completely wrong. I'd recommend filing a bug against the distribution to
> remove this old crap from libdm. 
> 
> What does libdm even check there precisely?

It uses libudev's udev_queue_get_udev_is_active. So is there a better
function we should use instead? If not, there should probably be a better
one provided in libudev to check whether udev is ready to serve on the system
or not.

As for devtmpfs, are you sure it's enabled everywhere and always?
It's configurable for the kernel and one does not need to enable it it seems.
I just need to be sure that if we completely turn this fallback node management
in libdm, I won't cut someone off in some distro with settings not exactly
the same as used in Fedora.

-- 
Peter
