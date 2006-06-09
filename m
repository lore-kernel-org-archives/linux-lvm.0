Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k599clNZ021276
	for <linux-lvm@redhat.com>; Fri, 9 Jun 2006 05:38:47 -0400
Received: from mtagate5.de.ibm.com (mtagate5.de.ibm.com [195.212.29.154])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k599ceIL003836
	for <linux-lvm@redhat.com>; Fri, 9 Jun 2006 05:38:41 -0400
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate5.de.ibm.com (8.13.6/8.13.6) with ESMTP id k599cZFv032498
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-lvm@redhat.com>; Fri, 9 Jun 2006 09:38:35 GMT
Received: from d12av01.megacenter.de.ibm.com (d12av01.megacenter.de.ibm.com
	[9.149.165.212])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.6/NCO/VER7.0) with ESMTP id
	k599eaDl110342
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 9 Jun 2006 11:40:36 +0200
Received: from d12av01.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av01.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id k599cZWM010959
	for <linux-lvm@redhat.com>; Fri, 9 Jun 2006 11:38:35 +0200
Received: from dyn-9-152-216-85.boeblingen.de.ibm.com
	(dyn-9-152-216-85.boeblingen.de.ibm.com [9.152.216.85])
	by d12av01.megacenter.de.ibm.com (8.12.11.20060308/8.12.11) with ESMTP
	id k599cZ2A010951
	for <linux-lvm@redhat.com>; Fri, 9 Jun 2006 11:38:35 +0200
From: Jens Wilke <jens.wilke@de.ibm.com>
Date: Fri, 9 Jun 2006 11:37:48 +0200
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200606091137.49000.jens.wilke@de.ibm.com>
Content-Transfer-Encoding: 7bit
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
