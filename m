Return-Path: <jweber@valinux.com>
Date: Fri, 19 Jan 2001 09:26:55 -0800 (PST)
From: Jay Weber <jweber@valinux.com>
Message-ID: <Pine.LNX.4.30.0101190924390.28951-100000@beefcake.hdqt.valinux.com>
MIME-Version: 1.0
Subject: [linux-lvm] [lvm-devel] Propose a patch. (fwd) -- Patch for loopback devices.
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

This is for those asking about loopback devices and below is a patch which
I use to allow scanning of loopback devices on 2.2 based kernel (I've no
idea if 2.4 differs, I wouldn't think so).  Enjoy!

Patch the lvm tools appropriately and then
'export LVM_FORCE_DEV_SCAN=1' in your shell to enable forcing LVM scan of
/dev dir.

---------- Forwarded message ----------
Date: Sun, 14 Jan 2001 16:36:31 -0800 (PST)
From: Jay Weber <jweber@valinux.com>
Reply-To: lvm-devel@sistina.com
To: lvm-devel@sistina.com
Subject: [lvm-devel] Propose a patch.

Hi,

I'd like to propose the following patch which addresses an issue in
lvm_dir_cache.c which scans /proc/partitions.  This helps when using
loopback devices (which aren't populated in /proc/partitions) and if
/proc/partitions contains an entry the /dev scan will not be performed,
hence, I'll never see my loopback device.

This also has solved my problems of having an empty /proc/partitions
which would cause me to never see my Mylex Raid controller during a RedHat
install which I setup LVM devices in.

Thanks.

Index: tools/lib/lvm_dir_cache.c
===================================================================
RCS file: /data/cvs/LVM/tools/lib/lvm_dir_cache.c,v
retrieving revision 1.4.2.2
diff -u -r1.4.2.2 lvm_dir_cache.c
--- tools/lib/lvm_dir_cache.c	2001/01/05 11:46:14	1.4.2.2
+++ tools/lib/lvm_dir_cache.c	2001/01/15 00:28:28
@@ -62,6 +62,7 @@
    char minor[20] = { 0, };
    char blocks[20] = { 0, };
    char devname[30] = { 0, };
+   char *envptr = NULL;
    static char *devdir[] = {
       "/dev/ida",
       "/dev/ide/hd",
@@ -96,7 +97,8 @@
       }
       fclose ( proc);
    }
-   if ( cache_size == 0 && lvm_check_devfs() == FALSE) {
+   if ( (cache_size == 0 && lvm_check_devfs() == FALSE)
+    || (envptr = getenv("LVM_FORCE_DEV_SCAN")) != NULL ) {
       for ( d = 0; devdir[d] != NULL; d++) {
          dirname = devdir[d];
 #ifdef DEBUG
Index: tools/man8/lvm.8
===================================================================
RCS file: /data/cvs/LVM/tools/man8/lvm.8,v
retrieving revision 1.2
diff -u -r1.2 lvm.8
--- tools/man8/lvm.8	2000/11/13 00:20:14	1.2
+++ tools/man8/lvm.8	2001/01/15 00:28:28
@@ -179,6 +179,15 @@

 Now let's rock and roll.
 For example create a file system with "mkfs -t ext2 /dev/test_vg/my_test_lv" and mount it with "mount /dev/test_vg/my_test_lv /usr1"
+.SH ENVIRONMENT VARIABLES
+.TP
+\fBLVM_FORCE_DEV_SCAN\fP
+If this variable is set (to any value) it will force LVM to scan the /dev
+directory to search for devices.  This is useful at times, for instance when
+using loop devices which do not register in /proc/partitions or when installing
+LVM during a Linux Installation procedure which may have an empty
+/proc/partitions.
+
 .SH See also
 e2fsadm(8), lvchange(8), lvcreate(8), lvdisplay(8),
 .br

_______________________________________________
lvm-devel mailing list
lvm-devel@sistina.com
http://lists.sistina.com/mailman/listinfo/lvm-devel
