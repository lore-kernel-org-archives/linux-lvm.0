Message-ID: <8DA212D53DEFD211A5E70060979801B46C0DD5@oreh.hermes.si>
From: Matej Kenda <matej.kenda@hermes.si>
Date: Mon, 24 Sep 2001 14:26:45 +0200
MIME-Version: 1.0
Subject: [linux-lvm] BUG REPORT: LVM 1.0.1-rc2 on kernel 2.4.10
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

Hi,

Kernel part of LVM does not compile with the kernel mentioned above.
Generated patch corrupts the sources: lvm.c tries to use min macro with
three parameters whereas it expects two. 


make[3]: Entering directory `/usr/src/linux-2.4.10/drivers/md'
gcc -D__KERNEL__ -I/usr/src/linux-2.4.10/include -Wall -Wstrict-prototypes
-Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common
-pipe -mpreferred-stack-boundary=2 -march=i686    -c -o lvm.o lvm.c
lvm.c:2329:77: macro "min" passed 3 arguments, but takes just 2
lvm.c:2343:65: macro "min" passed 3 arguments, but takes just 2
lvm.c: In function `__extend_reduce':
lvm.c:2329: `min' undeclared (first use in this function)
lvm.c:2329: (Each undeclared identifier is reported only once
lvm.c:2329: for each function it appears in.)
lvm.c:2280: warning: `end' might be used uninitialized in this function
lvm.c:2339: warning: `end' might be used uninitialized in this function
make[3]: *** [lvm.o] Error 1
make[3]: Leaving directory `/usr/src/linux-2.4.10/drivers/md'
make[2]: *** [first_rule] Error 2
make[2]: Leaving directory `/usr/src/linux-2.4.10/drivers/md'


Compiled on RedHat 7.1 (i386 architecture) with gcc 2.96.

Best regards,

Matej
