Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6BM044L025979
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 11 Jul 2016 18:00:04 -0400
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [148.251.109.235])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 985E9CF61F
	for <linux-lvm@redhat.com>; Mon, 11 Jul 2016 22:00:03 +0000 (UTC)
From: Christian Hesse <list@eworm.de>
Date: Mon, 11 Jul 2016 23:48:47 +0200
Message-Id: <20160711214847.563-1-list@eworm.de>
Subject: [linux-lvm] [PATCH 1/1] libdaemon: do not print error if there is
	non
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Christian Hesse <mail@eworm.de>

From: Christian Hesse <mail@eworm.de>

accept() returns EAGAIN if no connections are present to be accepted.
That's not an error, so do not print error if there is non.

Signed-off-by: Christian Hesse <mail@eworm.de>
---
 libdaemon/server/daemon-server.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/libdaemon/server/daemon-server.c b/libdaemon/server/daemon-server.c
index 7911dd6..6de545e 100644
--- a/libdaemon/server/daemon-server.c
+++ b/libdaemon/server/daemon-server.c
@@ -491,7 +491,8 @@ static int handle_connect(daemon_state s)
 
 	client.socket_fd = accept(s.socket_fd, (struct sockaddr *) &sockaddr, &sl);
 	if (client.socket_fd < 0) {
-		ERROR(&s, "Failed to accept connection.");
+		if (errno != EAGAIN && (EWOULDBLOCK != EAGAIN && errno != EWOULDBLOCK))
+			ERROR(&s, "Failed to accept connection.");
 		return 0;
 	}
 
-- 
2.9.0
