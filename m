From: Anders Widman <andewid@tnonline.net>
Message-ID: <549012796.20020731132606@tnonline.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Problem compiling LVM 1.0.5
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
Date: Wed Jul 31 06:25:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

   I have a problem with compiling LVM 1.0.5.

   Configure works fine. but when I run make I get this message:


[root@server 1.0.5]# make
make[1]: Entering directory `/usr/src/LVM/1.0.5/tools'
make[2]: Entering directory `/usr/src/LVM/1.0.5/tools/lib'
make[3]: Entering directory `/usr/src/LVM/1.0.5/tools/lib'
gcc -c -pipe -g -O0 -Wall -DDEBUG -I../../tools/lib -I../../tools -I/usr/src/LVM/1.0.5/tools/lib -o basename.o basename.c
In file included from ../../tools/lib/liblvm.h:59,
                 from basename.c:34:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in userspace
make[3]: *** [basename.o] Error 1
make[3]: Leaving directory `/usr/src/LVM/1.0.5/tools/lib'
make[2]: *** [all] Error 2
make[2]: Leaving directory `/usr/src/LVM/1.0.5/tools/lib'
make[2]: Entering directory `/usr/src/LVM/1.0.5/tools/man8'
make[3]: Entering directory `/usr/src/LVM/1.0.5/tools/man8'
make[3]: Leaving directory `/usr/src/LVM/1.0.5/tools/man8'
make[2]: Leaving directory `/usr/src/LVM/1.0.5/tools/man8'
make[2]: Entering directory `/usr/src/LVM/1.0.5/tools'
gcc -c -pipe -g -O0 -Wall -DDEBUG -I../tools/lib -I../tools -I/usr/src/LVM/1.0.5/tools/lib -o e2fsadm.o e2fsadm.c
In file included from ../tools/lib/liblvm.h:59,
                 from ../tools/lvm_user.h:43,
                 from e2fsadm.c:55:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in userspace
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
   

I am running Red Hat 7.3 with GCC 3.1.1 (and tried with the 2.96 that
came with Red Hat..)

Thanks for any help.

//Anders
