Message-ID: <OF8D6ACD21.34A36C6E-ON87256AB7.007C475A@sc.blm.gov>
From: dan_mcmanus@co.blm.gov
Date: Wed, 29 Aug 2001 17:04:01 -0600
MIME-Version: 1.0
Subject: [linux-lvm] A Caldera related bug?
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
To: linux-LVM@sistina.com

Hello,

First off, if I'm not supposed to send this to you, I apologize. I am
running Caldera Openlinux workstation 3.1 with a kernel of 2.4.8 that has
LVM support enabled. My computer is a gateway 4200 Pentium II, if you care
about that. I tried this with lvm 1.0.1-rc1, 1.0, and 0.9, following the
instructions faithfully. What happens is I type "make" (after having typed
"./configure", of course) and this same error happens in each case:

[root@co1432 1.0.1-rc1]# make
make[1]: Entering directory `/usr/src/linux/extras/LVM/1.0.1-rc1/tools'
make[2]: Entering directory `/usr/src/linux/extras/LVM/1.0.1-rc1/tools/lib'
make[3]: Entering directory `/usr/src/linux/extras/LVM/1.0.1-rc1/tools/lib'
gcc -c -pipe -g -O2 -Wall -DDEBUG -I../../tools/lib -I../../tools -o
basename.o basename.c
In file included from /usr/include/linux/prefetch.h:13,
                 from /usr/include/linux/list.h:6,
                 from ../../tools/lib/lvm.h:115,
                 from ../../tools/lib/liblvm.h:96,
                 from basename.c:34:
/usr/include/asm/processor.h:46: parse error before `u16'
/usr/include/asm/processor.h:46: warning: no semicolon at end of struct or
union
/usr/include/asm/processor.h:55: parse error before `}'
make[3]: *** [basename.o] Error 1
make[3]: Leaving directory `/usr/src/linux/extras/LVM/1.0.1-rc1/tools/lib'
make[2]: *** [all] Error 2
make[2]: Leaving directory `/usr/src/linux/extras/LVM/1.0.1-rc1/tools/lib'
make[2]: Entering directory
`/usr/src/linux/extras/LVM/1.0.1-rc1/tools/man8'
make[3]: Entering directory
`/usr/src/linux/extras/LVM/1.0.1-rc1/tools/man8'
make[3]: Leaving directory `/usr/src/linux/extras/LVM/1.0.1-rc1/tools/man8'
make[2]: Leaving directory `/usr/src/linux/extras/LVM/1.0.1-rc1/tools/man8'
make[2]: Entering directory `/usr/src/linux/extras/LVM/1.0.1-rc1/tools'
gcc -c -pipe -g -O2 -Wall -DDEBUG -I../tools/lib -I../tools -o e2fsadm.o
e2fsadm.c
In file included from /usr/include/linux/prefetch.h:13,
                 from /usr/include/linux/list.h:6,
                 from ../tools/lib/lvm.h:115,
                 from ../tools/lib/liblvm.h:96,
                 from ../tools/lvm_user.h:41,
                 from e2fsadm.c:53:
/usr/include/asm/processor.h:46: parse error before `u16'
/usr/include/asm/processor.h:46: warning: no semicolon at end of struct or
union
/usr/include/asm/processor.h:55: parse error before `}'
make[2]: *** [e2fsadm.o] Error 1
make[2]: Leaving directory `/usr/src/linux/extras/LVM/1.0.1-rc1/tools'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/usr/src/linux/extras/LVM/1.0.1-rc1/tools'
make[1]: Entering directory `/usr/src/linux/extras/LVM/1.0.1-rc1'

**********************************
There were errors in your compile.
**********************************

make[1]: *** [.touchbuilt] Error 1
make[1]: Leaving directory `/usr/src/linux/extras/LVM/1.0.1-rc1'
make: *** [all] Error 2


Any help would be appreciated.

Thanks,

Dan McManus
