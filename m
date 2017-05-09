From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Date: Tue,  9 May 2017 17:48:22 +0200
Message-Id: <20170509154822.13396-3-enric.balletbo@collabora.com>
In-Reply-To: <20170509154822.13396-1-enric.balletbo@collabora.com>
References: <20170509154822.13396-1-enric.balletbo@collabora.com>
Subject: [linux-lvm] [PATCH 2/2] dmsetup: add support to create devices when
	bootformat is used
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
To: linux-lvm@redhat.com, Alasdair Kergon <agk@redhat.com>
Cc: Kees Cook <keescook@chromium.org>, Mike Snitzer <snitzer@redhat.com>

Add a new switch to supply a bootformated string to dmsetup, we
support create one or multiple devices in one line provided to
the create command. E.g.

  dmsetup create --bootformat <multi_dev_info>|<multi_dev_info_file>

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 tools/dmsetup.c | 124 +++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 123 insertions(+), 1 deletion(-)

diff --git a/tools/dmsetup.c b/tools/dmsetup.c
index fc99145..0961e65 100644
--- a/tools/dmsetup.c
+++ b/tools/dmsetup.c
@@ -1097,6 +1097,116 @@ out:
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
+	/*
+	 * FIXME: support embedded '\,' in string data:
+	 *   s/strsep/_find_unescaped_comma()/
+	 */
+	while ((str = strsep(&ptr, ",")) != NULL ) {
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
+			if (!strncmp(str, "rw", strlen(str)))
+				break;
+			/* set as read-only if flags = "ro" | "" */
+			if (!strncmp(str, "ro", strlen(str)) ||
+			    !strncmp(str, "", strlen(str))) {
+				if (!dm_task_set_ro(dmt))
+					goto_out;
+			} else
+				goto_out;
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
+	/*
+	 * FIXME: support embedded '\;' in string data:
+	 *   s/strsep/_find_unescaped_semicolon()/
+	 */
+	while ((dev_info = strsep(&ptr, ";")) != NULL )
+		if (!_parse_device(dev_info))
+			goto_out;
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
@@ -1105,6 +1215,16 @@ static int _create(CMD_ARGS)
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
 
@@ -5909,7 +6029,8 @@ static struct command _dmsetup_commands[] = {
 	  "\t    [-U|--uid <uid>] [-G|--gid <gid>] [-M|--mode <octal_mode>]\n"
 	  "\t    [-u|uuid <uuid>] [--addnodeonresume|--addnodeoncreate]\n"
 	  "\t    [--readahead {[+]<sectors>|auto|none}]\n"
-	  "\t    [-n|--notable|--table {<table>|<table_file>}]", 1, 2, 0, 0, _create},
+	  "\t    [-n|--notable|--table {<table>|<table_file>}]\n"
+	  "\t    [--bootformat {<multi_dev_info>|<multi_dev_info_file>}]", 0, 2, 0, 0, _create},
 	{"remove", "[--deferred] [-f|--force] [--retry] <device>...", 0, -1, 1, 0, _remove},
 	{"remove_all", "[-f|--force]", 0, 0, 0, 0, _remove_all},
 	{"suspend", "[--noflush] [--nolockfs] <device>...", 0, -1, 1, 0, _suspend},
@@ -6004,6 +6125,7 @@ static void _dmsetup_usage(FILE *out)
 	fprintf(out, "<mangling_mode> is one of 'none', 'auto' and 'hex'.\n");
 	fprintf(out, "<fields> are comma-separated.  Use 'help -c' for list.\n");
 	fprintf(out, "Table_file contents may be supplied on stdin.\n");
+	fprintf(out, "Multi_dev_info_file contents may be supplied on stdin.\n");
 	fprintf(out, "Options are: devno, devname, blkdevname.\n");
 	fprintf(out, "Tree specific options are: ascii, utf, vt100; compact, inverted, notrunc;\n"
 		     "                           blkdevname, [no]device, active, open, rw and uuid.\n");
-- 
2.9.3
