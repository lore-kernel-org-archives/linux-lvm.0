Message-Id: <200003201642.RAA09501@e35.marxmeier.com>
Subject: Re: [linux-lvm] tools make error?
Date: Mon, 20 Mar 2000 17:42:24 MEZ
In-Reply-To: <Pine.OSF.4.02.10003201004080.477644-100000@ocean.tamu.edu>; from "Michael Bartosh" at Mar 20, 100 10:05 am
From: Michael Marxmeier <mike@msede.com>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bartosh@ocean.tamu.edu
Cc: mike@msede.com, linux-lvm@msede.com

> On Mon, 20 Mar 2000, Michael Marxmeier wrote:
> > > I have 0.8final compiled (w/ patch) into kernel, but am getting the
> > > following when I try to make the new tools. What's up?
> > 
> > Known problem.
> > 
> > You need to apply patch
> > patch-lvm_0.8final-2    - patch against LVM 0.8final user mode tools
> 
> Cool! Patch applied correctly. Still getting a different err though (see
> below)
> ...
> In file included from /root/LVM/0.8final/tools/lvm_user.h:44,
>                  from e2fsadm.c:45:
> /root/LVM/0.8final/tools/lib/liblvm.h:50: gnu/types.h: No such file or

Did you apply the patch correctly?
It should replace gnu/types.h with sys/types.h in lib/liblvm.h.

I just check the patch and it looks correct.

--- 0.8final/tools/lib/liblvm.h.orig    Tue Feb 22 03:51:00 2000
+++ 0.8final/tools/lib/liblvm.h Tue Feb 22 03:54:36 2000
@@ -47,7 +47,7 @@
 #  include <linux/version.h>
 #endif
 
-#include <gnu/types.h>
+#include <sys/types.h>
 
 #include <sys/stat.h>


Michael

--
Michael Marxmeier           Marxmeier Software AG
E-Mail: mike@msede.com      Besenbruchstrasse 9
Phone : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
