Return-Path: <diedvdyk@jedi.van-dijk.net>
From: Diederick van Dijk <diedvdyk@jedi.van-dijk.net>
Subject: Re: [linux-lvm] Problem with UUID, vgscan, vgcfgrestore
Date: Wed, 4 Apr 2001 00:15:52 +0200
References: <200104032136.f33LaKu17343@webber.adilger.int>
In-Reply-To: <200104032136.f33LaKu17343@webber.adilger.int>
MIME-Version: 1.0
Message-Id: <01040400155200.00918@darkvader>
Content-Transfer-Encoding: 8bit
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

On Tuesday 03 April 2001 23:36, you wrote:
> Diederick van Dijk writes:
> > Diederick van Dijk writes:
> > > My current system is on kernel 2.4.2 with LVM support build into the
> > > kernel. So I booted with a 2.2.18 kernel with no LVM support what so
> > > ever and the dd commands worked fine. Then I booted with the 2.4.2
> > > kernel again and did a vgscan and this worked too ! I checked the
> > > UUID's on the PV's with pvdata -U /dev/hdxx and the UUID lists are now
> > > as they have to be. If guess that LVM support in the kernel and dd were
> > > in conflict. To check that I will boot with a 2.4.2 kernel without LVM
> > > support and try the dd dd commands later on.
> >
> > Ok, I tested the dd commands with the 2.4.2 kernel without LVM support
> > and had no success.
>
> Strange.  I just tried (on a 2.4.2 kernel):
>
> # dd if=/dev/hda2 bs=1 skip=44 count=128 of=/tmp/uuids
> 128+0 records in
> 128+0 records out
> # dd of=/dev/hda2 bs=1 seek=44 count=128 if=/tmp/uuids
> 128+0 records in
> 128+0 records out
>
> It worked with no problems.  Maybe there is something strange about the
> version of dd that you have?  I have:
>
> # dd --version
> dd (GNU fileutils) 4.0.35

]# dd --version
dd (GNU fileutils) 4.0p

>
> Can you try running "strace dd of=/dev/hda2 bs=1 seek=6144 if=/tmp/uuids"
> and see where it gets the error from?

# strace dd of=/dev/hda2 bs=1 seek=6144 if=/etc/uuids
execve("/bin/dd", ["dd", "of=/dev/hda2", "bs=1", "seek=6144", 
"if=/etc/uuids"],
[/* 25 vars */]) = 0
brk(0)                                  = 0x8050848
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) 
= 0
x40013000
open("/etc/ld.so.preload", O_RDONLY)    = -1 ENOENT (No such file or 
directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=33088, ...}) = 0
old_mmap(NULL, 33088, PROT_READ, MAP_PRIVATE, 3, 0) = 0x40014000
close(3)                                = 0
open("/lib/libc.so.6", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=931668, ...}) = 0
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\210\215"..., 4096) = 
40
96
old_mmap(NULL, 946076, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x4001d000
mprotect(0x400fc000, 32668, PROT_NONE)  = 0
old_mmap(0x400fc000, 20480, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 
0xde
000) = 0x400fc000
old_mmap(0x40101000, 12188, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_ANON
YMOUS, -1, 0) = 0x40101000
close(3)                                = 0
mprotect(0x4001d000, 913408, PROT_READ|PROT_WRITE) = 0
mprotect(0x4001d000, 913408, PROT_READ|PROT_EXEC) = 0
munmap(0x40014000, 33088)               = 0
getpid()                                = 2928
brk(0)                                  = 0x8050848
brk(0x8050880)                          = 0x8050880
brk(0x8051000)                          = 0x8051000
close(0)                                = 0
open("/etc/uuids", O_RDONLY|O_LARGEFILE) = 0
close(1)                                = 0
open("/dev/hda2", O_RDWR|O_CREAT|O_LARGEFILE, 0666) = 1
ftruncate64(0x1, 0x1800, 0, 0, 0x1)     = -1 EINVAL (Invalid argument)
write(2, "dd: ", 4dd: )                     = 4
write(2, "/dev/hda2", 9/dev/hda2)                = 9
write(2, ": Invalid argument", 18: Invalid argument)      = 18
write(2, "\n", 1
)                       = 1
_exit(1)                                = ?

Thanks,

Diederick
