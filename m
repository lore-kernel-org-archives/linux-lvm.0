From: iafilius@xs4all.nl
Date: Tue, 21 Mar 2000 14:05:08 +0100 (CET)
Reply-To: Arjan Filius <iafilius@xs4all.nl>
Subject: [linux-lvm] [compile fix] linux-2.3.99-pre[23]* 
Message-ID: <Pine.LNX.4.21.0003211302510.21416-100000@sjoerd.sjoerdnet>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hello,

I noticed a change in patch-2.3.99-pre2 which prevents compiling.
./drivers/block/lvm.c:

@@ -931,8 +931,8 @@
                printk(KERN_DEBUG
                       "%s -- lvm_blk_ioctl -- BLKRAGET\n", lvm_name);
 #endif
-               copy_to_user((long *) arg, &lv_ptr->lv_read_ahead,
-                            sizeof(lv_ptr->lv_read_ahead));
+               if (put_user(lv->lv_read_ahead, (long *)arg))
+                       return -EFAULT;
                break;

I changed 
+               if (put_user(lv->lv_read_ahead, (long *)arg))
to
+               if (put_user(lv_ptr->lv_read_ahead, (long *)arg))


And now i've booted  linux-2.3.99-pre3-3 + patch-2.3.99-pre1-LVM-0.8final
+ lv/lv_ptr fix, and seems to work properly (almost anything on LV's) :)

Greatings,



Arjan Filius
mailto:iafilius@xs4all.nl
