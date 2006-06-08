Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k58GuhLl031964
	for <linux-lvm@redhat.com>; Thu, 8 Jun 2006 12:56:43 -0400
Received: from mtagate6.uk.ibm.com (mtagate6.uk.ibm.com [195.212.29.139])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k58GuZvS017152
	for <linux-lvm@redhat.com>; Thu, 8 Jun 2006 12:56:35 -0400
Received: from d06nrmr1407.portsmouth.uk.ibm.com
	(d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate6.uk.ibm.com (8.13.6/8.13.6) with ESMTP id k58GuT9F127640
	for <linux-lvm@redhat.com>; Thu, 8 Jun 2006 16:56:29 GMT
Received: from d06av02.portsmouth.uk.ibm.com (d06av02.portsmouth.uk.ibm.com
	[9.149.37.228])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.12.10/NCO/VER6.8) with ESMTP id
	k58GveVc038306
	for <linux-lvm@redhat.com>; Thu, 8 Jun 2006 17:57:40 +0100
Received: from d06av02.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av02.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id k58GuPYq001632
	for <linux-lvm@redhat.com>; Thu, 8 Jun 2006 17:56:25 +0100
Received: from dyn-9-152-216-82.boeblingen.de.ibm.com
	(dyn-9-152-216-82.boeblingen.de.ibm.com [9.152.216.82])
	by d06av02.portsmouth.uk.ibm.com (8.12.11.20060308/8.12.11) with ESMTP
	id k58GuPjI001625
	for <linux-lvm@redhat.com>; Thu, 8 Jun 2006 17:56:25 +0100
From: Jens Wilke <jens.wilke@de.ibm.com>
Date: Thu, 8 Jun 2006 18:55:37 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200606081855.37415.jens.wilke@de.ibm.com>
Subject: [linux-lvm] [PATCH] lvm metadata handling,
	warn only once about missing PV
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
To: linux-lvm@redhat.com

Hi,

When a disk is missing the messages of the lvm tools are quite 
verbose. Example output for a VG with a mirror LV:

Without patch:
# vgchange -ay -P
  Partial mode. Incomplete volume groups will be activated read-only.
  Couldn't find device with uuid 'egDxmo-sVp7-OQGB-6mgt-84mk-xioM-ahdzBw'.
  Couldn't find device with uuid 'egDxmo-sVp7-OQGB-6mgt-84mk-xioM-ahdzBw'.
  Couldn't find device with uuid 'egDxmo-sVp7-OQGB-6mgt-84mk-xioM-ahdzBw'.
  Couldn't find device with uuid 'egDxmo-sVp7-OQGB-6mgt-84mk-xioM-ahdzBw'.
  Couldn't find device with uuid 'egDxmo-sVp7-OQGB-6mgt-84mk-xioM-ahdzBw'.
  Couldn't find device with uuid 'egDxmo-sVp7-OQGB-6mgt-84mk-xioM-ahdzBw'.
  Couldn't find device with uuid 'egDxmo-sVp7-OQGB-6mgt-84mk-xioM-ahdzBw'.
  Couldn't find device with uuid 'egDxmo-sVp7-OQGB-6mgt-84mk-xioM-ahdzBw'.
  Couldn't find device with uuid 'egDxmo-sVp7-OQGB-6mgt-84mk-xioM-ahdzBw'.
  Couldn't find device with uuid 'egDxmo-sVp7-OQGB-6mgt-84mk-xioM-ahdzBw'.
  Couldn't find device with uuid 'egDxmo-sVp7-OQGB-6mgt-84mk-xioM-ahdzBw'.
  Couldn't find device with uuid 'egDxmo-sVp7-OQGB-6mgt-84mk-xioM-ahdzBw'.
  Couldn't find device with uuid 'egDxmo-sVp7-OQGB-6mgt-84mk-xioM-ahdzBw'.
  Couldn't find device with uuid 'egDxmo-sVp7-OQGB-6mgt-84mk-xioM-ahdzBw'.
  Couldn't find device with uuid 'egDxmo-sVp7-OQGB-6mgt-84mk-xioM-ahdzBw'.
  Couldn't find device with uuid 'egDxmo-sVp7-OQGB-6mgt-84mk-xioM-ahdzBw'.
  2 logical volume(s) in volume group "main" now active

With patch:

# vgchange -ay -P
  Partial mode. Incomplete volume groups will be activated read-only.
  Missing PV with uuid 'egDxmo-sVp7-OQGB-6mgt-84mk-xioM-ahdzBw' in VG main
  2 logical volume(s) in volume group "main" now active

Regards,

Jens

-- 
  Jens Wilke
  Linux on zSeries - Application Development Tools + GCC
  phone +49-(0)7031-16-3936 - tl *120-3936 - email jens.wilke@de.ibm.com
  IBM Germany Lab, Schoenaicher Str. 220, 71032 Boeblingen


Signed-Off-By: Jens Wilke <jens.wilke@de.ibm.com>

Index: lib/format_text/import_vsn1.c
===================================================================
--- lib/format_text/import_vsn1.c	9 May 2006 12:29:44 -0000	1.2
+++ lib/format_text/import_vsn1.c	8 Jun 2006 14:25:44 -0000
@@ -151,9 +151,9 @@
 		char buffer[64];
 
 		if (!id_write_format(&pv->id, buffer, sizeof(buffer)))
-			log_error("Couldn't find device.");
+			log_verbose("Couldn't find device.");
 		else
-			log_error("Couldn't find device with uuid '%s'.",
+			log_verbose("Couldn't find device with uuid '%s'.",
 				  buffer);
 
 		if (partial_mode())
Index: lib/metadata/metadata.c
===================================================================
--- lib/metadata/metadata.c	9 May 2006 12:29:45 -0000	1.2
+++ lib/metadata/metadata.c	8 Jun 2006 14:25:44 -0000
@@ -1096,6 +1096,25 @@
 	return correct_vg;
 }
 
+static void warn_pv_missing(struct volume_group *vg)
+{
+	struct physical_volume *pv;
+	struct pv_list *pvl;
+	char buffer[64];
+
+	list_iterate_items(pvl, &vg->pvs) {
+		pv = pvl->pv;
+		if (!pv->dev) {
+			if (!id_write_format(&pv->id, buffer, sizeof(buffer))) {
+				log_error("Volume group %s has missing PVs", vg->name);
+			} else {
+				log_error("Missing PV with uuid '%s' in VG %s",
+					  buffer, vg->name);
+			}
+		}
+	}
+}
+
 struct volume_group *vg_read(struct cmd_context *cmd, const char *vgname,
 			     const char *vgid, int *consistent)
 {
@@ -1118,6 +1137,8 @@
 			return NULL;
 		}
 	}
+	
+	warn_pv_missing(vg);
 
 	return vg;
 }
