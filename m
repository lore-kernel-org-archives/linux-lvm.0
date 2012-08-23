Received: from t500.com (vpn1-7-250.ams2.redhat.com [10.36.7.250])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q7NDV6Q1012313
	for <linux-lvm@redhat.com>; Thu, 23 Aug 2012 09:31:07 -0400
From: Matthew Booth <mbooth@redhat.com>
Date: Thu, 23 Aug 2012 14:31:02 +0100
Message-Id: <1345728662-28052-1-git-send-email-mbooth@redhat.com>
Subject: [linux-lvm] [PATCH] dmsetup: fix sscanf return check
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
To: linux-lvm@redhat.com

---
 tools/dmsetup.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/dmsetup.c b/tools/dmsetup.c
index 0ac970f..65d17f8 100644
--- a/tools/dmsetup.c
+++ b/tools/dmsetup.c
@@ -228,8 +228,7 @@ static int _parse_line(struct dm_task *dmt, char *buffer, const char *file,
 	if (!*ptr || *ptr == '#')
 		return 1;
 
-	if (sscanf(ptr, "%llu %llu %s %n",
-		   &start, &size, ttype, &n) < 3) {
+	if (sscanf(ptr, "%llu %llu %s %n", &start, &size, ttype, &n) != 4) {
 		err("Invalid format on line %d of table %s", line, file);
 		return 0;
 	}
-- 
1.7.11.4
