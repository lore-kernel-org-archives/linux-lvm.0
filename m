Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBGGRMr03519
	for <linux-lvm@redhat.com>; Thu, 16 Dec 2004 11:27:22 -0500
Received: from rbox2.erasmusmc.nl (rbox2.erasmusmc.nl [156.83.252.226])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iBGGRKJx007261
	for <linux-lvm@redhat.com>; Thu, 16 Dec 2004 11:27:21 -0500
Received: from localhost (localhost.erasmusmc.nl [127.0.0.1])
	by rbox2.erasmusmc.nl (Postfix) with ESMTP id B2CA3102C0D
	for <linux-lvm@redhat.com>; Thu, 16 Dec 2004 17:27:14 +0100 (CET)
Received: from rbox2.erasmusmc.nl ([127.0.0.1])
	by localhost (rbox2.erasmusmc.nl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 02786-01 for <linux-lvm@redhat.com>;
	Thu, 16 Dec 2004 17:27:14 +0100 (CET)
Received: from pc_jerome_2 (tch-239-37.pc.fgg.eur.nl [130.115.239.37])
	by rbox2.erasmusmc.nl (Postfix) with ESMTP id 46CE6102C01
	for <linux-lvm@redhat.com>; Thu, 16 Dec 2004 17:27:14 +0100 (CET)
From: "Jerome Borsboom" <j.borsboom@erasmusmc.nl>
Date: Thu, 16 Dec 2004 17:27:14 +0100
MIME-Version: 1.0
Message-ID: <41C1C572.15958.1B62373@localhost>
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Subject: [linux-lvm] [PATCH] cannot create PV on empty drive
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

While I was checking out LVM, I ran into a problem with the 
2.00.31 version of LVM2. When I tried to create a new PV on 
/dev/sdb, pvcreate failed and went into an infinite loop trying 
to close a file-descriptor. This only happened when no .cache 
file was present in /etc/lvm and only on /dev/sdb, i.e. 
/dev/sdb1 did work.

Some debugging showed that the culprit was the recent change to 
the dev_open_flags code. The problem seems to be the reopening 
of the fd in RW mode without closing the old RO one. The patch 
below solved the problem for me, but I did not give it very much 
testing. Hope this helps.

Greetz,

Jerome Borsboom


diff -ru LVM2.2.00.31/lib/device/dev-io.c LVM2.2.00.31.new/lib/device/dev-io.c
--- LVM2.2.00.31/lib/device/dev-io.c    2004-12-12 22:47:14.000000000 +0100
+++ LVM2.2.00.31.new/lib/device/dev-io.c        2004-12-16 17:03:09.503357553 +0100
@@ -292,6 +292,7 @@
 {
        struct stat buf;
        const char *name;
+       int old_open_count = 0;
 
        if (dev->fd >= 0) {
                if ((dev->flags & DEV_OPENED_RW) ||
@@ -299,12 +300,12 @@
                        dev->open_count++;
                        return 1;
                }
-
-               if (dev->open_count)
-                       log_debug("WARNING: %s already opened read-only",
-                                 dev_name(dev));
-               else
-                       dev_close_immediate(dev);
+               else {
+                       if (dev->open_count)
+                               log_debug("WARNING: %s already opened read-only",
+                                         dev_name(dev));
+                       old_open_count = dev->open_count;
+                       dev_close_immediate(dev); }
        }
 
        if (memlock())
@@ -340,7 +341,7 @@
                return 0;
        }
 
-       dev->open_count = 1;
+       dev->open_count = old_open_count + 1;
        dev->flags &= ~DEV_ACCESSED_W;
        if ((flags & O_ACCMODE) == O_RDWR)
                dev->flags |= DEV_OPENED_RW;
