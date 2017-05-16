From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Date: Tue, 16 May 2017 17:20:40 +0200
Message-Id: <20170516152040.4619-4-enric.balletbo@collabora.com>
In-Reply-To: <20170516152040.4619-1-enric.balletbo@collabora.com>
References: <20170516152040.4619-1-enric.balletbo@collabora.com>
Subject: [linux-lvm] [PATCH v2 3/3] dmsetup: add support to create devices
	when bootformat is used
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alasdair Kergon <agk@redhat.com>, linux-lvm@redhat.com
Cc: Kees Cook <keescook@chromium.org>, Mike Snitzer <snitzer@redhat.com>

Add a new switch to supply a bootformated string to dmsetup, we
support create one or multiple devices in one line provided to
the create command. E.g.

  dmsetup create --bootformat <multi_dev_info>|<multi_dev_info_file>

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 man/dmsetup.8_main               |  77 ++++++++++++++++++++++---
 test/shell/dmsetup-bootformat.sh |  77 +++++++++++++++++++++++++
 tools/dmsetup.c                  | 118 ++++++++++++++++++++++++++++++++++++++-
 3 files changed, 264 insertions(+), 8 deletions(-)
 create mode 100644 test/shell/dmsetup-bootformat.sh

diff --git a/man/dmsetup.8_main b/man/dmsetup.8_main
index 4421882..dad58b1 100644
--- a/man/dmsetup.8_main
+++ b/man/dmsetup.8_main
@@ -22,14 +22,17 @@ dmsetup \(em low level logical volume management
 .de CMD_CREATE
 .  ad l
 .  BR create
-.  IR device_name
+.  IR [[device_name]
 .  RB [ -u | --uuid
 .  IR uuid ]
 .  RB \%[ --addnodeoncreate | --addnodeonresume ]
 .  RB \%[ -n | --notable | --table
 .  IR \%table | table_file ]
 .  RB [ --readahead
-.  RB \%[ + ] \fIsectors | auto | none ]
+.  RB \%[ + ] \fIsectors | auto | none ]]
+.  RB |
+.  RB \%[ --bootformat
+.  IR \%multi_dev_info | multi_dev_info_file]
 .  ad b
 ..
 .CMD_CREATE
@@ -269,9 +272,11 @@ dmsetup \(em low level logical volume management
 .de CMD_TABLE
 .  ad l
 .  BR table
-.  RB [ --target
+.  RB [[ --target
 .  IR target_type ]
-.  RB [ --showkeys ]
+.  RB [ --showkeys ]]
+.  RB |
+.  RB [ --bootformat ]
 .  RI [ device_name ...]
 .  ad b
 ..
@@ -400,6 +405,12 @@ Ensure \fI/dev/mapper\fP node exists after \fBdmsetup create\fP.
 Ensure \fI/dev/mapper\fP node exists after \fBdmsetup resume\fP (default with udev).
 .
 .HP
+.BR --bootformat
+.br
+Specify a one-line multi device setup information directly on the command line.
+See below for more information on the boot format.
+.
+.HP
 .BR --checks
 .br
 Perform additional checks on the operations requested and report
@@ -610,9 +621,12 @@ Destroys the table in the inactive table slot for device_name.
 .HP
 .CMD_CREATE
 .br
-Creates a device with the given name.
-If \fItable\fP or \fItable_file\fP is supplied, the table is loaded and made live.
-Otherwise a table is read from standard input unless \fB--notable\fP is used.
+Creates a device with the given name or multiple devices if boot format is used.
+If boot format is used we must supply a multiple device setup information
+from cmdline or standard input. See below for more information on the boot format.
+Otherwise, if \fItable\fP or \fItable_file\fP is supplied, the table is loaded
+and made live. Otherwise a table is read from standard input unless \fB--notable\fP
+is used.
 The optional \fIuuid\fP can be used in place of
 device_name in subsequent dmsetup commands.
 If successful the device will appear in table and for live
@@ -824,6 +838,8 @@ Real encryption keys are suppressed in the table output for the crypt
 target unless the \fB--showkeys\fP parameter is supplied. Kernel key
 references prefixed with \fB:\fP are not affected by the parameter and get
 displayed always.
+With \fB--bootformat\fP, the information relating to the specified targets
+is displayed in boot format style.
 .
 .HP
 .CMD_TARGETS
@@ -996,6 +1012,53 @@ documentation directory for the device-mapper package.)
 .br
 2056320 2875602 linear /dev/hdb 1028160
 .
+.SH BOOT FORMAT
+.
+Simple string of data separated by commas and optionally semi-colons, where:
+.br
+- A comma is used to separate the fields for one device.
+.br
+- A semi-colon is used to separate devices.
+.TP
+The string is of the form:
+.sp
+<name>,<uuid>,<flags>,<table>[,<table>+][;<dev_name>,<uuid>,<flags>,<table>[,<table>+]]
+.sp
+.TP
+One device args include:
+.
+.TP
+.B name
+The name of the device.
+.TP
+.B uuid
+The UUID of the device or empty
+.TP
+.B flags
+Supported flags are:
+.sp
+.B ro
+Sets the table being loaded for the device read-only (default)
+.br
+.B rw
+Sets the table being loaded for the device read-write
+.sp
+.TP
+.B table
+See table format above.
+.TP
+.
+.SH EXAMPLES
+.
+# A simple linear device
+.br
+test-linear-small,,ro,0 2097152 linear /dev/loop0 0, 2097152 2097152 linear /dev/loop1 0'
+.br
+# Two linear devices
+.br
+test-linear-small,,ro,0 2097152 linear /dev/loop0 0;test-linear-large,,rw, 0 2097152 linear /dev/loop1 0, 2097152 2097152 linear /dev/loop2 0
+.br
+.
 .SH ENVIRONMENT VARIABLES
 .
 .TP
diff --git a/test/shell/dmsetup-bootformat.sh b/test/shell/dmsetup-bootformat.sh
new file mode 100644
index 0000000..8174ef4
--- /dev/null
+++ b/test/shell/dmsetup-bootformat.sh
@@ -0,0 +1,77 @@
+#!/bin/sh
+# Copyright (C) 2017 Red Hat, Inc. All rights reserved.
+#
+# This copyrighted material is made available to anyone wishing to use,
+# modify, copy, or redistribute it subject to the terms and conditions
+# of the GNU General Public License v.2.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software Foundation,
+# Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+
+# unrelated to lvm2 daemons
+SKIP_WITH_LVMLOCKD=1
+SKIP_WITH_LVMPOLLD=1
+SKIP_WITH_CLVMD=1
+SKIP_WITH_LVMETAD=1
+
+. lib/inittest
+
+LOOP="/dev/loop"
+
+for i in 0 1 2 3; do
+	[ -b /dev/loop${i} ] || skip "test requires /dev/loop${i}"
+done;
+
+# some constants
+UUID_A="457f0e3b-dc4b-4d39-81d4-2423a8ec0fa3"
+UUID_B="34e08a5b-8108-4939-b7e8-ba90b0b7d767"
+TABLES_A="0 2097152 linear ${LOOP}0 0, 2097152 2097152 linear ${LOOP}1 0"
+TABLES_B="0 2097152 linear ${LOOP}2 0, 2097152 2097152 linear ${LOOP}3 0"
+
+# test create/remove a single device
+dmsetup create --bootformat "test-linear-small,${UUID_A},rw,${TABLES_A}"
+dmsetup remove test-linear-small
+
+# test create/remove multiple devices
+dmsetup create --bootformat "test-linear-small,${UUID_A},rw,${TABLES_A};test-linear-large,${UUID_B},rw,${TABLES_B}"
+dmsetup remove test-linear-small test-linear-large
+
+# test empty fields
+dmsetup create --bootformat "test-linear-small,,,${TABLES_A}"
+dmsetup remove test-linear-small
+
+# test flags options (rw | ro | <empty>)
+# flag : rw
+dmsetup create --bootformat "test-linear-small,${UUID_A},rw,${TABLES_A}"
+# check that READ-ONLY string is not in State line
+str=`dmsetup info test-linear-small | grep 'State:'`
+test "${str#*READ-ONLY}" == "$str"
+dmsetup remove test-linear-small
+# flag : ro
+dmsetup create --bootformat "test-linear-small,${UUID_A},ro,${TABLES_A}"
+# check that READ-ONLY string is in State line
+str=`dmsetup info test-linear-small | grep 'State:'`
+test "${str#*READ-ONLY}" != "$str"
+dmsetup remove test-linear-small
+# flag : <emtpy>
+dmsetup create --bootformat "test-linear-small,${UUID_A},,${TABLES_A}"
+# check that READ-ONLY string is in State line
+str=`dmsetup info test-linear-small | grep 'State:'`
+test "${str#*READ-ONLY}" != "$str"
+dmsetup remove test-linear-small
+
+# let's try some scaped names
+declare -A escaped_names=(
+    ["test,linear,small"]="test\,linear\,small"
+    [",test,,linear,"]="\,test\,\,linear\,"
+    ["test;linear;small"]="test\;linear\;small"
+    [";test;;linear;"]="\;test\;\;linear\;"
+    [";test,linear;small,"]="\;test\,linear\;small\,"
+)
+
+for name in "${!escaped_names[@]}"
+do
+    dmsetup create --bootformat "${escaped_names[$name]},,ro,${TABLES_A}"
+    dmsetup remove "${name}"
+done
diff --git a/tools/dmsetup.c b/tools/dmsetup.c
index fc99145..dec3c84 100644
--- a/tools/dmsetup.c
+++ b/tools/dmsetup.c
@@ -1097,6 +1097,110 @@ out:
 	return r;
 }
 
+static int _parse_device(char *dev_info)
+{
+	int r = 0;
+	struct dm_task *dmt;
+	uint32_t cookie = 0;
+	uint16_t udev_flags = 0;
+	int line = 0, field = 0;
+	char *str = dev_info, *ptr = dev_info;
+
+	if (!(dmt = dm_task_create(DM_DEVICE_CREATE)))
+		return_0;
+
+	while ((str = dm_find_unescaped_char(&ptr, ',')) != NULL ) {
+                str = dm_unescape_colons(str);
+		switch (field) {
+		case 0: /* set device name */
+			if (!dm_task_set_name(dmt, str))
+				goto_out;
+                        break;
+		case 1: /* set uuid if any */
+			if (strlen(str) && !dm_task_set_uuid(dmt, str))
+				goto_out;
+			break;
+		case 2:
+			/* set as read-only if flags = "ro" | "" */
+			if (!strncmp(str, "ro", strlen(str)) || !strlen(str)) {
+				if (!dm_task_set_ro(dmt))
+					goto_out;
+			} else if (!strncmp(str, "rw", strlen(str))) {
+                                break;
+                        } else
+                                goto_out;
+			break;
+		default:
+			if (!_parse_line(dmt, str, "", line++))
+				goto_out;
+			break;
+		}
+		field++;
+	}
+
+	if (field < 4)
+		goto_out;
+
+	if (!_set_task_add_node(dmt))
+		goto_out;
+
+	if (_udev_cookie)
+		cookie = _udev_cookie;
+
+	if (_udev_only)
+		udev_flags |= DM_UDEV_DISABLE_LIBRARY_FALLBACK;
+
+	if (!dm_task_set_cookie(dmt, &cookie, udev_flags) ||
+	    !_task_run(dmt))
+		goto_out;
+
+	r = 1;
+
+out:
+	if (!_udev_cookie)
+		(void) dm_udev_wait(cookie);
+
+	if (r && _switches[VERBOSE_ARG])
+		r = _display_info(dmt);
+
+	dm_task_destroy(dmt);
+
+	return r;
+}
+
+static int _create_multi_devices(const char *multi_dev_info)
+{
+	char *buffer = NULL, *dev_info, *ptr;
+	size_t buffer_size = LINE_SIZE;
+	int r = 0;
+
+	if (!(buffer = dm_malloc(buffer_size))) {
+		err("Failed to malloc line buffer.");
+		return 0;
+	}
+
+	if (!multi_dev_info) {	/* get info from stdin */
+		if (!(getline(&buffer, &buffer_size, stdin) > 0))
+			goto_out;
+	} else if (!dm_strncpy(buffer, multi_dev_info, LINE_SIZE))
+		goto_out;
+
+	dev_info = ptr = buffer;
+
+	while ((dev_info = dm_find_unescaped_char(&ptr, ';')) != NULL ) {
+                dev_info = dm_unescape_semicolons(dev_info);
+		if (!_parse_device(dev_info))
+			goto_out;
+        }
+
+	r = 1;
+out:
+	memset(buffer, 0, buffer_size);
+	dm_free(buffer);
+
+	return r;
+}
+
 static int _create(CMD_ARGS)
 {
 	int r = 0;
@@ -1105,6 +1209,16 @@ static int _create(CMD_ARGS)
 	uint32_t cookie = 0;
 	uint16_t udev_flags = 0;
 
+	/* arguments are in bootformat style */
+	if (_switches[BOOTFORMAT_ARG]) {
+		if (argc > 1)
+			return 0;
+		if (argc == 1)
+			file = argv[0];
+		return _create_multi_devices(file);
+	}
+
+	/* otherwise  */
 	if (argc == 2)
 		file = argv[1];
 
@@ -5909,7 +6023,8 @@ static struct command _dmsetup_commands[] = {
 	  "\t    [-U|--uid <uid>] [-G|--gid <gid>] [-M|--mode <octal_mode>]\n"
 	  "\t    [-u|uuid <uuid>] [--addnodeonresume|--addnodeoncreate]\n"
 	  "\t    [--readahead {[+]<sectors>|auto|none}]\n"
-	  "\t    [-n|--notable|--table {<table>|<table_file>}]", 1, 2, 0, 0, _create},
+	  "\t    [-n|--notable|--table {<table>|<table_file>}]\n"
+	  "\t    [--bootformat {<multi_dev_info>|<multi_dev_info_file>}]", 0, 2, 0, 0, _create},
 	{"remove", "[--deferred] [-f|--force] [--retry] <device>...", 0, -1, 1, 0, _remove},
 	{"remove_all", "[-f|--force]", 0, 0, 0, 0, _remove_all},
 	{"suspend", "[--noflush] [--nolockfs] <device>...", 0, -1, 1, 0, _suspend},
@@ -6004,6 +6119,7 @@ static void _dmsetup_usage(FILE *out)
 	fprintf(out, "<mangling_mode> is one of 'none', 'auto' and 'hex'.\n");
 	fprintf(out, "<fields> are comma-separated.  Use 'help -c' for list.\n");
 	fprintf(out, "Table_file contents may be supplied on stdin.\n");
+	fprintf(out, "Multi_dev_info_file contents may be supplied on stdin.\n");
 	fprintf(out, "Options are: devno, devname, blkdevname.\n");
 	fprintf(out, "Tree specific options are: ascii, utf, vt100; compact, inverted, notrunc;\n"
 		     "                           blkdevname, [no]device, active, open, rw and uuid.\n");
-- 
2.9.3
