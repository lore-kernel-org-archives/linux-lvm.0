Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200101130054.f0D0s9C32510@webber.adilger.net>
Subject: Re: [linux-lvm] [lvm 0.8 final] lvmcreate_initrd fails for me
In-Reply-To: <3A5F657D.E3A67F2F@attglobal.net> "from Les Hazelton at Jan 12,
 2001 03:13:49 pm"
Date: Fri, 12 Jan 2001 17:54:08 -0700 (MST)
MIME-Version: 1.0
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

Les, you write:
> I have been working on a problem with 0.8final - lvmcreate_initrd for
> the past week or so - off and on.  The problem is that the step where
> the files are copied to the ram disk fails for lack of space even though
> the ram disk has about 7 meg free.

Is it possible you are running out of inodes on the ram disk?  You can
check with "df -i".  Looking at the lvmcreateinitrd script, this should
not happen because you have 1 inode per 1kB filesystem, so you should
have 8000 inodes (probably too many, or not if you have a large /dev).

I had a look at the lvmcreateinitrd script and fixed a few things.  I've
attached the whole file here, because the patch is larger than the file.
The code is generally the same, but it seems I changed something on more
than half of the lines.  Joe, can you please consider adding to CVS?

- call the ramdisk initrd-lvm-$VERSION.gz to allow multiple ramdisk images
- use INITRDSIZE when creating the initrd image (not fixed 8192 blocks)
  (this was already in the Changelog, but appears not to have been fixed?)
- don't include /sbin/modprobe in INITRDFILES twice (cpio complains)
- don't include /dev in INITRDFILES (handle /dev separately)
- check for kernel/drivers/md/lvm-mod.o, block/lvm-mod.o and block/lvm.o,
  rather than just using kernel version (no error if LVM is in kernel)
- mount ramdisk at /tmp/mnt.$$ instead of /tmp/mnt.$$/ram (no real benefit)
- add cleanup function called on all errors or interrupt or exit
- use sh HERE documents when creating files /etc/fstab /linuxrc
- check libraries for all INITRDFILES files, not just /sbin/vgscan and /bin/sh
- check /etc/modules.conf before /etc/conf.modules (the preferred order)
- don't redirect messages to /dev/null all the time (hard to troubleshoot),
  instead have the commands be quiet unless there is an error
- remove bashisms in case we are using real /bin/sh instead of bash
- don't cd to ramdisk, because it is busy if we have an error (can't unmount)

Cheers, Andreas
===========================================================================
#!/bin/sh
#
#  Copyright (C) 1997 - 2000  Heinz Mauelshagen, Sistina Software
# 
#  June 1999
#  December 1999
#  January 2000
#  January 2001
# 
#  LVM is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#  
#  LVM is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with LVM; see the file COPYING.  If not, write to
#  the Free Software Foundation, 59 Temple Place - Suite 330,
#  Boston, MA 02111-1307, USA. 
# 

#
# Changelog
#
#   16/11/1999 - corrected -N type with mke2fs
#   19/12/1999 - use correct ramdisk size, strip shared library to save space
#   04/01/2000 - support /proc mount, because lvm_dir_cache now uses it
#   01/12/2001 - always create enough inodes in ramdisk for new files
#   [AED]      - don't try to copy LVM module if LVM is compiled into kernel
#              - check all INITRDFILES for library dependencies
#              - make commands quiet and avoid redirecting errors to /dev/null
#              - use cleanup function for all errors, interrupts, normal exit
#

cmd=`basename $0`
VERSION=$1
[ -z "$VERSION" ] && VERSION=`uname -r`
DEVRAM=/tmp/initrd.$$
INITRD=/boot/initrd-lvm-$VERSION.gz
INITRDSIZE=8192
MODULES=/lib/modules/$VERSION
INITRDFILES="/sbin/modprobe /sbin/vgchange /sbin/vgscan /bin/bash /bin/mount /bin/umount /bin/sh /bin/rm /sbin/insmod $MODULES/modules.dep"
if [ -r $MODULES/kernel/drivers/md/lvm-mod.o ]; then
  INITRDFILES="$INITRDFILES $MODULES/kernel/drivers/md/lvm-mod.o"
elif [ -r $MODULES/block/lvm-mod.o ]; then
  INITRDFILES="$INITRDFILES $MODULES/block/lvm-mod.o"
elif [ -r $MODULES/block/lvm.o ]; then
  INITRDFILES="$INITRDFILES $MODULES/block/lvm.o"
fi

TMPMNT=/tmp/mnt.$$

cleanup () {
  [ "`mount | grep $DEVRAM`" ] && umount $DEVRAM
  [ -f $DEVRAM ] && rm $DEVRAM
  [ -d $TMPMNT ] && rmdir $TMPMNT
  exit $1
}

trap "
  echo -e 'Bye bye...\n'
  cleanup 1
" 1 2 3 15


create_fstab () {
   cat << FSTAB > $TMPMNT/etc/fstab
/dev/ram	/		ext2	defaults	0   0
proc		/proc		proc	defaults	0   0
FSTAB
   chmod 644 $TMPMNT/etc/fstab
}

create_linuxrc () {
   cat << LINUXRC > $TMPMNT/linuxrc
#!/bin/sh
/sbin/modprobe lvm-mod
/bin/mount /proc
/sbin/vgscan
/sbin/vgchange -a y
/bin/umount /proc
LINUXRC
   chmod 555 $TMPMNT/linuxrc
}

#
# Main
#
echo -e "\nLogical Volume Manager 0.9 by Heinz Mauelshagen  01/12/2001\n"
echo -e "$cmd -- create an LVM initial ram disk $INITRD\n"

# figure out which actual shared libraries we need in our initrd
echo "$cmd -- figuring out shared libraries"
SHLIBS=`ldd $INITRDFILES 2>/dev/null | awk '{if (/=>/) { print $3 }}' | sort -u`
if [ $? -ne 0 ]; then
   echo -e "$cmd -- ERROR figuring out needed shared libraries\n"
   exit 1
fi

echo "$cmd -- making ram filesystem"
dd if=/dev/zero of=$DEVRAM count=$INITRDSIZE bs=1024 >/dev/null 2>&1
if [ $? -ne 0 ]; then
   echo -e "$cmd -- ERROR creating loopback file\n"
   cleanup 1
fi

# We could use -N to specify the number of inodes, but this option only
# appeared in mke2fs 1.14 (Jan 1999) so we will avoid it at least for now
NUMINO="`find /dev $SHLIBS $INITRDFILES 2>/dev/null | wc -w`"
#mke2fs -q -F -m0 -N `expr $NUMINO + 64` $DEVRAM $INITRDSIZE
BYTES_PER_INODE=`expr $INITRDSIZE \* 1024 / \( $NUMINO + 64 \)`
mke2fs -q -F -m0 -i $BYTES_PER_INODE $DEVRAM $INITRDSIZE
if [ $? -ne 0 ]; then
   echo -e "$cmd -- ERROR making ram disk filesystem\n"
   cleanup 1
fi

mkdir $TMPMNT
if [ $? -ne 0 ]; then
   echo -e "$cmd -- ERROR making $TMPMNT\n"
   cleanup 1
fi

echo "$cmd -- mounting ram filesystem"
mount -oloop $DEVRAM $TMPMNT
if [ $? -ne 0 ]; then
   echo -e "$cmd -- ERROR mounting $DEVRAM on $TMPMNT\n"
   cleanup 1
fi

mkdir $TMPMNT/etc $TMPMNT/proc

#
# create new modules configuration to avoid kmod complaining
# about nonexsisting modules.
#
MODCONF=/etc/modules.conf
[ ! -r $MODCONF -a -r /etc/conf.modules ] && MODCONF=/etc/conf.modules
echo "$cmd -- creating new $MODCONF"
MAJ=0
while [ $MAJ -lt 256 ]; do
   echo "alias block-major-$MAJ	off"
   echo "alias char-major-$MAJ	off"
   MAJ=`expr $MAJ + 1`
done > $TMPMNT/$MODCONF

# to ensure, that modprobe doesn complain about timestamps
echo "$cmd -- creating new modules.dep"
depmod -a $VERSION
if [ $? -ne 0 ]; then
   echo -e "$cmd -- ERROR running depmod\n"
   cleanup 1
fi

# copy necessary files to ram disk
echo "$cmd -- copying files to ram disk"
find $INITRDFILES /dev|cpio -pdm --quiet $TMPMNT
if [ $? -ne 0 ]; then
   echo -e "$cmd -- ERROR cpio to ram disk\n"
   cleanup 1
fi

echo "$cmd -- copying shared libraries to ram disk"
find $SHLIBS|cpio -Lpdm --quiet $TMPMNT
if [ $? -ne 0 ]; then
   echo -e "$cmd -- ERROR copying needed shared libraries to ram disk\n"
   cleanup 1
fi
for lib in $SHLIBS
do
   strip $TMPMNT$lib >/dev/null
done

echo "$cmd -- creating new /linuxrc"
create_linuxrc
if [ $? -ne 0 ]; then
   echo -e "$cmd -- ERROR creating linuxrc\n"
   cleanup
   exit 1
fi

echo "$cmd -- creating new /etc/fstab"
create_fstab
if [ $? -ne 0 ]; then
   echo -e "$cmd -- ERROR creating /etc/fstab\n"
   cleanup 1
fi

echo "$cmd -- ummounting ram disk"
umount $DEVRAM
if [ $? -ne 0 ]; then
   echo -e "$cmd -- ERROR umounting $DEVRAM\n"
   cleanup 1
fi

echo "$cmd -- creating compressed initrd in $INITRD"
dd if=$DEVRAM bs=1k count=$INITRDSIZE 2>/dev/null | gzip -9 > $INITRD
if [ $? -ne 0 ]; then
   echo -e "$cmd -- ERROR creating $INITRD\n"
   cleanup 1
fi

cleanup 0
 
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
