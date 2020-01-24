From: Todd Gill <tgill@redhat.com>
Date: Fri, 24 Jan 2020 14:58:29 -0500
Message-Id: <20200124195830.6720-2-tgill@redhat.com>
In-Reply-To: <20200124195830.6720-1-tgill@redhat.com>
References: <20200124195830.6720-1-tgill@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] [PATCH 1/2] Add JSON output support to dmstats for list
	and report subcommands
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com
Cc: tgill@redhat.com

Reuse the dm_report_group[create|push|destroy] framework to create a JSON
formatted output.

Signed-off-by: Todd Gill <tgill@redhat.com>
---
 libdm/dm-tools/dmsetup.c | 45 +++++++++++++++++++++++++++++++++-------
 1 file changed, 37 insertions(+), 8 deletions(-)

diff --git a/libdm/dm-tools/dmsetup.c b/libdm/dm-tools/dmsetup.c
index 269f86c9b..cab0c85c8 100644
--- a/libdm/dm-tools/dmsetup.c
+++ b/libdm/dm-tools/dmsetup.c
@@ -182,6 +182,7 @@ enum {
 	HISTOGRAM_ARG,
 	INACTIVE_ARG,
 	INTERVAL_ARG,
+	REPORT_FORMAT_ARG,
 	LENGTH_ARG,
 	MANGLENAME_ARG,
 	MAJOR_ARG,
@@ -6153,7 +6154,7 @@ static int _stats_help(CMD_ARGS);
  *       [--units <u>] [--programid <id>] [--regionid <id>]
  *       [-o <fields>] [-O|--sort <sort_fields>]
  *       [-S|--select <selection>] [--nameprefixes]
- *       [--noheadings] [--separator <separator>]
+ *       [--reportformat basic|json] [--noheadings] [--separator <separator>]
  *       [--allprograms|--programid id] [<device>...]
  *   ungroup --groupid <id> [--allprograms|--programid id]
  *       [--alldevices|<device>...]
@@ -6177,12 +6178,12 @@ static int _stats_help(CMD_ARGS);
 #define ALL_PROGS_REGIONS_DEVICES ALL_PROGS_OPT INDENT ALL_REGIONS_OPT INDENT ALL_DEVICES_OPT
 #define FIELD_OPTS "[-o <fields>] [-O|--sort <sort_fields>]"
 #define DM_REPORT_OPTS FIELD_OPTS INDENT "[-S|--select <selection>] [--nameprefixes]" INDENT \
-"[--noheadings] [--separator <separator>]"
+"[--noheadings] [--reportformat basic|json] [--separator <separator>]"
 
 /* command options */
 #define CREATE_OPTS REGION_OPTS INDENT ID_OPTS INDENT EXTRA_OPTS INDENT SEGMENTS_OPT
 #define FILEMAP_OPTS "--filemap [--nogroup] " FILE_MONITOR_OPTS INDENT ID_OPTS INDENT EXTRA_OPTS
-#define PRINT_OPTS "[--clear] " ALL_PROGS_REGIONS_DEVICES
+#define PRINT_OPTS "[--clear] [--reportformat basic|json]" ALL_PROGS_REGIONS_DEVICES
 #define REPORT_OPTS "[--interval <seconds>] [--count <cnt>]" INDENT \
 "[--units <u>] " SELECT_OPTS INDENT DM_REPORT_OPTS INDENT ALL_PROGS_OPT
 #define GROUP_OPTS "[--alias NAME] --regions <regions>" INDENT ALL_PROGS_OPT ALL_DEVICES_OPT
@@ -6875,6 +6876,7 @@ static int _process_switches(int *argcp, char ***argvp, const char *dev_dir)
 		{"regions", 1, &ind, REGIONS_ARG},
 		{"regionid", 1, &ind, REGION_ID_ARG},
 		{"relative", 0, &ind, RELATIVE_ARG},
+		{"reportformat", 1, &ind, REPORT_FORMAT_ARG},
 		{"retry", 0, &ind, RETRY_ARG},
 		{"rows", 0, &ind, ROWS_ARG},
 		{"segments", 0, &ind, SEGMENTS_ARG},
@@ -7164,6 +7166,17 @@ static int _process_switches(int *argcp, char ***argvp, const char *dev_dir)
 				return 0;
 			}
 		}
+		if (ind == REPORT_FORMAT_ARG) {
+			_switches[REPORT_FORMAT_ARG]++;
+			if (!strcasecmp(optarg, "basic"))
+				_int_args[REPORT_FORMAT_ARG] = DM_REPORT_GROUP_BASIC;
+			else if (!strcasecmp(optarg, "json"))
+				_int_args[REPORT_FORMAT_ARG] = DM_REPORT_GROUP_JSON;
+			else {
+				log_error("Unknown report format.");
+				return 0;
+			}
+		}
 		if (ind == MANGLENAME_ARG) {
 			_switches[MANGLENAME_ARG]++;
 			if (!strcasecmp(optarg, "none"))
@@ -7307,6 +7320,7 @@ int main(int argc, char **argv)
 	const struct command *cmd;
 	const char *subcommand = "";
 	int multiple_devices;
+	struct dm_report_group *new_report_group = NULL;
 
 	(void) setlocale(LC_ALL, "");
 
@@ -7455,11 +7469,26 @@ doit:
 			fflush(stdout);
 		}
 		if (_report) {
-			/* only output headings for repeating reports */
-			if (_int_args[COUNT_ARG] != 1 && !dm_report_is_empty(_report))
-				dm_report_column_headings(_report);
-			dm_report_output(_report);
-
+			if (_switches[REPORT_FORMAT_ARG] &&
+			    _int_args[REPORT_FORMAT_ARG] == DM_REPORT_GROUP_JSON  && 
+			    strcmp(cmd->name, "stats") == 0) {
+				if (!(new_report_group = dm_report_group_create(DM_REPORT_GROUP_JSON, NULL))) {
+						log_error("Failed to create stats report group.");
+						return 0;
+				}
+				if (!(dm_report_group_push(new_report_group, _report, (void *) subcommand))) {
+						log_error("Failed to add stats report to report group.");
+						return 0;
+				}
+				dm_report_output(_report);
+				if (!dm_report_group_destroy(new_report_group))
+						return 0;
+			} else {
+				/* only output headings for repeating reports */
+				if (_int_args[COUNT_ARG] != 1 && !dm_report_is_empty(_report))
+					dm_report_column_headings(_report);
+				dm_report_output(_report);
+			}
 			if (_count > 1 && r) {
 				putchar('\n');
 				fflush(stdout);
-- 
2.21.1
