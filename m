From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] How to build LVM2 tools for 2.6?
Message-ID: <20031223070013.GB20078@percy.comedia.it>
References: <000701c3c8b7$3190a800$c3507580@atdsputnik>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000701c3c8b7$3190a800$c3507580@atdsputnik>
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
Date: Tue Dec 23 01:01:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Dec 22, 2003 at 11:12:43AM -0700, Charles Martin wrote:
>I'm running Linux 2.6.0 on a system that
>started life as Red Hat 9. I want to install
>the LVM2 tools (v2.0.8) so that I can resurrect
>my LVM disks.
>
>When I attempt to build the tools (./configure; make install),
>device/dev-io.c fails to compile, due to a missing definition
>of BLKGETSIZE64. Clearly, the compile needs to be looking
>at the headers in the 2.6.0 tree.
>
try this patch i stole from fedora :)
or use their rpm
L.

--- LVM2.2.00.08/lib/device/dev-io.c.blksize64	2003-12-02 19:00:00.347446473 -0500
+++ LVM2.2.00.08/lib/device/dev-io.c	2003-12-02 19:00:42.450641542 -0500
@@ -23,6 +23,9 @@
 #  undef WUNTRACED		/* Avoid redefinition */
 #  include <linux/fs.h>		/* For block ioctl definitions */
 #  define BLKSIZE_SHIFT SECTOR_SHIFT
+#ifndef BLKGETSIZE64
+#  define BLKGETSIZE64 _IOR(0x12,114,size_t)
+#endif /* BLKGETSIZE64 */
 #else
 #  include <sys/disk.h>
 #  define BLKBSZGET DKIOCGETBLOCKSIZE

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
