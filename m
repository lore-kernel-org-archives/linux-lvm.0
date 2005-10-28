Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9SHuDV02281
	for <linux-lvm@redhat.com>; Fri, 28 Oct 2005 13:56:13 -0400
Received: from volumehost.com
	(IDENT:3yxtEbDBU/RMo69pYgx+agdYXJ3n+k9L@adsl-69-154-123-201.dsl.fyvlar.swbell.net
	[69.154.123.201])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j9SHu137014737
	for <linux-lvm@redhat.com>; Fri, 28 Oct 2005 13:56:05 -0400
Received: from volumehost.com (localhost.localdomain [127.0.0.1])
	by volumehost.com (8.12.8/8.12.5) with ESMTP id j9SHtrUN008621
	for <linux-lvm@redhat.com>; Fri, 28 Oct 2005 12:55:53 -0500
Received: (from apache@localhost)
	by volumehost.com (8.12.8/8.12.8/Submit) id j9SHtrr5008619
	for linux-lvm@redhat.com; Fri, 28 Oct 2005 12:55:53 -0500
Message-ID: <1130522152.436266287429e@webmail.volumehost.com>
Date: Fri, 28 Oct 2005 12:55:52 -0500
From: Zac Slade <krakrjak@volumehost.com>
Subject: Re: [linux-lvm] pvresize patch pending
References: <1130518796.4362590c75cf0@webmail.volumehost.com>
	<20051028170130.GH11086@agk.surrey.redhat.com>
	<1130519874.43625d4253324@webmail.volumehost.com>
In-Reply-To: <1130519874.43625d4253324@webmail.volumehost.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Quoting Alasdair G Kergon <agk@redhat.com>:

> On Fri, Oct 28, 2005 at 12:17:54PM -0500, Zac Slade wrote:
> > Well alright.  Attached is a unified diff I validated that it merges
>
> Not attached:-)
>

Opps.  See previous in thread for patching:

diff -uNdr LVM2.2.01.13/lib/format_text/format-text.c
LVM2.2.01.13.patched/lib/format_text/format-text.c
--- LVM2.2.01.13/lib/format_text/format-text.c  2005-10-28 06:54:22.000000000 -0500
+++ LVM2.2.01.13.patched/lib/format_text/format-text.c  2005-10-28
06:55:13.000000000 -0500
@@ -1059,7 +1059,7 @@
        /* FIXME Test mode don't update cache? */

        if (!(info = lvmcache_add(fmt->labeller, (char *) &pv->id, pv->dev,
-                                 ORPHAN, NULL))) {
+                                 pv->vg_name, NULL))) {
                stack;
                return 0;
        }
diff -uNdr LVM2.2.01.13/tools/Makefile.in LVM2.2.01.13.patched/tools/Makefile.in
--- LVM2.2.01.13/tools/Makefile.in      2005-06-06 12:12:07.000000000 -0500
+++ LVM2.2.01.13.patched/tools/Makefile.in      2005-10-28 05:21:40.000000000 -0500
@@ -39,6 +39,7 @@
        polldaemon.c \
        pvchange.c \
        pvcreate.c \
+       pvresize.c \
        pvdisplay.c \
        pvmove.c \
        pvremove.c \
diff -uNdr LVM2.2.01.13/tools/commands.h LVM2.2.01.13.patched/tools/commands.h
--- LVM2.2.01.13/tools/commands.h       2005-06-06 12:12:07.000000000 -0500
+++ LVM2.2.01.13.patched/tools/commands.h       2005-10-28 05:19:40.000000000 -0500
@@ -486,8 +487,9 @@
    force_ARG, test_ARG, yes_ARG)

 xx(pvresize,
-   "Resize a physical volume in use by a volume group",
-   "Not implemented.  Use pvcreate options.",
+   "Resize (grow only) a physical volume",
+   "pvresize " "\n"
+   "\tPhysicalVolume\n",
 /***
    "pvresize "
    "[-A|--autobackup {y|n}] "
Files LVM2.2.01.13/tools/lvm.o and LVM2.2.01.13.patched/tools/lvm.o differ
diff -uNdr LVM2.2.01.13/tools/pvresize.c LVM2.2.01.13.patched/tools/pvresize.c
--- LVM2.2.01.13/tools/pvresize.c       1969-12-31 18:00:00.000000000 -0600
+++ LVM2.2.01.13.patched/tools/pvresize.c       2005-10-28 06:49:09.000000000 -0500
@@ -0,0 +1,149 @@
+/* pvresize
+ * Currently this code only supports growing a pv
+ * And you can only resize it to the actual size
+ * of the PhysicalVolume.
+ *
+ * The tricky part is making it smaller.
+ *
+ * Code is copyright 2005:
+ * Boyd Smith <bss03@volumehost.com>
+ * Zac Slade <krakrjak@volumehost.com>
+ *
+ */
+
+#include "tools.h"
+
+static int _pvresize_single(struct cmd_context *cmd, struct physical_volume *pv,
+       void *handle)
+{
+    struct volume_group *vg = NULL;
+    struct pv_list *pvl;
+    const char *pv_name = dev_name(pv->dev);
+    char uuid[64];
+
+    if (*pv->vg_name != '\0') {
+       log_verbose("Finding volume group of physical volume \"%s\"",
+               pv_name);
+
+       if (!lock_vol(cmd, pv->vg_name, LCK_VG_WRITE)) {
+           log_error("Can't get lock for %s", pv->vg_name);
+           return ECMD_FAILED;
+       }
+
+       if (!(vg = vg_read(cmd, pv->vg_name, NULL))) {
+           unlock_vg(cmd, pv->vg_name);
+           log_error("Unable to find volume group of \"%s\"",
+                   pv_name);
+           return ECMD_FAILED;
+       }
+
+       if (vg->status & EXPORTED_VG) {
+           unlock_vg(cmd, pv->vg_name);
+           log_error("Volume group \"%s\" is exported", vg->name);
+           return ECMD_FAILED;
+       }
+
+       if (!(vg->status & LVM_WRITE)) {
+           unlock_vg(cmd, pv->vg_name);
+           log_error("Volume group \"%s\" is read-only", vg->name);
+           return ECMD_FAILED;
+       }
+
+       if (!(pvl = find_pv_in_vg(vg, pv_name))) {
+           unlock_vg(cmd, pv->vg_name);
+           log_error
+               ("Unable to find \"%s\" in volume group \"%s\"",
+                pv_name, vg->name);
+           return ECMD_FAILED;
+       }
+       if (arg_count(cmd, uuid_ARG) && lvs_in_vg_activated(vg)) {
+           unlock_vg(cmd, pv->vg_name);
+           log_error("Volume group containing %s has active "
+                   "logical volumes", pv_name);
+           return ECMD_FAILED;
+       }
+       pv = pvl->pv;
+       if (!archive(vg))
+           return ECMD_FAILED;
+    } else {
+       if (!lock_vol(cmd, ORPHAN, LCK_VG_WRITE)) {
+           log_error("Can't get lock for orphans");
+           return ECMD_FAILED;
+       }
+    }
+    uint64_t size =0;
+    struct device *dev;
+
+    if (!(dev = dev_cache_get(pv_name, cmd->filter))) {
+       log_error("%s: Couldn't find device.  Check your filters?",
+               pv_name);
+       goto error;
+    }
+
+    if (!dev_get_size(pv->dev, &size)) {
+       log_error("%s: Couldn't get size.", dev_name(pv->dev));
+       goto error;
+    }
+
+    if (size < pv->size) {
+       log_error("Trying to shrink pv %s to %lu bytes.", dev_name(pv->dev), size);
+       goto error;
+    } else if (size == pv->size) {
+       log_error("Trying to extend pv %s to the same size.", dev_name(pv->dev));
+       goto error;
+    }
+
+    pv->size = size;
+    /* No mda or label changes */
+    if (!(pv->fmt->ops->pv_write(pv->fmt, pv, NULL, -1))) {
+       log_error("Failed to write physical volume \"%s\"", pv_name);
+       goto error;
+    }
+
+    log_verbose("Updating physical volume \"%s\"", pv_name);
+    if (*pv->vg_name != '\0') {
+       if (!vg_write(vg) || !vg_commit(vg)) {
+           unlock_vg(cmd, pv->vg_name);
+           log_error("Failed to store physical volume \"%s\" in "
+                   "volume group \"%s\"", pv_name, vg->name);
+           return 0;
+       }
+       backup(vg);
+       unlock_vg(cmd, pv->vg_name);
+    } else {
+       if (!(pv_write(cmd, pv, NULL, INT64_C(-1)))) {
+           unlock_vg(cmd, ORPHAN);
+           log_error("Failed to store physical volume \"%s\"",
+                   pv_name);
+           return 0;
+       }
+       unlock_vg(cmd, ORPHAN);
+    }
+
+    log_print("Physical volume \"%s\" changed", pv_name);
+    return ECMD_PROCESSED;
+error:
+    unlock_vg(cmd, pv->vg_name);
+    return ECMD_FAILED;
+}
+
+int pvresize(struct cmd_context *cmd, int argc, char **argv)
+{
+    char *pv_name;
+    struct physical_volume *pv;
+    int done;
+    if (argc != 1) {
+       log_error("Currently limited to only One physical volume");
+       return EINVALID_CMD_LINE;
+    }
+    log_verbose("Using physical volume on command line");
+    pv_name = argv[0];
+    /* FIXME Read VG instead - pv_read will fail */
+    if (!(pv = pv_read(cmd, pv_name, NULL, NULL, 1))) {
+       log_error("Failed to read physical volume %s", pv_name);
+    }
+    done = _pvresize_single(cmd, pv, NULL);
+    return (done == 1) ? ECMD_PROCESSED : ECMD_FAILED;
+}
+
+
diff -uNdr LVM2.2.01.13/tools/stub.h LVM2.2.01.13.patched/tools/stub.h
--- LVM2.2.01.13/tools/stub.h   2004-03-30 13:35:43.000000000 -0600
+++ LVM2.2.01.13.patched/tools/stub.h   2005-10-28 05:31:40.000000000 -0500
@@ -19,7 +19,7 @@
 /*int e2fsadm(struct cmd_context *cmd, int argc, char **argv) unimplemented*/
 int lvmsadc(struct cmd_context *cmd, int argc, char **argv) unimplemented
 int lvmsar(struct cmd_context *cmd, int argc, char **argv) unimplemented
-int pvresize(struct cmd_context *cmd, int argc, char **argv) unimplemented
+/*int pvresize(struct cmd_context *cmd, int argc, char **argv) unimplemented*/

 int pvdata(struct cmd_context *cmd, int argc, char **argv) {
        log_error("There's no 'pvdata' command in LVM2.");

Zac Slade
krakrjak@volumehost.com

-------------------------------------------------
This mail sent through IMP: http://horde.org/imp/
