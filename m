Date: Thu, 4 Oct 2001 17:04:47 -0400
From: urmk@reason.marist.edu
Message-ID: <20011004170447.A17897@reason.marist.edu>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] no such member 'de'
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
To: Linux-LVM@sistina.com

LVM 1.0.1rc4, Linux 2.2.19 stock kernel:

I applied the rawio patch for 2.2.18 (no errors, a few fuzzy offsets).
Configured LVM, ran make in the PATCHES dir.
Applied the newly made LVM patch.  Again, no errors, some fuzzy offsets.
Configured LVM support in the kernel.

Make fails, with:

cc -D__KERNEL__ -I/usr/src/linux-2.2.19/include -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -fno-strict-aliasing -D__SMP__ -pipe -fno-strength-reduce -m486 -malign-loops=2 -malign-jumps=2 -malign-functions=2 -DCPU=586   -c -o lvm.o lvm.c
lvm.c: In function `lvm_do_lv_create':
lvm.c:2192: structure has no member named `de'
lvm.c: In function `lvm_do_lv_remove':
lvm.c:2277: structure has no member named `de'
make[3]: *** [lvm.o] Error 1
make[3]: Leaving directory `/usr/src/linux-2.2.19/drivers/block'
make[2]: *** [first_rule] Error 2
make[2]: Leaving directory `/usr/src/linux-2.2.19/drivers/block'
make[1]: *** [_subdir_block] Error 2
make[1]: Leaving directory `/usr/src/linux-2.2.19/drivers'

It appears it's hardcoded to refer to the devfs entries, which don't exit in 
2.2.19 -- is this simply the final stage of dropping support for 2.2.19, or 
an oversight?

-m



-- 
Michael Kershaw
Michael.Kershaw@reason.marist.edu
Linux Systems Programmer, Information Technology

"Don't worry, I'm sure they'll listen to Reason." -- Fisheye, Snowcrash
