Date: Thu, 30 Aug 2001 09:08:48 +0200
From: Christoph Hellwig <hch@caldera.de>
Subject: Re: [linux-lvm] A Caldera related bug?
Message-ID: <20010830090848.A27345@caldera.de>
References: <OF8D6ACD21.34A36C6E-ON87256AB7.007C475A@sc.blm.gov>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OF8D6ACD21.34A36C6E-ON87256AB7.007C475A@sc.blm.gov>; from dan_mcmanus@co.blm.gov on Wed, Aug 29, 2001 at 05:04:01PM -0600
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

On Wed, Aug 29, 2001 at 05:04:01PM -0600, dan_mcmanus@co.blm.gov wrote:
> Hello,
> 
> First off, if I'm not supposed to send this to you, I apologize. I am
> running Caldera Openlinux workstation 3.1 with a kernel of 2.4.8 that has
> LVM support enabled. My computer is a gateway 4200 Pentium II, if you care
> about that. I tried this with lvm 1.0.1-rc1, 1.0, and 0.9, following the
> instructions faithfully. What happens is I type "make" (after having typed
> "./configure", of course) and this same error happens in each case:

This is because LVM is _completly_ broken by including kernel headers all
over theplace, and - even worse - sometimes even defining __KERNEL__ and
using kernel-only datatypes.

In fact any system using 2.4.2-ac and newer headers in /usr/include/linux
makes LVM fail this way.

I've attached the workaround I have in my RPM.

	Christoph

-- 
Of course it doesn't work. We've performed a software upgrade.

--- LVM/1.0.1-rc1/kernel/lvm.h~	Thu Aug 30 09:00:30 2001
+++ LVM/1.0.1-rc1/kernel/lvm.h	Thu Aug 30 09:02:47 2001
@@ -110,10 +110,7 @@
 #include <linux/kdev_t.h>
 #include <linux/list.h>
 #else
-#define __KERNEL__
 #include <linux/kdev_t.h>
-#include <linux/list.h>
-#undef __KERNEL__
 #endif				/* #ifndef __KERNEL__ */
 
 #include <asm/types.h>
@@ -420,7 +417,11 @@
 
 /* remap physical sector/rdev pairs including hash */
 typedef struct lv_block_exception_v1 {
+#ifdef __KERNEL__
 	struct list_head hash;
+#else
+	uint64_t hash;			/* XXX b0rken on 64bit plattforms */
+#endif
 	uint32_t rsector_org;
 	kdev_t   rdev_org;
 	uint32_t rsector_new;
