From: Chris Danis <screechco@home.com>
Message-Id: <E162MMe-0004br-00@brooks.homenet>
Subject: [linux-lvm] Problems compiling userland LVM on sparc debian unstable
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
Date: Fri Nov  9 18:50:02 2001
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello all,

I'm running Debian unstable on a Sparcstation 20. I've managed to
patch the kernel (2.4.14) fine, but I can't seem to get the userspace
tools to compile. There seems to be some kind of conflict with the
headers, but not knowing much C, I'm a bit at a loss for what is going
on.

The build looks like this:

gallagher% make
make[1]: Entering directory `/home/danish/LVM/1.0.1-rc4/tools'
make[2]: Entering directory `/home/danish/LVM/1.0.1-rc4/tools/lib'
make[3]: Entering directory `/home/danish/LVM/1.0.1-rc4/tools/lib'
gcc -c -pipe -g -O2 -Wall -pg -DDEBUG -I../../tools/lib -I../../tools -I/home/danish/LVM/1.0.1-rc4/tools/lib -o basename.o basename.c
In file included from /usr/include/asm/signal.h:11,
                 from /usr/include/asm-sparc/processor.h:21,
                 from /usr/include/asm/processor.h:11,
                 from /usr/include/linux/prefetch.h:13,
                 from /usr/include/linux/list.h:6,
                 from ../../tools/lib/lvm.h:115,
                 from ../../tools/lib/liblvm.h:96,
                 from basename.c:34:
/usr/include/asm-sparc/signal.h:112: conflicting types for `sigset_t'
/usr/include/sys/select.h:38: previous declaration of `sigset_t'
make[3]: *** [basename.o] Error 1
make[3]: Leaving directory `/home/danish/LVM/1.0.1-rc4/tools/lib'
make[2]: *** [all] Error 2
make[2]: Leaving directory `/home/danish/LVM/1.0.1-rc4/tools/lib'
make[2]: Entering directory `/home/danish/LVM/1.0.1-rc4/tools/man8'
make[3]: Entering directory `/home/danish/LVM/1.0.1-rc4/tools/man8'
make[3]: Leaving directory `/home/danish/LVM/1.0.1-rc4/tools/man8'
make[2]: Leaving directory `/home/danish/LVM/1.0.1-rc4/tools/man8'
make[2]: Entering directory `/home/danish/LVM/1.0.1-rc4/tools'
gcc -c -pipe -g -O2 -Wall -pg -DDEBUG -I../tools/lib -I../tools -I/home/danish/LVM/1.0.1-rc4/tools/lib -o e2fsadm.o e2fsadm.c
In file included from /usr/include/asm/signal.h:11,
                 from /usr/include/asm-sparc/processor.h:21,
                 from /usr/include/asm/processor.h:11,
                 from /usr/include/linux/prefetch.h:13,
                 from /usr/include/linux/list.h:6,
                 from ../tools/lib/lvm.h:115,
                 from ../tools/lib/liblvm.h:96,
                 from ../tools/lvm_user.h:41,
                 from e2fsadm.c:53:
/usr/include/asm-sparc/signal.h:112: conflicting types for `sigset_t'
/usr/include/sys/select.h:38: previous declaration of `sigset_t'
make[2]: *** [e2fsadm.o] Error 1
make[2]: Leaving directory `/home/danish/LVM/1.0.1-rc4/tools'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/danish/LVM/1.0.1-rc4/tools'
make[1]: Entering directory `/home/danish/LVM/1.0.1-rc4'

**********************************
There were errors in your compile.
**********************************

make[1]: *** [.touchbuilt] Error 1
make[1]: Leaving directory `/home/danish/LVM/1.0.1-rc4'
make: *** [all] Error 2

gallagher%


Any advice, of course, would be greatly appreciated.

thanks,

-chris
--
(I subscribe to all lists that I post to;
please do not Cc me on list reply)
Chris Danis
screechco@home.com / danish@debian.org
Debian GNU/Linux - www.debian.org
