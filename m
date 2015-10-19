Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t9JJ64nR021920
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2015 15:06:04 -0400
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mx1.redhat.com (Postfix) with ESMTPS id 8E66AC000082
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2015 19:06:02 +0000 (UTC)
Received: by pasz6 with SMTP id z6so38030230pas.2
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2015 12:06:02 -0700 (PDT)
From: Tomohiro Kusumi <kusumi.tomohiro@gmail.com>
Date: Tue, 20 Oct 2015 04:16:08 +0900
Message-Id: <1445282168-17413-1-git-send-email-kusumi.tomohiro@gmail.com>
Subject: [linux-lvm] [PATCH] man dmsetup: Add missing lines for dmsetup info
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
Cc: Tomohiro Kusumi <kusumi.tomohiro@gmail.com>

---
 man/dmsetup.8.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/man/dmsetup.8.in b/man/dmsetup.8.in
index 183f4fc..3722a10 100644
--- a/man/dmsetup.8.in
+++ b/man/dmsetup.8.in
@@ -640,7 +640,9 @@ the list of report fields.
 Outputs some brief information about the device in the form:
 .RS
 .RS
+ Device name
  State: SUSPENDED|ACTIVE, READ-ONLY
+ Read Ahead count
  Tables present: LIVE and/or INACTIVE
  Open reference count
  Last event sequence number (used by \fBwait\fP)
-- 
1.7.1
