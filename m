Message-ID: <37026B61.F8064BFA@msede.com>
Date: Wed, 31 Mar 1999 20:37:21 +0200
From: Michael Marxmeier <mike@msede.com>
MIME-Version: 1.0
Subject: [linux-lvm] lvm_proc_get_info()
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

There is a minor problem in lvm.c / lvm_proc_get_info()

lvm_proc_get_info() returns -1 on EOF which results in a bogus EPERM 
returned to user mode. Try a cat /proc/lvm to see the effect.
Returning 0 should indicate the EOF condition.

Trivial patch against 0.6 is below. Obviously this also needs to
be applied against linux/drivers/block/lvm.c


Michael


--- /usr/src/LVM/0.6/kernel/lvm.c       Fri Feb 26 01:46:28 1999
+++ lvm.c       Wed Mar 31 10:28:30 1999
@@ -1675,7 +1675,7 @@
    if ( pos > sz - 1) {
       vfree ( buf);
       buf = NULL;
-      return -1;
+      return 0;
    }
 
    *start = &buf[pos];

-- 
Michael Marxmeier           Marxmeier Software GmbH
E-Mail: mike@msede.com      Besenbruchstrasse 9
Voice : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
