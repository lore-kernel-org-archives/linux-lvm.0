From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Date: Tue,  9 May 2017 17:48:21 +0200
Message-Id: <20170509154822.13396-2-enric.balletbo@collabora.com>
In-Reply-To: <20170509154822.13396-1-enric.balletbo@collabora.com>
References: <20170509154822.13396-1-enric.balletbo@collabora.com>
Subject: [linux-lvm] [PATCH 1/2] dmsetup: add support to output devices in
	bootformat style
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

Add a new parameter to be able to output the bootformat of one or more
devices. The bootformat for a device can be obtained by doing a:

 dmsetup table <device...> --bootformat

where device can be a specific device, a list of the devices or empty
for all devices. The output will look like this:

 <dev_name>,<uuid>,<mode>,<table>[,<table>+][;<dev_name>,<uuid>,<mode>,<table>[,<table>+]]+

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 tools/dmsetup.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/tools/dmsetup.c b/tools/dmsetup.c
index 5c5c14c..fc99145 100644
--- a/tools/dmsetup.c
+++ b/tools/dmsetup.c
@@ -163,6 +163,7 @@ enum {
 	AREA_ARG,
 	AREAS_ARG,
 	AREA_SIZE_ARG,
+	BOOTFORMAT_ARG,
 	BOUNDS_ARG,
 	CHECKS_ARG,
 	CLEAR_ARG,
@@ -2127,6 +2128,9 @@ static int _status(CMD_ARGS)
 	int matched = 0;
 	int ls_only = 0;
 	struct dm_info info;
+	const char *uuid = NULL;
+	char bootstr[LINE_SIZE] = {0};
+	int len;
 
 	if (names)
 		name = names->name;
@@ -2171,6 +2175,9 @@ static int _status(CMD_ARGS)
 	if (!name)
 		name = dm_task_get_name(dmt);
 
+	if (!uuid)
+		uuid = dm_task_get_uuid(dmt);
+
 	/* Fetch targets and print 'em */
 	do {
 		next = dm_get_next_target(dmt, next, &start, &length,
@@ -2184,6 +2191,20 @@ static int _status(CMD_ARGS)
 			    _switches[VERBOSE_ARG])
 				_display_dev(dmt, name);
 			next = NULL;
+		} else if (_switches[BOOTFORMAT_ARG]) {
+			if (!dm_snprintf(bootstr, sizeof(bootstr), "%s,%s,%s",
+					 dm_task_get_name(dmt), uuid,
+					 info.read_only ? "ro" : "rw"))
+				goto_out;
+			if (target_type) {
+				len = strlen(bootstr);
+				if (!dm_snprintf(bootstr + len,
+						 sizeof(bootstr) - len,
+						 "," FMTu64 " " FMTu64 " %s %s",
+						 start, length, target_type,
+						 params))
+					goto_out;
+			}
 		} else if (!_switches[EXEC_ARG] || !_command_to_exec ||
 			   _switches[VERBOSE_ARG]) {
 			if (!matched && _switches[VERBOSE_ARG])
@@ -2218,6 +2239,9 @@ static int _status(CMD_ARGS)
 		matched = 1;
 	} while (next);
 
+	if (matched && _switches[BOOTFORMAT_ARG])
+		printf("%s;", bootstr);
+
 	if (multiple_devices && _switches[VERBOSE_ARG] && matched && !ls_only)
 		putchar('\n');
 
@@ -5903,7 +5927,9 @@ static struct command _dmsetup_commands[] = {
 	{"deps", "[-o <options>] [<device>...]", 0, -1, 1, 0, _deps},
 	{"stats", "<command> [<options>] [<device>...]", 1, -1, 1, 1, _stats},
 	{"status", "[<device>...] [--noflush] [--target <target_type>]", 0, -1, 1, 0, _status},
-	{"table", "[<device>...] [--target <target_type>] [--showkeys]", 0, -1, 1, 0, _status},
+	{"table", "[<device>...]\n"
+	   "\t    [--target <target_type>] [--showkeys]\n"
+	   "\t    [--bootformat]", 0, -1, 1, 0, _status},
 	{"wait", "<device> [<event_nr>] [--noflush]", 0, 2, 0, 0, _wait},
 	{"mknodes", "[<device>...]", 0, -1, 1, 0, _mknodes},
 	{"mangle", "[<device>...]", 0, -1, 1, 0, _mangle},
@@ -6468,6 +6494,7 @@ static int _process_switches(int *argcp, char ***argvp, const char *dev_dir)
 		{"area", 0, &ind, AREA_ARG},
 		{"areas", 1, &ind, AREAS_ARG},
 		{"areasize", 1, &ind, AREA_SIZE_ARG},
+		{"bootformat", 0, &ind, BOOTFORMAT_ARG},
 		{"bounds", 1, &ind, BOUNDS_ARG},
 		{"checks", 0, &ind, CHECKS_ARG},
 		{"clear", 0, &ind, CLEAR_ARG},
@@ -6636,6 +6663,8 @@ static int _process_switches(int *argcp, char ***argvp, const char *dev_dir)
 			return_0;
 		if (c == 'h' || ind == HELP_ARG)
 			_switches[HELP_ARG]++;
+		if (ind == BOOTFORMAT_ARG)
+			_switches[BOOTFORMAT_ARG]++;
 		if (ind == BOUNDS_ARG) {
 			_switches[BOUNDS_ARG]++;
 			_string_args[BOUNDS_ARG] = optarg;
-- 
2.9.3
