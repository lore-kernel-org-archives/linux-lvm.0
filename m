Content-Disposition: inline
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: kevin@joubert.com
Message-Id: <20020911134913.29265.h018.c000.wm@mail.joubert.com.criticalpath.net>
Subject: [linux-lvm] Installing LVM on RH v7.3
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
Date: Wed Sep 11 15:49:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I am having trouble installing LVM on RH v7.3 (2.4.18-10).

As I am pretty sure this has been discussed already, please excuse the question, but I can't
figure out how to search the "linux-lvm" archives. 

Anyway, I can run "configure" okay:
---------------------------------------
[root@localhost lvm]# pwd
/usr/local/bin/lvm
[root@localhost lvm]# /usr/src/redhat/SOURCES/LVM/1.0.1/configure
--with-kernel-dir=/usr/src/linux-2.4
loading cache ./config.cache
checking for mawk... (cached) gawk
checking for gcc... (cached) gcc
checking whether the C compiler (gcc  ) works... yes
checking whether the C compiler (gcc  ) is a cross-compiler... no
checking whether we are using GNU C... (cached) yes
checking whether gcc accepts -g... (cached) yes
checking for a BSD compatible install... (cached) /usr/bin/install -c
checking whether ln -s works... (cached) yes
checking whether make sets ${MAKE}... (cached) yes
checking for dirent.h that defines DIR... (cached) yes
checking for opendir in -ldir... (cached) no
checking how to run the C preprocessor... (cached) gcc -E
checking for ANSI C header files... (cached) yes
checking for fcntl.h... (cached) yes
checking for malloc.h... (cached) yes
checking for sys/ioctl.h... (cached) yes
checking for unistd.h... (cached) yes
checking for working const... (cached) yes
checking for inline... (cached) inline
checking for off_t... (cached) yes
checking for pid_t... (cached) yes
checking for size_t... (cached) yes
checking for st_rdev in struct stat... (cached) yes
checking whether time.h and sys/time.h may both be included... (cached) yes
checking whether gcc needs -traditional... (cached) no
checking return type of signal handlers... (cached) void
checking for vprintf... (cached) yes
checking for mkdir... (cached) yes
checking for rmdir... (cached) yes
checking for uname... (cached) yes
creating ./config.status
creating Makefile
creating make.tmpl
creating PATCHES/Makefile
creating tools/Makefile
creating tools/tools_and_lib.make.tmpl
creating tools/lib/Makefile
creating tools/man8/Makefile
--------------------------------------------------------

But when I try to run "make" I get errors:

-----------------------------------------------------
[root@localhost lvm]# make
make[1]: Entering directory `/usr/local/bin/lvm/tools'
make[2]: Entering directory `/usr/local/bin/lvm/tools/lib'
make[3]: Entering directory `/usr/local/bin/lvm/tools/lib'
gcc -c -pipe -g -O0 -Wall -pg -DDEBUG -I/usr/src/redhat/SOURCES/LVM/1.0.1/tools/lib
-I/usr/src/redhat/SOURCES/LVM/1.0.1/tools -I/usr/local/bin/lvm/tools/lib -o basename.o
/usr/src/redhat/SOURCES/LVM/1.0.1/tools/lib/basename.c
In file included from /usr/src/redhat/SOURCES/LVM/1.0.1/tools/lib/liblvm.h:53,
                 from /usr/src/redhat/SOURCES/LVM/1.0.1/tools/lib/basename.c:34:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in userspace
make[3]: *** [basename.o] Error 1
make[3]: Leaving directory `/usr/local/bin/lvm/tools/lib'
make[2]: *** [all] Error 2
make[2]: Leaving directory `/usr/local/bin/lvm/tools/lib'
make[2]: Entering directory `/usr/local/bin/lvm/tools/man8'
make[3]: Entering directory `/usr/local/bin/lvm/tools/man8'
make[3]: Leaving directory `/usr/local/bin/lvm/tools/man8'
make[2]: Leaving directory `/usr/local/bin/lvm/tools/man8'
make[2]: Entering directory `/usr/local/bin/lvm/tools'
gcc -c -pipe -g -O0 -Wall -pg -DDEBUG -I/usr/src/redhat/SOURCES/LVM/1.0.1/tools/lib
-I/usr/src/redhat/SOURCES/LVM/1.0.1/tools -I/usr/local/bin/lvm/tools/lib -o e2fsadm.o
/usr/src/redhat/SOURCES/LVM/1.0.1/tools/e2fsadm.c
In file included from /usr/src/redhat/SOURCES/LVM/1.0.1/tools/lib/liblvm.h:53,
                 from /usr/src/redhat/SOURCES/LVM/1.0.1/tools/lvm_user.h:41,
                 from /usr/src/redhat/SOURCES/LVM/1.0.1/tools/e2fsadm.c:53:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in userspace
make[2]: *** [e2fsadm.o] Error 1
make[2]: Leaving directory `/usr/local/bin/lvm/tools'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/usr/local/bin/lvm/tools'
make[1]: Entering directory `/usr/local/bin/lvm'

**********************************
There were errors in your compile.
**********************************

make[1]: *** [.touchbuilt] Error 1
make[1]: Leaving directory `/usr/local/bin/lvm'
make: *** [all] Error 2
[root@localhost lvm]#
---------------------------------------------------------------


I did find this on the web, http://linux.msede.com/lvm_mlist/archive/2002/07/0144.html
which sounds like the guy knows how to fix it, but I sure can't figure out what he is talking
about. 

Anyone have any ideas?

-K.
