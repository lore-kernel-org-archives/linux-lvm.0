From: Jason L Tibbitts III <tibbs@math.uh.edu>
Date: 18 Oct 2001 10:11:24 -0500
Message-ID: <ufazo6pq8yr.fsf@epithumia.math.uh.edu>
MIME-Version: 1.0
Subject: [linux-lvm] LVM 1.0.1_rc4 with 2.4.12-ac3?
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

Simply, does anyone have a recent LVM patchset that works on 2.4.12-ac3?

The details:

I'm currently running 2.4.7 + Red Hat patches (from their 2.4.7-10 RPM) +
LVM 1.0.1_rc4.  Everything works, but VM performance is horrendous.  (The
machine has 2GB of RAM and 700GB of disk and kswapd consumes 100% of the
CPU for long periods of time.)  So I'd like to move to a newer kernel.

I've heard that the recent ac kernels have up-to-date LVM, but lvm.h says:

#define LVM_RELEASE_NAME "LVM 0.9.1_beta7(ish)"
#define LVM_RELEASE_DATE "20 June 2001"

which doesn't look up-to-date to me.  I'm afraid of going backwards
(especially since the machine is already running the 1.0.1_rc4 tools) so
I'm afraid to downgrade to that version.

A naive application of the rc4 generated patch works (outside of the usual
reject for drivers/md/Makefile and the fact that lvm-snap.c is already
gone) but the resulting module has unresolved symbols:

depmod: *** Unresolved symbols in /lib/modules/2.4.12-ac3/kernel/drivers/md/lvm-mod.o
depmod:         alloc_kiovec
depmod:         gendisk_head
depmod:         free_kiovec

gendisk handling has been simplified in newer kernels and the kiovec
functions have changed names and sprouted another argument.  Examining the
patch shows that it backs out code in ac3that deals with these changes.  I could
probably do a merge, but I'm new to this level of kernel hacking and don't
want to destroy my data.

Thanks for any advice,
-- 
Jason L Tibbitts III - tibbs@math.uh.edu - 713/743-3486 - 660PGH - 94 PC800
     System Manager:  University of Houston Department of Mathematics 
     And your voice is vast and achromatic.  But still so precious...
