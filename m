Message-ID: <005e01c1442b$f1a528e0$0f00a8c0@myplace.net>
From: "Bas" <weblists@gmx.net>
References: <NBBBJHKIOKPKOGOEPEDPAEEJDNAA.stuart@bh90210.net><3BA0AE16.1A4F69F@carolina.rr.com><87u1xzv3gm.fsf@arm.t19.ds.pwr.wroc.pl><20010919165134.R14526@turbolinux.com> <87bsk3cujs.fsf@arm.t19.ds.pwr.wroc.pl>
Subject: Re: [linux-lvm] LVM - mkinitrd.sh
Date: Sun, 23 Sep 2001 14:33:27 +0200
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_005B_01C1443C.B51D3000"
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
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_005B_01C1443C.B51D3000
Content-Type: text/plain;
	charset="iso-8859-2"
Content-Transfer-Encoding: 7bit

Hi,

I modified lvmcreate_initrd on my system because I'm not using cpio.

This is the modified version to work with cp, let me know if it works ... I
never had any problems with it and LVM is compiled in my kernel, no module.
I checked to se if it handles symlinks like it's supposed to, and it does.

Bas.

------=_NextPart_000_005B_01C1443C.B51D3000
Content-Type: application/octet-stream;
	name="mkinitrd.sh"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="mkinitrd.sh"

#!/bin/sh=0A=
#=0A=
#  Copyright (C) 1997 - 2000  Heinz Mauelshagen, Sistina Software=0A=
# =0A=
#  June 1999=0A=
#  December 1999=0A=
#  January 2000=0A=
#  January 2001=0A=
# =0A=
#  LVM is free software; you can redistribute it and/or modify=0A=
#  it under the terms of the GNU General Public License as published by=0A=
#  the Free Software Foundation; either version 2, or (at your option)=0A=
#  any later version.=0A=
#  =0A=
#  LVM is distributed in the hope that it will be useful,=0A=
#  but WITHOUT ANY WARRANTY; without even the implied warranty of=0A=
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the=0A=
#  GNU General Public License for more details.=0A=
#  =0A=
#  You should have received a copy of the GNU General Public License=0A=
#  along with LVM; see the file COPYING.  If not, write to=0A=
#  the Free Software Foundation, 59 Temple Place - Suite 330,=0A=
#  Boston, MA 02111-1307, USA. =0A=
# =0A=
=0A=
#=0A=
# Changelog=0A=
#=0A=
#   16/11/1999 - corrected -N type with mke2fs=0A=
#   19/12/1999 - use correct ramdisk size=0A=
#                strip shared library to save space=0A=
#   04/01/2000 - support /proc mount, because lvm_dir_cache now uses it=0A=
#   12/02/2001 - always create enough inodes in ramdisk for dev files=0A=
#   [AED]      - check all INITRDFILES for library dependencies=0A=
#              - make commands quiet and avoid redirecting errors to =
/dev/null=0A=
#              - use cleanup function for all errors, interrupts, normal =
exit=0A=
#   12/02/2001 - copy and strip shared libraries before putting on =
ramdisk=0A=
#   [AED]      - allow specification of /dev directory (in case of devfs)=0A=
#              - calculate ramdisk size from libraries, devices, =
INITRDFILES=0A=
#              - add verbose progress messages=0A=
#              - copy actual executables if we are using wrapper scripts=0A=
#   12/02/2001 - support monolithic kernels=0A=
#   14/02/2001 - add usage and command-line switches. Lots of other =
changes=0A=
#              - from Andreas Dilger=0A=
#   05/04/2001 - Ignore errors from depmod because we might be a =
monolithic=0A=
#                kernel=0A=
#=0A=
=0A=
=0A=
cmd=3D`basename $0`=0A=
=0A=
TMPMNT=3D/tmp/mnt.$$=0A=
TMPLIB=3D/tmp/lib.$$=0A=
USEMOD=3D1=0A=
=0A=
PATH=3D/bin:/sbin:/usr/bin:/usr/sbin:$PATH=0A=
=0A=
usage () {=0A=
	echo "Create an initial ramdisk image for LVM root filesystem"=0A=
	echo "$cmd: [-h] [-i] [-M] [-v] [-V] [kernel version]"=0A=
	echo "      -h|--help     print this usage message"=0A=
	echo "      -i|--iop      specify LVM IOP version to use"=0A=
	echo "      -M|--nomod    do not set up module support in initrd"=0A=
	echo "      -v|--verbose  verbose progress messages"=0A=
	echo "      -V|--version  print script version and exit"=0A=
}=0A=
=0A=
verbose () {=0A=
   [ "$VERBOSE" ] && echo "`echo $cmd | tr '[a-z0-9/_]' ' '` -- $1" || =
true=0A=
}=0A=
=0A=
cleanup () {=0A=
  [ "`mount | grep $DEVRAM`" ] && verbose "unmounting $DEVRAM" && umount =
$DEVRAM=0A=
  [ -f $DEVRAM ] && verbose "removing $DEVRAM" && rm $DEVRAM=0A=
  [ -d $TMPMNT ] && verbose "removing $TMPMNT" && rmdir $TMPMNT=0A=
  [ -d $TMPLIB ] && verbose "removing $TMPLIB" && rm -r $TMPLIB=0A=
  verbose "exit with code $1"=0A=
  exit $1=0A=
}=0A=
=0A=
trap "=0A=
  verbose 'Caught interrupt'=0A=
  echo 'Bye bye...'=0A=
  cleanup 1=0A=
" 1 2 3 15=0A=
=0A=
=0A=
create_fstab () {=0A=
   cat << FSTAB > $TMPMNT/etc/fstab=0A=
/dev/ram	/		ext2	defaults	0   0=0A=
proc		/proc		proc	defaults	0   0=0A=
FSTAB=0A=
   chmod 644 $TMPMNT/etc/fstab=0A=
}=0A=
=0A=
create_linuxrc () {=0A=
   echo "#!/bin/sh" > $TMPMNT/linuxrc=0A=
   [ "$LVMMOD" ] && echo "/sbin/modprobe $LVMMOD" >> $TMPMNT/linuxrc=0A=
   cat << LINUXRC >> $TMPMNT/linuxrc=0A=
/bin/mount /proc=0A=
/sbin/vgscan=0A=
/sbin/vgchange -a y=0A=
/bin/umount /proc=0A=
LINUXRC=0A=
   chmod 555 $TMPMNT/linuxrc=0A=
}=0A=
=0A=
#=0A=
# Main=0A=
#=0A=
echo "Logical Volume Manager 0.9.1_CVS by Heinz Mauelshagen  02/03/2001"=0A=
=0A=
VERSION=3D`uname -r`=0A=
=0A=
while [ $# -gt 0 ]; do=0A=
   case $1 in=0A=
   -h|--help) usage; exit 0;;=0A=
   -i|--iop) IOP=3D$2; shift;;=0A=
   -M|--nomod) USEMOD=3D""; shift;;=0A=
   -V|--version) exit 0;;=0A=
   -d|-v|--debug|--verbose) VERBOSE=3D"y";;=0A=
   [2-9].[0-9]*.[0-9]*) VERSION=3D$1;;=0A=
   *) echo "$cmd -- invalid option '$1'"; usage; exit 0;;=0A=
   esac=0A=
   shift=0A=
done=0A=
=0A=
INITRD=3D${INITRD:-"/boot/initrd-lvm-$VERSION.gz"}=0A=
#INITRD=3D${INITRD:-"/boot/initrd-lvm-$VERSION.gz"}=0A=
MODULES=3D/lib/modules/$VERSION=0A=
DEVRAM=3D/tmp/initrd.$$=0A=
DEV=3D${DEV:-"/dev"}=0A=
=0A=
echo "$cmd -- make LVM initial ram disk $INITRD"=0A=
echo ""=0A=
=0A=
# The size of the ramdisk is automatically calculated unless this is set=0A=
INITRDSIZE=3D8192=0A=
INITRDFILES=3D"/sbin/vgchange /sbin/vgscan /bin/bash /bin/mount =
/bin/umount /bin/sh /bin/rm"=0A=
=0A=
if [ "$USEMOD" ]; then=0A=
   # Check for an LVM module, otherwise it must be compiled into the =
kernel=0A=
   if [ -r $MODULES/kernel/drivers/md/lvm-mod.o ]; then=0A=
      LVMMOD=3D"lvm-mod"=0A=
      INITRDFILES=3D"$INITRDFILES $MODULES/kernel/drivers/md/$LVMMOD.o"=0A=
   elif [ -r $MODULES/block/lvm-mod.o ]; then=0A=
      LVMMOD=3D"lvm-mod"=0A=
      INITRDFILES=3D"$INITRDFILES $MODULES/block/$LVMMOD.o"=0A=
   elif [ -r $MODULES/block/lvm.o ]; then=0A=
      LVMMOD=3D"lvm"=0A=
      INITRDFILES=3D"$INITRDFILES $MODULES/block/$LVMMOD.o"=0A=
   fi=0A=
=0A=
   if [ -x "/sbin/modprobe" ]; then=0A=
      INITRDFILES=3D"$INITRDFILES /sbin/modprobe"=0A=
   elif [ "$LVMMOD" ]; then=0A=
      echo "$cmd -- have $LVMMOD but not /sbin/modprobe."=0A=
      cleanup 1=0A=
   fi=0A=
   if [ -x "/sbin/insmod" ]; then=0A=
      INITRDFILES=3D"$INITRDFILES /sbin/insmod"=0A=
   elif [ "$LVMMOD" ]; then=0A=
      echo "$cmd -- have $LVMMOD but not /sbin/insmod."=0A=
      cleanup 1=0A=
   fi=0A=
   if [ -r "$MODULES/modules.dep" ]; then=0A=
      INITRDFILES=3D"$INITRDFILES $MODULES/modules.dep"=0A=
   fi=0A=
fi=0A=
=0A=
# If we have LVM wrapper scripts in /sbin, we need to fix this by =
including=0A=
# the actual executables into the initrd as well.=0A=
if [ -x /sbin/lvmiopversion ]; then=0A=
   # Use the IOP version, if specified.  Otherwise, if we are building =
for=0A=
   # the current kernel or there is only one IOP version installed, use =
it.=0A=
   if [ "$IOP" ]; then=0A=
      IOP=3D"/lib/lvm-iop$IOP"=0A=
   elif [ "$VERSION" =3D "`uname -r`" ]; then=0A=
      IOP=3D"/lib/lvm-iop`lvmiopversion`"=0A=
   elif [ `ls -d /lib/lvm-iop* | wc -w` -eq 1 ]; then=0A=
      IOP=3D"`ls -d /lib/lvm-iop*`"=0A=
   fi=0A=
   for FILE in $INITRDFILES; do=0A=
   case $FILE in=0A=
   /sbin/vg*|/sbin/lv*|/sbin/pv*)=0A=
      if [ "`file $FILE 2> /dev/null | grep script`" ]; then=0A=
         verbose "$FILE is a wrapper script, resolving."=0A=
         if [ -z "$IOP" ]; then=0A=
            echo "$cmd -- need to set LVM IOP for kernel $VERSION with =
'-i'."=0A=
            cleanup 1=0A=
         fi=0A=
         NEWFILE=3D"$IOP/`basename $FILE`"=0A=
	 if [ -x $NEWFILE ]; then=0A=
	    INITRDFILES=3D"$INITRDFILES $NEWFILE"=0A=
         else=0A=
	    echo "$cmd -- can't find $NEWFILE, your initrd may not work."=0A=
	 fi=0A=
      fi ;;=0A=
   esac=0A=
   done=0A=
   INITRDFILES=3D"$INITRDFILES /sbin/lvmiopversion"=0A=
fi=0A=
=0A=
# Figure out which shared libraries we actually need in our initrd=0A=
echo "$cmd -- finding required shared libraries"=0A=
verbose "INITRDFILES: `echo $INITRDFILES`"=0A=
SHLIBS=3D`ldd $INITRDFILES 2>/dev/null | awk '{if (/=3D>/) { print $3 =
}}' | sort -u`=0A=
if [ $? -ne 0 ]; then=0A=
   echo "$cmd -- ERROR figuring out needed shared libraries"=0A=
   exit 1=0A=
fi=0A=
=0A=
verbose "need: `echo $SHLIBS`"=0A=
=0A=
# Copy shared libraries to a temp directory before stripping, so that we =
don't=0A=
# run out of room on the ramdisk while stripping the libraries.=0A=
echo "$cmd -- stripping shared libraries"=0A=
mkdir -p ${TMPLIB}/lib=0A=
for LIB in $SHLIBS; do=0A=
   verbose "copy $LIB to ${TMPLIB}${LIB}"=0A=
   cp $LIB ${TMPLIB}${LIB}=0A=
   if [ $? -ne 0 ]; then=0A=
      echo "$cmd -- ERROR copying shared library $LIB to ram disk"=0A=
      cleanup 1=0A=
   fi=0A=
   verbose "strip $TMPLIB$LIB"=0A=
   strip ${TMPLIB}${LIB}=0A=
   if [ $? -ne 0 ]; then=0A=
      echo "$cmd -- ERROR stripping shared library $LIB"=0A=
      cleanup 1=0A=
   fi=0A=
done=0A=
=0A=
# Calculate the number of inodes needed, and the size of the ramdisk =
image.=0A=
# Don't forget that inodes take up space too, as does the filesystem =
metadata.=0A=
echo "$cmd -- calculating initrd filesystem parameters"=0A=
verbose "counting files in: $DEV $TMPLIB \$INITRDFILES"=0A=
NUMINO=3D"`find $DEV $TMPLIB $INITRDFILES | wc -w`"=0A=
verbose "minimum: $NUMINO inodes + filesystem reserved inodes"=0A=
NUMINO=3D`expr $NUMINO + 64`=0A=
if [ -z "$INITRDSIZE" ]; then=0A=
   echo "$cmd -- calculating loopback file size"=0A=
   verbose "finding size of: $DEV $TMPLIB \$INITRDFILES"=0A=
   INITRDSIZE=3D"`du -ck $DEV $TMPLIB $INITRDFILES | tail -1 | cut -f 1`"=0A=
   verbose "minimum: $INITRDSIZE kB for files + inodes + filesystem =
metadata"=0A=
   INITRDSIZE=3D`expr $INITRDSIZE + $NUMINO / 8 + 512`  # enough for =
ext2 fs + a bit=0A=
fi=0A=
=0A=
echo "$cmd -- making loopback file ($INITRDSIZE kB)"=0A=
verbose "using $DEVRAM as a temporary loopback file"=0A=
dd if=3D/dev/zero of=3D$DEVRAM count=3D$INITRDSIZE bs=3D1024 > /dev/null =
2>&1=0A=
if [ $? -ne 0 ]; then=0A=
   echo "$cmd -- ERROR creating loopback file"=0A=
   cleanup 1=0A=
fi=0A=
=0A=
# Ext2 can only have 8 * blocksize inodes per group, so we may need to=0A=
# increase the number of groups created if there are lots of inodes.=0A=
if [ $NUMINO -gt $INITRDSIZE ]; then=0A=
   if [ $NUMINO -gt 8192 ]; then=0A=
      verbose "too many inodes for one group - need to create more =
groups"=0A=
      BPG=3D`expr $INITRDSIZE \* 8192 / $NUMINO`=0A=
      INODE_OPT=3D"-g `expr $BPG + 8 - $BPG % 8` -N $NUMINO"=0A=
   else=0A=
      INODE_OPT=3D"-N $NUMINO"=0A=
   fi=0A=
else=0A=
   INODE_OPT=3D"-i `expr $INITRDSIZE \* 1024 / $NUMINO`"=0A=
fi=0A=
=0A=
echo "$cmd -- making ram disk filesystem ($NUMINO inodes)"=0A=
verbose "mke2fs -F -m0 -L LVM-$VERSION $INODE_OPT $DEVRAM $INITRDSIZE"=0A=
[ "$VERBOSE" ] && OPT_Q=3D"" || OPT_Q=3D"-q"=0A=
mke2fs $OPT_Q -F -m0 -L LVM-$VERSION $INODE_OPT $DEVRAM $INITRDSIZE =
>/dev/null 2>&1=0A=
if [ $? -ne 0 ]; then=0A=
   echo "$cmd -- ERROR making ram disk filesystem"=0A=
   echo "$cmd -- ERROR you need to use mke2fs >=3D 1.14 or increase =
INITRDSIZE"=0A=
   cleanup 1=0A=
fi=0A=
=0A=
verbose "creating mountpoint $TMPMNT"=0A=
mkdir -p "$TMPMNT"=0A=
if [ $? -ne 0 ]; then=0A=
   echo "$cmd -- ERROR making $TMPMNT"=0A=
   cleanup 1=0A=
fi=0A=
=0A=
echo "$cmd -- mounting ram disk filesystem"=0A=
verbose "mount -o loop $DEVRAM $TMPMNT"=0A=
mount -oloop $DEVRAM $TMPMNT=0A=
if [ $? -ne 0 ]; then=0A=
   echo "$cmd -- ERROR mounting $DEVRAM on $TMPMNT"=0A=
   cleanup 1=0A=
fi=0A=
=0A=
verbose "creating /etc /proc /lib in $TMPMNT"=0A=
mkdir -p $TMPMNT/etc $TMPMNT/proc $TMPMNT/lib/modules/$VERSION =
$TMPMNT/dev $TMPMNT/bin $TMPMNT/sbin=0A=
if [ $? -ne 0 ]; then=0A=
   echo "$cmd -- ERROR creating directories in $TMPMNT"=0A=
   cleanup 1=0A=
fi=0A=
verbose "removing $TMPMNT/lost+found"=0A=
rmdir $TMPMNT/lost+found=0A=
=0A=
if [ "$USEMOD" ]; then=0A=
   #=0A=
   # create new modules configuration to avoid kmod complaining=0A=
   # about nonexsisting modules.=0A=
   #=0A=
   MODCONF=3D/etc/modules.conf=0A=
   [ ! -r $MODCONF -a -r /etc/conf.modules ] && =
MODCONF=3D/etc/conf.modules=0A=
   echo "$cmd -- creating new $MODCONF"=0A=
   verbose "all block and char modules will be turned off"=0A=
   MAJ=3D0=0A=
   while [ $MAJ -lt 256 ]; do=0A=
      echo "alias block-major-$MAJ	off"=0A=
      echo "alias char-major-$MAJ	off"=0A=
      MAJ=3D`expr $MAJ + 1`=0A=
   done > $TMPMNT/$MODCONF=0A=
=0A=
=0A=
   # to ensure, that modprobe doesn complain about timestamps=0A=
   echo "$cmd -- creating new modules.dep"=0A=
   depmod -a $VERSION=0A=
   if [ $? -ne 0 ]; then=0A=
      echo "$cmd -- ERROR running depmod"=0A=
      cleanup 1=0A=
   fi=0A=
fi=0A=
=0A=
# copy necessary files to ram disk=0A=
echo "$cmd -- copying device files to ram disk"=0A=
[ "$VERBOSE" ] && OPT_Q=3D"-v" || OPT_Q=3D"--quiet"=0A=
verbose "find $DEV | cpio -pdm $TMPMNT"=0A=
#(cd $DEV; find . | cpio -pdm $OPT_Q $TMPMNT/dev)=0A=
(cd $DEV; cp -pRd /dev $TMPMNT)=0A=
if [ $? -ne 0 ]; then=0A=
   echo "$cmd -- ERROR cp to ram disk"=0A=
   cleanup 1=0A=
fi=0A=
=0A=
echo "$cmd -- copying initrd files to ram disk"=0A=
verbose "find \$INITRDFILES | cpio -pdm $OPT_Q $TMPMNT"=0A=
#find $INITRDFILES | cpio -pdm $OPT_Q $TMPMNT=0A=
for i in $INITRDFILES=0A=
do=0A=
	cp -pRd $i "$TMPMNT""$i"=0A=
done=0A=
if [ $? -ne 0 ]; then=0A=
   echo "$cmd -- ERROR cp to ram disk"=0A=
   cleanup 1=0A=
fi=0A=
=0A=
#mkdir ${TMPMNT}/lib=0A=
echo "$cmd -- copying shared libraries to ram disk"=0A=
verbose "find $TMPLIB | cpio -pdm $OPT_Q $TMPMNT"=0A=
#(cd $TMPLIB; find * | cpio -pdm $OPT_Q $TMPMNT)=0A=
(cd ${TMPLIB}/lib ; find * -exec cp -pRd '{}' ${TMPMNT}/lib ';')=0A=
if [ $? -ne 0 ]; then=0A=
   echo "$cmd -- ERROR copying shared libraries to ram disk"=0A=
   cleanup 1=0A=
fi=0A=
=0A=
echo "$cmd -- creating new /linuxrc"=0A=
create_linuxrc=0A=
if [ $? -ne 0 ]; then=0A=
   echo "$cmd -- ERROR creating linuxrc"=0A=
   cleanup=0A=
   exit 1=0A=
fi=0A=
=0A=
echo "$cmd -- creating new /etc/fstab"=0A=
create_fstab=0A=
if [ $? -ne 0 ]; then=0A=
   echo "$cmd -- ERROR creating /etc/fstab"=0A=
   cleanup 1=0A=
fi=0A=
=0A=
echo "$cmd -- ummounting ram disk"=0A=
umount $DEVRAM=0A=
if [ $? -ne 0 ]; then=0A=
   echo "$cmd -- ERROR umounting $DEVRAM"=0A=
   cleanup 1=0A=
fi=0A=
=0A=
echo "$cmd -- creating compressed initrd $INITRD"=0A=
verbose "dd if=3D$DEVRAM bs=3D1k count=3D$INITRDSIZE | gzip -9"=0A=
dd if=3D$DEVRAM bs=3D1k count=3D$INITRDSIZE 2>/dev/null | gzip -9 > =
$INITRD=0A=
if [ $? -ne 0 ]; then=0A=
   echo "$cmd -- ERROR creating $INITRD"=0A=
   cleanup 1=0A=
fi=0A=
=0A=
cleanup 0=0A=

------=_NextPart_000_005B_01C1443C.B51D3000--
