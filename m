Return-Path: <seawolf@attglobal.net>
Message-ID: <3A5FF179.2259C0EC@attglobal.net>
Date: Sat, 13 Jan 2001 01:11:05 -0500
From: Les Hazelton <seawolf@attglobal.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] newer version of lvmcreateinitrd script
References: <200101130313.f0D3DwR20064@webber.adilger.net>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I tried this newer version but could not make it work.  It runs just
fine and creates an initrd file but when I try to re-boot using it I get
a kernel panic. The first error is from EXT2 stating "Magic changed,
weird!". The next errors are from reiserfs stating it can't locate a
filesystem on device 01:00. Then, kernel panic.

I also tried setting the initrd size to 12288 and got the same results.

If I set the initrd size below 12288 in the lvmcreate_initrd script from
your first reply it produces the same kernel panic with the same error
messages.

So far, the only combination that works is initrd size at 12288 using
the script from your first post.

I think I will call it a day and look at it again in the morning.

Les

Andreas Dilger wrote:
> 
> Hello,
> here is yet a newer version of the lvmcreateinitrd script.  I realized
> after sending the old one that it is impossible to create > 8192 inodes
> on an 8MB ext2 filesystem with 1k blocks, so this is now taken care of
> by using a larger block size for the filesystem.
> 
> Cheers, Andreas
> ==========================================================================
> #!/bin/sh
> #
> #  Copyright (C) 1997 - 2000  Heinz Mauelshagen, Sistina Software
> #
> #  June 1999
> #  December 1999
> #  January 2000
> #  January 2001
> #
> #  LVM is free software; you can redistribute it and/or modify
> #  it under the terms of the GNU General Public License as published by
> #  the Free Software Foundation; either version 2, or (at your option)
> #  any later version.
> #
> #  LVM is distributed in the hope that it will be useful,
> #  but WITHOUT ANY WARRANTY; without even the implied warranty of
> #  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> #  GNU General Public License for more details.
> #
> #  You should have received a copy of the GNU General Public License
> #  along with LVM; see the file COPYING.  If not, write to
> #  the Free Software Foundation, 59 Temple Place - Suite 330,
> #  Boston, MA 02111-1307, USA.
> #
> 
> #
> # Changelog
> #
> #   16/11/1999 - corrected -N type with mke2fs
> #   19/12/1999 - use correct ramdisk size
> #                strip shared library to save space
> #   04/01/2000 - support /proc mount, because lvm_dir_cache now uses it
> #   01/12/2001 - always create enough inodes in ramdisk for dev files
> #   [AED]      - don't try to copy LVM module if LVM is compiled into kernel
> #              - check all INITRDFILES for library dependencies
> #              - make commands quiet and avoid redirecting errors to /dev/null
> #              - use cleanup function for all errors, interrupts, normal exit
> #              - allow creation of > 8192 inodes in case of large /dev
> #
> 
> cmd=`basename $0`
> VERSION=$1
> [ -z "$VERSION" ] && VERSION=`uname -r`
> DEVRAM=/tmp/initrd.$$
> INITRD=/boot/initrd-lvm-$VERSION.gz
> INITRDSIZE=8192
> MODULES=/lib/modules/$VERSION
> INITRDFILES="/sbin/modprobe /sbin/vgchange /sbin/vgscan /bin/bash /bin/mount /bin/umount /bin/sh /bin/rm /sbin/insmod $MODULES/modules.dep"
> if [ -r $MODULES/kernel/drivers/md/lvm-mod.o ]; then
>   INITRDFILES="$INITRDFILES $MODULES/kernel/drivers/md/lvm-mod.o"
> elif [ -r $MODULES/block/lvm-mod.o ]; then
>   INITRDFILES="$INITRDFILES $MODULES/block/lvm-mod.o"
> elif [ -r $MODULES/block/lvm.o ]; then
>   INITRDFILES="$INITRDFILES $MODULES/block/lvm.o"
> fi
> 
> TMPMNT=/tmp/mnt.$$
> 
> cleanup () {
>   [ "`mount | grep $DEVRAM`" ] && umount $DEVRAM
>   [ -f $DEVRAM ] && rm $DEVRAM
>   [ -d $TMPMNT ] && rmdir $TMPMNT
>   exit $1
> }
> 
> trap "
>   echo -e 'Bye bye...\n'
>   cleanup 1
> " 1 2 3 15
> 
> create_fstab () {
>    cat << FSTAB > $TMPMNT/etc/fstab
> /dev/ram        /               ext2    defaults        0   0
> proc            /proc           proc    defaults        0   0
> FSTAB
>    chmod 644 $TMPMNT/etc/fstab
> }
> 
> create_linuxrc () {
>    cat << LINUXRC > $TMPMNT/linuxrc
> #!/bin/sh
> /sbin/modprobe lvm-mod
> /bin/mount /proc
> /sbin/vgscan
> /sbin/vgchange -a y
> /bin/umount /proc
> LINUXRC
>    chmod 555 $TMPMNT/linuxrc
> }
> 
> #
> # Main
> #
> echo -e "\nLogical Volume Manager 0.9 by Heinz Mauelshagen  01/12/2001\n"
> echo -e "$cmd -- create an LVM initial ram disk $INITRD\n"
> 
> # figure out which actual shared libraries we need in our initrd
> echo "$cmd -- figuring out shared libraries"
> SHLIBS=`ldd $INITRDFILES 2>/dev/null | awk '{if (/=>/) { print $3 }}' | sort -u`
> if [ $? -ne 0 ]; then
>    echo -e "$cmd -- ERROR figuring out needed shared libraries\n"
>    exit 1
> fi
> 
> #INITRDSIZE="`du -cLk /dev $SHLIBS $INITRDFILES | awk '/total/ { print $1 }'`"
> echo "$cmd -- making loopback file ($INITRDSIZE kB)"
> dd if=/dev/zero of=$DEVRAM count=$INITRDSIZE bs=1024 >/dev/null 2>&1
> if [ $? -ne 0 ]; then
>    echo -e "$cmd -- ERROR creating loopback file\n"
>    cleanup 1
> fi
> 
> # We can only have 8 * blocksize inodes per group, so for an 8MB filesystem
> # (1 group) with > 8192 inodes, we need to use a bigger block size.  Yuk.
> NUMINO="`find /dev /dev $SHLIBS $INITRDFILES | wc -w`"
> NUMINO=`expr $NUMINO + 64`
> if [ $NUMINO -gt `expr $INITRDSIZE \* 2` ]; then
>    INODE_OPT="-b 4096 -N $NUMINO"
> elif [ $NUMINO -gt $INITRDSIZE ]; then
>    INODE_OPT="-b 2048 -N $NUMINO"
> else
>    INODE_OPT="-i `expr $INITRDSIZE \* 1024 / $NUMINO`"
> fi
> echo "$cmd -- making ram disk filesystem ($NUMINO inodes)"
> mke2fs -q -F -m0 $INODE_OPT $DEVRAM $INITRDSIZE
> if [ $? -ne 0 ]; then
>    echo -e "$cmd -- ERROR making ram disk filesystem\n"
>    cleanup 1
> fi
> 
> mkdir $TMPMNT
> if [ $? -ne 0 ]; then
>    echo -e "$cmd -- ERROR making $TMPMNT\n"
>    cleanup 1
> fi
> 
> echo "$cmd -- mounting ram filesystem"
> mount -oloop $DEVRAM $TMPMNT
> if [ $? -ne 0 ]; then
>    echo -e "$cmd -- ERROR mounting $DEVRAM on $TMPMNT\n"
>    cleanup 1
> fi
> 
> mkdir $TMPMNT/etc $TMPMNT/proc
> 
> #
> # create new modules configuration to avoid kmod complaining
> # about nonexsisting modules.
> #
> MODCONF=/etc/modules.conf
> [ ! -r $MODCONF -a -r /etc/conf.modules ] && MODCONF=/etc/conf.modules
> echo "$cmd -- creating new $MODCONF"
> MAJ=0
> while [ $MAJ -lt 256 ]; do
>    echo "alias block-major-$MAJ off"
>    echo "alias char-major-$MAJ  off"
>    MAJ=`expr $MAJ + 1`
> done > $TMPMNT/$MODCONF
> 
> # to ensure, that modprobe doesn complain about timestamps
> echo "$cmd -- creating new modules.dep"
> depmod -a $VERSION
> if [ $? -ne 0 ]; then
>    echo -e "$cmd -- ERROR running depmod\n"
>    cleanup 1
> fi
> 
> # copy necessary files to ram disk
> echo "$cmd -- copying files to ram disk"
> find $INITRDFILES /dev|cpio -pdm --quiet $TMPMNT
> if [ $? -ne 0 ]; then
>    echo -e "$cmd -- ERROR cpio to ram disk\n"
>    cleanup 1
> fi
> 
> echo "$cmd -- copying shared libraries to ram disk"
> for LIB in $SHLIBS; do
>    cp $LIB $TMPMNT$LIB
>    if [ $? -ne 0 ]; then
>       echo -e "$cmd -- ERROR copying shared library $LIB to ram disk\n"
>       cleanup 1
>    fi
>    strip $TMPMNT$LIB
>    if [ $? -ne 0 ]; then
>       echo -e "$cmd -- ERROR stripping shared library $LIB\n"
>       cleanup 1
>    fi
> done
> 
> echo "$cmd -- creating new /linuxrc"
> create_linuxrc
> if [ $? -ne 0 ]; then
>    echo -e "$cmd -- ERROR creating linuxrc\n"
>    cleanup
>    exit 1
> fi
> 
> echo "$cmd -- creating new /etc/fstab"
> create_fstab
> if [ $? -ne 0 ]; then
>    echo -e "$cmd -- ERROR creating /etc/fstab\n"
>    cleanup 1
> fi
> 
> echo "$cmd -- ummounting ram disk"
> umount $DEVRAM
> if [ $? -ne 0 ]; then
>    echo -e "$cmd -- ERROR umounting $DEVRAM\n"
>    cleanup 1
> fi
> 
> echo "$cmd -- creating compressed initrd $INITRD"
> dd if=$DEVRAM bs=1k count=$INITRDSIZE 2>/dev/null | gzip -9 > $INITRD
> if [ $? -ne 0 ]; then
>    echo -e "$cmd -- ERROR creating $INITRD\n"
>    cleanup 1
> fi
> 
> cleanup 0
> --
> Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
>                  \  would they cancel out, leaving him still hungry?"
> http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

-- 

Good Journey, longevity and prosperity to all

Les Hazelton
