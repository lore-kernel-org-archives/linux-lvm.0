From: Anders Widman <andewid@tnonline.net>
Message-ID: <1921469765.20020529012133@tnonline.net>
Subject: Re: [linux-lvm] errors compiling on redhat 7.3
In-Reply-To: <200205280843.AA111477202@mail.one.it>
References: <200205280843.AA111477202@mail.one.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Tue May 28 18:22:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Pierluigi Godi <pierluigi.godi@mail.one.it>
Cc: Linux-LVM@sistina.com

I  had  a  similar  problem with GCC-3.1. It works find with GCC 3.04.

//Anders

> hi, 
> I'm only an end-user (not a programmer... so i can't help you a lot).
> this is the problem... when i try to install (configure, make, make install) the lvm 1.0.4/1.1 rc2 on my (out of the box) redhat 7.3, i receive an error...

> [root@unixguest 1.0.4]# ./configure
> loading cache ./config.cache
> checking for mawk... (cached) gawk
> checking for gcc... (cached) gcc
> checking whether the C compiler (gcc  ) works... yes
> checking whether the C compiler (gcc  ) is a cross-compiler... no
> checking whether we are using GNU C... (cached) yes
> checking whether gcc accepts -g... (cached) yes
> checking for a BSD compatible install... (cached) /usr/bin/install -c
> checking whether ln -s works... (cached) yes
> checking whether make sets ${MAKE}... (cached) yes
> checking for dirent.h that defines DIR... (cached) yes
> checking for opendir in -ldir... (cached) no
> checking how to run the C preprocessor... (cached) gcc -E
> checking for ANSI C header files... (cached) yes
> checking for fcntl.h... (cached) yes
> checking for malloc.h... (cached) yes
> checking for sys/ioctl.h... (cached) yes
> checking for unistd.h... (cached) yes
> checking for working const... (cached) yes
> checking for inline... (cached) inline
> checking for off_t... (cached) yes
> checking for pid_t... (cached) yes
> checking for size_t... (cached) yes
> checking for st_rdev in struct stat... (cached) yes
> checking whether time.h and sys/time.h may both be included... (cached) yes
> checking whether gcc needs -traditional... (cached) no
> checking return type of signal handlers... (cached) void
> checking for vprintf... (cached) yes
> checking for mkdir... (cached) yes
> checking for rmdir... (cached) yes
> checking for uname... (cached) yes
> creating ./config.status
> creating Makefile
> creating make.tmpl
> creating PATCHES/Makefile
> creating tools/Makefile
> creating tools/tools_and_lib.make.tmpl
> creating tools/lib/Makefile
> creating tools/man8/Makefile
> [root@unixguest 1.0.4]#


> [root@unixguest 1.0.4]# make
> make[1]: Entering directory `/opt/LVM/LVM/1.0.4/tools'
> make[2]: Entering directory `/opt/LVM/LVM/1.0.4/tools/lib'
> make[3]: Entering directory `/opt/LVM/LVM/1.0.4/tools/lib'
> gcc -c -pipe -g -O0 -Wall -DDEBUG -I../../tools/lib -I../../tools -I/opt/LVM/LVM/1.0.4/tools/lib -o basename.o basename.c
> In file included from ../../tools/lib/liblvm.h:59,
>                  from basename.c:34:
> /usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in userspace
> make[3]: *** [basename.o] Error 1
> make[3]: Leaving directory `/opt/LVM/LVM/1.0.4/tools/lib'
> make[2]: *** [all] Error 2
> make[2]: Leaving directory `/opt/LVM/LVM/1.0.4/tools/lib'
> make[2]: Entering directory `/opt/LVM/LVM/1.0.4/tools/man8'
> make[3]: Entering directory `/opt/LVM/LVM/1.0.4/tools/man8'
> make[3]: Leaving directory `/opt/LVM/LVM/1.0.4/tools/man8'
> make[2]: Leaving directory `/opt/LVM/LVM/1.0.4/tools/man8'
> make[2]: Entering directory `/opt/LVM/LVM/1.0.4/tools'
> gcc -c -pipe -g -O0 -Wall -DDEBUG -I../tools/lib -I../tools -I/opt/LVM/LVM/1.0.4/tools/lib -o e2fsadm.o e2fsadm.c
> In file included from ../tools/lib/liblvm.h:59,
>                  from ../tools/lvm_user.h:43,
>                  from e2fsadm.c:55:
> /usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in userspace
> make[2]: *** [e2fsadm.o] Error 1
> make[2]: Leaving directory `/opt/LVM/LVM/1.0.4/tools'
> make[1]: *** [all] Error 2
> make[1]: Leaving directory `/opt/LVM/LVM/1.0.4/tools'
> make[1]: Entering directory `/opt/LVM/LVM/1.0.4'

> **********************************
> There were errors in your compile.
> **********************************

> make[1]: *** [.touchbuilt] Error 1
> make[1]: Leaving directory `/opt/LVM/LVM/1.0.4'
> make: *** [all] Error 2
> [root@unixguest 1.0.4]#

> by




> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
