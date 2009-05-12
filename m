Date: Tue, 12 May 2009 11:38:28 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20090512153820.GA3012@redhat.com>
References: <461677.62017.qm@web87108.mail.ird.yahoo.com>
	<20090508205312.GA7838@redhat.com>
	<138875.59888.qm@web87112.mail.ird.yahoo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <138875.59888.qm@web87112.mail.ird.yahoo.com>
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
Content-Transfer-Encoding: 7bit
To: chris procter <chris-procter@talk21.com>
Cc: linux-lvm@redhat.com

On Mon, May 11 2009 at  2:39pm -0400,
chris procter <chris-procter@talk21.com> wrote:

> 
> Hi,
> 
> Here's version 2. I've got it to play nicely with device names like:-
> /dev/"__\"!@#\$%^&*,()|@||\\\""
> /dev/\*
> 
> /dev/''*   (with trailing space and single quotes)
> /dev/$* ^"
> which should cover pretty much all possibilities by symlinking them from the temp directory and using the links which all seems to work and gets round issues with the filter regular expressions in lvm.conf  Hopefully that covers all the weirdness anyone is likely to use. 
> 
> One day I will work out how to use CVS and do proper diffs :)

Chris,

I reviewed and tested your latest script.  I had issues with your use of
whitespace delimiters (could be email ate it).  In any case, I reworked
it so that delimiters are all non-whitespace.

As you'll see in the below patch I made various changes:
. cleaned up whitespace
. added some extra negative checks for safety
. use different lvm commands that lend themselves to simpler parsing
. set cache_dir override in lvm.conf
. eliminated vgscan at the end

Let me know what you think, I'll commit this into the LVM2 CVS once I
get your feedback.

Thanks,
Mike


diff --git a/vgimportclone b/vgimportclone
index 7781d66..0bb77c6
--- a/vgimportclone
+++ b/vgimportclone
@@ -1,6 +1,10 @@
 #!/bin/sh
 
 # Copyright (C) 2009 Chris Procter All rights reserved.
+# Copyright (C) 2009 Red Hat, Inc. All rights reserved.
+#
+# This file is part of LVM2.
+#
 # This copyrighted material is made available to anyone wishing to use,
 # modify, copy, or redistribute it subject to the terms and conditions
 # of the GNU General Public License v.2.
@@ -8,6 +12,9 @@
 # You should have received a copy of the GNU General Public License
 # along with this program; if not, write to the Free Software Foundation,
 # Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+#
+# vgimportclone: This script is used to rename the VG and change the associated
+#                VG and PV UUIDs (primary application being HW snapshot restore)
 
 
 function getvgname {
@@ -28,7 +35,7 @@ function getvgname {
         NAME="${BASENAME}.$I"
     done
     echo "${NAME}"
-} 
+}
 
 
 function checkvalue {
@@ -50,7 +57,7 @@ function usage {
     echo -e "\t\t-h\t\t- Display this usage message"
     echo -e "\t\t-i\t\t- Import any exported volume groups found"
     echo -e "\t\t-n\t\t- Name for the new volume group(s)"
-    echo -e "\t\t-l [path]\t - location of lvm.conf (default ${LVMCONF})"
+    echo -e "\t\t-l [path]\t- location of lvm.conf (default ${LVMCONF})"
     exit 0
 }
 
@@ -59,7 +66,7 @@ function cleanup {
     LVM_SYSTEM_DIR=${ORIG_LVM_SYS_DIR}
 
     if [ ${DEBUG} -eq 0 ]
-    then 
+    then
          rm -r ${TMP_LVM_SYSTEM_DIR}
     fi
 }
@@ -76,13 +83,16 @@ fi
 SHOW=0
 DISKS=""
 LVMCONF="/etc/lvm/lvm.conf"
-TMP_LVM_SYSTEM_DIR=`mktemp -d -t snap.XXXXXXXX`
+TMP_LVM_SYSTEM_DIR=`mktemp -d --tmpdir snap.XXXXXXXX`
 NOVGFLAG=0
 IMPORT=0
 DEBUG=0
 DEVNO=0
 
-export ORIG_LVM_SYS_DIR="${LVM_SYSTEM_DIR}"
+if [ -n "${LVM_SYSTEM_DIR}" ]; then
+    export ORIG_LVM_SYS_DIR="${LVM_SYSTEM_DIR}"
+    LVMCONF="${LVM_SYSTEM_DIR}/lvm.conf"
+fi
 
 trap  cleanup 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
 
@@ -94,7 +104,7 @@ do
     case $1 in
         -d)    DEBUG=1
             exec 2> ./${SCRIPTNAME}.log
-               set -x
+            set -x
             echo "Using $TMP_LVM_SYSTEM_DIR/lvm.conf"
             shift
             ;;
@@ -135,13 +145,22 @@ LVM="${LVM_BINARY:-lvm}"
 "${LVM}" version >&/dev/null
 checkvalue $? "${LVM} doesn't look like an lvm binary."
 
+if [ -n "$NEWVG" ] ; then
+    "${LVM}" vgs $NEWVG >& /dev/null
+    if [ $? -eq 0 ] ; then
+        echo "Error: New VG ($NEWVG) already exists." >&2
+        exit 1
+    fi
+fi
+
+test -f $LVMCONF
+checkvalue $? "${LVMCONF} doesn't exist."
 
 #####################################################################
 ### Get the existing state so we can use it later
 #####################################################################
 
-OLDVGS=`"${LVM}" pvs --noheadings --trustcache --separator  2>/dev/null  | awk -F  '/lvm2/{printf("%s ",$2)}'`
-
+OLDVGS=`"${LVM}" vgs -o name --noheadings 2>/dev/null`
 
 #####################################################################
 ### Prepare the temporay lvm environment
@@ -150,15 +169,19 @@ OLDVGS=`"${LVM}" pvs --noheadings --trustcache --separator  2>/dev/null  | awk -
 ###create filter
 for BLOCK in ${DISKS}
 do
-    FILTER="\"a|^${BLOCK}$|\",${FILTER}"
+    FILTER="\"a|^${BLOCK}$|\", ${FILTER}"
 done
 
 export FILTER="filter=[ ${FILTER} \"r|.*|\" ]"
 
-awk -v DEV=${TMP_LVM_SYSTEM_DIR} '/^[[:space:]]*filter/{print ENVIRON["FILTER"];next}\
-                    /^[[:space:]]*scan/{print "scan = [ \"" DEV  "\" ]";next} \
+awk -v DEV=${TMP_LVM_SYSTEM_DIR} -v CACHE=${TMP_LVM_SYSTEM_DIR}/cache \
+                   '/^[[:space:]]*filter/{print ENVIRON["FILTER"];next} \
+                    /^[[:space:]]*scan/{print "scan = [ \"" DEV "\" ]";next} \
+                    /^[[:space:]]*cache_dir/{print "cache_dir = \"" CACHE "\"";next} \
                     {print $0}' < ${LVMCONF} > ${TMP_LVM_SYSTEM_DIR}/lvm.conf
 
+checkvalue $? "Failed to generate ${TMP_LVM_SYSTEM_DIR}/lvm.conf"
+
 ### set to use new lvm.conf
 export LVM_SYSTEM_DIR=${TMP_LVM_SYSTEM_DIR}
 
@@ -166,18 +189,30 @@ export LVM_SYSTEM_DIR=${TMP_LVM_SYSTEM_DIR}
 #####################################################################
 ### Change the uuids.
 #####################################################################
-PVSCAN=`"${LVM}" pvscan`
 
-### create a space seperated list of VGs where each VG looks like: nameexported?disk1disk2... 
-VGS=`echo "${PVSCAN}" |awk '$1~/PV/{for(i=1;i<=NF;i++){if($i=="VG"){vg[$(i+1)]=vg[$(i+1)]""$2} \
-                            if($i=="exported"){x[$(i+2)]="x"}}} \
-                END{for(k in vg){printf k""x[k] vg[k]" "}}'`
+PVINFO=`"${LVM}" pvs -o pv_name,vg_name,vg_attr --noheadings --separator : | sed -e "s/ //g"`
+
+# output VG info so each line looks like: name:exported?:disk1,disk2,...
+VGINFO=`echo "${PVINFO}" | \
+    awk -F : '{{vg[$2]=$1","vg[$2]} \
+    if($3 ~ /^..x/){x[$2]="x"}} \
+    END{for(k in vg){printf("%s:%s:%s\n", k, x[k], vg[k])}}'`
 
-for VG in ${VGS}
+for VG in ${VGINFO}
 do
-    VGNAME=`echo -e "${VG}" |cut -d -f1`
-    EXPORTED=`echo -e "${VG}" | cut -d -f2`
-    PVLIST=`echo -e "${VG}" | cut -d -f3-`
+    VGNAME=`echo "${VG}" | cut -d: -f1`
+    EXPORTED=`echo "${VG}" | cut -d: -f2`
+    PVLIST=`echo "${VG}" | cut -d: -f3- | tr , ' '`
+
+    if [ -z "${VGNAME}" ] ; then
+        FOLLOWLIST=""
+        for DEV in $PVLIST; do
+            FOLLOW=`readlink $DEV`
+            FOLLOWLIST="$FOLLOW $FOLLOWLIST"
+        done
+        echo "Error: Specified PV(s) ($FOLLOWLIST) don't belong to a VG." >&2
+        exit 1
+    fi
 
     if [ -n "${EXPORTED}" ]
     then
@@ -188,20 +223,18 @@ do
             echo "Volume Group ${VGNAME} exported, skipping."
             continue
         fi
-
     fi
 
     ### change the pv uuids
-    BLOCKDEVS=`echo ${PVLIST} | tr '' ' '`
-    if [[ "${BLOCKDEVS}" =~ "unknown" ]]
+    if [[ "${PVLIST}" =~ "unknown" ]]
     then
         echo "Volume Group ${VGNAME} incomplete, skipping."
         continue
     fi
 
-    for BLOCKDEV in ${BLOCKDEVS}
+    for BLOCKDEV in ${PVLIST}
     do
-        "${LVM}" pvchange --uuid ${BLOCKDEV} --config 'global{activation=0}' 
+        "${LVM}" pvchange --uuid ${BLOCKDEV} --config 'global{activation=0}'
         checkvalue $? "Unable to change pvuuid for ${BLOCKDEV}"
     done
 
@@ -225,12 +258,10 @@ done
 ### set to use old lvm.conf
 LVM_SYSTEM_DIR=${ORIG_LVM_SYS_DIR}
 
-### make sure all the device nodes we need are straight
-"${LVM}" vgmknodes >/dev/null
-
-### sort out caches.
+### update the device cache and make sure all
+### the device nodes we need are straight
 
 "${LVM}" pvscan
-"${LVM}" vgscan >/dev/null
+"${LVM}" vgmknodes
 
 exit 0
