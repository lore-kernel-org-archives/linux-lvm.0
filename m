Subject: Re: [linux-lvm] booting a dm+lvm2 kernel
From: Christophe Saout <christophe@saout.de>
In-Reply-To: <20040101184805.GA10139@percy.comedia.it>
References: 
	 <OF35F32634.21E2585F-ON00256E0E.005C46E1-00256E0E.005C46ED@svunta.os.is>
	 <20040101184805.GA10139@percy.comedia.it>
Message-Id: <1072993242.6220.12.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Thu Jan  1 15:42:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: Kjartan Reynir Hauksson <krh@os.is>, Luca Berra <bluca@comedia.it>

Hi!

Sorry for interrupting your discussion, but if someone is modifying the
initrd script to work with LVM2 or writing a new one, I've perhaps some
inspiration.

Some time ago I used a simple initrd that just ran lvm vgscan and let
the kernel do the rest. But some days ago the system hung while it had
snapshots mounted. It didn't boot. Why? Well, having the snapshots
mounted the minor numbers changed and the kernel didn't find the root
filesystem anymore.

So I modified my initrd to used pivot_root to mount the root filesystem
itself. I can now give root=/dev/vg/root directly as parameter to the
kernel instead of having to rely on lilo to resolve the numeric
major:minor (that caused the trouble).

The only backdraw: If there isn't an /initrd on the root filesystem,
pivot_root fails. Perhaps I could let the script put the detected
major:minor into /proc/sys/kernel/real-root-dev instead of using
pivot_root. (I didn't because another binary like ls would need more
space).

I also switched to ash as shell (a very small bourne-compatible shell).

And I added udev to the initrd. The static /dev entries on the initrd
are only the basic ones, like /dev/console, /dev/null and so.
/dev/mapper/initrd is created dynamically using /proc/misc, and the
existing block devices are created using udev and /sys/block/* (if /dev
isn't devfs).

I think these are alls things that an updated initrd could recognize.

So it could:
a) look whether a 2.4 or 2.6 kernel is used and if udev is available (if
it is, use udev and a minimalistic /dev, if not, copy the existing
/dev).
b) look for a small shell that is bourne-compatible (/bin/ash if found,
/bin/sh (probably bash) else).
c) if LVM2 is used add dynamic /dev/mapper/control detection and use
lvm2 tool, use lvm1 else
d) try to use pivot_root if available and/or write the recognized
major:minor to /proc/sys/kernel/real-root-dev
e) use partial activation mode if available
f) figure out the used binaries and libraries and copy them (just like
the old initrd does) and strip them
g) add the possibility to load modules

You can find my Athlon or P3 optimized initrd on my page:
http://www.saout.de/misc/ (after gunzipping it you can mount it using
mount initrd.blablabla /mnt -o loop).
