From: Anders Widman <andewid@tnonline.net>
Message-ID: <688972703.20020525015858@tnonline.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] GCC-3.1
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
Date: Fri May 24 18:59:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

   It  does  not seem to work to compile LVM 1.0.4 or 1.1-rc2 with GCC
   3.1.  I  get  errors  similar  to  what  is  below.  With GCC 3.0.4
   everything compiles and works good.

   //Anders

   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[root@server 1.1-rc2]# make
make[1]: Entering directory `/usr/src/LVM/1.1-rc2/tools'
make[2]: Entering directory `/usr/src/LVM/1.1-rc2/tools/lib'
make[3]: Entering directory `/usr/src/LVM/1.1-rc2/tools/lib'
gcc -c -pipe -g -Wall -DDEBUG -I../../tools/lib -I../../tools -I/usr/src/LVM/1.1-rc2/tools/lib -o basename.o basename.c
In file included from ../../tools/lib/liblvm.h:61,
                 from basename.c:36:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in userspace
make[3]: *** [basename.o] Error 1
make[3]: Leaving directory `/usr/src/LVM/1.1-rc2/tools/lib'
make[2]: *** [all] Error 2
make[2]: Leaving directory `/usr/src/LVM/1.1-rc2/tools/lib'
make[2]: Entering directory `/usr/src/LVM/1.1-rc2/tools/man8'
make[3]: Entering directory `/usr/src/LVM/1.1-rc2/tools/man8'
make[3]: Leaving directory `/usr/src/LVM/1.1-rc2/tools/man8'
make[2]: Leaving directory `/usr/src/LVM/1.1-rc2/tools/man8'
make[2]: Entering directory `/usr/src/LVM/1.1-rc2/tools'
gcc -c -pipe -DREADLINE -DSINGLE_EXECUTABLE -g -Wall -DDEBUG -I../tools/lib -I../tools -I/usr/src/LVM/1.1-rc2/tools/lib -o e2fsadm.o e2fsadm.c
In file included from ../tools/lib/liblvm.h:61,
                 from ../tools/lvm_user.h:47,
                 from e2fsadm.c:60:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in userspace
make[2]: *** [e2fsadm.o] Error 1
make[2]: Leaving directory `/usr/src/LVM/1.1-rc2/tools'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/usr/src/LVM/1.1-rc2/tools'
make[1]: Entering directory `/usr/src/LVM/1.1-rc2'

**********************************
There were errors in your compile.
**********************************

make[1]: *** [.touchbuilt] Error 1
make[1]: Leaving directory `/usr/src/LVM/1.1-rc2'
make: *** [all] Error 2
[root@server 1.1-rc2]# 
