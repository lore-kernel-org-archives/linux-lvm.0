Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r7EIcegT016670
	for <linux-lvm@redhat.com>; Wed, 14 Aug 2013 14:38:40 -0400
Received: from infra.in.zekjur.net (infra.in.zekjur.net [79.140.39.194])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r7EIccma011337
	for <linux-lvm@redhat.com>; Wed, 14 Aug 2013 14:38:38 -0400
Received: from midna.zekjur.net (unknown [213.144.156.149])
	by infra.in.zekjur.net (Postfix) with ESMTPSA id A84884F3D3
	for <linux-lvm@redhat.com>; Wed, 14 Aug 2013 20:38:36 +0200 (CEST)
From: Michael Stapelberg <stapelberg@debian.org>
Date: Wed, 14 Aug 2013 20:38:36 +0200
Message-ID: <x6zjski0cz.fsf@midna.lan>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Subject: [linux-lvm] [PATCH] Use LVM_PATH instead of hard-coded /usr/sbin/lvm
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

--=-=-=
Content-Type: text/plain

Hi,

I noticed that the systemd generator hardcodes /usr/sbin/lvm.

Attached you can find a patch which fixes the issue. Please merge it or
fix the issue in a different way if you prefer :). Thanks!

-- 
Best regards,
Michael

--=-=-=
Content-Type: text/x-diff
Content-Disposition: attachment; filename=lvm_path.patch

Description: Use LVM_PATH instead of hard-coded /usr/sbin/lvm
Author: Michael Stapelberg <stapelberg@debian.org>
Last-Update: 2013-08-14

---

Index: lvm2-2.02.98/scripts/lvm2_activation_generator_systemd_red_hat.c
===================================================================
--- lvm2-2.02.98.orig/scripts/lvm2_activation_generator_systemd_red_hat.c	2013-08-14 18:44:12.005448150 +0200
+++ lvm2-2.02.98/scripts/lvm2_activation_generator_systemd_red_hat.c	2013-08-14 18:52:14.403183063 +0200
@@ -20,6 +20,7 @@
 #include <sys/stat.h>
 #include <fcntl.h>
 #include "lvm2app.h"
+#include "lib.h" /* for LVM_PATH */
 
 #define KMSG_DEV_PATH        "/dev/kmsg"
 #define LVM_CONF_USE_LVMETAD "global/use_lvmetad"
@@ -125,7 +126,7 @@
 	fputs("Before=local-fs.target shutdown.target\n"
 	      "Wants=systemd-udev-settle.service\n\n"
 	      "[Service]\n"
-	      "ExecStart=/usr/sbin/lvm vgchange -aay --sysinit\n"
+	      "ExecStart=" LVM_PATH " vgchange -aay --sysinit\n"
 	      "Type=oneshot\n", f);
 
 	if (fclose(f) < 0) {

--=-=-=--
