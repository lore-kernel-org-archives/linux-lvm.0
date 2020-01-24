From: Todd Gill <tgill@redhat.com>
Date: Fri, 24 Jan 2020 14:58:30 -0500
Message-Id: <20200124195830.6720-3-tgill@redhat.com>
In-Reply-To: <20200124195830.6720-1-tgill@redhat.com>
References: <20200124195830.6720-1-tgill@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] [PATCH 2/2] Update man page to include --reportformat
	for list and report subcommands
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

Add text to explain the use of new --reportformat option.

Signed-off-by: Todd Gill <tgill@redhat.com>
---
 man/dmstats.8_main | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/man/dmstats.8_main b/man/dmstats.8_main
index da9d93490..81bd2408d 100644
--- a/man/dmstats.8_main
+++ b/man/dmstats.8_main
@@ -156,6 +156,8 @@ dmstats \(em device-mapper statistics management
 .  RB [ --units
 .  IR units ]
 .  OPT_OBJECTS
+.  RB [ --reportformat
+.  IR basic | json  ]
 .  RB \%[ --nosuffix ]
 .  RB [ --notimesuffix ]
 .  RB \%[ -v | --verbose]
@@ -192,6 +194,8 @@ dmstats \(em device-mapper statistics management
 .  OPT_PROGRAMS
 .  OPT_REGIONS
 .  OPT_OBJECTS
+.  RB [ --reportformat
+.  IR basic | json ]
 .  RB [ -O | --sort
 .  IR sort_fields ]
 .  RB [ -S | --select
@@ -506,6 +510,13 @@ If displaying the histogram report show relative (percentage) values
 instead of absolute counts.
 .
 .HP
+.BR \-\-reportformat
+.RB [ basic | json ]
+.br
+Specify the output format for list and report subcommands. The \fBjson\fP
+option produces report output in JSON format.
+.
+.HP
 .BR -S | --select
 .IR selection
 .br
-- 
2.21.1
