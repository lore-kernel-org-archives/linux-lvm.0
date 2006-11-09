From: Jonathan Brassow <jbrassow@redhat.com>
Date: Thu, 09 Nov 2006 12:28:41 -0600
Message-Id: <1163096921.21967.7.camel@hydrogen.msp.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] [Patch 1/1] LVM additional size suffixes support
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
To: linux-lvm@redhat.com, agk@redhat.com

...because only wimps use less than a Petabyte of storage.  :)

Add support for (P)etabyte and (E)xabyte endings.

Example:
[root@neo-04 ~]# lvcreate -L 3E -n lv vg
  Logical volume "lv" created
[root@neo-04 ~]# lvs
  LV         VG           Attr   LSize   Origin Snap%  Move Log Copy%  Devices
  lv         vg           -wi-a-   3.00E                               /dev/dm-2(0)
  lv         vg           -wi-a-   3.00E                               /dev/dm-3(0)
[root@neo-04 ~]# vgs
  VG           #PV #LV #SN Attr   VSize  VFree
  vg             3   1   0 wz--n-  6.00E  3.00E
[root@neo-04 ~]# pvs
  PV         VG           Fmt  Attr PSize  PFree
  /dev/dm-2  vg           lvm2 a-    2.00E       0
  /dev/dm-3  vg           lvm2 a-    2.00E 1024.00P
  /dev/dm-4  vg           lvm2 a-    2.00E    2.00E
  /dev/hda2  VolGroupKS00 lvm2 a-   37.16G   32.00M
  /dev/sdd1               lvm2 --   17.15G   17.15G
  /dev/sde1               lvm2 --   17.15G   17.15G
  /dev/sdf1               lvm2 --   17.15G   17.15G
  /dev/sdg1               lvm2 --   17.15G   17.15G
[root@neo-04 ~]# cat /proc/partitions
major minor  #blocks  name
<snip>
 253     2 2251799813685248 dm-2
 253     3 2251799813685248 dm-3
 253     4 2251799813685248 dm-4
 253     5 3377699720527872 dm-5

 brassow

Index: LVM2/lib/display/display.c
===================================================================
--- LVM2.orig/lib/display/display.c	2006-10-08 07:01:12.000000000 -0500
+++ LVM2/lib/display/display.c	2006-11-09 12:11:07.000000000 -0600
@@ -82,6 +82,12 @@ uint64_t units_to_bytes(const char *unit
 	case 't':
 		v *= KILO * KILO * KILO * KILO;
 		break;
+	case 'p':
+		v *= KILO * KILO * KILO * KILO * KILO;
+		break;
+	case 'e':
+		v *= KILO * KILO * KILO * KILO * KILO * KILO;
+		break;
 #undef KILO
 #define KILO UINT64_C(1000)
 	case 'K':
@@ -96,6 +102,12 @@ uint64_t units_to_bytes(const char *unit
 	case 'T':
 		v *= KILO * KILO * KILO * KILO;
 		break;
+	case 'P':
+		v *= KILO * KILO * KILO * KILO * KILO;
+		break;
+	case 'E':
+		v *= KILO * KILO * KILO * KILO * KILO * KILO;
+		break;
 #undef KILO
 	default:
 		return 0;
@@ -143,6 +155,8 @@ static const char *_display_size(struct 
 	uint64_t units = UINT64_C(1024);
 	char *size_buf = NULL;
 	const char *size_str[][3] = {
+		{" Exabyte", " EB", "E"},
+		{" Petabyte", " PB", "P"},
 		{" Terabyte", " TB", "T"},
 		{" Gigabyte", " GB", "G"},
 		{" Megabyte", " MB", "M"},
@@ -161,7 +175,7 @@ static const char *_display_size(struct 
 
 	suffix = cmd->current_settings.suffix;
 
-	for (s = 0; s < 8; s++)
+	for (s = 0; s < 10; s++)
 		if (toupper((int) cmd->current_settings.unit_type) ==
 		    *size_str[s][2])
 			break;
@@ -171,7 +185,7 @@ static const char *_display_size(struct 
 		return size_buf;
 	}
 
-	if (s < 8) {
+	if (s < 10) {
 		byte = cmd->current_settings.unit_factor;
 		size *= UINT64_C(512);
 	} else {
@@ -181,7 +195,7 @@ static const char *_display_size(struct 
 			units = UINT64_C(1000);
 		else
 			units = UINT64_C(1024);
-		byte = units * units * units;
+		byte = units * units * units * units * units;
 		s = 0;
 		while (size_str[s] && size < byte)
 			s++, byte /= units;
Index: LVM2/lib/format_text/export.c
===================================================================
--- LVM2.orig/lib/format_text/export.c	2006-10-07 18:17:17.000000000 -0500
+++ LVM2/lib/format_text/export.c	2006-11-09 11:06:28.000000000 -0600
@@ -221,6 +221,8 @@ static int _sectors_to_units(uint64_t se
 		"Megabytes",
 		"Gigabytes",
 		"Terabytes",
+		"Petabytes",
+		"Exabytes",
 		NULL
 	};
 
Index: LVM2/tools/lvmcmdline.c
===================================================================
--- LVM2.orig/tools/lvmcmdline.c	2006-10-02 11:15:03.000000000 -0500
+++ LVM2/tools/lvmcmdline.c	2006-11-09 12:08:41.000000000 -0600
@@ -186,7 +186,7 @@ static int _size_arg(struct cmd_context 
 {
 	char *ptr;
 	int i;
-	static const char *suffixes = "kmgt";
+	static const char *suffixes = "kmgtpe";
 	char *val;
 	double v;
 
