Date: Thu, 18 Feb 1999 02:10:44 -0600 (CST)
From: Shawn Leas <sleas@ixion.honeywell.com>
Subject: Re: [linux-lvm] Problems on compile
In-Reply-To: <Pine.GSO.3.96.990218002100.11391B-100000@eesnop1.ews.uiuc.edu>
Message-Id: <Pine.GHP.4.05.9902180207500.11349-100000@ixion.honeywell.com>
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Stamborski <cstambor@uiuc.edu>
Cc: linux-lvm@msede.com

Ok, it seems it is fixed by re-arranging liblvm.h a little. Heinz sent me
this a while back.

I suspect this was your problem as well.

--- 0.5alpha/tools/lib/liblvm.h Sat Jan 30 13:46:35 1999
+++ 0.6alpha/tools/lib/liblvm.h Mon Feb  1 00:54:29 1999
@@ -46,10 +46,6 @@
 #  endif
 #endif

-#include <sys/ioctl.h>
-#include <linux/genhd.h>
-#include <linux/major.h>
-
 #if __GLIBC__ > 1
 #  ifndef uint8_t
 #    define uint8_t    u_int8_t
@@ -97,6 +93,10 @@
 #  include <malloc.h>
 #  include <stdio.h>
 #endif /* __GLIBC__ > 1 */
+
+#include <sys/ioctl.h>
+#include <linux/genhd.h>
+#include <linux/major.h>

 #include <lvm.h>

-Shawn
<=========== America Held Hostage ===========>
   Day 2220 for the poor and the middle class. 
   Day 2239 for the rich and the dead.
   702 days remaining in the Raw Deal.
<============================================> 
