Subject: Re: [linux-lvm] mount root filesystem on lvm
From: Christophe Saout <christophe@saout.de>
In-Reply-To: <3EBBFF45.4050006@inode.at>
References: <3EBBF411.6060405@inode.at>  <3EBBFF45.4050006@inode.at>
Message-Id: <1052511447.6321.22.camel@chtephan.cs.pocnet.net>
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
Date: Fri May  9 15:17:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: Manfred Gschweidl <m.gschweidl@inode.at>

Am Fre, 2003-05-09 um 21.19 schrieb Manfred Gschweidl:

> was anyone successfull with booting the root-filesystem on am lvm-volume 
> with lvm2 and device-mapper interface, using an initial ramdisk??
> 
> can anyone point me in the right direction??

I built my own ramdisk for that purpose (loosely based on the old LVM1
ramdisk). It's contains the following files:

-rwxr-xr-x  1 root root  442740 Dec 13 00:48 bin/bash
-rwxr-xr-x  1 root root   17196 Nov  7  2002 bin/mknod
-rwsr-xr-x  1 root root   60896 Jan 20  2002 bin/mount
-rwxr-xr-x  1 root root   46692 Nov  7  2002 bin/sed
-rwxr-xr-x  1 root root    4948 Dec 25 18:02 bin/true
-rwsr-xr-x  1 root root   27524 Jan 20  2002 bin/umount
-rw-r--r--  1 root root      66 Jan 11 17:17 etc/fstab
-rw-r--r--  1 root root   16932 Dec 12 23:36 etc/modprobe.conf
-rw-r--r--  1 root root      24 Jan 11 17:17 etc/mtab
-rwxr-xr-x  1 root root   91790 Nov  7  2002 lib/ld-linux.so.2
-rwxr-xr-x  1 root root 1193240 Nov  7  2002 lib/libc.so.6
-rwxr-xr-x  1 root root   17300 Nov  7  2002 lib/libdevmapper.so.0.96
-rwxr-xr-x  1 root root    9140 Nov  7  2002 lib/libdl.so.2
-rwxr-xr-x  1 root root   23256 Dec 12 23:56 lib/libhistory.so.4
-rwxr-xr-x  1 root root  289484 Jan 20  2002 lib/libncurses.so.5
-rwxr-xr-x  1 root root  156144 Dec 13 00:39 lib/libreadline.so.4
-r-xr-xr-x  1 root root     433 Dec 25 18:24 linuxrc
-rwxr-xr-x  1 root root    5876 Jan 11 17:15 sbin/insmod
-r-xr-xr-x  1 root root  329956 Jan 11 17:13 sbin/lvm
-rwxr-xr-x  1 root root   18556 Jan 11 17:15 sbin/modprobe

Note: I'm using kernel 2.5.69, so instead of modprobe.conf you should
use modules.conf, the only purpose of this file in conjunction with
modprobe is to suppress a lot of kernel messages that say it couldn't
load the module for major blabla). The shared libraries were used by my
bash, you can check that with ldd.

The shell script /linuxrc looks like this (note: I removed the
indentation to fit everything into one line, you might want to correct
this):

#!/bin/sh
/bin/mount /proc
echo /sbin/modprobe > /proc/sys/kernel/modprobe
if test ! -e /dev/.devfsd ; then
set -e
MAJOR=$(/bin/sed -n 's/^ *\([0-9]\+\) \+misc$/\1/p' /proc/devices)
MINOR=$(/bin/sed -n 's/^ *\([0-9]\+\) \+device-mapper$/\1/p' /proc/misc)
if test -n "$MAJOR" -a -n "$MINOR" ; then
    /bin/mknod --mode=600 /dev/mapper/control c $MAJOR $MINOR
fi
fi
/sbin/lvm vgchange --ignorelockingfailure -a y
/bin/umount /proc

The other text files contain this:

chtephan:/mnt/tmp # cat etc/mtab
/dev/ram0 / ext2 rw 0 0
chtephan:/mnt/tmp # cat etc/fstab
/dev/ram0       /               ext2    defaults        0   0
proc            /proc           proc    defaults        0   0

You can also find this ramdisk under
http://www.saout.de/misc/initrd-2.5.67-lvm2-athlon.gz - as the name
suggets my libc is athlon optimized, so you might want to replace some
libraries or executables.

BTW: I've also got some lilo patches on that page (remove the filename
after the last slash) that make it recognize device-mapper volumes.

-- 
Christophe Saout <christophe@saout.de>
