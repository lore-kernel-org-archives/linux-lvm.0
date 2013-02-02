Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r12GEpRb023691
	for <linux-lvm@redhat.com>; Sat, 2 Feb 2013 11:14:51 -0500
Received: from furnace.wzff.de (furnace.wzff.de [176.9.216.40])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r12GEnLd021545
	for <linux-lvm@redhat.com>; Sat, 2 Feb 2013 11:14:50 -0500
Received: from xdsl-188-155-204-150.adslplus.ch ([188.155.204.150]
	helo=[10.1.1.4])
	by furnace.wzff.de with esmtpsa (TLSv1:DHE-RSA-CAMELLIA256-SHA:256)
	(Exim 4.80.1 (FreeBSD)) (envelope-from <maillist-lvm@barfooze.de>)
	id 1U1fjq-0002kz-A5
	for linux-lvm@redhat.com; Sat, 02 Feb 2013 17:14:47 +0100
Message-ID: <510D3B57.3020607@barfooze.de>
Date: Sat, 02 Feb 2013 17:14:15 +0100
From: John Spencer <maillist-lvm@barfooze.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------070508090701040502020807"
Subject: [linux-lvm] [PATCH] fix missing include directives
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
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------070508090701040502020807
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

on glibc, those are erroneously (namespace pollution) pulled in via 
other headers. this doesn't work with conformant libcs (musl libc in 
this case), we simply need to include all needed headers.

Signed-Off-By: John Spencer <maillist-lvm@barfooze.de>

--------------070508090701040502020807
Content-Type: text/x-patch;
 name="lvm2-includes.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="lvm2-includes.patch"

--- a/libdm/mm/pool-fast.c	2012-11-24 19:05:17.413015858 +0100
+++ b/libdm/mm/pool-fast.c	2012-11-24 19:05:56.589926540 +0100
@@ -18,6 +18,7 @@
 #endif
 
 #include "dmlib.h"
+#include <stddef.h>
 #include <malloc.h>
 
 struct chunk {
--- a/daemons/dmeventd/dmeventd.c	2012-11-24 19:08:48.981918074 +0100
+++ b/daemons/dmeventd/dmeventd.c	2012-11-24 19:09:25.822750433 +0100
@@ -37,6 +37,7 @@
 #include <unistd.h>
 #include <signal.h>
 #include <arpa/inet.h>		/* for htonl, ntohl */
+#include <fcntl.h>
 
 #ifdef linux
 /*
--- a/scripts/lvm2_activation_generator_systemd_red_hat.c	2012-11-24 20:06:19.481792514 +0100
+++ b/scripts/lvm2_activation_generator_systemd_red_hat.c	2012-11-24 20:06:56.774634314 +0100
@@ -19,6 +19,7 @@
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
+#include <limits.h>		/* for PATH_MAX */
 #include "lvm2app.h"
 
 #define KMSG_DEV_PATH        "/dev/kmsg"

--------------070508090701040502020807--
