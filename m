From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Message-Id: <20020220115457.A6628@sistina.com>
MIME-Version: 1.0
Subject: [linux-lvm] pvmove bug with large PE numbers
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
Date: Wed Feb 20 04:58:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Have overlooked a wrong llseek64 cast in yesterdays LVM 1.0.3 release,
which prevents pvmove to move PEs bejond 2GB offsets :-(

Sorry for any inconvenience.


Following patch against a clean 1.0.3 source fixes it:

diff -u -B -r1.43 -r1.44
--- LVM/tools/lib/liblvm.h      18 Feb 2002 16:37:18 -0000      1.43
+++ LVM/tools/lib/liblvm.h      20 Feb 2002 10:49:14 -0000      1.44
@@ -93,10 +93,10 @@
 #include <time.h>
 #include <limits.h>
 #ifdef _G_LSEEK64
-int lseek64 ( unsigned int, unsigned long long, unsigned int);
+loff_t lseek64 ( int, loff_t, int);
 #define llseek lseek64
 #else
-int llseek ( unsigned int, unsigned long long, unsigned int);
+loff_t llseek ( int, loff_t, int);
 #endif

 #include <sys/ioctl.h>
@@ -130,7 +130,7 @@
 #define        LVMTAB                  "/etc/lvmtab"   /* LVM table of VGs */
 #define        LVMTAB_DIR              "/etc/lvmtab.d" /* storage dir VG data */
 #define        LVMTAB_MINSIZE   ( sizeof ( vg_t) + sizeof ( lv_t) + sizeof ( pv_t))
-#define        LVM_DEV                 "/dev/lvm"
+#define        LVM_DEV                 LVM_DIR_PREFIX "lvm"
 #define        VG_BACKUP_DIR           "/etc/lvmconf"
 #define        DISK_NAME_LEN           8
 #define        LV_MIN_NAME_LEN         5

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
