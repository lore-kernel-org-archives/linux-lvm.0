Return-Path: <mjt@tls.msk.ru>
Message-ID: <3A28181B.9B0967CD@tls.msk.ru>
Date: Sat, 02 Dec 2000 00:28:59 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Using Oracle with lvm AND rawio: read(512) from /dev/raw/...
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
To: linux-lvm@sistina.com

Hello!

I finally got working (at least at first view) lvm with
RedHat's 2.2.17-8 kernel (from rawhide) and lvm-0.9.new_raid.patch,
patched by Andreas Dilger (with small additional changes).

So far, so good.

As I can see, lvm patch should go with sct's rawio patch, so
I conclude that them should work together.  Isn't it? :)

My main goal is to use oracle database with raw devices on
top of lvm (using some number of disks, so that total
storage size is large and needs to be managed intelligently).
This is IMHO a great thing to have with linux -- Oracle's
best results can be achieved on raw devices, and those needs
to be managed (using disk partitions is a PITA here).

I've made simple LV, and attached raw device on top of it,
using `raw' utility.  And what I've noticied is that I
can't write 512-byte blocks to it.  The only block size
I can use is 1024, 2048, 3072, etc, i.e. 1024*n.  With
just lvm device it is ok (seemed to be), but with /dev/raw
device write/read gives "invalid argument" error message.

The bad thing is that Oracle tries to write 512 bytes
_when creating tablespace_ (I've set up it to use 4k
blocks, so it will read/write 4096*n blocks after ts
creation).  I attached some strace output from oracle
process when creating tablespace, below.

/dev/raw/raw100 bound to /dev/vg0/ora0 lv (128M).
 dd if=/dev/zero of=/dev/raw/raw100 bs=512
  dd: /dev/raw/raw100: Invalid argument
  1+0 records in
  0+0 records out

But what's interesting is that I already have set up
some databases to use raw devices, and them working
good (no glitches was found so far).  I used "plain"
disk partitions for this, and softraid-devices, e.g.
  partition => rawdevice => oracle datafile
  partition,partition => raid0 => rawdevice => oracle

/dev/raw/raw1 bound to /dev/sda2 (1G)
 dd if=/dev/zero of=/dev/raw/raw1 bs=512
 ^C
 281835+0 records in
 281834+0 records out

(I've just hit ^C here for. Process will complete
correctly).

So the question: why read/write fails with rawio
on top of lvm when requesting "incorrect" block size?

Strace excerpt below.  What I noticied is that
oracle tried to use different methods here, but
all failed.  Some of them used with 1024-multiple
sizes only, but also failed.
BTW, does anybody knows what's "pwrite()" ?

Oracle 8.1.6 EE (Oracle8iR2) for Linux.

I think that we all interested in resolving this
particular issue.  I'll be glad to try different things
here as well, and provide any additional info, or providing
all my experience for this... And just one thing -- may this
be due to strangers with lvm patch (0.9-2.2.17-new_raid +
Andreas "patch for patch" + my *minor* tweaks)? 

Thank you.

Regards,
 Michael.

SQL> create tablespace x datafile '/dev/raw/raw100' size 100m reuse;
...
stat("/dev/raw/raw100", {st_mode=S_IFCHR|0660, st_rdev=makedev(162, 100), ...}) = 0
open("/dev/raw/raw100", O_RDONLY)       = 9
close(9)                                = 0
open("/dev/raw/raw100", O_RDWR)         = 9
getrlimit(RLIMIT_NOFILE, {rlim_cur=1024, rlim_max=1024}) = 0
fstat(408, {st_mode=S_IFREG|0640, st_size=1077248, ...}) = 0
fstat(407, 0xbfffb65c)                  = -1 EBADF (Bad file descriptor)
dup2(9, 407)                            = 407
close(9)                                = 0
fcntl(407, F_SETFD, FD_CLOEXEC)         = 0
fcntl(407, F_GETFL)                     = 0x2 (flags O_RDWR)
fcntl(407, F_SETLK, {type=F_WRLCK, whence=SEEK_SET, start=0, len=0}) = 0
stat("/dev/raw/raw100", {st_mode=S_IFCHR|0660, st_rdev=makedev(162, 100), ...}) = 0
open("/dev/raw/raw100", O_RDWR)         = 9
lseek(9, 0, SEEK_SET)                   = 0
write(9, "\0\0\0\0\0\20\0\0\0d\0\0]\\[Z\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
lseek(9, 104861184, SEEK_SET)           = 104861184
read(9, 0x92e4800, 512)                 = -1 EINVAL (Invalid argument)
close(9)                                = 0
fcntl(407, F_SETLK, {type=F_UNLCK, whence=SEEK_SET, start=0, len=0}) = 0
close(407)                              = 0
old_mmap(NULL, 266240, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40191000
old_mmap(NULL, 266240, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x401d2000
old_mmap(NULL, 266240, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40213000
old_mmap(NULL, 266240, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40254000
stat("/dev/raw/raw100", {st_mode=S_IFCHR|0660, st_rdev=makedev(162, 100), ...}) = 0
open("/dev/raw/raw100", O_RDONLY)       = 9
close(9)                                = 0
open("/dev/raw/raw100", O_RDWR)         = 9
getrlimit(RLIMIT_NOFILE, {rlim_cur=1024, rlim_max=1024}) = 0
fstat(407, 0xbfffaf58)                  = -1 EBADF (Bad file descriptor)
dup2(9, 407)                            = 407
close(9)                                = 0
fcntl(407, F_SETFD, FD_CLOEXEC)         = 0
fcntl(407, F_GETFL)                     = 0x2 (flags O_RDWR)
fcntl(407, F_SETLK, {type=F_WRLCK, whence=SEEK_SET, start=0, len=0}) = 0
stat("/dev/raw/raw100", {st_mode=S_IFCHR|0660, st_rdev=makedev(162, 100), ...}) = 0
open("/dev/raw/raw100", O_RDWR)         = 9
lseek(9, 0, SEEK_SET)                   = 0
write(9, "\0\0\0\0\0\20\0\0\377\377\377\377]\\[Z\0\0\0\0\0\0\0\0"..., 4096) = 4096
lseek(9, 4294966784, SEEK_SET)          = -1 EINVAL (Invalid argument)
close(9)                                = 0
fcntl(407, F_SETLK, {type=F_UNLCK, whence=SEEK_SET, start=0, len=0}) = 0
close(407)                              = 0
stat("/dev/raw/raw100", {st_mode=S_IFCHR|0660, st_rdev=makedev(162, 100), ...}) = 0
open("/dev/raw/raw100", O_RDONLY)       = 9
close(9)                                = 0
gettimeofday({975703953, 657435}, NULL) = 0
open("/dev/raw/raw100", O_RDWR)         = 9
getrlimit(RLIMIT_NOFILE, {rlim_cur=1024, rlim_max=1024}) = 0
fstat(407, 0xbfffb378)                  = -1 EBADF (Bad file descriptor)
dup2(9, 407)                            = 407
close(9)                                = 0
fcntl(407, F_SETFD, FD_CLOEXEC)         = 0
pwrite(407, "\0\2\0\0\1\0\0\0\0\0\0\0\0\0\1\1\0\0\0\0\0\0\0\0\0\0\0"..., 262144, 4096) = -1 EINVAL (Invalid argument)
pwrite(407, "\0\2\0\0A\0\0\0\0\0\0\0\0\0\1\1\0\0\0\0\0\0\0\0\0\0\0\0"..., 262144, 266240) = -1 EINVAL (Invalid argument)
pwrite(407, "\0\2\0\0\201\0\0\0\0\0\0\0\0\0\1\1\0\0\0\0\0\0\0\0\0\0"..., 262144, 528384) = -1 EINVAL (Invalid argument)
pwrite(407, "\0\2\0\0\301\0\0\0\0\0\0\0\0\0\1\1\0\0\0\0\0\0\0\0\0\0"..., 262144, 790528) = -1 EINVAL (Invalid argument)
stat("/dev/raw/raw100", {st_mode=S_IFCHR|0660, st_rdev=makedev(162, 100), ...}) = 0
open("/dev/raw/raw100", O_RDWR)         = 9
lseek(9, 0, SEEK_SET)                   = 0
write(9, "\0\0\0\0\0\20\0\0\0\1\0\0]\\[Z\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
lseek(9, 1052160, SEEK_SET)             = 1052160
read(9, 0x92e4800, 512)                 = -1 EINVAL (Invalid argument)
close(9)                                = 0
fcntl(407, F_SETLK, {type=F_UNLCK, whence=SEEK_SET, start=0, len=0}) = 0
close(407)                              = 0
gettimeofday({975703953, 665286}, NULL) = 0
gettimeofday({975703953, 665470}, NULL) = 0
close(6)                                = 0
open("/usr/oracle/dbs/orcl/bgdump/alert_orcl.log", O_WRONLY|O_APPEND|O_CREAT, 0664) = 6
... "ORA-19502 signalled during: crea"
