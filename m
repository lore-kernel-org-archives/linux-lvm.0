Subject: Re: [linux-lvm] booting a dm+lvm2 kernel
From: Christophe Saout <christophe@saout.de>
In-Reply-To: <20040101224529.GD21031@percy.comedia.it>
References: 
	 <OF35F32634.21E2585F-ON00256E0E.005C46E1-00256E0E.005C46ED@svunta.os.is>
	 <20040101184805.GA10139@percy.comedia.it>
	 <1072993242.6220.12.camel@leto.cs.pocnet.net>
	 <20040101224529.GD21031@percy.comedia.it>
Content-Type: multipart/mixed; boundary="=-OTh/Z51UoWQIR/fxWaHL"
Message-Id: <1072998611.5199.21.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
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
Date: Fri Jan  2 08:30:01 2004
List-Id: <linux-lvm.redhat.com>
To: Luca Berra <bluca@comedia.it>
Cc: linux-lvm@sistina.com

--=-OTh/Z51UoWQIR/fxWaHL
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Do, den 01.01.2004 schrieb Luca Berra um 23:45:

> I modified mkinitrd for Mandrake Linux, which is in turn based on
> redhat's one. I tkink my code is production stable, but i could still be
> contraddicted

I didn't say that, I just want to throw something into this discussion.
:)

I thought you were talking about the lvmcreate_initrd script that came
with LVM1. I always used that one before, it doesn't need some extras
compiled, it just takes the binaries it finds on the system. I think
it's well suited for people that don't have a distro-specific script to
handle things.

> >So I modified my initrd to used pivot_root to mount the root filesystem
> >itself. I can now give root=/dev/vg/root directly as parameter to the
> >kernel instead of having to rely on lilo to resolve the numeric
> >major:minor (that caused the trouble).
> 
> I always use pivot root in case i am using lvm, but i get the LV name
> from fstab when creating the initrd image, i do not trust lilo as well,

Yes, I've seen redhat doing this. I personally prefer being able to
override it at the command line though. Having something hardcoded in
the initrd sounds strange to me.

> i did not have your problem, but i had to test switching from lvm1 to
> dm, and did not love lilo hardcoding the wrong MAJOR number. How do you
> get the "root=/dev/vg/root", by parsing the last occurrence in
> /proc/cmdline?

I have attached the script. I parse /proc/cmdline, try to remove root=
using a shell function and if it actually removed something I know that
the rest has to be a device name. :)

I then try to look it up and use it.

I'm also doing the same for rw/ro, rootfstype and rootflags, just like
the kernel would.

> >The only backdraw: If there isn't an /initrd on the root filesystem,
> I used to forcibly create /initrd during the mkinitrd script, i don't do
> it anymore since /initrd is part of mandrake filesystem package

Sure. For a generic script it would be probably best to do it too.

> >I also switched to ash as shell (a very small bourne-compatible shell).
> Atm i am using a modified redhat nash, another option would be busybox
> (nash is a very minimal command parser designed with initrd in mind)

Wasn't ash the one from busybox?

The tools from my system that I put into the initrd are:
-rwxr-xr-x    1 root     root        16776 28. Dez 04:20 cat
-rwxr-xr-x    1 root     root        19896 28. Dez 03:43 mknod
-rwxr-xr-x    1 root     root        75572 28. Dez 03:43 mount
-rwxr-xr-x    1 root     root        88960 28. Dez 03:43 sed
-rwxr-xr-x    1 root     root        91000 28. Dez 03:43 sh
-rwxr-xr-x    1 root     root        35940 28. Dez 03:43 umount

Rather small. The only big thing is libc.so.6 in /lib (1,3MB). The whole
initrd compressed is < 1MB. Perhaps linking the tools against dietlibc
would help and/or taking mount/umount/mknod/sed/cat from busybox (does
it have those?). Well, not an option for a generic lvmcreate_initrd.

> udev was on my todo list, but i never got there, i'll take a look at
> what you did.

It's rather simple:

        /bin/mount /sys
        export UDEV_NO_SLEEP=1 ACTION=add
        for i in /sys/block/*; do
                DEVPATH=${i#/sys} /sbin/udev block &
                for j in $i/*; do
                        if [ -e $j/dev ]; then
                                DEVPATH=${j#/sys} /sbin/udev block &
                        fi
                done
        done
        unset UDEV_NO_SLEEP ACTION
        wait
        /bin/umount /sys

In the future udev will probably be able to populate /dev itself without
the shell script around it.

What I like is that it will create all block devices the kernel knows
about. Without a special rules file in /etr/rules it uses the device
names the kernel provides (these are traditional style). This should
cause trouble since the LVM device cache is thrown away with the initrd
anyway.

Just look at my linuxrc script, I attached it.

> I don't copy any device file in the initrd at the moment. I create device
> nodes if i need them in nash (and lvm tools), and it suffices my
> purposes.

With udev I just created /dev/console and some others. Doing everything
from the script seems unnecessary.

> >d) try to use pivot_root if available and/or write the recognized
> >major:minor to /proc/sys/kernel/real-root-dev
> pivot_root is cleaner

Ok, I thought just in case there is no /initrd. But I dislike it because
the kernel major:minor thing is in a flux and
/proc/sys/kernel/real-root-dev is kind of broken (8:8 bit split fixed).

> >e) use partial activation mode if available
> this is a good idea

Yes, it's really needed. I accidentally wiped an empty PV without
telling LVM and my system didn't boot anymore...

> all the tools i use are linked with dietlibc (on arches that support
> it), for the other i already detect the needed libraries, look at my
> code.

Ok.

> My initrd detects if the root VG is on a md (softraid) device and
> starts it before trying to activate the VG.

Doesn't the kernel start them automatically? You mean, if it isn't
activated in the kernel? Probably a good idea.

> I also deal with a readonly initrd (read cramfs), by mounting /dev
> (devfs or tmpfs) at the beginning of linuxrc and /etc (tmpfs) before
> calling vgscan for lvm1.

Yes, that's also possible. But I don't really like it being readonly
because, as you say, mounting something on /etc or /dev is unnecessary.
What's the problem with ext2? The wasted memory?

I would love making the initrd an initramfs. But that doesn't currently
work correctly. initramfs is a tmpfs which is populated by a compressed
cpio archive. Linux 2.6 has an initramfs and is able to populate it via
a cpio archive passed via initrd but doesn't call linuxrc... (see the
early userspace discussion).


--=-OTh/Z51UoWQIR/fxWaHL
Content-Disposition: attachment; filename=linuxrc
Content-Type: text/x-sh; name=linuxrc; charset=iso-8859-15
Content-Transfer-Encoding: 7bit

#!/bin/sh
setup_dev() {
	MAJOR=$(/bin/sed -n 's/^ *\([0-9]\+\) \+misc$/\1/p' /proc/devices)
	MINOR=$(/bin/sed -n 's/^ *\([0-9]\+\) \+device-mapper$/\1/p' /proc/misc)
	if test -n "$MAJOR" -a -n "$MINOR" ; then
		/bin/mknod --mode=600 /dev/mapper/control c $MAJOR $MINOR
	fi

	/bin/mount /sys
	export UDEV_NO_SLEEP=1 ACTION=add
	for i in /sys/block/*; do
		DEVPATH=${i#/sys} /sbin/udev block &
		for j in $i/*; do
			if [ -e $j/dev ]; then
				DEVPATH=${j#/sys} /sbin/udev block &
			fi
		done
	done
	unset UDEV_NO_SLEEP ACTION
	wait
	/bin/umount /sys
}

setup_lvm() {
	/sbin/lvm vgchange --ignorelockingfailure -P -a y
}

find_root() {
	for arg in $CMDLINE; do
		ROOT="${arg#root=}"
		if [ ! "$ROOT" = "$arg" ]; then
			ROOT="/dev/${ROOT#/dev/}"
			[ -n "$ROOT" -a -b $ROOT ] || ROOT=
			return 0
		fi
	done
	ROOT=
	return 0
}

find_fstype() {
	for arg in $CMDLINE; do
		FSTYPE="${arg#rootfstype=}"
		[ "$FSTYPE" = "$arg" ] || return 0
	done
	FSTYPE=auto
	return 0
}

find_flags() {
	local MODE
	for arg in $CMDLINE; do
		FLAGS="${arg#rootflags=}"
		[ "$FLAGS" = "$arg" ] || break
		FLAGS=
	done
	for arg in $CMDLINE; do
		case "$arg" in
			ro)	MODE=,ro;;
			rw)	MODE=,rw;;
		esac
	done
	FLAGS="$FLAGS$MODE"
	FLAGS="${FLAGS#,}"
	[ -n "$FLAGS" ] && FLAGS="-o $FLAGS"
	return 0
}

mount_root() {
	find_flags
	find_fstype

	echo "Mounting root filesystem on $ROOT:"
	if ! /bin/mount $FLAGS -t "$FSTYPE" "$ROOT" /mnt; then
		echo "... failed!"
		return 0
	fi

	echo -n "Trying to mount old root to /initrd ... "
	cd /mnt
	if /sbin/pivot_root . initrd 2> /dev/null; then
		echo okay
		cd /
	else
		echo failed
		cd /
		/bin/umount /mnt
		return 0
	fi

	export LD_LIBRARY_PATH="/initrd/lib"
	LD_SO="$LD_LIBRARY_PATH/ld-linux.so.2"

	echo 0x0100 > /initrd/proc/sys/kernel/real-root-dev

	[ -e /initrd/dev/.devfsd ] && $LD_SO /initrd/bin/mount -n --move /initrd/dev /dev

	$LD_SO /initrd/bin/umount -n /initrd/proc

	if [ -e /initrd/dev/.devfsd ]; then
		exec $LD_SO /initrd/bin/umount -n /initrd/dev < /dev/console > /dev/console 2>&1
	else
		exit 0
	fi
}

#################################

/bin/mount /proc
CMDLINE=$(/bin/cat /proc/cmdline)

[ -e /dev/.devfsd ] || setup_dev

setup_lvm

find_root
[ -n "$ROOT" ] && mount_root

/bin/umount /proc

--=-OTh/Z51UoWQIR/fxWaHL--
