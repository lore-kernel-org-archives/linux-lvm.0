Date: Sun, 9 Sep 2001 10:46:06 -0400
From: Benjamin Reed <ranger@befunk.com>
Message-ID: <20010909104606.B967@befunk.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM and -ac kernels?
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

I've tried applying 1.0.1-rc2 to 2.4.9-ac9 and it appears
that something's not matching up; I was wondering if anyone
has had any luck with the 2.4.9 ac kernels?

I get a reject in the Makefile for something that Alan's
already added to his tree, and when I build, I get:

---(snip!)---
make[3]: Entering directory `/usr/src/linux-2.4.9-ac9-eb1/drivers/md'
gcc -D__KERNEL__ -I/usr/src/linux-2.4.9-ac9-eb1/include -Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common -pipe -mpreferred-stack-boundary=2 -march=i686    -c -o lvm.o lvm.c
lvm.c: In function `__extend_reduce':
lvm.c:2329: warning: implicit declaration of function `min'
lvm.c:2329: parse error before `uint'
lvm.c:2343: parse error before `uint'
lvm.c:2280: warning: `end' might be used uninitialized in this function
lvm.c:2339: warning: `end' might be used uninitialized in this function
make[3]: *** [lvm.o] Error 1
make[3]: Leaving directory `/usr/src/linux-2.4.9-ac9-eb1/drivers/md'
make[2]: *** [first_rule] Error 2
make[2]: Leaving directory `/usr/src/linux-2.4.9-ac9-eb1/drivers/md'
make[1]: *** [_subdir_md] Error 2
make[1]: Leaving directory `/usr/src/linux-2.4.9-ac9-eb1/drivers'
make: *** [_dir_drivers] Error 2
---(snip!)---

Feel free to tell me "don't bother with -ac kernels and LVM", all
I *truly* care about from the -ac tree is ext3, but it would be nice
if it's a simple fix.

TIA,

-- 
Ben Reed a.k.a. Ranger Rick (ranger@befunk.com)
http://defiance.dyndns.org/ / http://radio.scenespot.org/
The devil's in the broad, sweeping generalizations.
