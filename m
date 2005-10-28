Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9SKF2V14486
	for <linux-lvm@redhat.com>; Fri, 28 Oct 2005 16:15:02 -0400
Received: from mta09-winn.ispmail.ntl.com (mta09-winn.ispmail.ntl.com
	[81.103.221.49])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j9SKF04U004500
	for <linux-lvm@redhat.com>; Fri, 28 Oct 2005 16:15:00 -0400
Received: from aamta10-winn.ispmail.ntl.com ([81.103.221.35])
	by mta09-winn.ispmail.ntl.com with ESMTP id
	<20051028201452.QBHI8609.mta09-winn.ispmail.ntl.com@aamta10-winn.ispmail.ntl.com>
	for <linux-lvm@redhat.com>; Fri, 28 Oct 2005 21:14:52 +0100
Received: from remain.afraid.org ([80.1.204.245])
	by aamta10-winn.ispmail.ntl.com with ESMTP id
	<20051028201451.IHDI26459.aamta10-winn.ispmail.ntl.com@remain.afraid.org>
	for <linux-lvm@redhat.com>; Fri, 28 Oct 2005 21:14:51 +0100
Received: from pandora.local ([192.168.178.3])
	by remain.afraid.org with esmtps (TLSv1:AES256-SHA:256) (Exim 4.50)
	id 1EVacm-0003sg-Jw
	for linux-lvm@redhat.com; Fri, 28 Oct 2005 21:14:52 +0100
Message-ID: <436286B3.80604@cantab.net>
Date: Fri, 28 Oct 2005 21:14:43 +0100
From: Zak Kipling <zak.kipling@cantab.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvresize patch pending
References: <1130518796.4362590c75cf0@webmail.volumehost.com>	<20051028170130.GH11086@agk.surrey.redhat.com>	<1130519874.43625d4253324@webmail.volumehost.com>	<1130522152.436266287429e@webmail.volumehost.com>
	<20051028192752.GJ11086@agk.surrey.redhat.com>
In-Reply-To: <20051028192752.GJ11086@agk.surrey.redhat.com>
Content-Type: multipart/mixed; boundary="------------000109010402060000060700"
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.
--------------000109010402060000060700
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Alasdair G Kergon wrote:

> If the PV belongs to a VG (the only case that matters - pvcreate
> is quite adequate otherwise), after the pv_write (equivalent
> to 'pvcreate'), more fields need updating I think - see 
> add_pv_to_vg() - incl. the various extent counters and
> the segment lists.  

Indeed. I've recently been working on an implementation myself 
(primarily because I wanted to grow a live PV on my own system), which 
I've attached in its current (somewhat rough, but seemingly working) 
state as a patch against CVS HEAD.

In addition to updating pv->size it also adjusts pv->pe_count, 
pe->segments, vg->extent_count and vg->free_count.

In the shrinking case, it checks that the removed extents are free 
(though ideally it would relocate them elsewhere in the VG, like pvmove.

There is no requirement for LVs to be deactivated, as the actual LVs 
don't get touched during the operation.

I've tested it (both growing and shrinking) on loop devices containing 
small LVM systems, and successfully used it to grow the PV housing a 
running system (including the root filesystem).

The main issues I'm not sure about are:

* Support for metadata formats other than format_text.

* Support for more than one mda on a PV (I think it will currently 
clobber ones at the end of the PV, since it assumes all space after 
pe_start is available for extents).

I hadn't planned on posting it quite yet, but since the discussion has 
started it might be useful.


-- 
Zak Kipling.

--------------000109010402060000060700
Content-Type: text/x-patch;
 name="lvm2-pvresize.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="lvm2-pvresize.diff"

Index: lib/metadata/pv_alloc.h
===================================================================
RCS file: /cvs/lvm2/LVM2/lib/metadata/pv_alloc.h,v
retrieving revision 1.5
diff -b -u -r1.5 pv_alloc.h
--- lib/metadata/pv_alloc.h	16 Oct 2005 23:03:58 -0000	1.5
+++ lib/metadata/pv_alloc.h	28 Oct 2005 20:04:49 -0000
@@ -25,4 +25,8 @@
 int check_pv_segments(struct volume_group *vg);
 void merge_pv_segments(struct pv_segment *peg1, struct pv_segment *peg2);
 
+/* This code is experimental. Do NOT complain if it trashes your LVM system */
+int pv_resize(struct physical_volume *pv, struct volume_group *vg,
+	      uint32_t new_pe_count);
+
 #endif
Index: lib/metadata/pv_manip.c
===================================================================
RCS file: /cvs/lvm2/LVM2/lib/metadata/pv_manip.c,v
retrieving revision 1.8
diff -b -u -r1.8 pv_manip.c
--- lib/metadata/pv_manip.c	16 Oct 2005 23:03:58 -0000	1.8
+++ lib/metadata/pv_manip.c	28 Oct 2005 20:04:50 -0000
@@ -301,3 +301,107 @@
 
 	return ret;
 }
+
+
+/*
+ * Resize a PV, adding or removing segments as needed.
+ * Update the volume group if supplied.
+ * New size must fit within pv->size
+ *
+ * This code is experimental. Do NOT complain if it trashes your LVM system
+ */
+int pv_resize(struct physical_volume *pv,
+	      struct volume_group *vg,
+	      uint32_t new_pe_count)
+{
+	struct pv_segment *peg, *tmp_peg;
+	uint32_t old_pe_count = pv->pe_count;
+	
+	if (new_pe_count < old_pe_count) {
+		if (new_pe_count < pv->pe_alloc_count) {
+			log_error("%s: cannot resize to %" PRIu32 " extents "
+				  "as %" PRIu32 " are allocated.",
+				  dev_name(pv->dev), new_pe_count,
+				  pv->pe_alloc_count);
+			return 0;
+		}
+
+		log_verbose("Reducing physical volume %s to %" PRIu32
+			    " extents.", dev_name(pv->dev), new_pe_count);
+
+		if (!pv_split_segment(pv, new_pe_count)) return 0;
+		
+		list_iterate_items_safe(peg, tmp_peg, &pv->segments) {
+ 			if (peg->pe + peg->len > new_pe_count) {
+				if (peg->lvseg) {
+					log_error("%s: cannot resize to %"PRIu32
+						  " extents as later ones are "
+						  "allocated.",
+						  dev_name(pv->dev),
+						  new_pe_count);
+					return 0;
+				}
+				else {
+					assert (peg->pe >= new_pe_count);
+					list_del(&peg->list);
+				}
+			}
+		}
+	}
+	else if (new_pe_count > old_pe_count) {
+		if (pv->size / pv->pe_size < new_pe_count) {
+		  log_error("%s: cannot resize to %" PRIu32 " extents as there "
+			    "is only space for %" PRIu64 ".", dev_name(pv->dev),
+			    new_pe_count, pv->size / pv->pe_size);
+		}
+
+		log_verbose("Extending physical volume %s to %" PRIu32
+			    " extents.", dev_name(pv->dev), new_pe_count);
+
+		peg = _alloc_pv_segment(pv->fmt->cmd->mem, pv,
+					old_pe_count,
+					new_pe_count - old_pe_count,
+					NULL, 0);
+		list_add(&pv->segments, &peg->list);
+
+		pv->pe_count = new_pe_count;
+	}
+	else {
+		log_verbose("No change to size of physical volume %s.",
+			    dev_name(pv->dev));
+		return 1;
+	}
+		
+	pv->pe_count = new_pe_count;
+
+	if (vg) {
+		if (strcmp(pv->vg_name, vg->name)) {
+			log_error("pv_resize internal error: given wrong "
+				  "volume group %s.", vg->name);
+			return 0;
+		}
+
+		log_verbose("Changing extent count of volume group %s to "
+			    "match", vg->name);
+		
+		if (new_pe_count < old_pe_count) {
+			assert(vg->extent_count >= old_pe_count);
+			assert(vg->free_count >= old_pe_count - new_pe_count);
+			vg->extent_count -= (old_pe_count - new_pe_count);
+			vg->free_count -= (old_pe_count - new_pe_count);
+		}
+		else if (new_pe_count > old_pe_count) {
+			vg->extent_count += (new_pe_count - old_pe_count);
+			vg->free_count += (new_pe_count - old_pe_count);
+		}
+	}
+	else {
+		if (*pv->vg_name) {
+			log_error("pv_resize internal error: need volume group "
+				  "%s.", pv->vg_name);
+			return 0;
+		}
+	}
+
+	return 1;
+}
Index: man/Makefile.in
===================================================================
RCS file: /cvs/lvm2/LVM2/man/Makefile.in,v
retrieving revision 1.14
diff -b -u -r1.14 Makefile.in
--- man/Makefile.in	9 Dec 2004 16:57:37 -0000	1.14
+++ man/Makefile.in	28 Oct 2005 20:04:50 -0000
@@ -19,10 +19,10 @@
 MAN5=lvm.conf.5
 MAN8=lvchange.8 lvcreate.8 lvdisplay.8 lvextend.8 lvm.8 lvmchange.8 \
 	lvmdiskscan.8 lvreduce.8 lvremove.8 lvrename.8 lvresize.8 lvs.8 \
-	lvscan.8 pvchange.8 pvcreate.8 pvdisplay.8 pvmove.8 pvremove.8 pvs.8 \
-	pvscan.8 vgcfgbackup.8 vgcfgrestore.8 vgchange.8 vgck.8 vgcreate.8 \
-	vgconvert.8 vgdisplay.8 vgexport.8 vgextend.8 vgimport.8 \
-	vgmerge.8 vgmknodes.8 vgreduce.8 vgremove.8 vgrename.8 \
+	lvscan.8 pvchange.8 pvcreate.8 pvdisplay.8 pvmove.8 pvremove.8 \
+	pvresize.8 pvs.8 pvscan.8 vgcfgbackup.8 vgcfgrestore.8 vgchange.8 \
+	vgck.8 vgcreate.8 vgconvert.8 vgdisplay.8 vgexport.8 vgextend.8 \
+	vgimport.8 vgmerge.8 vgmknodes.8 vgreduce.8 vgremove.8 vgrename.8 \
 	vgs.8 vgscan.8 vgsplit.8
 MAN8CLUSTER=clvmd.8
 MAN5DIR=${mandir}/man5
Index: man/pvresize.8
===================================================================
RCS file: man/pvresize.8
diff -N man/pvresize.8
--- /dev/null	1 Jan 1970 00:00:00 -0000
+++ man/pvresize.8	28 Oct 2005 20:04:50 -0000
@@ -0,0 +1,53 @@
+.TH PVCREATE 8 "LVM TOOLS" "Sistina Software UK" \" -*- nroff -*-
+.SH NAME
+pvresize \- resize a disk or partition in use by LVM
+.SH SYNOPSIS
+.B pvresize
+.RB [ \-d | \-\-debug ]
+.RB [ \-h | \-\-help ]
+.RB [ \-t | \-\-test ]
+.RB [ \-v | \-\-verbose ]
+.RB [ \-\-setphysicalvolumesize size ]
+.IR PhysicalVolume " [" PhysicalVolume ...]
+.SH DESCRIPTION
+.B pvresize
+resizes
+.I PhysicalVolume
+which may already be in a volume group and have active logical volumes
+allocated on it.
+.SH STATUS
+.B pvresize
+is currently EXPERIMENTAL. Make sure you have a backup and do NOT complain if
+it trashes your LVM system.
+.SH OPTIONS
+See \fBlvm\fP(8) for common options.
+.TP
+.BR \-\-setphysicalvolumesize " size"
+Overrides the automatically-detected size of the PV.  Use with care, or
+prior to reducing the physical size of the device.
+.SH EXAMPLES
+Expand the PV on /dev/sda1 after enlarging the partition with fdisk:
+.sp
+.B pvresize /dev/sda1
+.sp
+Shrink the PV on /dev/sda1 prior to shrinking the partition with fdisk
+(ensure that the PV size is appropriate for your intended new partition
+size):
+.sp
+.B pvresize --setphysicalvolumesize 40G /dev/sda1
+.sp
+.SH RESTRICTIONS
+.B pvresize
+will refuse to shrink
+.I PhysicalVolume
+if it has allocated extents after where its new end would be. In the future,
+it should relocate these elsewhere in the volume group if there is sufficient
+free space, like
+.B pvmove
+does.
+.sp
+.B pvresize
+probably won't currently work correctly on LVM1 volumes, or PVs with extra
+metadata areas.
+.SH SEE ALSO
+.BR lvm "(8), " pvmove "(8), " lvresize "(8), " fdisk "(8)"
Index: tools/Makefile.in
===================================================================
RCS file: /cvs/lvm2/LVM2/tools/Makefile.in,v
retrieving revision 1.68
diff -b -u -r1.68 Makefile.in
--- tools/Makefile.in	6 Jun 2005 17:12:07 -0000	1.68
+++ tools/Makefile.in	28 Oct 2005 20:04:50 -0000
@@ -42,6 +42,7 @@
 	pvdisplay.c \
 	pvmove.c \
 	pvremove.c \
+	pvresize.c \
 	pvscan.c \
 	reporter.c \
 	segtypes.c \
Index: tools/commands.h
===================================================================
RCS file: /cvs/lvm2/LVM2/tools/commands.h,v
retrieving revision 1.75
diff -b -u -r1.75 commands.h
--- tools/commands.h	17 Oct 2005 16:41:38 -0000	1.75
+++ tools/commands.h	28 Oct 2005 20:04:52 -0000
@@ -373,6 +373,22 @@
    all_ARG, allocatable_ARG, allocation_ARG, autobackup_ARG, deltag_ARG,
    addtag_ARG, test_ARG, uuid_ARG)
 
+xx(pvresize,
+   "Resize physical volume(s) in use by LVM [EXPERIMENTAL]",
+   "pvresize " "\n"
+   "\t[-d|--debug]" "\n"
+   "\t[-h|-?|--help] " "\n"
+   "\t[--setphysicalvolumesize PhysicalVolumeSize[kKmMgGtT]" "\n"
+   "\t[-t|--test] " "\n"
+   "\t[-v|--verbose] " "\n"
+   "\t[--version] " "\n"
+   "\tPhysicalVolume [PhysicalVolume...]\n"
+   "\t\n"
+   "\tpvresize is EXPERIMENTAL -- ensure you have a backup and\n"
+   "\tdo NOT complain if it trashes your LVM system!\n",
+
+   test_ARG, physicalvolumesize_ARG)
+
 xx(pvcreate,
    "Initialize physical volume(s) for use by LVM",
    "pvcreate " "\n"
Index: tools/pvresize.c
===================================================================
RCS file: tools/pvresize.c
diff -N tools/pvresize.c
--- /dev/null	1 Jan 1970 00:00:00 -0000
+++ tools/pvresize.c	28 Oct 2005 20:04:52 -0000
@@ -0,0 +1,212 @@
+/*
+ * Copyright (C) 2001-2004 Sistina Software, Inc. All rights reserved. 
+ * Copyright (C) 2004 Red Hat, Inc. All rights reserved.
+ * Copyright (C) 2005 Zak Kipling. All rights reserved.
+ *
+ * This file is part of LVM2.
+ *
+ * This copyrighted material is made available to anyone wishing to use,
+ * modify, copy, or redistribute it subject to the terms and conditions
+ * of the GNU General Public License v.2.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software Foundation,
+ * Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ */
+
+#include "tools.h"
+#include "pv_alloc.h"
+
+/* This code is experimental. Do NOT complain if it trashes your LVM system */
+
+/* FIXME Locking.  PVs in VG. */
+
+static int _pvresize_single(struct cmd_context *cmd,
+			    struct physical_volume *pv)
+{
+	struct volume_group *vg = NULL;
+	struct pv_list *pvl;
+	struct list mdas;
+	uint64_t sector;
+
+	const char *pv_name = dev_name(pv->dev);
+
+	int consistent = 1;
+	uint64_t size = 0;
+	uint32_t old_pe_count = 0, new_pe_count = 0;
+
+	list_init(&mdas);
+
+	if (arg_sign_value(cmd, physicalvolumesize_ARG, 0) == SIGN_MINUS) {
+		log_error("Physical volume size may not be negative");
+		return 0;
+	}
+	size = arg_uint64_value(cmd, physicalvolumesize_ARG, UINT64_C(0)) * 2;
+
+	/* If in a VG, must change using volume group. */
+	if (*pv->vg_name) {
+		log_verbose("Finding volume group of physical volume \"%s\"",
+			    pv_name);
+
+		if (!lock_vol(cmd, pv->vg_name, LCK_VG_WRITE)) {
+			log_error("Can't get lock for %s", pv->vg_name);
+			return 0;
+		}
+
+		if (!(vg = vg_read(cmd, pv->vg_name, &consistent))) {
+			unlock_vg(cmd, pv->vg_name);
+			log_error("Unable to find volume group of \"%s\"",
+				  pv_name);
+			return 0;
+		}
+
+		if (vg->status & EXPORTED_VG) {
+			unlock_vg(cmd, pv->vg_name);
+			log_error("Volume group \"%s\" is exported", vg->name);
+			return 0;
+		}
+
+		if (!(vg->status & LVM_WRITE)) {
+			unlock_vg(cmd, pv->vg_name);
+			log_error("Volume group \"%s\" is read-only", vg->name);
+			return 0;
+		}
+
+		if (!(pvl = find_pv_in_vg(vg, pv_name))) {
+			unlock_vg(cmd, pv->vg_name);
+			log_error
+			    ("Unable to find \"%s\" in volume group \"%s\"",
+			     pv_name, vg->name);
+			return 0;
+		}
+		pv = pvl->pv;
+		if (!archive(vg))
+			return 0;
+	} else {
+		if (!lock_vol(cmd, ORPHAN, LCK_VG_WRITE)) {
+			log_error("Can't get lock for orphans");
+			return 0;
+		}
+
+		if (!(pv = pv_read(cmd, pv_name, &mdas, &sector, 1))) {
+			unlock_vg(cmd, ORPHAN);
+			log_error("Unable to read PV \"%s\"", pv_name);
+			return 0;
+		}
+
+	}
+
+	/* change size of PV */
+	if (!dev_get_size(pv->dev, &pv->size)) {
+		log_error("%s: Couldn't get size.", pv_name);
+		return 0;
+	}
+	
+	if (size) {
+		if (size > pv->size)
+			log_print("WARNING: %s: Overriding real size. "
+				  "You could lose data.", pv_name);
+		log_verbose("%s: Pretending size is %" PRIu64 " sectors.",
+			    pv_name, size);
+		pv->size = size;
+	}
+
+	if (pv->size < PV_MIN_SIZE) {
+		log_error("%s: Size must exceed minimum of %ld sectors.",
+			  pv_name, PV_MIN_SIZE);
+		return 0;
+	}
+
+	if (pv->size < pv->pe_start) {
+		log_error("%s: Size must exceed physical extent start of "
+			  "%" PRIu64 " sectors.", pv_name, pv->pe_start);
+		return 0;
+	}
+
+	pv->size -= pv->pe_start;
+
+	log_verbose("Resizing volume \"%s\" to %" PRIu64 " sectors.",
+		    pv_name, pv->size);
+
+	if (pv->pe_size) {
+		new_pe_count = (pv->size - pv->pe_start) / vg->extent_size;
+		
+		log_verbose("That makes %" PRIu32 " extents of %" PRIu32
+			    " sectors each.", new_pe_count, pv->pe_size);
+
+		if (new_pe_count < pv->pe_count) {
+ 			if (!new_pe_count) {
+				log_error("%s: Size must leave space for at "
+					  "least one physical extent of "
+					  "%" PRIu32 " sectors.", pv_name,
+					  pv->pe_size);
+				return 0;
+			}
+		}
+
+		old_pe_count = pv->pe_count;
+		if (!pv_resize(pv, vg, new_pe_count)) return 0;
+	}
+
+	log_verbose("Updating physical volume \"%s\"", pv_name);
+	if (*pv->vg_name) {
+		if (!vg_write(vg) || !vg_commit(vg)) {
+			unlock_vg(cmd, pv->vg_name);
+			log_error("Failed to store physical volume \"%s\" in "
+				  "volume group \"%s\"", pv_name, vg->name);
+			return 0;
+		}
+		backup(vg);
+		unlock_vg(cmd, pv->vg_name);
+	} else {
+		if (!(pv_write(cmd, pv, NULL, INT64_C(-1)))) {
+			unlock_vg(cmd, ORPHAN);
+			log_error("Failed to store physical volume \"%s\"",
+				  pv_name);
+			return 0;
+		}
+		unlock_vg(cmd, ORPHAN);
+	}
+
+	log_print("Physical volume \"%s\" changed", pv_name);
+
+	return 1;
+}
+
+int pvresize(struct cmd_context *cmd, int argc, char **argv)
+{
+	int opt = 0;
+	int done = 0;
+	int total = 0;
+
+	struct physical_volume *pv;
+	char *pv_name;
+
+	struct list mdas;
+
+	list_init(&mdas);
+
+	if (!argc) {
+		log_error("Please give a physical volume path");
+		return EINVALID_CMD_LINE;
+	}
+
+	for (; opt < argc; opt++) {
+		pv_name = argv[opt];
+		/* FIXME Read VG instead - pv_read will fail */
+		if (!(pv = pv_read(cmd, pv_name, &mdas, NULL, 1))) {
+			log_error("Failed to read physical volume %s",
+				  pv_name);
+			continue;
+		}
+		total++;
+		done += _pvresize_single(cmd, pv);
+	}
+
+	log_print("%d physical volume%s changed / %d physical volume%s "
+		  "not changed",
+		  done, done == 1 ? "" : "s",
+		  total - done, (total - done) == 1 ? "" : "s");
+
+	return (total == done) ? ECMD_PROCESSED : ECMD_FAILED;
+}
Index: tools/stub.h
===================================================================
RCS file: /cvs/lvm2/LVM2/tools/stub.h,v
retrieving revision 1.43
diff -b -u -r1.43 stub.h
--- tools/stub.h	30 Mar 2004 19:35:43 -0000	1.43
+++ tools/stub.h	28 Oct 2005 20:04:52 -0000
@@ -19,7 +19,6 @@
 /*int e2fsadm(struct cmd_context *cmd, int argc, char **argv) unimplemented*/
 int lvmsadc(struct cmd_context *cmd, int argc, char **argv) unimplemented
 int lvmsar(struct cmd_context *cmd, int argc, char **argv) unimplemented
-int pvresize(struct cmd_context *cmd, int argc, char **argv) unimplemented
 
 int pvdata(struct cmd_context *cmd, int argc, char **argv) {
 	log_error("There's no 'pvdata' command in LVM2.");

--------------000109010402060000060700--
