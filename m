Message-Id: <199907011608.AA20815@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] vgscan -- invalid i/o protocol version
Date: Thu, 01 Jul 1999 18:04:54 METDST
In-Reply-To: <852567A1.0047037F.00@USCOMM02.aholdusa.com>; from "David Venus" at Jul 1, 99 8:46 am
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Venus <dvenus@aholdusa.com>
Cc: mge@u9ete.ez-darmstadt.telekom.de, linux-lvm@msede.com


Hi Dave.

> 
> Can you send me the contents of the INITRD partition? Is this in the LVM
> documentation?
> 

No it's not in the 0.6 documentation.

Here are lvmcreate_initrd which creates an initial ram disk image
and an example /boot/lilo.conf to boot from a boot partition and change
root to a LV based root filesystem.

You have to have a /boot fs on a bios adressable disk (saw in /dev/hda5).
16 MB is sufficient, if you want to make this boot partition standalone
bootable and not only want to use it to store an INITRD image.

Copy vmlinux, System.map, lilo.conf, boot.b and chain.b to that boot fs.
Make /etc/lilo.conf a symlink to /boot/lilo.conf.

Set up LVs for /, /usr etc. and copy existing partition bases filesystem
contents to the temporary mounted LV based new filesystems.

The lvmcreate_initrd script below assumes /boot as your mountpoint of
the boot filesystem and that you load LVM as a module.
Don't forget to configure RAM disk and Initial RAM disk support in the kernel
and to copy any files to /boot you need for standalone emergency boot of
your boot fs (see end of the lilo.conf example).

Regards and good luck,
Heinz



A lilo.conf example assuming you would set up a vg00 as the "boot" VG,
your boot partition is on /dev/hda5 and your LV based root is on /dev/vg00/root:

#########################################################################
# LILO Configuration

# Start LILO global Section
boot = /dev/hda
install = /boot/boot.b	# must be redable by bios
read-only
prompt
timeout = 100
vga = normal    # force sane state
message = /boot/message
map = /boot/map	# must be readable by bios
# End LILO global Section

#
image = /boot/vmlinuz
  initrd = /boot/initrd.gz
  root = /dev/vg00/root
  alias = 1
  label = linuxinitrd

#
image = /boot/vmlinuz.old
  initrd = /boot/initrd.old.gz
  root = /dev/vg00/root
  alias = 2
  label = lnxoldinitrdold

#
image = /boot/vmlinuz
  append = "init=/bin/sh"
  root = /dev/hda5
  alias = 3
  label = linuxhda5
# End ###################################################################




#!/bin/sh
#
#  Copyright (C) 1997 - 1999  Heinz Mauelshagen, Germany
# 
#  June 1999
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
# make it devfs clean
#

cmd=`basename $0`
DEVRAM=/dev/ram1
INITRD=/boot/initrd.gz
INITRDSIZE=8192
INITRDFILES="/sbin/modprobe /sbin/vgchange /sbin/vgscan /bin/bash /bin/sh /bin/rm /sbin/insmod /dev/* /lib/modules/`uname -r`/modules.dep /lib/modules/`uname -r`/block/lvm.o"
TMP=/tmp/mnt.$$

trap "
  cd /
  umount $DEVRAM
  freeramdisk $DEVRAM
  echo -e 'Bye bye...\n'
" 1 2 3 15


function create_linuxrc {
   echo "#!/bin/sh
   /sbin/insmod lvm
   /sbin/vgscan
   /sbin/vgchange -a y" > linuxrc
   chmod 555 linuxrc
}

#
# Main
#
echo -e "\nLogical Volume Manager 0.7 by Heinz Mauelshagen  01/07/1999\n"
echo -e "$cmd -- this script creates a LVM initial ram disk in $INITRD\n"

echo "$cmd -- making ram filesystem"
mke2fs -m0 -N 4096 $DEVRAM $INITRDSIZE >/dev/null 2>&1
if [ $? -ne 0 ]; then
   echo -e "$cmd -- ERROR making ram disk filesystem\n"
   exit 1
fi

mkdir -p $TMP/ram >/dev/null 2>&1
if [ $? -ne 0 ]; then
   echo -e "$cmd -- ERROR making $TMP/ram\n"
   exit 1
fi

echo "$cmd -- mounting ram filesystem"
mount -t ext2 $DEVRAM $TMP/ram >/dev/null 2>&1
if [ $? -ne 0 ]; then
   echo -e "$cmd -- ERROR mounting $DEVRAM on $TMP/ram\n"
   exit 1
fi

cd $TMP/ram
[ ! -d etc ] && mkdir etc

#
# create new conf.modules to avoid kmod complaining about nonexsisting modules.
#
echo "$cmd -- creating etc/conf.modules"
i=0
while [ $i -lt 256 ]; do
   echo "alias	block-major-$i	off"
   echo "alias	char-major-$i	off"
   let i=i+1
done > etc/conf.modules

# to ensure, that modprobe doesn complain about timestamps
echo "$cmd -- creating new modules.dep"
depmod -a >/dev/null 2>&1
if [ $? -ne 0 ]; then
   echo -e "$cmd -- ERROR depmod\n"
   exit 1
fi

# copy necessary files to ram disk
echo "$cmd -- copying files to ram disk"
find $INITRDFILES|cpio -pdm $TMP/ram >/dev/null 2>&1
if [ $? -ne 0 ]; then
   echo -e "$cmd -- ERROR cpio to ram disk\n"
   exit 1
fi

# figure out which actual shared libraries we need in our initrd
echo "$cmd -- figuring out shared libraries"
SHLIBS=`ldd sbin/vg* bin/sh|awk '{if(/=>/){print $3}}'|sort -u 2>/dev/null`
if [ $? -ne 0 ]; then
   echo -e "$cmd -- ERROR figuring out needed shared libraries\n"
   exit 1
fi

echo "$cmd -- copying shared libraries to ram disk"
find $SHLIBS|cpio -Lpdm $TMP/ram >/dev/null 2>&1
if [ $? -ne 0 ]; then
   echo -e "$cmd -- ERROR copying needed shared libraries to ram disk\n"
   exit 1
fi

echo "$cmd -- creating linuxrc"
create_linuxrc >/dev/null 2>&1
if [ $? -ne 0 ]; then
   echo -e "$cmd -- ERROR creating linuxrc\n"
   exit 1
fi

cd /
echo "$cmd -- ummounting ram disk"
umount $DEVRAM
if [ $? -ne 0 ]; then
   echo -e "$cmd -- ERROR umounting $DEVRAM\n"
   exit 1
fi

echo "$cmd -- creating compressed initrd in $INITRD"
gzip -9 < $DEVRAM > $INITRD 2>/dev/null
if [ $? -ne 0 ]; then
   echo -e "$cmd -- ERROR creating $INITRD\n"
   exit 1
fi

freeramdisk $DEVRAM

--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement C/S                             Deutsche Telekom AG
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
