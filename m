Message-ID: <5379BA1D.8070809@redhat.com>
Date: Mon, 19 May 2014 10:00:29 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <llb9j7$b01$1@ger.gmane.org>
In-Reply-To: <llb9j7$b01$1@ger.gmane.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Race condition in udev_is_running check when
 running under systemd
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
To: andy.kittner@gmail.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 05/18/2014 11:44 PM, Andy Kittner wrote:
> Hi all,
> 
> first of I hope I have come to the right place for reporting (possible)
> bugs, if not feel free to give me a gentle kick in the right direction
> ;)
> 
> 
> After updating to systemd-212 I was experiencing problems with
> cryptsetup for a while. systemd would open and close my encrypted
> partitions in rapid succession, causing dependent services like fsck to
> fail most of the time because the device vanished again.
> 
> After some discussion on the systemd mailing list and a bit of debugging
> I found that the root of the issue is, that when systemd calls cryptsetup
> the _check_udev_is_running() function (in ./libdm/libdm-common.c) would
> still return false.
> This causes libdm to create some device nodes itself, and that in turn
> apparently to causes the problems with systemd thinking the device has
> vanished.
> 
> According to the systemd developers this issue should be fixed on the
> libdm side. To quote the relevant part from the mails there:
> 

Libdm still uses fallback to direct node creation by default if libdm
users (like cryptsetup in your case) does not explicitly set libdm to
not use this fallback, which is the exact case here. Hence the nodes
are created by libdm. We could possibly change this default in libdm
so we rely on udev completetely without a need for libdm user to set
this. But then a great care must be taken when installing such binary
to an environment where udev is still not used - e.g. when installing
to initramfs (though I think most distros already use udev in initramfs).

But the problem here is a bit different one - the correct way to detect
whether udev is running or not. Libdm uses libudev's function "udev_queue_get_udev_is_active"
which, it seems, returns false in case udev is socket-activated in
systemd environment.


>> On 15/05/14 23:38, Lennart Poettering wrote:
>>> On Thu, 15.05.14 23:15, Andy Kittner (andy.kittner@gmail.com) wrote:
>>>> Anyway, my conclusion from this is that either the LVM guys need to
>>>> use another method to detect that udev is running, or systemd should
>>>> not start the cryptsetup stuff until udev is fully initialized.
>>>
>>> Nope, we don't need more synchronization. The LVM guys should stop doing
>>> mknod() on their own.
> 
> For full details see the thread here
>   http://thread.gmane.org/gmane.comp.sysutils.systemd.devel/18992/focus=19069

'"Starting udev Control Socket." is the indication for the API the
device mapper tools use to find out if udev is running.'

 - well, we could add this check (for the udev control socket), but
I think more correct way would be for udev to add this check and it
should provide a function to libudev to check for this as otherwise
we'll be adding *another* "just usable for systemd" check to libdm
and we'd like to be as environment agnostic as possible (...systemd is
not the only init system that exists).

I'll try to discuss this with systemd/udev team...

-- 
Peter
