Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iACGvWr21730
	for <linux-lvm@redhat.com>; Fri, 12 Nov 2004 11:57:32 -0500
Received: from outbound1.sopragroup.com (outbound1.z-ptx-11.fr.sopragroup.com
	[81.80.239.198])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iACGvPMh032008
	for <linux-lvm@redhat.com>; Fri, 12 Nov 2004 11:57:26 -0500
Received: by outbound1.sopragroup.com (8.12.10/8.12.10/outbound-A02) with
	ESMTP id iACGvJKv014346
	for <linux-lvm@redhat.com>; Fri, 12 Nov 2004 17:57:20 +0100
content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Fri, 12 Nov 2004 17:57:19 +0100
Message-ID: <79E413D153B85D4C93B36CD7B4611320029C7327@wexchbe03.ancy.fr.sopra>
From: "Wendling Pierre" <pwendling@sopragroup.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] fixing LVM1 tools to work on top of IBM SDD
	multipathing driver ...
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

 
We're currently trying to make LVM1 work on top of IBM SDD multipathing
driver for SAN environment.

Background info: when you have 2 paths to a single SAN LUN (/dev/sdc and
/dev/sdd for example), IBM SDD driver sits on top of those, detecting
that it's actually the same LUN, and presenting a /dev/vpatha block
device to be used by filesystem/LVM/etc., with the same SCSI device
interface as the orginial /dev/sdX devices (partitionning/etc.), but
adding path load balancing and failover.

the LVM1 kernel driver shipped with Redhat Enterprise 3 (version 1.0.5+)
is ok with that, however, the user level tools are not (any version, I'm
working on 1.0.8 at the moment). So far, we've found 2 problems to fix:

1. in lib/lvm_check_partitioned_dev.c: a new entry should be added in
device_names[] for the /dev/vpath prefix, using LVM_DEVICE_TYPE_SD, for
pvcreate to work

2. another problem is that vgscan detects all 3 devices to the SAME LUN
(/dev/vpatha1, /dev/sdc1 and /dev/sdd1 for example) as PVs, and use only
the last one which is not /dev/vpatha1, thus losing IBM SDD driver
benefit ...

We found a loop at the end of pv_read_all_pv() in lib/pv_read_all_pv.c
(around line 165) which looks like it's supposed to remove duplicate PVs
for MD devices. If I understood correctly, the decision is based on
(major ?) device number, which does not work for IBM SDD (they are
differents, even if the underlying LUN is the same). I've replaced this
by a test on the PV UUID, which seemed more appropriate, but I don't
know which side effect it could have (break MD duplicate PV removal ?)

Does anyone have an idea about that ?

Any other place to check for potential problems ?

Any other solution to make this work ? (no upgrade to LVM2 please, we're
stuck with Redhat Enterprise provided kernels ...)

Here is the very simple patch to LVM 1.0.8:

--- LVM/1.0.8/tools/lib/lvm_check_partitioned_dev.c     2003-02-06
16:05:33.000000000 +0100
+++ LVM.sdd/1.0.8/tools/lib/lvm_check_partitioned_dev.c 2004-11-12
14:48:46.000000000 +0100
@@ -150,6 +150,7 @@
     } device_names[] = {
        { "ide", LVM_DEVICE_TYPE_IDE },   /* IDE disk
*/
        { "sd", LVM_DEVICE_TYPE_SD },     /* SCSI disk
*/
+       { "vpath", LVM_DEVICE_TYPE_SD },          /* IBM Sdd
*/
        { "md", LVM_DEVICE_TYPE_MD },     /* Multiple Disk driver
(SoftRAID) */
        { "loop", LVM_DEVICE_TYPE_LOOP }, /* Loop device
*/
        { "dasd", LVM_DEVICE_TYPE_DASD }, /* DASD disk (IBM S/390,
zSeries)  */
diff -ru LVM/1.0.8/tools/lib/pv_read_all_pv.c
LVM.sdd/1.0.8/tools/lib/pv_read_all_pv.c
--- LVM/1.0.8/tools/lib/pv_read_all_pv.c        2003-03-03
09:34:31.000000000 +0100
+++ LVM.sdd/1.0.8/tools/lib/pv_read_all_pv.c    2004-11-12
16:25:57.000000000 +0100
@@ -168,7 +168,7 @@
       for ( p = 0; pv_this[p] != NULL; p++) {
          if ( pv_this[p_sav1] != pv_this[p] &&
               strcmp ( pv_this[p_sav1]->vg_name, pv_this[p]->vg_name)
== 0) {
-            if ( pv_this[p_sav1]->pv_dev == pv_this[p]->pv_dev) {
+          if ( strcmp( pv_this[p_sav1]->pv_uuid, pv_this[p]->pv_uuid)
== 0) {
                free ( pv_this[p]);
                pv_this[p] = NULL;
                if ( p < np) np--;
