Date: Mon, 27 Aug 2001 15:51:00 +0200 (DFT)
From: Peter Druck <peterd@tp2.ruhr-uni-bochum.de>
Message-ID: <Pine.A41.3.96.1010827154540.15862G-100000@hadron.tp2.ruhr-uni-bochum.de>
MIME-Version: 1.0
Subject: [linux-lvm] Problems compiling lvm 1.0 and 2.4.x kernel
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: Peter Druck <Peter.Druck@tp2.ruhr-uni-bochum.de>

Hallo,
I want to update my lvm from 0.9xx to 1.0. I've downloaded a
new kernel 2.4.9 (but I also tried it with 2.4.4). After I've
applied the patch and compile the kernel I get the following
error. Any idears what goes wrong?

Peter

Here is what make says:
lvm.c:2329: macro `min' used with only 2 args
lvm.c:2343: macro `min' used with only 2 args
lvm.c: In function `__extend_reduce':
lvm.c:2329: parse error before `__x'
lvm.c:2329: `__x' undeclared (first use in this function)
lvm.c:2329: (Each undeclared identifier is reported only once
lvm.c:2329: for each function it appears in.)
lvm.c:2329: `__y' undeclared (first use in this function)
lvm.c:2343: `old_stripe_size' undeclared (first use in this function)
lvm.c:2343: parse error before `__x'
lvm.c:2280: warning: `end' might be used uninitialized in this function
lvm.c:2339: warning: `end' might be used uninitialized in this function
make[3]: *** [lvm.o] Error 1
make[2]: *** [first_rule] Error 2
make[1]: *** [_subdir_md] Error 2
make: *** [_dir_drivers] Error 2
