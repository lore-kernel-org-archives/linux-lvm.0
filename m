Message-ID: <3BAB1F01001185CA@mail.fibertel.com.ar> (added by postmaster@fibertel.com.ar)
Date: Wed, 26 Sep 2001 12:40:29 -0300 (ART)
From: Leandro Lucarella <luca@lucarella.com.ar>
MIME-Version: 1.0
Content-Disposition: INLINE
Subject: [linux-lvm] Problems compiling kernel 2.4.10 with  LVM-1.0.1rc2 patch
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
To: linux-lvm <linux-lvm@sistina.com>

Here's the error message:

make -C md modules
make[2]: Entering directory `/usr/src/linux-2.4.10/drivers/md'
gcc -D__KERNEL__ -I/usr/src/linux-2.4.10/include -Wall -Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common -pipe -mpreferred-stack-boundary=2 -march=i686 -malign-functions=4  -DMODULE -DMODVERSIONS -include /usr/src/linux-2.4.10/include/linux/modversions.h   -c -o lvm.o lvm.c
lvm.c:2329: macro `min' used with too many (3) args
lvm.c:2343: macro `min' used with too many (3) args
lvm.c: In function `__extend_reduce':
lvm.c:2329: parse error before `;'
lvm.c:2329: `_y' undeclared (first use in this function)
lvm.c:2329: (Each undeclared identifier is reported only once
lvm.c:2329: for each function it appears in.)
lvm.c:2343: parse error before `;'
lvm.c:2280: warning: `end' might be used uninitialized in this function
lvm.c:2339: warning: `end' might be used uninitialized in this function
make[2]: *** [lvm.o] Error 1
make[2]: Leaving directory `/usr/src/linux-2.4.10/drivers/md'
make[1]: *** [_modsubdir_md] Error 2
make[1]: Leaving directory `/usr/src/linux-2.4.10/drivers'
make: *** [_mod_drivers] Error 2

Any ideas?

--
LUCA - Leandro Lucarella
------------------------
luca@lucarella.com.ar
http://www.luca.2y.net
LICQ UIN: 2847576
------------------------
Usando Debian GNU/Linux
