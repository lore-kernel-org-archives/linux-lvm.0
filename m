From: Jan =?iso-8859-2?Q?=A9vec?= <svecj@fzu.cz>
Content-Transfer-Encoding: 7bit
Message-Id: <1066307106.1480.59.camel@pc112b.fzu.cz>
Mime-Version: 1.0
Subject: [linux-lvm] LVM2 compilation problem
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
Date: Thu Oct 16 07:26:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

I'm having trouble compiling the LVM2 ver. 2.2.00.07. During make
install I receive this error:

device/dev-io.c: In function `dev_get_size':
device/dev-io.c:215: `BLKGETSIZE64' undeclared (first use in this
function)
device/dev-io.c:215: (Each undeclared identifier is reported only once
device/dev-io.c:215: for each function it appears in.)
make[1]: *** [device/dev-io.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: Leaving directory `/root/LVM2.2.00.07/lib'
make: *** [lib] Error 2

The kernel is 2.6.0 test6. I also tried to make the link
/usr/src/linux-2.6.0-test6/include/linux -> /usr/include/linux, but then
I receive another error message:

gcc -c -I. -I../include -DLVM1_INTERNAL -DREADLINE_SUPPORT
-DDEVMAPPER_SUPPORT -DHAVE_LIBDL -DHAVE_GETOPTLONG -DHAVE_RL_COMPLET
ION_MATCHES -fPIC -Wall -Wundef -Wshadow -Wcast-align -Wwrite-strings
-Wmissing-prototypes -Wmissing-declarations -Wnested-exte
rns -Winline -O2 device/dev-io.c -o device/dev-io.o
In file included from /usr/include/linux/fs.h:10,
                 from device/dev-io.c:24:
/usr/include/linux/linkage.h:5:25: asm/linkage.h: No such file or
directory
In file included from /usr/include/linux/fs.h:16,
                 from device/dev-io.c:24:
/usr/include/linux/list.h:563:2: warning: #warning "don't include kernel
headers in userspace"
In file included from /usr/include/linux/fs.h:20,
                 from device/dev-io.c:24:
/usr/include/linux/radix-tree.h: In function `radix_tree_preload_end':
/usr/include/linux/radix-tree.h:54: invalid type argument of `->'
/usr/include/linux/radix-tree.h:54: `TIF_NEED_RESCHED' undeclared (first
use in this function)
/usr/include/linux/radix-tree.h:54: (Each undeclared identifier is
reported only once
/usr/include/linux/radix-tree.h:54: for each function it appears in.)
In file included from /usr/include/linux/fs.h:22,
                 from device/dev-io.c:24:
/usr/include/asm/atomic.h:40:2: warning: #warning Using kernel header in
userland program. BAD!
make[1]: *** [device/dev-io.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: Leaving directory `/root/LVM2.2.00.07/lib'
make: *** [lib] Error 2

Anyone have any idea how to solve this problem ?

Thanks,
Jan

-- 
----------------------------------------------------------------------
Jan Svec                                 Institute of Physics 
e-mail: svecj@fzu.cz                     Academy of Sciences of the CR
Phone : +420 2 6605 2145                 Na Slovance 2, 182 21 Praha 8
Fax   : +420 2 8658 5443                 Czech Republic
----------------------------------------------------------------------
