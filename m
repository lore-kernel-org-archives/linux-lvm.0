Date: Sat, 31 Jul 1999 22:44:51 -0400
From: root <root@gate.penguinpowered.com>
Message-Id: <199908010244.WAA02156@gate.penguinpowered.com>
Subject: [linux-lvm] Sparc woes
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hey all, I'm sending this from my home machine, monitoring the mailing list 
archives for a response as my email is down.

I've been trying to get LVM to work on my Redhat 6.0 based Sparc.

I download 2.2.10, applied the patch from the ftp site and have successfully
built LVM as a module.  Unlike the intel box at work which I built LVM on, it
doesn't show up in the config menu automatically, I have to manually add the
four lines from drivers/block/config.in to the arch/sparc/Config.in file.
If I compile it into the kernel, the kernel won't boot (I get the hitchhikers
face and a kernel oops on swapper...) but as a module:

[root@gate lvmtesting]# modprobe lvm
[root@gate lvmtesting]# lsmod
Module                  Size  Used by
lvm                    28872   0  (unused)  

good stuff...

now, when I run any of the 0.7 tools, odd things happen -- specifically, a
device file gets created in the current directory, and the name of the device
file is the name of a data structure, with a couple of characters chopped off
the front - any help would be appreciated:

[root@gate lvmtesting]# ls -al
total 2
drwxr-xr-x   2 root     root         1024 Jul 31 22:32 .
drwxr-x---   5 root     root         1024 Jul 31 22:30 ..
-rw-r--r--   1 root     root            0 Jul 31 22:32 message
[root@gate lvmtesting]# vgscan -d
vm_tab_writeervgscan -- LVM driver/module not loaded?

[root@gate lvmtesting]# ls -al
total 2
drwxr-xr-x   2 root     root         1024 Jul 31 22:32 .
drwxr-x---   5 root     root         1024 Jul 31 22:30 ..
crw-r-----   1 root     root     109,   0 Jul 31 22:32 atus_byindex
-rw-r--r--   1 root     root            0 Jul 31 22:32 message
[root@gate lvmtesting]# strace vgscan -d
execve("/sbin/vgscan", ["vgscan", "-d"], [/* 18 vars */]) = 0
brk(0)                                  = 0x22228
open("/etc/ld.so.preload", O_RDONLY)    = -1 ENOENT (No such file or directory)
open("/raid/LVM/0.7/tools/lib/liblvm.so", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=195552, ...}) = 0
read(3, "\177ELF\1\2\1\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
mmap(0, 244440, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x5002a000
mprotect(0x50053000, 76504, PROT_NONE)  = 0
mmap(0x5005a000, 36864, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0x20000) = 0x5005a000
mmap(0x50063000, 10968, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x50063000
close(3)                                = 0
open("/raid/LVM/0.7/tools/lib/libc.so.6", O_RDONLY) = -1 ENOENT (No such file or directory)
open("/lib/libc.so.6", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=4237650, ...}) = 0
read(3, "\177ELF\1\2\1\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
mmap(0, 1065572, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x50066000
mprotect(0x5014e000, 115300, PROT_NONE) = 0
mmap(0x50156000, 61440, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0xe0000) = 0x50156000
mmap(0x50165000, 21092, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x50165000
close(3)                                = 0
mprotect(0x5002a000, 167936, PROT_READ|PROT_WRITE) = 0
mprotect(0x5002a000, 167936, PROT_READ|PROT_EXEC) = 0
personality(PER_LINUX)                  = 0
getpid()                                = 2118
getuid()                                = 0
geteuid()                               = 0
fstat(1, {st_mode=S_IFCHR|0600, st_rdev=makedev(3, 2), ...}) = 0
mmap(0, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x50019000
ioctl(1, TCGETS, {B9600 opost isig icanon echo ...}) = 0
write(1, "vm_tab_write", 12vm_tab_write)            = 12
stat("atus_byindex", {st_mode=S_IFCHR|0640, st_rdev=makedev(109, 0), ...}) = 0
open("eck_exist_all_vg", O_RDONLY)      = -1 ENOENT (No such file or directory)
write(1, "er", 2er)                       = 2
write(2, "vgscan -- LVM driver/module not "..., 41vgscan -- LVM driver/module not loaded?)                             = 41
munmap(0x50019000, 8192)                = 0
exit(95)                                = ?


Simon Galton
(at home)
Please reply to list... :)
