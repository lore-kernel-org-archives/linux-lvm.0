Message-Id: <199905171218.AA21299@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Volume Group Creation
Date: Mon, 17 May 1999 14:16:50 METDST
In-Reply-To: <s73c32dd.084@mossergrp.com>; from "SHAD GUNDERSON" at May 14, 99 2:27 pm
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SHAD GUNDERSON <sgunderson@mossergrp.com>
Cc: mge@ts1.ez-darmstadt.telekom.de, mike@msede.com, linux-lvm@msede.com

> 
> I have successfully patched and compiled the lvm code and kernel.... and I =
> am able to create the physical volumes using "pvcreate /dev/sdb[12]". =
> However, the next step in the documention is where I run into problems... =
> upon execution of the "vgcreate test_vg /dev/sdb[12]" I receive an error =
> that no physical volumes exist.  Am I missing something. I have changed =
> the system ids on the partitions. I am running kernel 2.2.8 with lvm 0.6 =
> and the devfs patch for May 3rd.=20
> 

In addition to Mike's vgscan hint:

Could you please check, if /dev/sd* are all o.k.?

I've seen trouble with overlapping specials before (_no_ devfs!).

/dev/sdb16 existed with major/minor of /dev/sdc
/dev/sdb17 mapped /dev/sdc1 etc.

I've attached a script which is able to create SCSI device specials.
Please remove existing /dev/sd* yourself, because the script doesn't
take care of that.

Regards,
Heinz


#!/bin/sh
#
# (C)opyright  Heinz Mauelshagen  11/15/1998
#
# Generates SCSI disk specials for disk 1 up to 128
#

alphabet="a b c d e f g h i j k l m n o p q r s t u v w x y z"
DIR=/dev
[ ! -d $DIR ] && ( mkdir $DIR; chmod 555 $DIR )

function do_mknod {
   major_this=$1
   minor_this=$2
   disknum_this=$3
   DIR_this=$4

   let modminor_this=minor_this%16

   if [ $disknum_this -lt 26 ]; then
      i=0
      for c in $alphabet; do
         [ $i -eq $disknum_this ] && break
         let i=i+1
      done
      name=$c
      [ $modminor_this -ne 0 ] && name=$name$modminor_this
   else
      let ilt1=disknum_this/26-1
      let ilt2=disknum_this%26
      i=0
      for c in $alphabet; do
         [ $i -eq $ilt1 ] && break
         let i=i+1
      done
      lt1=$c
      i=0
      for c in $alphabet; do
         [ $i -eq $ilt2 ] && break
         let i=i+1
      done
      name=$lt1$c
      [ $modminor_this -ne 0 ] && name=$name$modminor_this
   fi

   rm -f $DIR_this/sd$name
   echo mknod $DIR_this/sd$name b $major_this $minor_this
   mknod $DIR_this/sd$name b $major_this $minor_this
   chown root:disk $DIR_this/sd$name
   chmod 660 $DIR_this/sd$name
}

disknum=0
ongoing_minor=0
for major in 8 65 66 67 68 69 70 71
do
   disk_per_major=1
   while [ $disk_per_major -le 16 ]; do
      minor=0
      [ $ongoing_minor -gt 255 ] && ongoing_minor=0
      while [ $minor -lt 16 ]; do
         do_mknod $major $ongoing_minor $disknum $DIR
         let minor=minor+1
         let ongoing_minor=ongoing_minor+1
      done
      let disk_per_major=disk_per_major+1
      let disknum=disknum+1
   done
done

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
