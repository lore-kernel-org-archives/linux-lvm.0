From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Problems compiling userland LVM on sparc debian unstable
Message-ID: <20011112101323.G624@tykepenguin.com>
References: <E162MMe-0004br-00@brooks.homenet>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E162MMe-0004br-00@brooks.homenet>; from screechco@home.com on Fri, Nov 09, 2001 at 07:51:16PM -0500
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
Date: Mon Nov 12 04:12:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Nov 09, 2001 at 07:51:16PM -0500, Chris Danis wrote:
> 
> Hello all,
> 
> I'm running Debian unstable on a Sparcstation 20. I've managed to
> patch the kernel (2.4.14) fine, but I can't seem to get the userspace
> tools to compile. There seems to be some kind of conflict with the
> headers, but not knowing much C, I'm a bit at a loss for what is going
> on.
> 
> /usr/include/asm-sparc/signal.h:112: conflicting types for `sigset_t'
> /usr/include/sys/select.h:38: previous declaration of `sigset_t'

Argh. This is because lvm.h pulls in kernel header files when compiling
user-mode programs, which it really shouldn't.

The following patch should make it compile OK (it works on my SPARC machine
running woody) even though it's more than a little naff!

Index: lvm.h
===================================================================
RCS file: /cvs/LVM/kernel/lvm.h,v
retrieving revision 1.35
diff -u -r1.35 lvm.h
--- lvm.h       2001/11/02 02:11:43     1.35
+++ lvm.h       2001/11/12 10:00:52
@@ -112,7 +112,9 @@
 #else
 #define __KERNEL__
 #include <linux/kdev_t.h>
-#include <linux/list.h>
+struct list_head {
+        struct list_head *next, *prev;
+};
 #undef __KERNEL__
 #endif                         /* #ifndef __KERNEL__ */
 


patrick
