Message-ID: <E3A1ACFEDE71D3118C000020352285A0387FB9@nbsjexm2.nbtel.nb.ca>
From: "Shaw, Marco" <marco.shaw@nbtel.nb.ca>
Subject: RE: [linux-lvm] lvmcreate_initrd with SuSE 6.3?
Date: Mon, 10 Apr 2000 07:54:21 -0300
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01BFA2DB.20D5B049"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01BFA2DB.20D5B049
Content-Type: text/plain

Can someone provide me with this script?  Or tell me if this is the latest
one (don't know if attachment will work since I'm using Outlook...)?

 <<lvmcreate_initrd-19991114.txt>> 

Thanks,
Marco

> -----Original Message-----
> From:	Shaw, Marco [SMTP:marco.shaw@nbtel.nb.ca]
> Sent:	April 9, 2000 8:35 PM
> To:	linux-lvm@msede.com
> Subject:	[linux-lvm] lvmcreate_initrd with SuSE 6.3?
> 
> Trying to setup my root fs as a LVM.  Was reading up on lvmcreate_initrd,
> and my SuSE 6.3 system has the man page, but I searched my entire system,
> and the command itself cannot be found.
> 
> I imagine I could create it myself with the appropriate libraries...
> 
> Any ideas?
> Marco

------_=_NextPart_000_01BFA2DB.20D5B049
Content-Type: text/plain;
	name="lvmcreate_initrd-19991114.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="lvmcreate_initrd-19991114.txt"

#!/bin/sh=0A=
#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=0A=
#=0A=
# Warning! This is definitely NOT the original version!!!=0A=
#=0A=
# DONTCHA USE THIS SCRIPT EXCEPT ON OWN RISK!!!=0A=
#=0A=
# Read the following sentence 10 times:=0A=
#=0A=
#     I have been warned.=0A=
#=0A=
#                                                       1999-11-12/Ulf =
Bartelt=0A=
#                                                                   =
ulf@twc.de=0A=
#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=0A=
#=0A=
#  Copyright (C) 1997 - 1999  Heinz Mauelshagen, Germany=0A=
# =0A=
#  June 1999=0A=
# =0A=
#  LVM is free software; you can redistribute it and/or modify=0A=
#  it under the terms of the GNU General Public License as published =
by=0A=
#  the Free Software Foundation; either version 2, or (at your =
option)=0A=
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
# make it devfs clean=0A=
#=0A=
=0A=
cmd=3D`basename $0`=0A=
=0A=
#=0A=
# 19991112/UBa:=0A=
#	I decided to generate the image using a loop mount instead of a=0A=
#	ramdisk device and not to put initrd into /boot automagically, so=0A=
#	this has to be done manually now not forgetting to rerun lilo or=0A=
#	whatever bootloader you're using...=0A=
#=0A=
DEVRAM=3D/tmp/initrd=0A=
INITRD=3D/tmp/initrd.gz=0A=
INITRDSIZE=3D8192=0A=
#=0A=
# 19991113/UBa:=0A=
#	added grep=0A=
# 19991112/UBa:=0A=
#	added mount and umount=0A=
#	question: what for did Heinz include rm in this list?=0A=
#=0A=
INITRDFILES=3D"/bin/grep /bin/mount /bin/umount /sbin/modprobe =
/sbin/vgchange /sbin/vgscan /bin/bash /bin/sh /bin/rm /sbin/insmod =
/dev/* /lib/modules/`uname -r`/modules.dep /lib/modules/`uname =
-r`/block/lvm.o"=0A=
TMP=3D/tmp/mnt.$$=0A=
=0A=
trap "=0A=
  cd /=0A=
  umount $DEVRAM=0A=
  rm -rf $TMP=0A=
  echo -e 'Bye bye...\n'=0A=
" 1 2 3 15=0A=
=0A=
=0A=
function create_fstab {=0A=
   echo "=0A=
/dev/ram        /                         ext2            defaults   1  =
 0=0A=
none            /proc                     proc            defaults   0  =
 0=0A=
   " > etc/fstab=0A=
   chmod 644 etc/fstab=0A=
}=0A=
=0A=
#=0A=
# 19991113/UBa:=0A=
#	added scanning /proc/partitions for vg00/root to get major and =
minor=0A=
#	of root device=0A=
# 19991112/UBa:=0A=
#	added mounting/umounting proc to echo a hardcoded value of=0A=
#	major*256+minor of root device into /proc/sys/kernel/real-root-dev=0A=
#=0A=
function create_linuxrc {=0A=
   echo "\=0A=
#!/bin/sh=0A=
/bin/mount /proc=0A=
/sbin/insmod lvm=0A=
=0A=
/sbin/vgscan=0A=
/sbin/vgchange -a y=0A=
=0A=
/bin/grep vg00/root /proc/partitions | (=0A=
   read major minor blocks name=0A=
   if [ \$name =3D=3D vg00/root ] ; then=0A=
      echo found vg00/root with major/minor =3D \$major/\$minor=0A=
      echo \$((\$major*256+\$minor)) > =
/proc/sys/kernel/real-root-dev=0A=
   else=0A=
      echo error, cannot find vg00/root in /proc/partitions=0A=
   fi=0A=
)=0A=
=0A=
/bin/umount /proc=0A=
" > linuxrc=0A=
   chmod 555 linuxrc=0A=
}=0A=
=0A=
#=0A=
# Main=0A=
#=0A=
# 19991112/UBa:=0A=
#	Heinz shall not be blamed if THIS script fails, so it has to be=0A=
#	echoed that this IS NOT the original version=0A=
#=0A=
echo -e "\nLogical Volume Manager 0.7 by Heinz Mauelshagen  =
01/07/1999\n"=0A=
echo -e "$cmd -- (hack warning: this script is modified by =
ulf@twc.de)\n"=0A=
echo -e "$cmd -- this script creates a LVM initial ram disk in =
$INITRD\n"=0A=
=0A=
#=0A=
# 19991112/UBa:=0A=
#	I wanted not to use a ramdisk to create initrd, so I changed this=0A=
#	stuff to do it on a file.=0A=
#	Additionally the original script used -N 4096 option of mke2fs to =
set=0A=
#	the number of inodes. This option is not understood by mke2fs of=0A=
#	Debian-2.1, so using -i 2048 on a 8192 blocks filesystem should do=0A=
#	the same...=0A=
#=0A=
echo "$cmd -- making a file of $INITRDSIZE blocks in $DEVRAM"=0A=
dd if=3D/dev/zero of=3D$DEVRAM bs=3D1024 count=3D$INITRDSIZE >/dev/null =
2>&1=0A=
if [ $? -ne 0 ]; then=0A=
   echo -e "$cmd -- ERROR making file for initrd image\n"=0A=
   exit 1=0A=
fi=0A=
echo "$cmd -- making filesystem on $DEVRAM"=0A=
echo y | mke2fs -m 0 -i 2048 $DEVRAM $INITRDSIZE >/dev/null 2>&1=0A=
if [ $? -ne 0 ]; then=0A=
   echo -e "$cmd -- ERROR making filesystem on $DEVRAM\n"=0A=
   exit 1=0A=
fi=0A=
=0A=
mkdir -p $TMP/ram >/dev/null 2>&1=0A=
if [ $? -ne 0 ]; then=0A=
   echo -e "$cmd -- ERROR making $TMP/ram\n"=0A=
   exit 1=0A=
fi=0A=
=0A=
#=0A=
# 19991112/UBa:=0A=
#	changed to mount the image via loop=0A=
#=0A=
echo "$cmd -- mounting ram filesystem"=0A=
mount -o loop -t ext2 $DEVRAM $TMP/ram >/dev/null 2>&1=0A=
if [ $? -ne 0 ]; then=0A=
   echo -e "$cmd -- ERROR mounting $DEVRAM on $TMP/ram\n"=0A=
   exit 1=0A=
fi=0A=
=0A=
#=0A=
# 19991112/UBa:=0A=
#	added mkdir proc, as I need proc to be mounted for scanning for=0A=
#	vg00/root in /proc/partitions, calculate major*256+minor of it and=0A=
#	echo this value to /proc/sys/kernel/ral-root-dev.=0A=
#=0A=
cd $TMP/ram=0A=
[ ! -d etc ] && mkdir etc=0A=
[ ! -d proc ] && mkdir proc=0A=
=0A=
#=0A=
# create new conf.modules to avoid kmod complaining about nonexsisting =
modules.=0A=
#=0A=
echo "$cmd -- creating etc/conf.modules"=0A=
i=3D0=0A=
while [ $i -lt 256 ]; do=0A=
   echo "alias	block-major-$i	off"=0A=
   echo "alias	char-major-$i	off"=0A=
   let i=3Di+1=0A=
done > etc/conf.modules=0A=
=0A=
#=0A=
# 19991113/UBa:=0A=
#	I got this one as module but not in this initrd...=0A=
#	aliasing ide-cd to off suppresses the lines complaining a missing=0A=
#	ide-cd module. The lines complaining no driver being present still=0A=
#	remain.=0A=
#=0A=
echo "alias  ide-cd          off" >> etc/conf.modules=0A=
=0A=
# to ensure, that modprobe doesn complain about timestamps=0A=
echo "$cmd -- creating new modules.dep"=0A=
depmod -a >/dev/null 2>&1=0A=
if [ $? -ne 0 ]; then=0A=
   echo -e "$cmd -- ERROR depmod\n"=0A=
   exit 1=0A=
fi=0A=
=0A=
# copy necessary files to ram disk=0A=
echo "$cmd -- copying files to ram disk"=0A=
find $INITRDFILES|cpio -pdm $TMP/ram >/dev/null 2>&1=0A=
if [ $? -ne 0 ]; then=0A=
   echo -e "$cmd -- ERROR cpio to ram disk\n"=0A=
   exit 1=0A=
fi=0A=
=0A=
# figure out which actual shared libraries we need in our initrd=0A=
#=0A=
# 19991112/UBa:=0A=
#	@@@TODO:=0A=
#		this is incomplete now, as I added some binaries.=0A=
#		...but it still generates a working initrd, so I put my=0A=
#		hands on this stuff later.=0A=
#		Plan: ldd on bin/* sbin/* or file on all files and ldd on=0A=
#		those which could need libraries (execs and(?) libs)...=0A=
#=0A=
echo "$cmd -- figuring out shared libraries"=0A=
SHLIBS=3D`ldd sbin/vg* bin/sh|awk '{if(/=3D>/){print $3}}'|sort -u =
2>/dev/null`=0A=
if [ $? -ne 0 ]; then=0A=
   echo -e "$cmd -- ERROR figuring out needed shared libraries\n"=0A=
   exit 1=0A=
fi=0A=
=0A=
echo "$cmd -- copying shared libraries to ram disk"=0A=
find $SHLIBS|cpio -Lpdm $TMP/ram >/dev/null 2>&1=0A=
if [ $? -ne 0 ]; then=0A=
   echo -e "$cmd -- ERROR copying needed shared libraries to ram =
disk\n"=0A=
   exit 1=0A=
fi=0A=
=0A=
echo "$cmd -- creating linuxrc"=0A=
create_linuxrc >/dev/null 2>&1=0A=
if [ $? -ne 0 ]; then=0A=
   echo -e "$cmd -- ERROR creating linuxrc\n"=0A=
   exit 1=0A=
fi=0A=
=0A=
echo "$cmd -- creating etc/fstab"=0A=
create_fstab >/dev/null 2>&1=0A=
if [ $? -ne 0 ]; then=0A=
   echo -e "$cmd -- ERROR creating etc/fstab\n"=0A=
   exit 1=0A=
fi=0A=
=0A=
cd /=0A=
echo "$cmd -- ummounting ram disk"=0A=
umount $DEVRAM=0A=
if [ $? -ne 0 ]; then=0A=
   echo -e "$cmd -- ERROR umounting $DEVRAM\n"=0A=
   exit 1=0A=
fi=0A=
=0A=
#=0A=
# 19991114/UBa:=0A=
#	cleanup=0A=
#=0A=
echo "$cmd -- removing temporary mount point"=0A=
rm -rf $TMP=0A=
if [ $? -ne 0 ]; then=0A=
   echo -e "$cmd -- ERROR removing temporary mount point $TMP\n"=0A=
   exit 1=0A=
fi=0A=
=0A=
#=0A=
# 19991114/UBa:=0A=
#	added reminder to manually put the crated initrd to where it is =
needed.=0A=
#=0A=
echo "$cmd -- creating compressed initrd in $INITRD"=0A=
echo "$cmd -- uncompressed $DEVRAM will NOT automagically be =
removed"=0A=
gzip -9 < $DEVRAM > $INITRD 2>/dev/null=0A=
if [ $? -ne 0 ]; then=0A=
   echo -e "$cmd -- ERROR creating $INITRD\n"=0A=
   exit 1=0A=
else=0A=
   echo "$cmd -- sucessfully created $INITRD"=0A=
   echo "$cmd -- this image is NOT automagically activated."=0A=
   echo "$cmd -- $INITRD sure is not the path where your bootloader"=0A=
   echo "$cmd -- expects it."=0A=
fi=0A=

------_=_NextPart_000_01BFA2DB.20D5B049--
