Message-ID: <20010823162554.47355.qmail@web20302.mail.yahoo.com>
Date: Thu, 23 Aug 2001 09:25:54 -0700 (PDT)
From: Brad Langhorst <bwlang@yahoo.com>
Subject: [linux-lvm] segfault running vgscan
MIME-Version: 1.0
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

>Are you linking the tools statically or dynamically?
> I have seen a
>seg-fault with the tools that call at_exit() and
>static linking with glibc -
>apparently the bug is in glibc, not LVM, and is
>fixed in newer versions.  I
>have yet to verify this.
>=20
>--=20
>AJ Lewis
sorry to be an idiot - i'm not sure how to tell if its
linked statically or dynamically.  Looking through the
build messags I see a gcc -shared command in the lib
building section so I'm guessing dynamic linking but I
don't really know.

here is my glibc info

# rpm -qa |grep glibc
compat-glibc-6.2-2.1.3.2
glibc-common-2.2.4-5
glibc-devel-2.2.4-5
glibc-2.2.4-5
glibc-profile-2.2.4-5

I ran the program using strace...
but I don't really know what everything means yet.
It looks to me like it is opening shared libraries and
allocating memory - but for some reason is not allowed
to allocate 0x40187000.
*shrug*

# strace vgscan
execve("/sbin/vgscan", ["vgscan"], [/* 27 vars */]) =
0
uname({sys="Linux", node="[hostname.removed]", ...}) =
0
brk(0)                                  = 0x804b3e0
open("/etc/ld.so.preload", O_RDONLY)    = -1 ENOENT
(No such file or directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=38258, ...})
= 0
old_mmap(NULL, 38258, PROT_READ, MAP_PRIVATE, 3, 0) =
0x40017000
close(3)                                = 0
open("/lib/liblvm-10.so.1", O_RDONLY)   = 3
read(3,
"\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\360P\0"...,
1024) = 1024
fstat64(3, {st_mode=S_IFREG|0555, st_size=704519,
...}) = 0
old_mmap(NULL, 189300, PROT_READ|PROT_EXEC,
MAP_PRIVATE, 3, 0) = 0x40021000
mprotect(0x4004b000, 17268, PROT_NONE)  = 0
old_mmap(0x4004b000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED, 3, 0x29000) = 0x4004b000
old_mmap(0x4004d000, 9076, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) =
0x4004d000
close(3)                                = 0
open("/lib/i686/libc.so.6", O_RDONLY)   = 3
read(3,
"\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\340\310"...,
1024) = 1024
fstat64(3, {st_mode=S_IFREG|0755, st_size=5761921,
...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40050000
old_mmap(NULL, 1285704, PROT_READ|PROT_EXEC,
MAP_PRIVATE, 3, 0) = 0x40051000
mprotect(0x40182000, 36424, PROT_NONE)  = 0
old_mmap(0x40182000, 20480, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED, 3, 0x130000) = 0x40182000
old_mmap(0x40187000, 15944, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) =
0x40187000
close(3)                                = 0
--- SIGSEGV (Segmentation fault) ---
+++ killed by SIGSEGV +++


__________________________________________________
Do You Yahoo!?
Make international calls for as low as $.04/minute with Yahoo! Messenger
http://phonecard.yahoo.com/
