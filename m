From: Morten Wang <warnckew@online.no>
Date: 13 Oct 2001 17:07:21 +0200
Message-ID: <m3d73rino6.fsf@tigger.plaindog.no>
MIME-Version: 1.0
Subject: [linux-lvm] Tools compile problem, 1.0.1-rc4 on RH6.2 w/kernel 2.4.12
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
To: linux-lvm@sistina.com

Greetings all,

in my quest to learn more about Linux I've decided to have a look at
LVM.  primarily because my server has some free space I'd like to
exploit better, secondly because I like to learn.

I downloaded 1.0.1-rc4.  after changing all occurrences of [[:blank:]]
with [[:space:]] in the various configuration scripts (grep didn't
support the former according to my man-pages) I got ./configure to
run, and as far I could tell from looking at a few of the Makefiles it
returned the correct values.  I then did a 'make' in ./PATCHES,
patched my kernel and then built the new LVM module.  I can now
successfully load lvm-mod:

    kernel: LVM version 1.0.1-rc4(03/10/2001) module loaded

I am not able to build the tools needed to work with LVM.  the kernel
reported being unable to locate module block-major-105 (some Compaq
RAID thingy according to /usr/src/linux/Documentation/devices.txt) and
I added 'alias block-major-105 off' to /etc/modules.conf with good
results.  the tools still don't build though:

[root@tigger 1.0.1-rc4]# make
make[1]: Entering directory `/usr/local/src/LVM/1.0.1-rc4/tools'
make[2]: Entering directory `/usr/local/src/LVM/1.0.1-rc4/tools/lib'
make[3]: Entering directory `/usr/local/src/LVM/1.0.1-rc4/tools/lib'
gcc -c -pipe -g -O2 -Wall -pg -DDEBUG -I../../tools/lib -I../../tools -I/usr/local/src/LVM/1.0.1-rc4/tools/lib -o basename.o basename.c
In file included from basename.c:34:
../../tools/lib/liblvm.h:81: malloc.h: Device not configured
make[3]: *** [basename.o] Error 1
make[3]: Leaving directory `/usr/local/src/LVM/1.0.1-rc4/tools/lib'
make[2]: *** [all] Error 2
make[2]: Leaving directory `/usr/local/src/LVM/1.0.1-rc4/tools/lib'
make[2]: Entering directory `/usr/local/src/LVM/1.0.1-rc4/tools/man8'
make[3]: Entering directory `/usr/local/src/LVM/1.0.1-rc4/tools/man8'
make[3]: Leaving directory `/usr/local/src/LVM/1.0.1-rc4/tools/man8'
make[2]: Leaving directory `/usr/local/src/LVM/1.0.1-rc4/tools/man8'
make[2]: Entering directory `/usr/local/src/LVM/1.0.1-rc4/tools'
gcc -c -pipe -g -O2 -Wall -pg -DDEBUG -I../tools/lib -I../tools -I/usr/local/src/LVM/1.0.1-rc4/tools/lib -o e2fsadm.o e2fsadm.c
In file included from ../tools/lvm_user.h:41,
                 from e2fsadm.c:53:
../tools/lib/liblvm.h:81: malloc.h: Device not configured
In file included from e2fsadm.c:53:
../tools/lvm_user.h:48: malloc.h: Device not configured
make[2]: *** [e2fsadm.o] Error 1
make[2]: Leaving directory `/usr/local/src/LVM/1.0.1-rc4/tools'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/usr/local/src/LVM/1.0.1-rc4/tools'
make[1]: Entering directory `/usr/local/src/LVM/1.0.1-rc4'

**********************************
There were errors in your compile.
**********************************

make[1]: *** [.touchbuilt] Error 1
make[1]: Leaving directory `/usr/local/src/LVM/1.0.1-rc4'
make: *** [all] Error 2

this is as far as I am able to go with my knowledge.  I've searched
the mailing list archives and googled for some solutions, and as I've
mentioned I found one for the missing module kernel error.  I'm not
sure if I'm missing some clues here or not.  the help for LVM in
'make xconfig' doesn't mention any requirements of other drivers or
anything, neither does INSTALL, as far as I've been able to read
(think I've read it quite a few times now).

I'd be very appreciative of any help on this.  I could do a
trial & error of adding the module for that Compaq RAID thingy to see
if that would help, but it feels like I'm stumbling in the dark here.
if I'm making any errors here, or any much-needed information is
missing, let me know and I'll supply it.


Morten!

-- 
Hoare's Law of Large Programs:
    "Inside every large program is a small program struggling to get out." 
