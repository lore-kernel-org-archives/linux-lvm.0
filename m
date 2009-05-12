Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n4CNFZrN019554
	for <linux-lvm@redhat.com>; Tue, 12 May 2009 19:15:35 -0400
Received: from web87103.mail.ird.yahoo.com (web87103.mail.ird.yahoo.com
	[87.248.114.75])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id n4CNFHdQ026787
	for <linux-lvm@redhat.com>; Tue, 12 May 2009 19:15:17 -0400
Message-ID: <652717.76283.qm@web87103.mail.ird.yahoo.com>
References: <461677.62017.qm@web87108.mail.ird.yahoo.com>
	<20090508205312.GA7838@redhat.com>
	<138875.59888.qm@web87112.mail.ird.yahoo.com>
	<20090512153820.GA3012@redhat.com>
Date: Tue, 12 May 2009 23:15:16 +0000 (GMT)
From: chris procter <chris-procter@talk21.com>
In-Reply-To: <20090512153820.GA3012@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Re: Script to import hardware snapshoted VGs
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Mike Snitzer <snitzer@redhat.com>
Cc: linux-lvm@redhat.com


> Chris,

> 
> I reviewed and tested your latest script.  I had issues with your use of
> whitespace delimiters (could be email ate it).  In any case, I reworked
> it so that delimiters are all non-whitespace.
>
> As you'll see in the below patch I made various changes:
> . cleaned up whitespace
> . added some extra negative checks for safety
> . use different lvm commands that lend themselves to simpler parsing
> . set cache_dir override in lvm.conf
> . eliminated vgscan at the end
> 
> Let me know what you think, I'll commit this into the LVM2 CVS once I
> get your feedback.
> 
> Thanks,
> Mike

I was using whitespace as a seperator in a
couple of places but mostly I was using ascii \002 which do appear to
have been mangled somewhere on the line. This may also explain why I
cant get your changes to apply cleanly, but they mostly look pretty
sensible.   I've inlined my comments below.



> diff --git a/vgimportclone b/vgimportclone
> index 7781d66..0bb77c6
> --- a/vgimportclone
> +++ b/vgimportclone
> @@ -1,6 +1,10 @@
> #!/bin/sh
> 
> # Copyright (C) 2009 Chris Procter All rights reserved.
> +# Copyright (C) 2009 Red Hat, Inc. All rights reserved.
> +#
> +# This file is part of LVM2.
> +#
> # This copyrighted material is made available to anyone wishing to use,
> # modify, copy, or redistribute it subject to the terms and conditions
> # of the GNU General Public License v.2.
> @@ -8,6 +12,9 @@
> # You should have received a copy of the GNU General Public License
> # along with this program; if not, write to the Free Software Foundation,
> # Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
> +#
> +# vgimportclone: This script is used to rename the VG and change the associated
> +#                VG and PV UUIDs (primary application being HW snapshot 
> restore)
> 
> 
> function getvgname {
> @@ -28,7 +35,7 @@ function getvgname {
>          NAME="${BASENAME}.$I"
>      done
>      echo "${NAME}"
> -} 
> +}
> 
> 
> function checkvalue {
> @@ -50,7 +57,7 @@ function usage {
>      echo -e "\t\t-h\t\t- Display this usage message"
>      echo -e "\t\t-i\t\t- Import any exported volume groups found"
>      echo -e "\t\t-n\t\t- Name for the new volume group(s)"
> -    echo -e "\t\t-l [path]\t - location of lvm.conf (default ${LVMCONF})"
> +    echo -e "\t\t-l [path]\t- location of lvm.conf (default ${LVMCONF})"
>      exit 0
> }
> 
> @@ -59,7 +66,7 @@ function cleanup {
>      LVM_SYSTEM_DIR=${ORIG_LVM_SYS_DIR}
> 
>      if [ ${DEBUG} -eq 0 ]
> -    then 
> +    then
>           rm -r ${TMP_LVM_SYSTEM_DIR}
>      fi
> }
> @@ -76,13 +83,16 @@ fi
> SHOW=0
> DISKS=""
> LVMCONF="/etc/lvm/lvm.conf"
> -TMP_LVM_SYSTEM_DIR=`mktemp -d -t snap.XXXXXXXX`
> +TMP_LVM_SYSTEM_DIR=`mktemp -d --tmpdir snap.XXXXXXXX`


[root@boyle disktools]# mktemp -d --tmpdir snap.XXXXXXXX
mktemp: invalid option -- -
Usage: mktemp [-V] | [-dqtu] [-p prefix] [template]

So the long option doesn't work. The result of an old version of coreutils (coreutils-5.97-19.el5)  on CentOS5.3  not tested it on RHEL yet but if its different I'd be surprised!



> NOVGFLAG=0

The SHOW and  NOVGFLAG variables aren't actually used any more so could be removed (my fault!)


> IMPORT=0
> DEBUG=0
> DEVNO=0
> 
> -export ORIG_LVM_SYS_DIR="${LVM_SYSTEM_DIR}"
> +if [ -n "${LVM_SYSTEM_DIR}" ]; then
> +    export ORIG_LVM_SYS_DIR="${LVM_SYSTEM_DIR}"
> +    LVMCONF="${LVM_SYSTEM_DIR}/lvm.conf"
> +fi
> 
> trap  cleanup 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
> 
> @@ -94,7 +104,7 @@ do
>      case $1 in
>          -d)    DEBUG=1
>              exec 2> ./${SCRIPTNAME}.log
> -               set -x
> +            set -x
>              echo "Using $TMP_LVM_SYSTEM_DIR/lvm.conf"
>              shift
>              ;;
> @@ -135,13 +145,22 @@ LVM="${LVM_BINARY:-lvm}"
> "${LVM}" version >&/dev/null
> checkvalue $? "${LVM} doesn't look like an lvm binary."
> 
> +if [ -n "$NEWVG" ] ; then
> +    "${LVM}" vgs $NEWVG >& /dev/null
> +    if [ $? -eq 0 ] ; then
> +        echo "Error: New VG ($NEWVG) already exists." >&2
> +        exit 1
> +    fi
> +fi

You dont have to test if the name given with the -n option is unique
because it gets run through the getvgname function which uses the given
name as a starting point to build a unique name, but if you prefer to
enforce the given name rather then just use it as a hint then thats
fine.



> +
> +test -f $LVMCONF
> +checkvalue $? "${LVMCONF} doesn't exist."
> 
> #####################################################################
> ### Get the existing state so we can use it later
> #####################################################################
> 
> -OLDVGS=`"${LVM}" pvs --noheadings --trustcache --separator  2>/dev/null  | awk 
> -F  '/lvm2/{printf("%s ",$2)}'`
> -
> +OLDVGS=`"${LVM}" vgs -o name --noheadings 2>/dev/null`
> 
> #####################################################################
> ### Prepare the temporay lvm environment
> @@ -150,15 +169,19 @@ OLDVGS=`"${LVM}" pvs --noheadings --trustcache 
> --separator  2>/dev/null  | awk -
> ###create filter
> for BLOCK in ${DISKS}
> do
> -    FILTER="\"a|^${BLOCK}$|\",${FILTER}"
> +    FILTER="\"a|^${BLOCK}$|\", ${FILTER}"
> done
> 
> export FILTER="filter=[ ${FILTER} \"r|.*|\" ]"
> 
> -awk -v DEV=${TMP_LVM_SYSTEM_DIR} '/^[[:space:]]*filter/{print 
> ENVIRON["FILTER"];next}\
> -                    /^[[:space:]]*scan/{print "scan = [ \"" DEV  "\" ]";next} \
> +awk -v DEV=${TMP_LVM_SYSTEM_DIR} -v CACHE=${TMP_LVM_SYSTEM_DIR}/cache \
> +                   '/^[[:space:]]*filter/{print ENVIRON["FILTER"];next} \
> +                    /^[[:space:]]*scan/{print "scan = [ \"" DEV "\" ]";next} \
> +                    /^[[:space:]]*cache_dir/{print "cache_dir = \"" CACHE 
> "\"";next} \
>                      {print $0}' < ${LVMCONF} > ${TMP_LVM_SYSTEM_DIR}/lvm.conf


This doesn't work on my setup, there is no cache_dir directive as far as I can tell, I think you're trying to change "cache =" instead so that should be:

awk -v DEV=${TMP_LVM_SYSTEM_DIR} -v CACHE=${TMP_LVM_SYSTEM_DIR}/cache \
                   '/^[[:space:]]*filter/{print ENVIRON["FILTER"];next} \
                    /^[[:space:]]*scan/{print "scan = [ \"" DEV "\" ]";next} \
                    /^[[:space:]]*cache/{print "cache = \"" CACHE "\"";next} \
                     {print $0}' < ${LVMCONF} > ${TMP_LVM_SYSTEM_DIR}/lvm.conf

Otherwise it fails :(   Is this an "upgrade to the latest version" thing?


> +checkvalue $? "Failed to generate ${TMP_LVM_SYSTEM_DIR}/lvm.conf"
> +
> ### set to use new lvm.conf
> export LVM_SYSTEM_DIR=${TMP_LVM_SYSTEM_DIR}
> 
> @@ -166,18 +189,30 @@ export LVM_SYSTEM_DIR=${TMP_LVM_SYSTEM_DIR}
> #####################################################################
> ### Change the uuids.
> #####################################################################
> -PVSCAN=`"${LVM}" pvscan`

I was trying to keep the number of lvm commands to the minimum because they can be pretty slow on some of our systems with a lot of luns presented, so I was trading complicated awk for speed. Wether it really makes a difference is debatable though.


> -### create a space seperated list of VGs where each VG looks like: 
> nameexported?disk1disk2... 
> -VGS=`echo "${PVSCAN}" |awk 
> '$1~/PV/{for(i=1;i<=NF;i++){if($i=="VG"){vg[$(i+1)]=vg[$(i+1)]""$2} \
> -                            if($i=="exported"){x[$(i+2)]="x"}}} \
> -                END{for(k in vg){printf k""x[k] vg[k]" "}}'`


> +PVINFO=`"${LVM}" pvs -o pv_name,vg_name,vg_attr --noheadings --separator : | 
> sed -e "s/ //g"`
> +
> +# output VG info so each line looks like: name:exported?:disk1,disk2,...
> +VGINFO=`echo "${PVINFO}" | \
> +    awk -F : '{{vg[$2]=$1","vg[$2]} \
> +    if($3 ~ /^..x/){x[$2]="x"}} \
> +    END{for(k in vg){printf("%s:%s:%s\n", k, x[k], vg[k])}}'`

You could replace from PVINFO= to here with

VGINFO=`lvm pvs -o pv_name,vg_name,vg_attr --noheadings --separator : | \
                  awk -F : '{sub(/^[[:space:]]*/,"");vg[$2]=$1","vg[$2];if($3 ~ /^..x/){x[$2]="x"}} \ 
                                END{for(k in vg){printf("%s:%s:%s\n", k, x[k], vg[k])}}'`

But I'm a sed-a-phobe ;)


> -for VG in ${VGS}
> +for VG in ${VGINFO}
> do
> -    VGNAME=`echo -e "${VG}" |cut -d -f1`
> -    EXPORTED=`echo -e "${VG}" | cut -d -f2`
> -    PVLIST=`echo -e "${VG}" | cut -d -f3-`
> +    VGNAME=`echo "${VG}" | cut -d: -f1`
> +    EXPORTED=`echo "${VG}" | cut -d: -f2`
> +    PVLIST=`echo "${VG}" | cut -d: -f3- | tr , ' '`

I was avoiding using colons as the seperator because its a valid character in device names, which is why I was then using control characters as separators, but given that we're now linking them all to sensible names it probably doesn't matter.


> +    if [ -z "${VGNAME}" ] ; then
> +        FOLLOWLIST=""
> +        for DEV in $PVLIST; do
> +            FOLLOW=`readlink $DEV`
> +            FOLLOWLIST="$FOLLOW $FOLLOWLIST"
> +        done
> +        echo "Error: Specified PV(s) ($FOLLOWLIST) don't belong to a VG." >&2
> +        exit 1
> +    fi
> 
>      if [ -n "${EXPORTED}" ]
>      then
> @@ -188,20 +223,18 @@ do
>              echo "Volume Group ${VGNAME} exported, skipping."
>              continue
>          fi
> -
>      fi
> 
>      ### change the pv uuids
> -    BLOCKDEVS=`echo ${PVLIST} | tr '' ' '`
> -    if [[ "${BLOCKDEVS}" =~ "unknown" ]]
> +    if [[ "${PVLIST}" =~ "unknown" ]]
>      then
>          echo "Volume Group ${VGNAME} incomplete, skipping."
>          continue
>      fi
> 
> -    for BLOCKDEV in ${BLOCKDEVS}
> +    for BLOCKDEV in ${PVLIST}
>      do
> -        "${LVM}" pvchange --uuid ${BLOCKDEV} --config 'global{activation=0}' 
> +        "${LVM}" pvchange --uuid ${BLOCKDEV} --config 'global{activation=0}'
>          checkvalue $? "Unable to change pvuuid for ${BLOCKDEV}"
>      done
> 
> @@ -225,12 +258,10 @@ done
> ### set to use old lvm.conf
> LVM_SYSTEM_DIR=${ORIG_LVM_SYS_DIR}
> 
> -### make sure all the device nodes we need are straight
> -"${LVM}" vgmknodes >/dev/null
> -
> -### sort out caches.
> +### update the device cache and make sure all
> +### the device nodes we need are straight
> 
> "${LVM}" pvscan
> -"${LVM}" vgscan >/dev/null
>
> +"${LVM}" vgmknodes
> 
> exit 0



      
