From: VLADIMIR DUBNIKOV <msvd@mscc.huji.ac.il>
Message-ID: <Pine.LNX.4.21.0208121055400.28279-100000@pluto.mscc.huji.ac.il>
MIME-Version: 1.0
Subject: [linux-lvm] lvm 1.05 does not compile
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
Date: Mon Aug 12 03:05:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi.
I received next errors in the time of compilation of LVM 1.0.5

make[1]: Entering directory `/usr/src/LVM/1.0.5/tools'
make[2]: Entering directory `/usr/src/LVM/1.0.5/tools/lib'
make[3]: Entering directory `/usr/src/LVM/1.0.5/tools/lib'
gcc -c -pipe -g -O0 -Wall -DDEBUG -I../../tools/lib -I../../tools
-I/usr/src/LVM
/1.0.5/tools/lib -o basename.o basename.c
In file included from ../../tools/lib/liblvm.h:59,
                 from basename.c:34:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included
in user
space
make[3]: *** [basename.o] Error 1
make[3]: Leaving directory `/usr/src/LVM/1.0.5/tools/lib'
make[2]: *** [all] Error 2
make[2]: Leaving directory `/usr/src/LVM/1.0.5/tools/lib'
make[2]: Entering directory `/usr/src/LVM/1.0.5/tools/man8'
make[3]: Entering directory `/usr/src/LVM/1.0.5/tools/man8'
make[3]: Leaving directory `/usr/src/LVM/1.0.5/tools/man8'
make[2]: Leaving directory `/usr/src/LVM/1.0.5/tools/man8'
make[2]: Entering directory `/usr/src/LVM/1.0.5/tools'
gcc -c -pipe -g -O0 -Wall -DDEBUG -I../tools/lib -I../tools
-I/usr/src/LVM/1.0.5
/tools/lib -o e2fsadm.o e2fsadm.c
In file included from ../tools/lib/liblvm.h:59,
                 from ../tools/lvm_user.h:43,
                 from e2fsadm.c:55:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included
in user
space
make[2]: *** [e2fsadm.o] Error 1
make[2]: Leaving directory `/usr/src/LVM/1.0.5/tools'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/usr/src/LVM/1.0.5/tools'
make[1]: Entering directory `/usr/src/LVM/1.0.5'

**********************************
There were errors in your compile.
**********************************

make[1]: *** [.touchbuilt] Error 1
make[1]: Leaving directory `/usr/src/LVM/1.0.5'
make: *** [all] Error 2

I did all according to INSTALL files including patches.

Os: RH 7.3
Kernel: 2.4.19
LVM: 1.0.5
GCC: version 2.96
Pentium III (Katmai) 550Mhz 
-- 
===============================================================
Vladimir Dubnikov (Unix System Group)
Computation center, Mount Scopus, Hebrew University of Jerusalem
Tel:    02-5883070
E-mail: msvd@panda.mscc.huji.ac.il
===============================================================
