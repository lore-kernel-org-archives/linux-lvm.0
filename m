From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] booting a dm+lvm2 kernel
Message-ID: <20040101224529.GD21031@percy.comedia.it>
References: <OF35F32634.21E2585F-ON00256E0E.005C46E1-00256E0E.005C46ED@svunta.os.is> <20040101184805.GA10139@percy.comedia.it> <1072993242.6220.12.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1072993242.6220.12.camel@leto.cs.pocnet.net>
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
Date: Thu Jan  1 16:47:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Christophe Saout <christophe@saout.de>
Cc: linux-lvm@sistina.com

On Thu, Jan 01, 2004 at 10:40:42PM +0100, Christophe Saout wrote:
>Sorry for interrupting your discussion, but if someone is modifying the
>initrd script to work with LVM2 or writing a new one, I've perhaps some
>inspiration.
I modified mkinitrd for Mandrake Linux, which is in turn based on
redhat's one. I tkink my code is production stable, but i could still be
contraddicted

Redhat(fedora) is also doing a similar thing. I believe to have started
earlier, then merged in some code from fedora...

>So I modified my initrd to used pivot_root to mount the root filesystem
>itself. I can now give root=/dev/vg/root directly as parameter to the
>kernel instead of having to rely on lilo to resolve the numeric
>major:minor (that caused the trouble).

I always use pivot root in case i am using lvm, but i get the LV name
from fstab when creating the initrd image, i do not trust lilo as well,
i did not have your problem, but i had to test switching from lvm1 to
dm, and did not love lilo hardcoding the wrong MAJOR number. How do you
get the "root=/dev/vg/root", by parsing the last occurrence in
/proc/cmdline?

>The only backdraw: If there isn't an /initrd on the root filesystem,
I used to forcibly create /initrd during the mkinitrd script, i don't do
it anymore since /initrd is part of mandrake filesystem package

>I also switched to ash as shell (a very small bourne-compatible shell).
Atm i am using a modified redhat nash, another option would be busybox
(nash is a very minimal command parser designed with initrd in mind)

>And I added udev to the initrd. The static /dev entries on the initrd
>are only the basic ones, like /dev/console, /dev/null and so.
>/dev/mapper/initrd is created dynamically using /proc/misc, and the
>existing block devices are created using udev and /sys/block/* (if /dev
>isn't devfs).
udev was on my todo list, but i never got there, i'll take a look at
what you did.
I don't copy any device file in the initrd at the moment. I create device
nodes if i need them in nash (and lvm tools), and it suffices my
purposes.

>a) look whether a 2.4 or 2.6 kernel is used and if udev is available (if
see above

>b) look for a small shell that is bourne-compatible (/bin/ash if found,
see above

>c) if LVM2 is used add dynamic /dev/mapper/control detection and use
>lvm2 tool, use lvm1 else
i already do this

>d) try to use pivot_root if available and/or write the recognized
>major:minor to /proc/sys/kernel/real-root-dev
pivot_root is cleaner

>e) use partial activation mode if available
this is a good idea

>f) figure out the used binaries and libraries and copy them (just like
>the old initrd does) and strip them
all the tools i use are linked with dietlibc (on arches that support
it), for the other i already detect the needed libraries, look at my
code.

>g) add the possibility to load modules
i already do this

My initrd detects if the root VG is on a md (softraid) device and
starts it before trying to activate the VG.

I also deal with a readonly initrd (read cramfs), by mounting /dev
(devfs or tmpfs) at the beginning of linuxrc and /etc (tmpfs) before
calling vgscan for lvm1.

Btw, in lilo i use your patch but i tested opening /dev/mapper/control
before trying to initialize dm() so users won't see an error if they
don't have dm in their kernel.

Regards,
L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
