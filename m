From: Jesse Sipprell <jss@evcom.net>
Date: Fri, 14 Sep 2001 23:55:17 -0400
Message-ID: <20010914235517.A31653@kevorkian.evcom.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] dac960+2.2.19 issue with 1.0.1-rc2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

It appears that rc2 consults /proc/devices when determining the block type of
a device in lvm_get_device_type().  The device_names[] array in this function
indicates that the device name for a mylex dac960 array controller should be 
"dac960", however under 2.2.19, /proc/devices indicates that the "name" for 
major device 48 is "rd" and not "dac960". 

I'm assuming that the code was based on a 2.4 kernel, however I don't have a 
2.4 box handy that has dac960 support compiled in, so I cannot verify this.

The end result is that PV operations cannot be performed on a dac960 device; 
tools typically emit "invalid physical volume name".

The following patch addresses the issue although, as should be obvious from
above, I have in no way verified this under kernels > 2.2.19.

--- LVM/1.0.1-rc2/tools/lib/lvm_check_partitioned_dev.c.orig	Fri Sep 14 23:43:56 2001
+++ LVM/1.0.1-rc2/tools/lib/lvm_check_partitioned_dev.c	Fri Sep 14 23:45:54 2001
@@ -134,7 +134,11 @@
 	"md",			/* Multiple Disk driver (SoftRAID)   */
 	"loop",			/* Loop device              */
 	"dasd",			/* DASD disk (IBM S/390, zSeries)      */
+#if LINUX_VERSION_CODE < KERNEL_VERSION(2, 3, 0)
+	"rd",
+#else  /* kernel > 2.2.x */
 	"dac960",		/* DAC960              */
+#endif 
 	"nbd",			/* Network Block Device              */
 	"ida",			/* Compaq SMART2              */
 	"cciss",		/* Compaq CCISS array              */


-- 
Jesse Sipprell
Technical Operations Director
Evolution Communications, Inc.
800.496.4736

* Finger jss@evcom.net for my PGP Public Key *
