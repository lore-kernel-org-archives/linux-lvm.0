Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6DN3i026444
	for <linux-lvm@redhat.com>; Tue, 13 Jul 2004 19:03:44 -0400
Received: from mail.osdl.org (fw.osdl.org [65.172.181.6])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i6DN3bXn017623
	for <linux-lvm@redhat.com>; Tue, 13 Jul 2004 19:03:37 -0400
Date: Tue, 13 Jul 2004 16:03:31 -0700
From: Dave Olien <dmo@osdl.org>
Message-ID: <20040713230331.GA12061@osdl.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Problems with LVM2 creating large numbers of volumes.
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com



I've been experimenting with the LVM2, creating lots of logical volumes.
I'm using shell scripts that create 250 logical volumes in vg1 (lvol0 through
lvol249, then 250 logical volumes in vg2 (lvol0 through lvol249),
then 250 logical volumes in vg3 (lvol0 through lvol249).
Beginning in volume group vg3, I get some behavior I can't explain.

The logical volumes lvol0 through lvol26 in vg3 are created as expected.
Then the lvcreate command that creates logical volume lvol27 first
creates lvol27 and then deletes the symlinks and device nodes for logical
volumes lvol0 through lvol26.

This pattern repeats every 28 logical volumes.  Logical volumes lvol27
through lvol53 are created, then the creation of lvol54 deletes the
previously created logical volumes.

Notice in the strace output below for the creation of vg3/lvol27,
just after the mknod() of /dev/mapper/vg3-lvol27, begins a series of
unlink()'s of previously created nodes in /dev/mapper.  Then later on,
it unlinks() the symlinks in /dev/vg3 for previously created volumes.

This is with linux 2.6.7, LVM2.2.00.20, device-mapper.1.00.19
I also tried the latest CVS trees of device-mapper and LVM2 tools.

Any idea what's happening here?

Thanks!
Dave Olien

execve("/sbin/lvcreate", ["lvcreate", "--extents", "1", "vg3"], [/* 22 vars */]) = 0
uname({sys="Linux", node="dev8-001", ...}) = 0
brk(0)                                  = 0x80a0000
open("/etc/ld.so.preload", O_RDONLY)    = -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=126154, ...}) = 0
old_mmap(NULL, 126154, PROT_READ, MAP_PRIVATE, 3, 0) = 0xb7fe1000
close(3)                                = 0
open("/lib/libdevmapper.so.1.00", O_RDONLY) = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0@\20\0\000"..., 512) = 512
fstat64(3, {st_mode=S_IFREG|0555, st_size=24270, ...}) = 0
old_mmap(NULL, 22360, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0xb7fdb000
old_mmap(0xb7fdf000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x3000) = 0xb7fdf000
close(3)                                = 0
open("/usr/lib/libreadline.so.4", O_RDONLY) = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0@\376\\"..., 512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=172944, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb7fda000
old_mmap(0x5c5000, 174292, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x5c5000
old_mmap(0x5eb000, 16384, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x26000) = 0x5eb000
old_mmap(0x5ef000, 2260, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x5ef000
close(3)                                = 0
open("/lib/libselinux.so.1", O_RDONLY)  = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\350qT\000"..., 512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=60776, ...}) = 0
old_mmap(0x544000, 64532, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x544000
old_mmap(0x552000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0xd000) = 0x552000
close(3)                                = 0
open("/lib/libdl.so.2", O_RDONLY)       = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\300x\204"..., 512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=16708, ...}) = 0
old_mmap(0x846000, 12412, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x846000
old_mmap(0x848000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x1000) = 0x848000
close(3)                                = 0
open("/usr/lib/libncurses.so.5", O_RDONLY) = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0000\201"..., 512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=2748455, ...}) = 0
old_mmap(0x4a7a000, 261420, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x4a7a000
old_mmap(0x4ab1000, 36864, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x36000) = 0x4ab1000
close(3)                                = 0
open("/lib/tls/libc.so.6", O_RDONLY)    = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\300\213"..., 512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=1455084, ...}) = 0
old_mmap(0x704000, 1158124, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x704000
old_mmap(0x819000, 16384, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x115000) = 0x819000
old_mmap(0x81d000, 7148, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x81d000
close(3)                                = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb7fd9000
mprotect(0x819000, 8192, PROT_READ)     = 0
mprotect(0x848000, 4096, PROT_READ)     = 0
mprotect(0x6fc000, 4096, PROT_READ)     = 0
set_thread_area({entry_number:-1 -> 6, base_addr:0xb7fd9580, limit:1048575, seg_32bit:1, contents:0, read_exec_only:0, limit_in_pages:1, seg_not_present:0, useable:1}) = 0
munmap(0xb7fe1000, 126154)              = 0
brk(0)                                  = 0x80a0000
brk(0x80c1000)                          = 0x80c1000
open("/proc/mounts", O_RDONLY)          = 3
fstat64(3, {st_mode=S_IFREG|0444, st_size=0, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb7fff000
read(3, "rootfs / rootfs rw 0 0\n/dev/root"..., 1024) = 291
read(3, "", 1024)                       = 0
close(3)                                = 0
munmap(0xb7fff000, 4096)                = 0
open("/usr/lib/locale/locale-archive", O_RDONLY|O_LARGEFILE) = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=40263104, ...}) = 0
mmap2(NULL, 2097152, PROT_READ, MAP_PRIVATE, 3, 0) = 0xb7dd9000
close(3)                                = 0
stat64("/etc/lvm", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
stat64("/etc/lvm/lvm.conf", {st_mode=S_IFREG|0644, st_size=10073, ...}) = 0
stat64("/etc/lvm/lvm.conf", {st_mode=S_IFREG|0644, st_size=10073, ...}) = 0
open("/etc/lvm/lvm.conf", O_RDONLY|O_LARGEFILE) = 3
mmap2(NULL, 10073, PROT_READ, MAP_PRIVATE, 3, 0) = 0xb7dd6000
munmap(0xb7dd6000, 10073)               = 0
close(3)                                = 0
time(NULL)                              = 1089339570
open("/etc/localtime", O_RDONLY)        = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=844, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb7dd8000
read(3, "TZif\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\5\0\0\0\5\0"..., 4096) = 844
close(3)                                = 0
munmap(0xb7dd8000, 4096)                = 0
open("/usr/lib/gconv/gconv-modules.cache", O_RDONLY) = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=21512, ...}) = 0
mmap2(NULL, 21512, PROT_READ, MAP_SHARED, 3, 0) = 0xb7dd3000
close(3)                                = 0
uname({sys="Linux", node="dev8-001", ...}) = 0
umask(077)                              = 022
stat64("/dev", {st_mode=S_IFDIR|0755, st_size=118784, ...}) = 0
open("/proc/mounts", O_RDONLY|O_LARGEFILE) = 3
fstat64(3, {st_mode=S_IFREG|0444, st_size=0, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb7dd2000
read(3, "rootfs / rootfs rw 0 0\n/dev/root"..., 1024) = 291
close(3)                                = 0
munmap(0xb7dd2000, 4096)                = 0
open("/proc/devices", O_RDONLY|O_LARGEFILE) = 3
fstat64(3, {st_mode=S_IFREG|0444, st_size=0, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb7dd2000
read(3, "Character devices:\n  1 mem\n  2 p"..., 1024) = 385
read(3, "", 1024)                       = 0
close(3)                                = 0
munmap(0xb7dd2000, 4096)                = 0
stat64("/etc/lvm/.cache", {st_mode=S_IFREG|0600, st_size=719, ...}) = 0
stat64("/etc/lvm/.cache", {st_mode=S_IFREG|0600, st_size=719, ...}) = 0
open("/etc/lvm/.cache", O_RDONLY|O_LARGEFILE) = 3
mmap2(NULL, 719, PROT_READ, MAP_PRIVATE, 3, 0) = 0xb7dd2000
munmap(0xb7dd2000, 719)                 = 0
close(3)                                = 0
stat64("/dev/rd/c0d0", {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 0), ...}) = 0
stat64("/dev/sdh", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 112), ...}) = 0
stat64("/dev/sdo", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 224), ...}) = 0
stat64("/dev/rd/c0d1", {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 8), ...}) = 0
stat64("/dev/sdv", {st_mode=S_IFBLK|0660, st_rdev=makedev(65, 80), ...}) = 0
stat64("/dev/rd/c0d3", {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 24), ...}) = 0
stat64("/dev/rd/c0d4", {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 32), ...}) = 0
stat64("/dev/rd/c0d7", {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 56), ...}) = 0
stat64("/dev/sdb", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 16), ...}) = 0
stat64("/dev/sdn", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 208), ...}) = 0
stat64("/dev/sdt", {st_mode=S_IFBLK|0660, st_rdev=makedev(65, 48), ...}) = 0
stat64("/dev/sda6", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 6), ...}) = 0
stat64("/dev/rd/c0d2", {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 16), ...}) = 0
stat64("/dev/rd/c0d8", {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 64), ...}) = 0
stat64("/dev/rd/c0d9", {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 72), ...}) = 0
stat64("/dev/sdf", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 80), ...}) = 0
stat64("/dev/sdp", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 240), ...}) = 0
stat64("/dev/sda5", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 5), ...}) = 0
stat64("/dev/sdg", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 96), ...}) = 0
stat64("/dev/sdj", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 144), ...}) = 0
stat64("/dev/sdk", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 160), ...}) = 0
stat64("/dev/sda1", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 1), ...}) = 0
stat64("/dev/sdb1", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 17), ...}) = 0
stat64("/dev/sdc", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 32), ...}) = 0
stat64("/dev/sdq", {st_mode=S_IFBLK|0660, st_rdev=makedev(65, 0), ...}) = 0
stat64("/dev/rd/c0d5", {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 40), ...}) = 0
stat64("/dev/sdi", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 128), ...}) = 0
stat64("/dev/sdm", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 192), ...}) = 0
stat64("/dev/sdu", {st_mode=S_IFBLK|0660, st_rdev=makedev(65, 64), ...}) = 0
stat64("/dev/sdb2", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 18), ...}) = 0
stat64("/dev/sda2", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 2), ...}) = 0
stat64("/dev/rd/c0d6", {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 48), ...}) = 0
stat64("/dev/sdl", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 176), ...}) = 0
stat64("/dev/sda", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 0), ...}) = 0
stat64("/dev/sdd", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 48), ...}) = 0
stat64("/dev/sde", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 64), ...}) = 0
stat64("/dev/sdr", {st_mode=S_IFBLK|0660, st_rdev=makedev(65, 16), ...}) = 0
stat64("/dev/sds", {st_mode=S_IFBLK|0660, st_rdev=makedev(65, 32), ...}) = 0
stat64("/dev/sda4", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 4), ...}) = 0
stat64("/dev/sda3", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 3), ...}) = 0
stat64("/dev/sdb3", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 19), ...}) = 0
time(NULL)                              = 1089339570
getpid()                                = 32674
stat64("/etc/lvm/archive", {st_mode=S_IFDIR|0700, st_size=81920, ...}) = 0
stat64("/etc/lvm/backup", {st_mode=S_IFDIR|0700, st_size=4096, ...}) = 0
stat64("/etc/lvm/lvm.conf", {st_mode=S_IFREG|0644, st_size=10073, ...}) = 0
stat64("/var/lock/lvm", {st_mode=S_IFDIR|0700, st_size=4096, ...}) = 0
access("/var/lock/lvm", R_OK|W_OK|X_OK) = 0
open("/dev/mapper/control", O_RDWR)     = 3
brk(0)                                  = 0x80c1000
brk(0x80e4000)                          = 0x80e4000
ioctl(3, DM_VERSION, 0x80bf1c0)         = 0
brk(0)                                  = 0x80e4000
brk(0)                                  = 0x80e4000
brk(0x80e0000)                          = 0x80e0000
brk(0)                                  = 0x80e0000
ioctl(3, DM_LIST_VERSIONS, 0x80bf1c0)   = 0
ioctl(3, DM_LIST_VERSIONS, 0x80bf1c0)   = 0
stat64("/proc/lvm/VGs/vg3", 0xbffff7a0) = -1 ENOENT (No such file or directory)
rt_sigprocmask(SIG_SETMASK, ~[RTMIN], [], 8) = 0
open("/var/lock/lvm/V_vg3", O_RDWR|O_APPEND|O_CREAT|O_LARGEFILE, 0777) = 4
rt_sigaction(SIGINT, {0x8088134, [INT], SA_RESTART}, {SIG_DFL}, 8) = 0
rt_sigprocmask(SIG_SETMASK, ~[INT RTMIN], NULL, 8) = 0
rt_sigaction(SIGINT, NULL, {0x8088134, [INT], SA_RESTART}, 8) = 0
rt_sigaction(SIGINT, {0x8088134, [INT], 0}, NULL, 8) = 0
flock(4, LOCK_EX)                       = 0
rt_sigaction(SIGINT, NULL, {0x8088134, [INT], 0}, 8) = 0
rt_sigaction(SIGINT, {0x8088134, [INT], SA_RESTART}, NULL, 8) = 0
rt_sigprocmask(SIG_SETMASK, ~[RTMIN], NULL, 8) = 0
rt_sigaction(SIGINT, {SIG_DFL}, {0x8088134, [INT], SA_RESTART}, 8) = 0
stat64("/var/lock/lvm/V_vg3", {st_mode=S_IFREG|0700, st_size=0, ...}) = 0
fstat64(4, {st_mode=S_IFREG|0700, st_size=0, ...}) = 0
stat64("/dev/sda", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 0), ...}) = 0
stat64("/dev/sda", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 0), ...}) = 0
open("/dev/sda", O_RDWR|O_DIRECT|O_LARGEFILE) = 5
fstat64(5, {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 0), ...}) = 0
ioctl(5, BLKBSZGET, 0xbfffed38)         = 0
_llseek(5, 0, [0], SEEK_SET)            = 0
read(5, "\372\353|lbaLILO\1\0\25\0046\0$\0\1cC\370\345@\7\"\200"..., 4096) = 4096
stat64("/dev/rd/c0d0", {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 0), ...}) = 0
stat64("/dev/rd/c0d0", {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 0), ...}) = 0
open("/dev/rd/c0d0", O_RDWR|O_DIRECT|O_LARGEFILE) = 6
fstat64(6, {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 0), ...}) = 0
ioctl(6, BLKBSZGET, 0xbfffed38)         = 0
_llseek(6, 0, [0], SEEK_SET)            = 0
read(6, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(6, BLKBSZGET, 0xbffff458)         = 0
_llseek(6, 0, [0], SEEK_SET)            = 0
read(6, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(6, BLKBSZGET, 0xbffff488)         = 0
_llseek(6, 188416, [188416], SEEK_SET)  = 0
read(6, "vg1 {\nid = \"EtPxtg-t1Bc-AOd3-mW2"..., 4096) = 4096
stat64("/dev/sdq", {st_mode=S_IFBLK|0660, st_rdev=makedev(65, 0), ...}) = 0
stat64("/dev/sdq", {st_mode=S_IFBLK|0660, st_rdev=makedev(65, 0), ...}) = 0
open("/dev/sdq", O_RDWR|O_DIRECT|O_LARGEFILE) = 7
fstat64(7, {st_mode=S_IFBLK|0660, st_rdev=makedev(65, 0), ...}) = 0
ioctl(7, BLKBSZGET, 0xbfffed38)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbffff458)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbffff488)         = 0
_llseek(7, 77824, [77824], SEEK_SET)    = 0
read(7, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
stat64("/dev/sda1", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 1), ...}) = 0
stat64("/dev/sda1", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 1), ...}) = 0
open("/dev/sda1", O_RDWR|O_DIRECT|O_LARGEFILE) = 8
fstat64(8, {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 1), ...}) = 0
ioctl(8, BLKBSZGET, 0xbfffed38)         = 0
_llseek(8, 0, [0], SEEK_SET)            = 0
read(8, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 2048) = 2048
stat64("/dev/sda2", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 2), ...}) = 0
stat64("/dev/sda2", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 2), ...}) = 0
open("/dev/sda2", O_RDWR|O_DIRECT|O_LARGEFILE) = 9
fstat64(9, {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 2), ...}) = 0
ioctl(9, BLKBSZGET, 0xbfffed38)         = 0
_llseek(9, 0, [0], SEEK_SET)            = 0
read(9, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
stat64("/dev/sda3", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 3), ...}) = 0
stat64("/dev/sda3", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 3), ...}) = 0
open("/dev/sda3", O_RDWR|O_DIRECT|O_LARGEFILE) = 10
fstat64(10, {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 3), ...}) = 0
ioctl(10, BLKBSZGET, 0xbfffed38)        = 0
_llseek(10, 0, [0], SEEK_SET)           = 0
read(10, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
stat64("/dev/sda4", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 4), ...}) = 0
stat64("/dev/sda4", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 4), ...}) = 0
open("/dev/sda4", O_RDWR|O_DIRECT|O_LARGEFILE) = 11
fstat64(11, {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 4), ...}) = 0
ioctl(11, BLKBSZGET, 0xbfffed38)        = 0
_llseek(11, 0, [0], SEEK_SET)           = 0
read(11, 0xbfffe400, 2048)              = -1 EIO (Input/output error)
stat64("/dev/sda5", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 5), ...}) = 0
stat64("/dev/sda5", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 5), ...}) = 0
open("/dev/sda5", O_RDWR|O_DIRECT|O_LARGEFILE) = 12
fstat64(12, {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 5), ...}) = 0
ioctl(12, BLKBSZGET, 0xbfffed38)        = 0
_llseek(12, 0, [0], SEEK_SET)           = 0
read(12, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
stat64("/dev/sda6", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 6), ...}) = 0
stat64("/dev/sda6", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 6), ...}) = 0
open("/dev/sda6", O_RDWR|O_DIRECT|O_LARGEFILE) = 13
fstat64(13, {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 6), ...}) = 0
ioctl(13, BLKBSZGET, 0xbfffed38)        = 0
_llseek(13, 0, [0], SEEK_SET)           = 0
read(13, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
stat64("/dev/rd/c0d1", {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 8), ...}) = 0
stat64("/dev/rd/c0d1", {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 8), ...}) = 0
open("/dev/rd/c0d1", O_RDWR|O_DIRECT|O_LARGEFILE) = 14
fstat64(14, {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 8), ...}) = 0
ioctl(14, BLKBSZGET, 0xbfffed38)        = 0
_llseek(14, 0, [0], SEEK_SET)           = 0
read(14, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(14, BLKBSZGET, 0xbffff458)        = 0
_llseek(14, 0, [0], SEEK_SET)           = 0
read(14, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(14, BLKBSZGET, 0xbffff488)        = 0
_llseek(14, 184320, [184320], SEEK_SET) = 0
read(14, "segment1 {\nstart_extent = 0\nexte"..., 4096) = 4096
stat64("/dev/sdb", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 16), ...}) = 0
stat64("/dev/sdb", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 16), ...}) = 0
open("/dev/sdb", O_RDWR|O_DIRECT|O_LARGEFILE) = 15
fstat64(15, {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 16), ...}) = 0
ioctl(15, BLKBSZGET, 0xbfffed38)        = 0
_llseek(15, 0, [0], SEEK_SET)           = 0
read(15, "llllllllllllllllllllllllllllllll"..., 2048) = 2048
stat64("/dev/rd/c0d2", {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 16), ...}) = 0
stat64("/dev/rd/c0d2", {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 16), ...}) = 0
open("/dev/rd/c0d2", O_RDWR|O_DIRECT|O_LARGEFILE) = 16
fstat64(16, {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 16), ...}) = 0
ioctl(16, BLKBSZGET, 0xbfffed38)        = 0
_llseek(16, 0, [0], SEEK_SET)           = 0
read(16, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(16, BLKBSZGET, 0xbffff458)        = 0
_llseek(16, 0, [0], SEEK_SET)           = 0
read(16, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(16, BLKBSZGET, 0xbffff488)        = 0
_llseek(16, 184320, [184320], SEEK_SET) = 0
read(16, "s = [\n\"pv3\", 43\n]\n}\n}\n\nlvol242 {"..., 4096) = 4096
stat64("/dev/sdr", {st_mode=S_IFBLK|0660, st_rdev=makedev(65, 16), ...}) = 0
stat64("/dev/sdr", {st_mode=S_IFBLK|0660, st_rdev=makedev(65, 16), ...}) = 0
open("/dev/sdr", O_RDWR|O_DIRECT|O_LARGEFILE) = 17
fstat64(17, {st_mode=S_IFBLK|0660, st_rdev=makedev(65, 16), ...}) = 0
ioctl(17, BLKBSZGET, 0xbfffed38)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbffff458)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbffff488)        = 0
_llseek(17, 77824, [77824], SEEK_SET)   = 0
read(17, " i686\ncreation_time = 1089339567"..., 4096) = 4096
stat64("/dev/sdb1", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 17), ...}) = 0
stat64("/dev/sdb1", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 17), ...}) = 0
open("/dev/sdb1", O_RDWR|O_DIRECT|O_LARGEFILE) = 18
fstat64(18, {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 17), ...}) = 0
ioctl(18, BLKBSZGET, 0xbfffed38)        = 0
_llseek(18, 0, [0], SEEK_SET)           = 0
read(18, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
stat64("/dev/sdb2", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 18), ...}) = 0
stat64("/dev/sdb2", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 18), ...}) = 0
open("/dev/sdb2", O_RDWR|O_DIRECT|O_LARGEFILE) = 19
fstat64(19, {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 18), ...}) = 0
ioctl(19, BLKBSZGET, 0xbfffed38)        = 0
_llseek(19, 0, [0], SEEK_SET)           = 0
read(19, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
stat64("/dev/sdb3", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 19), ...}) = 0
stat64("/dev/sdb3", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 19), ...}) = 0
open("/dev/sdb3", O_RDWR|O_DIRECT|O_LARGEFILE) = 20
fstat64(20, {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 19), ...}) = 0
ioctl(20, BLKBSZGET, 0xbfffed38)        = 0
_llseek(20, 0, [0], SEEK_SET)           = 0
read(20, "\363\377\377\377\377\377\377\377\377\377\377\377\377\377"..., 4096) = 4096
stat64("/dev/rd/c0d3", {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 24), ...}) = 0
stat64("/dev/rd/c0d3", {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 24), ...}) = 0
open("/dev/rd/c0d3", O_RDWR|O_DIRECT|O_LARGEFILE) = 21
fstat64(21, {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 24), ...}) = 0
ioctl(21, BLKBSZGET, 0xbfffed38)        = 0
_llseek(21, 0, [0], SEEK_SET)           = 0
read(21, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(21, BLKBSZGET, 0xbffff458)        = 0
_llseek(21, 0, [0], SEEK_SET)           = 0
read(21, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(21, BLKBSZGET, 0xbffff488)        = 0
_llseek(21, 184320, [184320], SEEK_SET) = 0
read(21, " \"WRITE\", \"VISIBLE\"]\nsegment_cou"..., 4096) = 4096
stat64("/dev/sdc", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 32), ...}) = 0
stat64("/dev/sdc", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 32), ...}) = 0
open("/dev/sdc", O_RDWR|O_DIRECT|O_LARGEFILE) = 22
fstat64(22, {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 32), ...}) = 0
ioctl(22, BLKBSZGET, 0xbfffed38)        = 0
_llseek(22, 0, [0], SEEK_SET)           = 0
read(22, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 2048) = 2048
ioctl(22, BLKBSZGET, 0xbffff458)        = 0
_llseek(22, 2048, [2048], SEEK_SET)     = 0
read(22, "\36\274\16\317 LVM2 x[5A%r0N*>\1\0\0\0\0\10\0\0\0\0\0\0"..., 512) = 512
ioctl(22, BLKBSZGET, 0xbffff488)        = 0
_llseek(22, 14848, [14848], SEEK_SET)   = 0
read(22, "vg4 {\nid = \"dWOHdO-Zt0P-4ZRx-UHr"..., 512) = 512
stat64("/dev/rd/c0d4", {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 32), ...}) = 0
stat64("/dev/rd/c0d4", {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 32), ...}) = 0
open("/dev/rd/c0d4", O_RDWR|O_DIRECT|O_LARGEFILE) = 23
fstat64(23, {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 32), ...}) = 0
ioctl(23, BLKBSZGET, 0xbfffed38)        = 0
_llseek(23, 0, [0], SEEK_SET)           = 0
read(23, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(23, BLKBSZGET, 0xbffff458)        = 0
_llseek(23, 0, [0], SEEK_SET)           = 0
read(23, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(23, BLKBSZGET, 0xbffff488)        = 0
_llseek(23, 184320, [184320], SEEK_SET) = 0
read(23, "vg1 {\nid = \"EtPxtg-t1Bc-AOd3-mW2"..., 4096) = 4096
stat64("/dev/sds", {st_mode=S_IFBLK|0660, st_rdev=makedev(65, 32), ...}) = 0
stat64("/dev/sds", {st_mode=S_IFBLK|0660, st_rdev=makedev(65, 32), ...}) = 0
open("/dev/sds", O_RDWR|O_DIRECT|O_LARGEFILE) = 24
fstat64(24, {st_mode=S_IFBLK|0660, st_rdev=makedev(65, 32), ...}) = 0
ioctl(24, BLKBSZGET, 0xbfffed38)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbffff458)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbffff488)        = 0
_llseek(24, 73728, [73728], SEEK_SET)   = 0
read(24, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
stat64("/dev/rd/c0d5", {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 40), ...}) = 0
stat64("/dev/rd/c0d5", {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 40), ...}) = 0
open("/dev/rd/c0d5", O_RDWR|O_DIRECT|O_LARGEFILE) = 25
fstat64(25, {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 40), ...}) = 0
ioctl(25, BLKBSZGET, 0xbfffed38)        = 0
_llseek(25, 0, [0], SEEK_SET)           = 0
read(25, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(25, BLKBSZGET, 0xbffff458)        = 0
_llseek(25, 0, [0], SEEK_SET)           = 0
read(25, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(25, BLKBSZGET, 0xbffff488)        = 0
_llseek(25, 188416, [188416], SEEK_SET) = 0
read(25, "vg2 {\nid = \"QB7IOR-91VD-xnK2-z1a"..., 4096) = 4096
stat64("/dev/sdd", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 48), ...}) = 0
stat64("/dev/sdd", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 48), ...}) = 0
open("/dev/sdd", O_RDWR|O_DIRECT|O_LARGEFILE) = 26
fstat64(26, {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 48), ...}) = 0
ioctl(26, BLKBSZGET, 0xbfffed38)        = 0
_llseek(26, 0, [0], SEEK_SET)           = 0
read(26, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 2048) = 2048
ioctl(26, BLKBSZGET, 0xbffff458)        = 0
_llseek(26, 2048, [2048], SEEK_SET)     = 0
read(26, "B\326\\  LVM2 x[5A%r0N*>\1\0\0\0\0\10\0\0\0\0\0\0"..., 512) = 512
ioctl(26, BLKBSZGET, 0xbffff488)        = 0
_llseek(26, 13824, [13824], SEEK_SET)   = 0
read(26, "vg4 {\nid = \"dWOHdO-Zt0P-4ZRx-UHr"..., 512) = 512
stat64("/dev/rd/c0d6", {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 48), ...}) = 0
stat64("/dev/rd/c0d6", {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 48), ...}) = 0
open("/dev/rd/c0d6", O_RDWR|O_DIRECT|O_LARGEFILE) = 27
fstat64(27, {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 48), ...}) = 0
ioctl(27, BLKBSZGET, 0xbfffed38)        = 0
_llseek(27, 0, [0], SEEK_SET)           = 0
read(27, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(27, BLKBSZGET, 0xbffff458)        = 0
_llseek(27, 0, [0], SEEK_SET)           = 0
read(27, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(27, BLKBSZGET, 0xbffff488)        = 0
_llseek(27, 184320, [184320], SEEK_SET) = 0
read(27, "segment1 {\nstart_extent = 0\nexte"..., 4096) = 4096
stat64("/dev/sdt", {st_mode=S_IFBLK|0660, st_rdev=makedev(65, 48), ...}) = 0
stat64("/dev/sdt", {st_mode=S_IFBLK|0660, st_rdev=makedev(65, 48), ...}) = 0
open("/dev/sdt", O_RDWR|O_DIRECT|O_LARGEFILE) = 28
fstat64(28, {st_mode=S_IFBLK|0660, st_rdev=makedev(65, 48), ...}) = 0
ioctl(28, BLKBSZGET, 0xbfffed38)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbffff458)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbffff488)        = 0
_llseek(28, 73728, [73728], SEEK_SET)   = 0
read(28, "unt = 1\n\nsegment1 {\nstart_extent"..., 4096) = 4096
stat64("/dev/rd/c0d7", {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 56), ...}) = 0
stat64("/dev/rd/c0d7", {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 56), ...}) = 0
open("/dev/rd/c0d7", O_RDWR|O_DIRECT|O_LARGEFILE) = 29
fstat64(29, {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 56), ...}) = 0
ioctl(29, BLKBSZGET, 0xbfffed38)        = 0
_llseek(29, 0, [0], SEEK_SET)           = 0
read(29, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(29, BLKBSZGET, 0xbffff458)        = 0
_llseek(29, 0, [0], SEEK_SET)           = 0
read(29, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(29, BLKBSZGET, 0xbffff488)        = 0
_llseek(29, 184320, [184320], SEEK_SET) = 0
read(29, "s = [\n\"pv3\", 43\n]\n}\n}\n\nlvol242 {"..., 4096) = 4096
stat64("/dev/sde", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 64), ...}) = 0
stat64("/dev/sde", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 64), ...}) = 0
open("/dev/sde", O_RDWR|O_DIRECT|O_LARGEFILE) = 30
fstat64(30, {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 64), ...}) = 0
ioctl(30, BLKBSZGET, 0xbfffed38)        = 0
_llseek(30, 0, [0], SEEK_SET)           = 0
read(30, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 2048) = 2048
ioctl(30, BLKBSZGET, 0xbffff458)        = 0
_llseek(30, 2048, [2048], SEEK_SET)     = 0
read(30, "\235t<G LVM2 x[5A%r0N*>\1\0\0\0\0\10\0\0\0\0\0\0"..., 512) = 512
ioctl(30, BLKBSZGET, 0xbffff488)        = 0
_llseek(30, 12800, [12800], SEEK_SET)   = 0
read(30, "vg4 {\nid = \"dWOHdO-Zt0P-4ZRx-UHr"..., 512) = 512
stat64("/dev/rd/c0d8", {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 64), ...}) = 0
stat64("/dev/rd/c0d8", {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 64), ...}) = 0
open("/dev/rd/c0d8", O_RDWR|O_DIRECT|O_LARGEFILE) = 31
fstat64(31, {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 64), ...}) = 0
ioctl(31, BLKBSZGET, 0xbfffed38)        = 0
_llseek(31, 0, [0], SEEK_SET)           = 0
read(31, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(31, BLKBSZGET, 0xbffff458)        = 0
_llseek(31, 0, [0], SEEK_SET)           = 0
read(31, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(31, BLKBSZGET, 0xbffff488)        = 0
_llseek(31, 184320, [184320], SEEK_SET) = 0
read(31, " \"WRITE\", \"VISIBLE\"]\nsegment_cou"..., 4096) = 4096
stat64("/dev/sdu", {st_mode=S_IFBLK|0660, st_rdev=makedev(65, 64), ...}) = 0
stat64("/dev/sdu", {st_mode=S_IFBLK|0660, st_rdev=makedev(65, 64), ...}) = 0
open("/dev/sdu", O_RDWR|O_DIRECT|O_LARGEFILE) = 32
fstat64(32, {st_mode=S_IFBLK|0660, st_rdev=makedev(65, 64), ...}) = 0
ioctl(32, BLKBSZGET, 0xbfffed38)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbffff458)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbffff488)        = 0
_llseek(32, 73728, [73728], SEEK_SET)   = 0
read(32, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
stat64("/dev/rd/c0d9", {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 72), ...}) = 0
stat64("/dev/rd/c0d9", {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 72), ...}) = 0
open("/dev/rd/c0d9", O_RDWR|O_DIRECT|O_LARGEFILE) = 33
fstat64(33, {st_mode=S_IFBLK|0660, st_rdev=makedev(48, 72), ...}) = 0
ioctl(33, BLKBSZGET, 0xbfffed38)        = 0
_llseek(33, 0, [0], SEEK_SET)           = 0
read(33, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(33, BLKBSZGET, 0xbffff458)        = 0
_llseek(33, 0, [0], SEEK_SET)           = 0
read(33, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(33, BLKBSZGET, 0xbffff488)        = 0
_llseek(33, 184320, [184320], SEEK_SET) = 0
read(33, "vg2 {\nid = \"QB7IOR-91VD-xnK2-z1a"..., 4096) = 4096
stat64("/dev/sdf", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 80), ...}) = 0
stat64("/dev/sdf", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 80), ...}) = 0
open("/dev/sdf", O_RDWR|O_DIRECT|O_LARGEFILE) = 34
fstat64(34, {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 80), ...}) = 0
ioctl(34, BLKBSZGET, 0xbfffed38)        = 0
_llseek(34, 0, [0], SEEK_SET)           = 0
read(34, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 2048) = 2048
ioctl(34, BLKBSZGET, 0xbffff458)        = 0
_llseek(34, 2048, [2048], SEEK_SET)     = 0
read(34, "\374\223\235\356 LVM2 x[5A%r0N*>\1\0\0\0\0\10\0\0\0\0\0"..., 512) = 512
ioctl(34, BLKBSZGET, 0xbffff488)        = 0
_llseek(34, 11776, [11776], SEEK_SET)   = 0
read(34, "vg4 {\nid = \"dWOHdO-Zt0P-4ZRx-UHr"..., 512) = 512
stat64("/dev/sdv", {st_mode=S_IFBLK|0660, st_rdev=makedev(65, 80), ...}) = 0
stat64("/dev/sdv", {st_mode=S_IFBLK|0660, st_rdev=makedev(65, 80), ...}) = 0
open("/dev/sdv", O_RDWR|O_DIRECT|O_LARGEFILE) = 35
fstat64(35, {st_mode=S_IFBLK|0660, st_rdev=makedev(65, 80), ...}) = 0
ioctl(35, BLKBSZGET, 0xbfffed38)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbffff458)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbffff488)        = 0
_llseek(35, 69632, [69632], SEEK_SET)   = 0
read(35, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
stat64("/dev/sdg", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 96), ...}) = 0
stat64("/dev/sdg", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 96), ...}) = 0
open("/dev/sdg", O_RDWR|O_DIRECT|O_LARGEFILE) = 36
fstat64(36, {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 96), ...}) = 0
ioctl(36, BLKBSZGET, 0xbfffed38)        = 0
_llseek(36, 0, [0], SEEK_SET)           = 0
read(36, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 2048) = 2048
ioctl(36, BLKBSZGET, 0xbffff458)        = 0
_llseek(36, 2048, [2048], SEEK_SET)     = 0
read(36, "#1\375\211 LVM2 x[5A%r0N*>\1\0\0\0\0\10\0\0\0\0\0\0"..., 512) = 512
ioctl(36, BLKBSZGET, 0xbffff488)        = 0
_llseek(36, 10752, [10752], SEEK_SET)   = 0
read(36, "vg4 {\nid = \"dWOHdO-Zt0P-4ZRx-UHr"..., 512) = 512
stat64("/dev/sdh", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 112), ...}) = 0
stat64("/dev/sdh", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 112), ...}) = 0
open("/dev/sdh", O_RDWR|O_DIRECT|O_LARGEFILE) = 37
fstat64(37, {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 112), ...}) = 0
ioctl(37, BLKBSZGET, 0xbfffed38)        = 0
_llseek(37, 0, [0], SEEK_SET)           = 0
read(37, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 2048) = 2048
ioctl(37, BLKBSZGET, 0xbffff458)        = 0
_llseek(37, 2048, [2048], SEEK_SET)     = 0
read(37, "J\223@5 LVM2 x[5A%r0N*>\1\0\0\0\0\10\0\0\0\0\0\0"..., 512) = 512
ioctl(37, BLKBSZGET, 0xbffff488)        = 0
_llseek(37, 9216, [9216], SEEK_SET)     = 0
read(37, "vg4 {\nid = \"dWOHdO-Zt0P-4ZRx-UHr"..., 512) = 512
stat64("/dev/sdi", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 128), ...}) = 0
stat64("/dev/sdi", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 128), ...}) = 0
open("/dev/sdi", O_RDWR|O_DIRECT|O_LARGEFILE) = 38
fstat64(38, {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 128), ...}) = 0
ioctl(38, BLKBSZGET, 0xbfffed38)        = 0
_llseek(38, 0, [0], SEEK_SET)           = 0
read(38, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 2048) = 2048
ioctl(38, BLKBSZGET, 0xbffff458)        = 0
_llseek(38, 2048, [2048], SEEK_SET)     = 0
read(38, "F\200\214\36 LVM2 x[5A%r0N*>\1\0\0\0\0\10\0\0\0\0\0\0"..., 512) = 512
ioctl(38, BLKBSZGET, 0xbffff488)        = 0
_llseek(38, 7680, [7680], SEEK_SET)     = 0
read(38, "vg4 {\nid = \"dWOHdO-Zt0P-4ZRx-UHr"..., 512) = 512
stat64("/dev/sdj", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 144), ...}) = 0
stat64("/dev/sdj", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 144), ...}) = 0
open("/dev/sdj", O_RDWR|O_DIRECT|O_LARGEFILE) = 39
fstat64(39, {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 144), ...}) = 0
ioctl(39, BLKBSZGET, 0xbfffed38)        = 0
_llseek(39, 0, [0], SEEK_SET)           = 0
read(39, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 2048) = 2048
ioctl(39, BLKBSZGET, 0xbffff458)        = 0
_llseek(39, 2048, [2048], SEEK_SET)     = 0
read(39, "\326\360\344\247 LVM2 x[5A%r0N*>\1\0\0\0\0\10\0\0\0\0\0"..., 512) = 512
ioctl(39, BLKBSZGET, 0xbffff488)        = 0
_llseek(39, 6144, [6144], SEEK_SET)     = 0
read(39, "vg4 {\nid = \"dWOHdO-Zt0P-4ZRx-UHr"..., 512) = 512
stat64("/dev/sdk", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 160), ...}) = 0
stat64("/dev/sdk", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 160), ...}) = 0
open("/dev/sdk", O_RDWR|O_DIRECT|O_LARGEFILE) = 40
fstat64(40, {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 160), ...}) = 0
ioctl(40, BLKBSZGET, 0xbfffed38)        = 0
_llseek(40, 0, [0], SEEK_SET)           = 0
read(40, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 2048) = 2048
ioctl(40, BLKBSZGET, 0xbffff458)        = 0
_llseek(40, 2048, [2048], SEEK_SET)     = 0
read(40, "\32\352\336\361 LVM2 x[5A%r0N*>\1\0\0\0\0\10\0\0\0\0\0"..., 512) = 512
ioctl(40, BLKBSZGET, 0xbffff488)        = 0
_llseek(40, 4608, [4608], SEEK_SET)     = 0
read(40, "vg4 {\nid = \"dWOHdO-Zt0P-4ZRx-UHr"..., 512) = 512
stat64("/dev/sdl", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 176), ...}) = 0
stat64("/dev/sdl", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 176), ...}) = 0
open("/dev/sdl", O_RDWR|O_DIRECT|O_LARGEFILE) = 41
fstat64(41, {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 176), ...}) = 0
ioctl(41, BLKBSZGET, 0xbfffed38)        = 0
_llseek(41, 0, [0], SEEK_SET)           = 0
read(41, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 2048) = 2048
ioctl(41, BLKBSZGET, 0xbffff458)        = 0
_llseek(41, 2048, [2048], SEEK_SET)     = 0
read(41, "\244\257\37? LVM2 x[5A%r0N*>\1\0\0\0\0\10\0\0\0\0\0\0"..., 512) = 512
ioctl(41, BLKBSZGET, 0xbffff488)        = 0
_llseek(41, 2560, [2560], SEEK_SET)     = 0
read(41, "vg4 {\nid = \"dWOHdO-Zt0P-4ZRx-UHr"..., 512) = 512
stat64("/dev/sdm", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 192), ...}) = 0
stat64("/dev/sdm", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 192), ...}) = 0
open("/dev/sdm", O_RDWR|O_DIRECT|O_LARGEFILE) = 42
fstat64(42, {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 192), ...}) = 0
ioctl(42, BLKBSZGET, 0xbfffed38)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbffff458)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbffff488)        = 0
_llseek(42, 81920, [81920], SEEK_SET)   = 0
read(42, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
stat64("/dev/sdn", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 208), ...}) = 0
stat64("/dev/sdn", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 208), ...}) = 0
open("/dev/sdn", O_RDWR|O_DIRECT|O_LARGEFILE) = 43
fstat64(43, {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 208), ...}) = 0
ioctl(43, BLKBSZGET, 0xbfffed38)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbffff458)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbffff488)        = 0
_llseek(43, 81920, [81920], SEEK_SET)   = 0
read(43, "= 1\n\ntype = \"striped\"\nstripe_cou"..., 4096) = 4096
stat64("/dev/sdo", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 224), ...}) = 0
stat64("/dev/sdo", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 224), ...}) = 0
open("/dev/sdo", O_RDWR|O_DIRECT|O_LARGEFILE) = 44
fstat64(44, {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 224), ...}) = 0
ioctl(44, BLKBSZGET, 0xbfffed38)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbffff458)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbffff488)        = 0
_llseek(44, 81920, [81920], SEEK_SET)   = 0
read(44, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
stat64("/dev/sdp", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 240), ...}) = 0
stat64("/dev/sdp", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 240), ...}) = 0
open("/dev/sdp", O_RDWR|O_DIRECT|O_LARGEFILE) = 45
fstat64(45, {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 240), ...}) = 0
ioctl(45, BLKBSZGET, 0xbfffed38)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbffff458)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbffff488)        = 0
_llseek(45, 77824, [77824], SEEK_SET)   = 0
read(45, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbffff778)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbffff748)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbffff6d8)         = 0
_llseek(7, 77824, [77824], SEEK_SET)    = 0
read(7, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbffff6c8)         = 0
_llseek(7, 77824, [77824], SEEK_SET)    = 0
read(7, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 12288) = 12288
ioctl(42, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbffff288)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(42, 81920, [81920], SEEK_SET)   = 0
read(42, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbffff288)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(43, 81920, [81920], SEEK_SET)   = 0
read(43, "= 1\n\ntype = \"striped\"\nstripe_cou"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbffff288)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(44, 81920, [81920], SEEK_SET)   = 0
read(44, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbffff288)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(45, 77824, [77824], SEEK_SET)   = 0
read(45, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffeb68)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbffff288)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbffff2b8)         = 0
_llseek(7, 77824, [77824], SEEK_SET)    = 0
read(7, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbffff288)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(17, 77824, [77824], SEEK_SET)   = 0
read(17, " i686\ncreation_time = 1089339567"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbffff288)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(24, 73728, [73728], SEEK_SET)   = 0
read(24, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbffff288)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(28, 73728, [73728], SEEK_SET)   = 0
read(28, "unt = 1\n\nsegment1 {\nstart_extent"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbffff288)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(32, 73728, [73728], SEEK_SET)   = 0
read(32, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbffff288)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(35, 69632, [69632], SEEK_SET)   = 0
read(35, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbffff778)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbffff748)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbffff6d8)        = 0
_llseek(17, 77824, [77824], SEEK_SET)   = 0
read(17, " i686\ncreation_time = 1089339567"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbffff6c8)        = 0
_llseek(17, 77824, [77824], SEEK_SET)   = 0
read(17, " i686\ncreation_time = 1089339567"..., 12288) = 12288
ioctl(42, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbffff288)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(42, 81920, [81920], SEEK_SET)   = 0
read(42, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbffff288)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(43, 81920, [81920], SEEK_SET)   = 0
read(43, "= 1\n\ntype = \"striped\"\nstripe_cou"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbffff288)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(44, 81920, [81920], SEEK_SET)   = 0
read(44, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbffff288)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(45, 77824, [77824], SEEK_SET)   = 0
read(45, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffeb68)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbffff288)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbffff2b8)         = 0
_llseek(7, 77824, [77824], SEEK_SET)    = 0
read(7, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbffff288)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(17, 77824, [77824], SEEK_SET)   = 0
read(17, " i686\ncreation_time = 1089339567"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbffff288)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(24, 73728, [73728], SEEK_SET)   = 0
read(24, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbffff288)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(28, 73728, [73728], SEEK_SET)   = 0
read(28, "unt = 1\n\nsegment1 {\nstart_extent"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbffff288)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(32, 73728, [73728], SEEK_SET)   = 0
read(32, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbffff288)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(35, 69632, [69632], SEEK_SET)   = 0
read(35, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbffff778)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbffff748)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbffff6d8)        = 0
_llseek(24, 73728, [73728], SEEK_SET)   = 0
read(24, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbffff6c8)        = 0
_llseek(24, 73728, [73728], SEEK_SET)   = 0
read(24, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 12288) = 12288
ioctl(42, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbffff288)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(42, 81920, [81920], SEEK_SET)   = 0
read(42, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbffff288)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(43, 81920, [81920], SEEK_SET)   = 0
read(43, "= 1\n\ntype = \"striped\"\nstripe_cou"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbffff288)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(44, 81920, [81920], SEEK_SET)   = 0
read(44, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbffff288)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(45, 77824, [77824], SEEK_SET)   = 0
read(45, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffeb68)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbffff288)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbffff2b8)         = 0
_llseek(7, 77824, [77824], SEEK_SET)    = 0
read(7, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbffff288)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(17, 77824, [77824], SEEK_SET)   = 0
read(17, " i686\ncreation_time = 1089339567"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbffff288)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(24, 73728, [73728], SEEK_SET)   = 0
read(24, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbffff288)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(28, 73728, [73728], SEEK_SET)   = 0
read(28, "unt = 1\n\nsegment1 {\nstart_extent"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbffff288)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(32, 73728, [73728], SEEK_SET)   = 0
read(32, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbffff288)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(35, 69632, [69632], SEEK_SET)   = 0
read(35, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbffff778)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbffff748)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbffff6d8)        = 0
_llseek(28, 73728, [73728], SEEK_SET)   = 0
read(28, "unt = 1\n\nsegment1 {\nstart_extent"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbffff6c8)        = 0
_llseek(28, 73728, [73728], SEEK_SET)   = 0
read(28, "unt = 1\n\nsegment1 {\nstart_extent"..., 12288) = 12288
ioctl(42, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbffff288)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(42, 81920, [81920], SEEK_SET)   = 0
read(42, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbffff288)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(43, 81920, [81920], SEEK_SET)   = 0
read(43, "= 1\n\ntype = \"striped\"\nstripe_cou"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbffff288)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(44, 81920, [81920], SEEK_SET)   = 0
read(44, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbffff288)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(45, 77824, [77824], SEEK_SET)   = 0
read(45, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffeb68)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbffff288)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbffff2b8)         = 0
_llseek(7, 77824, [77824], SEEK_SET)    = 0
read(7, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbffff288)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(17, 77824, [77824], SEEK_SET)   = 0
read(17, " i686\ncreation_time = 1089339567"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbffff288)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(24, 73728, [73728], SEEK_SET)   = 0
read(24, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbffff288)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(28, 73728, [73728], SEEK_SET)   = 0
read(28, "unt = 1\n\nsegment1 {\nstart_extent"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbffff288)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(32, 73728, [73728], SEEK_SET)   = 0
read(32, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbffff288)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(35, 69632, [69632], SEEK_SET)   = 0
read(35, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbffff778)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbffff748)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbffff6d8)        = 0
_llseek(32, 73728, [73728], SEEK_SET)   = 0
read(32, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbffff6c8)        = 0
_llseek(32, 73728, [73728], SEEK_SET)   = 0
read(32, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 8192) = 8192
ioctl(42, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbffff288)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(42, 81920, [81920], SEEK_SET)   = 0
read(42, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbffff288)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(43, 81920, [81920], SEEK_SET)   = 0
read(43, "= 1\n\ntype = \"striped\"\nstripe_cou"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbffff288)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(44, 81920, [81920], SEEK_SET)   = 0
read(44, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbffff288)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(45, 77824, [77824], SEEK_SET)   = 0
read(45, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffeb68)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbffff288)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbffff2b8)         = 0
_llseek(7, 77824, [77824], SEEK_SET)    = 0
read(7, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbffff288)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(17, 77824, [77824], SEEK_SET)   = 0
read(17, " i686\ncreation_time = 1089339567"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbffff288)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(24, 73728, [73728], SEEK_SET)   = 0
read(24, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbffff288)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(28, 73728, [73728], SEEK_SET)   = 0
read(28, "unt = 1\n\nsegment1 {\nstart_extent"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbffff288)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(32, 73728, [73728], SEEK_SET)   = 0
read(32, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbffff288)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(35, 69632, [69632], SEEK_SET)   = 0
read(35, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbffff778)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbffff748)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbffff6d8)        = 0
_llseek(35, 69632, [69632], SEEK_SET)   = 0
read(35, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbffff6c8)        = 0
_llseek(35, 69632, [69632], SEEK_SET)   = 0
read(35, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 12288) = 12288
brk(0)                                  = 0x80e0000
brk(0x8101000)                          = 0x8101000
ioctl(42, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbffff288)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(42, 81920, [81920], SEEK_SET)   = 0
read(42, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbffff288)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(43, 81920, [81920], SEEK_SET)   = 0
read(43, "= 1\n\ntype = \"striped\"\nstripe_cou"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbffff288)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(44, 81920, [81920], SEEK_SET)   = 0
read(44, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbffff288)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(45, 77824, [77824], SEEK_SET)   = 0
read(45, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffeb68)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbffff288)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbffff2b8)         = 0
_llseek(7, 77824, [77824], SEEK_SET)    = 0
read(7, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbffff288)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(17, 77824, [77824], SEEK_SET)   = 0
read(17, " i686\ncreation_time = 1089339567"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbffff288)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(24, 73728, [73728], SEEK_SET)   = 0
read(24, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbffff288)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(28, 73728, [73728], SEEK_SET)   = 0
read(28, "unt = 1\n\nsegment1 {\nstart_extent"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbffff288)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(32, 73728, [73728], SEEK_SET)   = 0
read(32, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbffff288)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(35, 69632, [69632], SEEK_SET)   = 0
read(35, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbffff778)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbffff748)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbffff6d8)        = 0
_llseek(42, 81920, [81920], SEEK_SET)   = 0
read(42, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbffff6c8)        = 0
_llseek(42, 81920, [81920], SEEK_SET)   = 0
read(42, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 12288) = 12288
ioctl(42, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbffff288)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(42, 81920, [81920], SEEK_SET)   = 0
read(42, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbffff288)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(43, 81920, [81920], SEEK_SET)   = 0
read(43, "= 1\n\ntype = \"striped\"\nstripe_cou"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbffff288)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(44, 81920, [81920], SEEK_SET)   = 0
read(44, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbffff288)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(45, 77824, [77824], SEEK_SET)   = 0
read(45, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffeb68)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbffff288)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbffff2b8)         = 0
_llseek(7, 77824, [77824], SEEK_SET)    = 0
read(7, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbffff288)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(17, 77824, [77824], SEEK_SET)   = 0
read(17, " i686\ncreation_time = 1089339567"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbffff288)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(24, 73728, [73728], SEEK_SET)   = 0
read(24, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbffff288)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(28, 73728, [73728], SEEK_SET)   = 0
read(28, "unt = 1\n\nsegment1 {\nstart_extent"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbffff288)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(32, 73728, [73728], SEEK_SET)   = 0
read(32, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbffff288)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(35, 69632, [69632], SEEK_SET)   = 0
read(35, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbffff778)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbffff748)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbffff6d8)        = 0
_llseek(43, 81920, [81920], SEEK_SET)   = 0
read(43, "= 1\n\ntype = \"striped\"\nstripe_cou"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbffff6c8)        = 0
_llseek(43, 81920, [81920], SEEK_SET)   = 0
read(43, "= 1\n\ntype = \"striped\"\nstripe_cou"..., 12288) = 12288
ioctl(42, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbffff288)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(42, 81920, [81920], SEEK_SET)   = 0
read(42, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbffff288)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(43, 81920, [81920], SEEK_SET)   = 0
read(43, "= 1\n\ntype = \"striped\"\nstripe_cou"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbffff288)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(44, 81920, [81920], SEEK_SET)   = 0
read(44, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbffff288)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(45, 77824, [77824], SEEK_SET)   = 0
read(45, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffeb68)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbffff288)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbffff2b8)         = 0
_llseek(7, 77824, [77824], SEEK_SET)    = 0
read(7, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbffff288)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(17, 77824, [77824], SEEK_SET)   = 0
read(17, " i686\ncreation_time = 1089339567"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbffff288)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(24, 73728, [73728], SEEK_SET)   = 0
read(24, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbffff288)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(28, 73728, [73728], SEEK_SET)   = 0
read(28, "unt = 1\n\nsegment1 {\nstart_extent"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbffff288)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(32, 73728, [73728], SEEK_SET)   = 0
read(32, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbffff288)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(35, 69632, [69632], SEEK_SET)   = 0
read(35, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbffff778)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbffff748)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbffff6d8)        = 0
_llseek(44, 81920, [81920], SEEK_SET)   = 0
read(44, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbffff6c8)        = 0
_llseek(44, 81920, [81920], SEEK_SET)   = 0
read(44, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 8192) = 8192
ioctl(42, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbffff288)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(42, 81920, [81920], SEEK_SET)   = 0
read(42, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbffff288)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(43, 81920, [81920], SEEK_SET)   = 0
read(43, "= 1\n\ntype = \"striped\"\nstripe_cou"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbffff288)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(44, 81920, [81920], SEEK_SET)   = 0
read(44, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbffff288)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(45, 77824, [77824], SEEK_SET)   = 0
read(45, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffeb68)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbffff288)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbffff2b8)         = 0
_llseek(7, 77824, [77824], SEEK_SET)    = 0
read(7, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbffff288)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(17, 77824, [77824], SEEK_SET)   = 0
read(17, " i686\ncreation_time = 1089339567"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbffff288)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(24, 73728, [73728], SEEK_SET)   = 0
read(24, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbffff288)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(28, 73728, [73728], SEEK_SET)   = 0
read(28, "unt = 1\n\nsegment1 {\nstart_extent"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbffff288)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(32, 73728, [73728], SEEK_SET)   = 0
read(32, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbffff288)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(35, 69632, [69632], SEEK_SET)   = 0
read(35, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbffff778)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbffff748)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbffff6d8)        = 0
_llseek(45, 77824, [77824], SEEK_SET)   = 0
read(45, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbffff6c8)        = 0
_llseek(45, 77824, [77824], SEEK_SET)   = 0
read(45, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 12288) = 12288
ioctl(42, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbffff288)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(42, 81920, [81920], SEEK_SET)   = 0
read(42, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbffff288)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(43, 81920, [81920], SEEK_SET)   = 0
read(43, "= 1\n\ntype = \"striped\"\nstripe_cou"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbffff288)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(44, 81920, [81920], SEEK_SET)   = 0
read(44, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbffff288)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(45, 77824, [77824], SEEK_SET)   = 0
read(45, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffeb68)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbffff288)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbffff2b8)         = 0
_llseek(7, 77824, [77824], SEEK_SET)    = 0
read(7, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbffff288)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(17, 77824, [77824], SEEK_SET)   = 0
read(17, " i686\ncreation_time = 1089339567"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbffff288)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(24, 73728, [73728], SEEK_SET)   = 0
read(24, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbffff288)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(28, 73728, [73728], SEEK_SET)   = 0
read(28, "unt = 1\n\nsegment1 {\nstart_extent"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbffff288)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(32, 73728, [73728], SEEK_SET)   = 0
read(32, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffeb68)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbffff288)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbffff2b8)        = 0
_llseek(35, 69632, [69632], SEEK_SET)   = 0
read(35, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
open("/dev/urandom", O_RDONLY|O_LARGEFILE) = 46
read(46, "\254\5\323\357\303*\243o\231\233\366\257\16\316\216C\v"..., 32) = 32
close(46)                               = 0
uname({sys="Linux", node="dev8-001", ...}) = 0
open("/etc/lvm/archive/.lvm_dev8-001_32674_141324569", O_WRONLY|O_APPEND|O_CREAT|O_EXCL|O_LARGEFILE, 0666) = 46
fcntl64(46, F_SETLK64, {type=F_WRLCK, whence=SEEK_SET, start=0, len=0}, 0xbfffd720) = 0
fcntl64(46, F_GETFL)                    = 0x8401 (flags O_WRONLY|O_APPEND|O_LARGEFILE)
fstat64(46, {st_mode=S_IFREG|0600, st_size=0, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb7dd2000
_llseek(46, 0, [0], SEEK_CUR)           = 0
uname({sys="Linux", node="dev8-001", ...}) = 0
time(NULL)                              = 1089339571
write(46, "# Generated by LVM2: Thu Jul  8 "..., 4096) = 4096
write(46, "DG4-NMnd6u\"\n\t\t\tstatus = [\"READ\","..., 4096) = 4096
write(46, "aBEnV-iw4A-2htA-DYVB-iAkF-2Q9R-f"..., 2343) = 2343
close(46)                               = 0
munmap(0xb7dd2000, 4096)                = 0
open("/etc/lvm/archive", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 46
fstat64(46, {st_mode=S_IFDIR|0700, st_size=81920, ...}) = 0
fcntl64(46, F_SETFD, FD_CLOEXEC)        = 0
getdents64(46, /* 127 entries */, 4096) = 4072
getdents64(46, /* 77 entries */, 4096)  = 2464
getdents64(46, /* 128 entries */, 4096) = 4096
getdents64(46, /* 76 entries */, 4096)  = 2432
getdents64(46, /* 128 entries */, 4096) = 4096
getdents64(46, /* 76 entries */, 4096)  = 2432
getdents64(46, /* 128 entries */, 4096) = 4096
getdents64(46, /* 76 entries */, 4096)  = 2432
getdents64(46, /* 128 entries */, 4096) = 4096
getdents64(46, /* 76 entries */, 4096)  = 2432
getdents64(46, /* 128 entries */, 4096) = 4096
getdents64(46, /* 76 entries */, 4096)  = 2432
getdents64(46, /* 128 entries */, 4096) = 4096
getdents64(46, /* 76 entries */, 4096)  = 2432
getdents64(46, /* 128 entries */, 4096) = 4096
getdents64(46, /* 76 entries */, 4096)  = 2432
getdents64(46, /* 128 entries */, 4096) = 4096
getdents64(46, /* 76 entries */, 4096)  = 2432
getdents64(46, /* 128 entries */, 4096) = 4096
getdents64(46, /* 76 entries */, 4096)  = 2432
getdents64(46, /* 128 entries */, 4096) = 4096
getdents64(46, /* 76 entries */, 4096)  = 2432
getdents64(46, /* 128 entries */, 4096) = 4096
brk(0)                                  = 0x8101000
brk(0x8122000)                          = 0x8122000
getdents64(46, /* 76 entries */, 4096)  = 2432
getdents64(46, /* 128 entries */, 4096) = 4096
getdents64(46, /* 76 entries */, 4096)  = 2432
getdents64(46, /* 128 entries */, 4096) = 4096
getdents64(46, /* 76 entries */, 4096)  = 2432
getdents64(46, /* 128 entries */, 4096) = 4096
getdents64(46, /* 76 entries */, 4096)  = 2432
getdents64(46, /* 128 entries */, 4096) = 4096
getdents64(46, /* 76 entries */, 4096)  = 2432
getdents64(46, /* 128 entries */, 4096) = 4096
getdents64(46, /* 76 entries */, 4096)  = 2432
getdents64(46, /* 128 entries */, 4096) = 4096
getdents64(46, /* 76 entries */, 4096)  = 2432
getdents64(46, /* 128 entries */, 4096) = 4096
getdents64(46, /* 76 entries */, 4096)  = 2432
getdents64(46, /* 128 entries */, 4096) = 4096
getdents64(46, /* 42 entries */, 4096)  = 1344
getdents64(46, /* 0 entries */, 4096)   = 0
open("/etc/mtab", O_RDONLY)             = 47
fstat64(47, {st_mode=S_IFREG|0644, st_size=233, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb7dd2000
read(47, "/dev/sda6 / ext3 rw 0 0\nproc /pr"..., 4096) = 233
close(47)                               = 0
munmap(0xb7dd2000, 4096)                = 0
open("/proc/meminfo", O_RDONLY)         = 47
fstat64(47, {st_mode=S_IFREG|0444, st_size=0, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb7dd2000
read(47, "MemTotal:      3895024 kB\nMemFre"..., 1024) = 644
close(47)                               = 0
munmap(0xb7dd2000, 4096)                = 0
close(46)                               = 0
brk(0)                                  = 0x8122000
brk(0x8143000)                          = 0x8143000
link("/etc/lvm/archive/.lvm_dev8-001_32674_141324569", "/etc/lvm/archive/vg3_01048.vg") = 0
stat64("/etc/lvm/archive/.lvm_dev8-001_32674_141324569", {st_mode=S_IFREG|0600, st_size=10535, ...}) = 0
unlink("/etc/lvm/archive/.lvm_dev8-001_32674_141324569") = 0
time(NULL)                              = 1089339572
stat64("/etc/lvm/archive/vg3_00000.vg", {st_mode=S_IFREG|0600, st_size=727, ...}) = 0
ioctl(7, BLKBSZGET, 0xbffef768)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbffef6c8)         = 0
_llseek(7, 77824, [77824], SEEK_SET)    = 0
read(7, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
time(NULL)                              = 1089339572
ioctl(7, BLKBSZGET, 0xbffef798)         = 0
_llseek(7, 86016, [86016], SEEK_SET)    = 0
read(7, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 12288) = 12288
_llseek(7, 86016, [86016], SEEK_SET)    = 0
write(7, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 12288) = 12288
ioctl(17, BLKBSZGET, 0xbffef768)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbffef6c8)        = 0
_llseek(17, 77824, [77824], SEEK_SET)   = 0
read(17, " i686\ncreation_time = 1089339567"..., 4096) = 4096
time(NULL)                              = 1089339572
ioctl(17, BLKBSZGET, 0xbffef798)        = 0
_llseek(17, 86016, [86016], SEEK_SET)   = 0
read(17, "tripes = [\n\"pv0\", 26\n]\n}\n}\n}\n}\n#"..., 12288) = 12288
_llseek(17, 86016, [86016], SEEK_SET)   = 0
write(17, "tripes = [\n\"pv0\", 26\n]\n}\n}\n}\n}\n#"..., 12288) = 12288
ioctl(24, BLKBSZGET, 0xbffef768)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbffef6c8)        = 0
_llseek(24, 73728, [73728], SEEK_SET)   = 0
read(24, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
time(NULL)                              = 1089339572
ioctl(24, BLKBSZGET, 0xbffef798)        = 0
_llseek(24, 81920, [81920], SEEK_SET)   = 0
read(24, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 12288) = 12288
_llseek(24, 81920, [81920], SEEK_SET)   = 0
write(24, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 12288) = 12288
ioctl(28, BLKBSZGET, 0xbffef768)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbffef6c8)        = 0
_llseek(28, 73728, [73728], SEEK_SET)   = 0
read(28, "unt = 1\n\nsegment1 {\nstart_extent"..., 4096) = 4096
time(NULL)                              = 1089339572
ioctl(28, BLKBSZGET, 0xbffef798)        = 0
_llseek(28, 81920, [81920], SEEK_SET)   = 0
read(28, "unt = 1\n\nsegment1 {\nstart_extent"..., 12288) = 12288
_llseek(28, 81920, [81920], SEEK_SET)   = 0
write(28, "unt = 1\n\nsegment1 {\nstart_extent"..., 12288) = 12288
ioctl(32, BLKBSZGET, 0xbffef768)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbffef6c8)        = 0
_llseek(32, 73728, [73728], SEEK_SET)   = 0
read(32, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
time(NULL)                              = 1089339572
ioctl(32, BLKBSZGET, 0xbffef798)        = 0
_llseek(32, 81920, [81920], SEEK_SET)   = 0
read(32, "Fu-HIet2q\"\nstatus = [\"READ\", \"WR"..., 12288) = 12288
_llseek(32, 81920, [81920], SEEK_SET)   = 0
write(32, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 12288) = 12288
ioctl(35, BLKBSZGET, 0xbffef768)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbffef6c8)        = 0
_llseek(35, 69632, [69632], SEEK_SET)   = 0
read(35, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
time(NULL)                              = 1089339572
ioctl(35, BLKBSZGET, 0xbffef798)        = 0
_llseek(35, 77824, [77824], SEEK_SET)   = 0
read(35, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 12288) = 12288
_llseek(35, 77824, [77824], SEEK_SET)   = 0
write(35, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 12288) = 12288
ioctl(42, BLKBSZGET, 0xbffef768)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbffef6c8)        = 0
_llseek(42, 81920, [81920], SEEK_SET)   = 0
read(42, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
time(NULL)                              = 1089339572
ioctl(42, BLKBSZGET, 0xbffef798)        = 0
_llseek(42, 90112, [90112], SEEK_SET)   = 0
read(42, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 12288) = 12288
_llseek(42, 90112, [90112], SEEK_SET)   = 0
write(42, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 12288) = 12288
ioctl(43, BLKBSZGET, 0xbffef768)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbffef6c8)        = 0
_llseek(43, 81920, [81920], SEEK_SET)   = 0
read(43, "= 1\n\ntype = \"striped\"\nstripe_cou"..., 4096) = 4096
time(NULL)                              = 1089339572
ioctl(43, BLKBSZGET, 0xbffef798)        = 0
_llseek(43, 90112, [90112], SEEK_SET)   = 0
read(43, "= 1\n\ntype = \"striped\"\nstripe_cou"..., 12288) = 12288
_llseek(43, 90112, [90112], SEEK_SET)   = 0
write(43, "= 1\n\ntype = \"striped\"\nstripe_cou"..., 12288) = 12288
ioctl(44, BLKBSZGET, 0xbffef768)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbffef6c8)        = 0
_llseek(44, 81920, [81920], SEEK_SET)   = 0
read(44, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
time(NULL)                              = 1089339572
ioctl(44, BLKBSZGET, 0xbffef798)        = 0
_llseek(44, 90112, [90112], SEEK_SET)   = 0
read(44, "Fu-HIet2q\"\nstatus = [\"READ\", \"WR"..., 12288) = 12288
_llseek(44, 90112, [90112], SEEK_SET)   = 0
write(44, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 12288) = 12288
ioctl(45, BLKBSZGET, 0xbffef768)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbffef6c8)        = 0
_llseek(45, 77824, [77824], SEEK_SET)   = 0
read(45, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
time(NULL)                              = 1089339572
ioctl(45, BLKBSZGET, 0xbffef798)        = 0
_llseek(45, 86016, [86016], SEEK_SET)   = 0
read(45, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 12288) = 12288
_llseek(45, 86016, [86016], SEEK_SET)   = 0
write(45, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 12288) = 12288
uname({sys="Linux", node="dev8-001", ...}) = 0
open("/etc/lvm/backup/.lvm_dev8-001_32674_2062288751", O_WRONLY|O_APPEND|O_CREAT|O_EXCL|O_LARGEFILE, 0666) = 46
fcntl64(46, F_SETLK64, {type=F_WRLCK, whence=SEEK_SET, start=0, len=0}, 0xbfffc6f0) = 0
fcntl64(46, F_GETFL)                    = 0x8401 (flags O_WRONLY|O_APPEND|O_LARGEFILE)
fstat64(46, {st_mode=S_IFREG|0600, st_size=0, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb7dd2000
_llseek(46, 0, [0], SEEK_CUR)           = 0
time(NULL)                              = 1089339572
write(46, "# Generated by LVM2: Thu Jul  8 "..., 4096) = 4096
write(46, "G4-NMnd6u\"\n\t\t\tstatus = [\"READ\", "..., 4096) = 4096
fsync(46)                               = 0
write(46, "BEnV-iw4A-2htA-DYVB-iAkF-2Q9R-f1"..., 2342) = 2342
close(46)                               = 0
munmap(0xb7dd2000, 4096)                = 0
rename("/etc/lvm/backup/.lvm_dev8-001_32674_2062288751", "/etc/lvm/backup/vg3.tmp") = 0
rename("/etc/lvm/backup/vg3.tmp", "/etc/lvm/backup/vg3") = 0
stat64("/etc/lvm/backup/vg3.tmp", 0xbfffe7a0) = -1 ENOENT (No such file or directory)
open("/etc/lvm/backup", O_RDONLY|O_LARGEFILE) = 46
fsync(46)                               = 0
close(46)                               = 0
ioctl(7, BLKBSZGET, 0xbffff7a8)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbffff708)         = 0
_llseek(7, 77824, [77824], SEEK_SET)    = 0
read(7, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbffff798)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
_llseek(7, 0, [0], SEEK_SET)            = 0
write(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbffff7a8)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbffff708)        = 0
_llseek(17, 77824, [77824], SEEK_SET)   = 0
read(17, " i686\ncreation_time = 1089339567"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbffff798)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
_llseek(17, 0, [0], SEEK_SET)           = 0
write(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbffff7a8)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbffff708)        = 0
_llseek(24, 73728, [73728], SEEK_SET)   = 0
read(24, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbffff798)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
_llseek(24, 0, [0], SEEK_SET)           = 0
write(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbffff7a8)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbffff708)        = 0
_llseek(28, 73728, [73728], SEEK_SET)   = 0
read(28, "unt = 1\n\nsegment1 {\nstart_extent"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbffff798)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
_llseek(28, 0, [0], SEEK_SET)           = 0
write(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbffff7a8)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbffff708)        = 0
_llseek(32, 73728, [73728], SEEK_SET)   = 0
read(32, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbffff798)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
_llseek(32, 0, [0], SEEK_SET)           = 0
write(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbffff7a8)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbffff708)        = 0
_llseek(35, 69632, [69632], SEEK_SET)   = 0
read(35, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbffff798)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
_llseek(35, 0, [0], SEEK_SET)           = 0
write(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbffff7a8)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbffff708)        = 0
_llseek(42, 81920, [81920], SEEK_SET)   = 0
read(42, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbffff798)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
_llseek(42, 0, [0], SEEK_SET)           = 0
write(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbffff7a8)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbffff708)        = 0
_llseek(43, 81920, [81920], SEEK_SET)   = 0
read(43, "= 1\n\ntype = \"striped\"\nstripe_cou"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbffff798)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
_llseek(43, 0, [0], SEEK_SET)           = 0
write(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbffff7a8)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbffff708)        = 0
_llseek(44, 81920, [81920], SEEK_SET)   = 0
read(44, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbffff798)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
_llseek(44, 0, [0], SEEK_SET)           = 0
write(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbffff7a8)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbffff708)        = 0
_llseek(45, 77824, [77824], SEEK_SET)   = 0
read(45, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbffff798)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
_llseek(45, 0, [0], SEEK_SET)           = 0
write(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffe518)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffe4e8)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffe478)         = 0
_llseek(7, 86016, [86016], SEEK_SET)    = 0
read(7, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffe468)         = 0
_llseek(7, 86016, [86016], SEEK_SET)    = 0
read(7, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 12288) = 12288
ioctl(42, BLKBSZGET, 0xbfffd908)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbfffe028)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbfffe058)        = 0
_llseek(42, 90112, [90112], SEEK_SET)   = 0
read(42, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffd908)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffe028)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffe058)        = 0
_llseek(43, 90112, [90112], SEEK_SET)   = 0
read(43, "= 1\n\ntype = \"striped\"\nstripe_cou"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffd908)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffe028)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffe058)        = 0
_llseek(44, 90112, [90112], SEEK_SET)   = 0
read(44, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffd908)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffe028)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffe058)        = 0
_llseek(45, 86016, [86016], SEEK_SET)   = 0
read(45, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffd908)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffe028)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffe058)         = 0
_llseek(7, 86016, [86016], SEEK_SET)    = 0
read(7, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffd908)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffe028)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffe058)        = 0
_llseek(17, 86016, [86016], SEEK_SET)   = 0
read(17, "tripes = [\n\"pv0\", 26\n]\n}\n}\n}\n}\n#"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffd908)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffe028)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffe058)        = 0
_llseek(24, 81920, [81920], SEEK_SET)   = 0
read(24, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffd908)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffe028)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffe058)        = 0
_llseek(28, 81920, [81920], SEEK_SET)   = 0
read(28, "unt = 1\n\nsegment1 {\nstart_extent"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffd908)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffe028)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffe058)        = 0
_llseek(32, 81920, [81920], SEEK_SET)   = 0
read(32, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffd908)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffe028)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffe058)        = 0
_llseek(35, 77824, [77824], SEEK_SET)   = 0
read(35, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffe518)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffe4e8)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffe478)        = 0
_llseek(17, 86016, [86016], SEEK_SET)   = 0
read(17, "tripes = [\n\"pv0\", 26\n]\n}\n}\n}\n}\n#"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffe468)        = 0
_llseek(17, 86016, [86016], SEEK_SET)   = 0
read(17, "tripes = [\n\"pv0\", 26\n]\n}\n}\n}\n}\n#"..., 12288) = 12288
ioctl(42, BLKBSZGET, 0xbfffd908)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbfffe028)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbfffe058)        = 0
_llseek(42, 90112, [90112], SEEK_SET)   = 0
read(42, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffd908)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffe028)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffe058)        = 0
_llseek(43, 90112, [90112], SEEK_SET)   = 0
read(43, "= 1\n\ntype = \"striped\"\nstripe_cou"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffd908)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffe028)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffe058)        = 0
_llseek(44, 90112, [90112], SEEK_SET)   = 0
read(44, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffd908)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffe028)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffe058)        = 0
_llseek(45, 86016, [86016], SEEK_SET)   = 0
read(45, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffd908)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffe028)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffe058)         = 0
_llseek(7, 86016, [86016], SEEK_SET)    = 0
read(7, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffd908)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffe028)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffe058)        = 0
_llseek(17, 86016, [86016], SEEK_SET)   = 0
read(17, "tripes = [\n\"pv0\", 26\n]\n}\n}\n}\n}\n#"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffd908)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffe028)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffe058)        = 0
_llseek(24, 81920, [81920], SEEK_SET)   = 0
read(24, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffd908)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffe028)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffe058)        = 0
_llseek(28, 81920, [81920], SEEK_SET)   = 0
read(28, "unt = 1\n\nsegment1 {\nstart_extent"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffd908)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffe028)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffe058)        = 0
_llseek(32, 81920, [81920], SEEK_SET)   = 0
read(32, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffd908)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffe028)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffe058)        = 0
_llseek(35, 77824, [77824], SEEK_SET)   = 0
read(35, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffe518)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffe4e8)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffe478)        = 0
_llseek(24, 81920, [81920], SEEK_SET)   = 0
read(24, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffe468)        = 0
_llseek(24, 81920, [81920], SEEK_SET)   = 0
read(24, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 12288) = 12288
ioctl(42, BLKBSZGET, 0xbfffd908)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbfffe028)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbfffe058)        = 0
_llseek(42, 90112, [90112], SEEK_SET)   = 0
read(42, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffd908)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffe028)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffe058)        = 0
_llseek(43, 90112, [90112], SEEK_SET)   = 0
read(43, "= 1\n\ntype = \"striped\"\nstripe_cou"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffd908)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffe028)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffe058)        = 0
_llseek(44, 90112, [90112], SEEK_SET)   = 0
read(44, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffd908)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffe028)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffe058)        = 0
_llseek(45, 86016, [86016], SEEK_SET)   = 0
read(45, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffd908)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffe028)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffe058)         = 0
_llseek(7, 86016, [86016], SEEK_SET)    = 0
read(7, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffd908)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffe028)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffe058)        = 0
_llseek(17, 86016, [86016], SEEK_SET)   = 0
read(17, "tripes = [\n\"pv0\", 26\n]\n}\n}\n}\n}\n#"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffd908)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffe028)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffe058)        = 0
_llseek(24, 81920, [81920], SEEK_SET)   = 0
read(24, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffd908)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffe028)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffe058)        = 0
_llseek(28, 81920, [81920], SEEK_SET)   = 0
read(28, "unt = 1\n\nsegment1 {\nstart_extent"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffd908)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffe028)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffe058)        = 0
_llseek(32, 81920, [81920], SEEK_SET)   = 0
read(32, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffd908)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffe028)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffe058)        = 0
_llseek(35, 77824, [77824], SEEK_SET)   = 0
read(35, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffe518)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffe4e8)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffe478)        = 0
_llseek(28, 81920, [81920], SEEK_SET)   = 0
read(28, "unt = 1\n\nsegment1 {\nstart_extent"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffe468)        = 0
_llseek(28, 81920, [81920], SEEK_SET)   = 0
read(28, "unt = 1\n\nsegment1 {\nstart_extent"..., 12288) = 12288
ioctl(42, BLKBSZGET, 0xbfffd908)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbfffe028)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbfffe058)        = 0
_llseek(42, 90112, [90112], SEEK_SET)   = 0
read(42, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffd908)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffe028)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffe058)        = 0
_llseek(43, 90112, [90112], SEEK_SET)   = 0
read(43, "= 1\n\ntype = \"striped\"\nstripe_cou"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffd908)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffe028)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffe058)        = 0
_llseek(44, 90112, [90112], SEEK_SET)   = 0
read(44, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffd908)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffe028)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffe058)        = 0
_llseek(45, 86016, [86016], SEEK_SET)   = 0
read(45, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffd908)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffe028)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffe058)         = 0
_llseek(7, 86016, [86016], SEEK_SET)    = 0
read(7, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffd908)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffe028)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffe058)        = 0
_llseek(17, 86016, [86016], SEEK_SET)   = 0
read(17, "tripes = [\n\"pv0\", 26\n]\n}\n}\n}\n}\n#"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffd908)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffe028)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffe058)        = 0
_llseek(24, 81920, [81920], SEEK_SET)   = 0
read(24, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffd908)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffe028)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffe058)        = 0
_llseek(28, 81920, [81920], SEEK_SET)   = 0
read(28, "unt = 1\n\nsegment1 {\nstart_extent"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffd908)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffe028)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffe058)        = 0
_llseek(32, 81920, [81920], SEEK_SET)   = 0
read(32, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffd908)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffe028)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffe058)        = 0
_llseek(35, 77824, [77824], SEEK_SET)   = 0
read(35, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffe518)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffe4e8)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffe478)        = 0
_llseek(32, 81920, [81920], SEEK_SET)   = 0
read(32, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffe468)        = 0
_llseek(32, 81920, [81920], SEEK_SET)   = 0
read(32, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 12288) = 12288
ioctl(42, BLKBSZGET, 0xbfffd908)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbfffe028)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbfffe058)        = 0
_llseek(42, 90112, [90112], SEEK_SET)   = 0
read(42, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffd908)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffe028)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffe058)        = 0
_llseek(43, 90112, [90112], SEEK_SET)   = 0
read(43, "= 1\n\ntype = \"striped\"\nstripe_cou"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffd908)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffe028)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffe058)        = 0
_llseek(44, 90112, [90112], SEEK_SET)   = 0
read(44, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffd908)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffe028)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffe058)        = 0
_llseek(45, 86016, [86016], SEEK_SET)   = 0
read(45, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffd908)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffe028)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffe058)         = 0
_llseek(7, 86016, [86016], SEEK_SET)    = 0
read(7, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffd908)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffe028)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffe058)        = 0
_llseek(17, 86016, [86016], SEEK_SET)   = 0
read(17, "tripes = [\n\"pv0\", 26\n]\n}\n}\n}\n}\n#"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffd908)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffe028)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffe058)        = 0
_llseek(24, 81920, [81920], SEEK_SET)   = 0
read(24, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffd908)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffe028)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffe058)        = 0
_llseek(28, 81920, [81920], SEEK_SET)   = 0
read(28, "unt = 1\n\nsegment1 {\nstart_extent"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffd908)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffe028)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffe058)        = 0
_llseek(32, 81920, [81920], SEEK_SET)   = 0
read(32, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffd908)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffe028)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffe058)        = 0
_llseek(35, 77824, [77824], SEEK_SET)   = 0
read(35, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffe518)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffe4e8)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffe478)        = 0
_llseek(35, 77824, [77824], SEEK_SET)   = 0
read(35, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffe468)        = 0
_llseek(35, 77824, [77824], SEEK_SET)   = 0
read(35, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 12288) = 12288
ioctl(42, BLKBSZGET, 0xbfffd908)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbfffe028)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbfffe058)        = 0
_llseek(42, 90112, [90112], SEEK_SET)   = 0
read(42, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffd908)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffe028)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffe058)        = 0
_llseek(43, 90112, [90112], SEEK_SET)   = 0
read(43, "= 1\n\ntype = \"striped\"\nstripe_cou"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffd908)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffe028)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffe058)        = 0
_llseek(44, 90112, [90112], SEEK_SET)   = 0
read(44, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffd908)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffe028)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffe058)        = 0
_llseek(45, 86016, [86016], SEEK_SET)   = 0
read(45, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffd908)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffe028)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffe058)         = 0
_llseek(7, 86016, [86016], SEEK_SET)    = 0
read(7, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffd908)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffe028)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffe058)        = 0
_llseek(17, 86016, [86016], SEEK_SET)   = 0
read(17, "tripes = [\n\"pv0\", 26\n]\n}\n}\n}\n}\n#"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffd908)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffe028)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffe058)        = 0
_llseek(24, 81920, [81920], SEEK_SET)   = 0
read(24, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffd908)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffe028)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffe058)        = 0
_llseek(28, 81920, [81920], SEEK_SET)   = 0
read(28, "unt = 1\n\nsegment1 {\nstart_extent"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffd908)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffe028)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffe058)        = 0
_llseek(32, 81920, [81920], SEEK_SET)   = 0
read(32, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffd908)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffe028)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffe058)        = 0
_llseek(35, 77824, [77824], SEEK_SET)   = 0
read(35, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbfffe518)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbfffe4e8)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbfffe478)        = 0
_llseek(42, 90112, [90112], SEEK_SET)   = 0
read(42, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbfffe468)        = 0
_llseek(42, 90112, [90112], SEEK_SET)   = 0
read(42, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 12288) = 12288
ioctl(42, BLKBSZGET, 0xbfffd908)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbfffe028)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbfffe058)        = 0
_llseek(42, 90112, [90112], SEEK_SET)   = 0
read(42, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffd908)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffe028)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffe058)        = 0
_llseek(43, 90112, [90112], SEEK_SET)   = 0
read(43, "= 1\n\ntype = \"striped\"\nstripe_cou"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffd908)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffe028)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffe058)        = 0
_llseek(44, 90112, [90112], SEEK_SET)   = 0
read(44, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffd908)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffe028)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffe058)        = 0
_llseek(45, 86016, [86016], SEEK_SET)   = 0
read(45, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffd908)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffe028)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffe058)         = 0
_llseek(7, 86016, [86016], SEEK_SET)    = 0
read(7, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffd908)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffe028)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffe058)        = 0
_llseek(17, 86016, [86016], SEEK_SET)   = 0
read(17, "tripes = [\n\"pv0\", 26\n]\n}\n}\n}\n}\n#"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffd908)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffe028)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffe058)        = 0
_llseek(24, 81920, [81920], SEEK_SET)   = 0
read(24, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffd908)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffe028)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffe058)        = 0
_llseek(28, 81920, [81920], SEEK_SET)   = 0
read(28, "unt = 1\n\nsegment1 {\nstart_extent"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffd908)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffe028)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffe058)        = 0
_llseek(32, 81920, [81920], SEEK_SET)   = 0
read(32, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffd908)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffe028)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffe058)        = 0
_llseek(35, 77824, [77824], SEEK_SET)   = 0
read(35, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffe518)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffe4e8)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffe478)        = 0
_llseek(43, 90112, [90112], SEEK_SET)   = 0
read(43, "= 1\n\ntype = \"striped\"\nstripe_cou"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffe468)        = 0
_llseek(43, 90112, [90112], SEEK_SET)   = 0
read(43, "= 1\n\ntype = \"striped\"\nstripe_cou"..., 12288) = 12288
ioctl(42, BLKBSZGET, 0xbfffd908)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbfffe028)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbfffe058)        = 0
_llseek(42, 90112, [90112], SEEK_SET)   = 0
read(42, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffd908)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffe028)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffe058)        = 0
_llseek(43, 90112, [90112], SEEK_SET)   = 0
read(43, "= 1\n\ntype = \"striped\"\nstripe_cou"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffd908)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffe028)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffe058)        = 0
_llseek(44, 90112, [90112], SEEK_SET)   = 0
read(44, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffd908)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffe028)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffe058)        = 0
_llseek(45, 86016, [86016], SEEK_SET)   = 0
read(45, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffd908)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffe028)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffe058)         = 0
_llseek(7, 86016, [86016], SEEK_SET)    = 0
read(7, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffd908)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffe028)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffe058)        = 0
_llseek(17, 86016, [86016], SEEK_SET)   = 0
read(17, "tripes = [\n\"pv0\", 26\n]\n}\n}\n}\n}\n#"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffd908)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffe028)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffe058)        = 0
_llseek(24, 81920, [81920], SEEK_SET)   = 0
read(24, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffd908)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffe028)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffe058)        = 0
_llseek(28, 81920, [81920], SEEK_SET)   = 0
read(28, "unt = 1\n\nsegment1 {\nstart_extent"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffd908)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffe028)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffe058)        = 0
_llseek(32, 81920, [81920], SEEK_SET)   = 0
read(32, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffd908)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffe028)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffe058)        = 0
_llseek(35, 77824, [77824], SEEK_SET)   = 0
read(35, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffe518)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffe4e8)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffe478)        = 0
_llseek(44, 90112, [90112], SEEK_SET)   = 0
read(44, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffe468)        = 0
_llseek(44, 90112, [90112], SEEK_SET)   = 0
read(44, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 12288) = 12288
ioctl(42, BLKBSZGET, 0xbfffd908)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbfffe028)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbfffe058)        = 0
_llseek(42, 90112, [90112], SEEK_SET)   = 0
read(42, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffd908)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffe028)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffe058)        = 0
_llseek(43, 90112, [90112], SEEK_SET)   = 0
read(43, "= 1\n\ntype = \"striped\"\nstripe_cou"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffd908)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffe028)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffe058)        = 0
_llseek(44, 90112, [90112], SEEK_SET)   = 0
read(44, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffd908)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffe028)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffe058)        = 0
_llseek(45, 86016, [86016], SEEK_SET)   = 0
read(45, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffd908)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffe028)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffe058)         = 0
_llseek(7, 86016, [86016], SEEK_SET)    = 0
read(7, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffd908)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffe028)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffe058)        = 0
_llseek(17, 86016, [86016], SEEK_SET)   = 0
read(17, "tripes = [\n\"pv0\", 26\n]\n}\n}\n}\n}\n#"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffd908)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffe028)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffe058)        = 0
_llseek(24, 81920, [81920], SEEK_SET)   = 0
read(24, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffd908)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffe028)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffe058)        = 0
_llseek(28, 81920, [81920], SEEK_SET)   = 0
read(28, "unt = 1\n\nsegment1 {\nstart_extent"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffd908)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffe028)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffe058)        = 0
_llseek(32, 81920, [81920], SEEK_SET)   = 0
read(32, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffd908)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffe028)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffe058)        = 0
_llseek(35, 77824, [77824], SEEK_SET)   = 0
read(35, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffe518)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffe4e8)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffe478)        = 0
_llseek(45, 86016, [86016], SEEK_SET)   = 0
read(45, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffe468)        = 0
_llseek(45, 86016, [86016], SEEK_SET)   = 0
read(45, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 12288) = 12288
ioctl(42, BLKBSZGET, 0xbfffd908)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbfffe028)        = 0
_llseek(42, 0, [0], SEEK_SET)           = 0
read(42, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(42, BLKBSZGET, 0xbfffe058)        = 0
_llseek(42, 90112, [90112], SEEK_SET)   = 0
read(42, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffd908)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffe028)        = 0
_llseek(43, 0, [0], SEEK_SET)           = 0
read(43, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(43, BLKBSZGET, 0xbfffe058)        = 0
_llseek(43, 90112, [90112], SEEK_SET)   = 0
read(43, "= 1\n\ntype = \"striped\"\nstripe_cou"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffd908)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffe028)        = 0
_llseek(44, 0, [0], SEEK_SET)           = 0
read(44, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(44, BLKBSZGET, 0xbfffe058)        = 0
_llseek(44, 90112, [90112], SEEK_SET)   = 0
read(44, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffd908)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffe028)        = 0
_llseek(45, 0, [0], SEEK_SET)           = 0
read(45, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(45, BLKBSZGET, 0xbfffe058)        = 0
_llseek(45, 86016, [86016], SEEK_SET)   = 0
read(45, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffd908)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffe028)         = 0
_llseek(7, 0, [0], SEEK_SET)            = 0
read(7, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(7, BLKBSZGET, 0xbfffe058)         = 0
_llseek(7, 86016, [86016], SEEK_SET)    = 0
read(7, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffd908)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffe028)        = 0
_llseek(17, 0, [0], SEEK_SET)           = 0
read(17, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(17, BLKBSZGET, 0xbfffe058)        = 0
_llseek(17, 86016, [86016], SEEK_SET)   = 0
read(17, "tripes = [\n\"pv0\", 26\n]\n}\n}\n}\n}\n#"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffd908)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffe028)        = 0
_llseek(24, 0, [0], SEEK_SET)           = 0
read(24, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(24, BLKBSZGET, 0xbfffe058)        = 0
_llseek(24, 81920, [81920], SEEK_SET)   = 0
read(24, "unt = 1\t# linear\n\nstripes = [\n\"p"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffd908)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffe028)        = 0
_llseek(28, 0, [0], SEEK_SET)           = 0
read(28, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(28, BLKBSZGET, 0xbfffe058)        = 0
_llseek(28, 81920, [81920], SEEK_SET)   = 0
read(28, "unt = 1\n\nsegment1 {\nstart_extent"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffd908)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffe028)        = 0
_llseek(32, 0, [0], SEEK_SET)           = 0
read(32, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(32, BLKBSZGET, 0xbfffe058)        = 0
_llseek(32, 81920, [81920], SEEK_SET)   = 0
read(32, "vg3 {\nid = \"cXWsBD-VU22-t6Ue-b4c"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffd908)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffe028)        = 0
_llseek(35, 0, [0], SEEK_SET)           = 0
read(35, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
ioctl(35, BLKBSZGET, 0xbfffe058)        = 0
_llseek(35, 77824, [77824], SEEK_SET)   = 0
read(35, "\"\nstatus = [\"READ\", \"WRITE\", \"VI"..., 4096) = 4096
ioctl(3, DM_DEV_STATUS, 0x8128478)      = -1 ENXIO (No such device or address)
ioctl(3, DM_DEV_STATUS, 0x8128478)      = -1 ENXIO (No such device or address)
mlockall(MCL_CURRENT|MCL_FUTURE)        = 0
brk(0)                                  = 0x8143000
brk(0x894f000)                          = 0x894f000
brk(0)                                  = 0x894f000
brk(0x8b37000)                          = 0x8b37000
getpriority(PRIO_PROCESS, 0)            = 20
setpriority(PRIO_PROCESS, 0, -18)       = 0
ioctl(3, DM_LIST_DEVICES, 0x8128478)    = 0
ioctl(3, DM_DEV_STATUS, 0x8128478)      = 0
ioctl(3, DM_DEV_STATUS, 0x8128478)      = 0
ioctl(3, DM_DEV_STATUS, 0x8128478)      = 0
ioctl(3, DM_DEV_STATUS, 0x8128478)      = 0
ioctl(3, DM_DEV_STATUS, 0x8128478)      = 0
ioctl(3, DM_DEV_STATUS, 0x8128478)      = 0
ioctl(3, DM_DEV_STATUS, 0x8128478)      = 0
ioctl(3, DM_DEV_STATUS, 0x8128478)      = 0
ioctl(3, DM_DEV_STATUS, 0x8128478)      = 0
ioctl(3, DM_DEV_STATUS, 0x8128478)      = 0
ioctl(3, DM_DEV_STATUS, 0x8128478)      = 0
ioctl(3, DM_DEV_STATUS, 0x8128478)      = 0
ioctl(3, DM_DEV_STATUS, 0x8128478)      = 0
ioctl(3, DM_DEV_STATUS, 0x8128478)      = 0
ioctl(3, DM_DEV_STATUS, 0x8128478)      = 0
ioctl(3, DM_DEV_STATUS, 0x8128478)      = 0
ioctl(3, DM_DEV_STATUS, 0x8128478)      = 0
ioctl(3, DM_DEV_STATUS, 0x8128478)      = 0
ioctl(3, DM_DEV_STATUS, 0x8128478)      = 0
ioctl(3, DM_DEV_STATUS, 0x8128478)      = 0
ioctl(3, DM_DEV_STATUS, 0x8128478)      = 0
ioctl(3, DM_DEV_STATUS, 0x8128478)      = 0
ioctl(3, DM_DEV_STATUS, 0x8128478)      = 0
ioctl(3, DM_DEV_STATUS, 0x8128478)      = 0
ioctl(3, DM_DEV_STATUS, 0x8128478)      = 0
ioctl(3, DM_DEV_STATUS, 0x8128478)      = 0
ioctl(3, DM_DEV_STATUS, 0x8128478)      = 0
ioctl(3, DM_DEV_STATUS, 0x8128478)      = -1 ENXIO (No such device or address)
ioctl(3, DM_DEV_STATUS, 0x8128478)      = -1 ENXIO (No such device or address)
ioctl(3, DM_DEV_CREATE, 0x8128478)      = 0
ioctl(3, DM_TABLE_LOAD, 0x8128478)      = 0
ioctl(3, DM_DEV_SUSPEND, 0x8128478)     = 0
ioctl(3, DM_DEV_REMOVE, 0x8128478)      = 0
ioctl(3, DM_DEV_REMOVE, 0x8128478)      = 0
ioctl(3, DM_DEV_REMOVE, 0x8128478)      = 0
ioctl(3, DM_DEV_REMOVE, 0x8128478)      = 0
ioctl(3, DM_DEV_REMOVE, 0x8128478)      = 0
ioctl(3, DM_DEV_REMOVE, 0x8128478)      = 0
ioctl(3, DM_DEV_REMOVE, 0x8128478)      = 0
ioctl(3, DM_DEV_REMOVE, 0x8128478)      = 0
ioctl(3, DM_DEV_REMOVE, 0x8128478)      = 0
ioctl(3, DM_DEV_REMOVE, 0x8128478)      = 0
ioctl(3, DM_DEV_REMOVE, 0x8128478)      = 0
ioctl(3, DM_DEV_REMOVE, 0x8128478)      = 0
ioctl(3, DM_DEV_REMOVE, 0x8128478)      = 0
ioctl(3, DM_DEV_REMOVE, 0x8128478)      = 0
ioctl(3, DM_DEV_REMOVE, 0x8128478)      = 0
ioctl(3, DM_DEV_REMOVE, 0x8128478)      = 0
ioctl(3, DM_DEV_REMOVE, 0x8128478)      = 0
ioctl(3, DM_DEV_REMOVE, 0x8128478)      = 0
ioctl(3, DM_DEV_REMOVE, 0x8128478)      = 0
ioctl(3, DM_DEV_REMOVE, 0x8128478)      = 0
ioctl(3, DM_DEV_REMOVE, 0x8128478)      = 0
ioctl(3, DM_DEV_REMOVE, 0x8128478)      = 0
ioctl(3, DM_DEV_REMOVE, 0x8128478)      = 0
ioctl(3, DM_DEV_REMOVE, 0x8128478)      = 0
ioctl(3, DM_DEV_REMOVE, 0x8128478)      = 0
ioctl(3, DM_DEV_REMOVE, 0x8128478)      = 0
ioctl(3, DM_DEV_REMOVE, 0x8128478)      = 0
munlockall()                            = 0
brk(0)                                  = 0x8b37000
brk(0)                                  = 0x8b37000
brk(0x814f000)                          = 0x814f000
brk(0)                                  = 0x814f000
setpriority(PRIO_PROCESS, 0, 0)         = 0
close(3)                                = 0
stat64("/dev/mapper/vg3-lvol27", 0xbfffd59c) = -1 ENOENT (No such file or directory)
mknod("/dev/mapper/vg3-lvol27", S_IFBLK|0640, makedev(254, 527)) = 0
stat64("/dev/mapper/vg3-lvol12", {st_mode=S_IFBLK|0600, st_rdev=makedev(254, 0), ...}) = 0
unlink("/dev/mapper/vg3-lvol12")        = 0
stat64("/dev/mapper/vg3-lvol15", {st_mode=S_IFBLK|0600, st_rdev=makedev(254, 3), ...}) = 0
unlink("/dev/mapper/vg3-lvol15")        = 0
stat64("/dev/mapper/vg3-lvol0", {st_mode=S_IFBLK|0600, st_rdev=makedev(254, 244), ...}) = 0
unlink("/dev/mapper/vg3-lvol0")         = 0
stat64("/dev/mapper/vg3-lvol2", {st_mode=S_IFBLK|0600, st_rdev=makedev(254, 246), ...}) = 0
unlink("/dev/mapper/vg3-lvol2")         = 0
stat64("/dev/mapper/vg3-lvol8", {st_mode=S_IFBLK|0600, st_rdev=makedev(254, 252), ...}) = 0
unlink("/dev/mapper/vg3-lvol8")         = 0
stat64("/dev/mapper/vg3-lvol21", {st_mode=S_IFBLK|0600, st_rdev=makedev(254, 9), ...}) = 0
unlink("/dev/mapper/vg3-lvol21")        = 0
stat64("/dev/mapper/vg3-lvol22", {st_mode=S_IFBLK|0600, st_rdev=makedev(254, 10), ...}) = 0
unlink("/dev/mapper/vg3-lvol22")        = 0
stat64("/dev/mapper/vg3-lvol7", {st_mode=S_IFBLK|0600, st_rdev=makedev(254, 251), ...}) = 0
unlink("/dev/mapper/vg3-lvol7")         = 0
stat64("/dev/mapper/vg3-lvol18", {st_mode=S_IFBLK|0600, st_rdev=makedev(254, 6), ...}) = 0
unlink("/dev/mapper/vg3-lvol18")        = 0
stat64("/dev/mapper/vg3-lvol14", {st_mode=S_IFBLK|0600, st_rdev=makedev(254, 2), ...}) = 0
unlink("/dev/mapper/vg3-lvol14")        = 0
stat64("/dev/mapper/vg3-lvol23", {st_mode=S_IFBLK|0600, st_rdev=makedev(254, 11), ...}) = 0
unlink("/dev/mapper/vg3-lvol23")        = 0
stat64("/dev/mapper/vg3-lvol17", {st_mode=S_IFBLK|0600, st_rdev=makedev(254, 5), ...}) = 0
unlink("/dev/mapper/vg3-lvol17")        = 0
stat64("/dev/mapper/vg3-lvol24", {st_mode=S_IFBLK|0600, st_rdev=makedev(254, 12), ...}) = 0
unlink("/dev/mapper/vg3-lvol24")        = 0
stat64("/dev/mapper/vg3-lvol13", {st_mode=S_IFBLK|0600, st_rdev=makedev(254, 1), ...}) = 0
unlink("/dev/mapper/vg3-lvol13")        = 0
stat64("/dev/mapper/vg3-lvol4", {st_mode=S_IFBLK|0600, st_rdev=makedev(254, 248), ...}) = 0
unlink("/dev/mapper/vg3-lvol4")         = 0
stat64("/dev/mapper/vg3-lvol19", {st_mode=S_IFBLK|0600, st_rdev=makedev(254, 7), ...}) = 0
unlink("/dev/mapper/vg3-lvol19")        = 0
stat64("/dev/mapper/vg3-lvol20", {st_mode=S_IFBLK|0600, st_rdev=makedev(254, 8), ...}) = 0
unlink("/dev/mapper/vg3-lvol20")        = 0
stat64("/dev/mapper/vg3-lvol6", {st_mode=S_IFBLK|0600, st_rdev=makedev(254, 250), ...}) = 0
unlink("/dev/mapper/vg3-lvol6")         = 0
stat64("/dev/mapper/vg3-lvol26", {st_mode=S_IFBLK|0600, st_rdev=makedev(254, 14), ...}) = 0
unlink("/dev/mapper/vg3-lvol26")        = 0
stat64("/dev/mapper/vg3-lvol1", {st_mode=S_IFBLK|0600, st_rdev=makedev(254, 245), ...}) = 0
unlink("/dev/mapper/vg3-lvol1")         = 0
stat64("/dev/mapper/vg3-lvol16", {st_mode=S_IFBLK|0600, st_rdev=makedev(254, 4), ...}) = 0
unlink("/dev/mapper/vg3-lvol16")        = 0
stat64("/dev/mapper/vg3-lvol9", {st_mode=S_IFBLK|0600, st_rdev=makedev(254, 253), ...}) = 0
unlink("/dev/mapper/vg3-lvol9")         = 0
stat64("/dev/mapper/vg3-lvol11", {st_mode=S_IFBLK|0600, st_rdev=makedev(254, 255), ...}) = 0
unlink("/dev/mapper/vg3-lvol11")        = 0
stat64("/dev/mapper/vg3-lvol25", {st_mode=S_IFBLK|0600, st_rdev=makedev(254, 13), ...}) = 0
unlink("/dev/mapper/vg3-lvol25")        = 0
stat64("/dev/mapper/vg3-lvol10", {st_mode=S_IFBLK|0600, st_rdev=makedev(254, 254), ...}) = 0
unlink("/dev/mapper/vg3-lvol10")        = 0
stat64("/dev/mapper/vg3-lvol3", {st_mode=S_IFBLK|0600, st_rdev=makedev(254, 247), ...}) = 0
unlink("/dev/mapper/vg3-lvol3")         = 0
stat64("/dev/mapper/vg3-lvol5", {st_mode=S_IFBLK|0600, st_rdev=makedev(254, 249), ...}) = 0
unlink("/dev/mapper/vg3-lvol5")         = 0
stat64("/dev/vg3", {st_mode=S_IFDIR|0500, st_size=4096, ...}) = 0
lstat64("/dev/vg3/group", 0xbfffa620)   = -1 ENOENT (No such file or directory)
lstat64("/dev/vg3/lvol27", 0xbfffa620)  = -1 ENOENT (No such file or directory)
symlink("/dev/mapper/vg3-lvol27", "/dev/vg3/lvol27") = 0
open("/proc/filesystems", O_RDONLY)     = 3
read(3, "nodev\tsysfs\nnodev\trootfs\nnodev\tb"..., 4095) = 249
close(3)                                = 0
lstat64("/dev/vg3/lvol12", {st_mode=S_IFLNK|0777, st_size=22, ...}) = 0
unlink("/dev/vg3/lvol12")               = 0
open("/dev/vg3", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=S_IFDIR|0500, st_size=4096, ...}) = 0
fcntl64(3, F_SETFD, FD_CLOEXEC)         = 0
getdents64(3, /* 29 entries */, 4096)   = 912
close(3)                                = 0
lstat64("/dev/vg3/lvol15", {st_mode=S_IFLNK|0777, st_size=22, ...}) = 0
unlink("/dev/vg3/lvol15")               = 0
open("/dev/vg3", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=S_IFDIR|0500, st_size=4096, ...}) = 0
fcntl64(3, F_SETFD, FD_CLOEXEC)         = 0
getdents64(3, /* 28 entries */, 4096)   = 880
close(3)                                = 0
lstat64("/dev/vg3/lvol0", {st_mode=S_IFLNK|0777, st_size=21, ...}) = 0
unlink("/dev/vg3/lvol0")                = 0
open("/dev/vg3", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=S_IFDIR|0500, st_size=4096, ...}) = 0
fcntl64(3, F_SETFD, FD_CLOEXEC)         = 0
getdents64(3, /* 27 entries */, 4096)   = 848
close(3)                                = 0
lstat64("/dev/vg3/lvol2", {st_mode=S_IFLNK|0777, st_size=21, ...}) = 0
unlink("/dev/vg3/lvol2")                = 0
open("/dev/vg3", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=S_IFDIR|0500, st_size=4096, ...}) = 0
fcntl64(3, F_SETFD, FD_CLOEXEC)         = 0
getdents64(3, /* 26 entries */, 4096)   = 816
close(3)                                = 0
lstat64("/dev/vg3/lvol8", {st_mode=S_IFLNK|0777, st_size=21, ...}) = 0
unlink("/dev/vg3/lvol8")                = 0
open("/dev/vg3", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=S_IFDIR|0500, st_size=4096, ...}) = 0
fcntl64(3, F_SETFD, FD_CLOEXEC)         = 0
getdents64(3, /* 25 entries */, 4096)   = 784
close(3)                                = 0
lstat64("/dev/vg3/lvol21", {st_mode=S_IFLNK|0777, st_size=22, ...}) = 0
unlink("/dev/vg3/lvol21")               = 0
open("/dev/vg3", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=S_IFDIR|0500, st_size=4096, ...}) = 0
fcntl64(3, F_SETFD, FD_CLOEXEC)         = 0
getdents64(3, /* 24 entries */, 4096)   = 752
close(3)                                = 0
lstat64("/dev/vg3/lvol22", {st_mode=S_IFLNK|0777, st_size=22, ...}) = 0
unlink("/dev/vg3/lvol22")               = 0
open("/dev/vg3", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=S_IFDIR|0500, st_size=4096, ...}) = 0
fcntl64(3, F_SETFD, FD_CLOEXEC)         = 0
getdents64(3, /* 23 entries */, 4096)   = 720
close(3)                                = 0
lstat64("/dev/vg3/lvol7", {st_mode=S_IFLNK|0777, st_size=21, ...}) = 0
unlink("/dev/vg3/lvol7")                = 0
open("/dev/vg3", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=S_IFDIR|0500, st_size=4096, ...}) = 0
fcntl64(3, F_SETFD, FD_CLOEXEC)         = 0
getdents64(3, /* 22 entries */, 4096)   = 688
close(3)                                = 0
lstat64("/dev/vg3/lvol18", {st_mode=S_IFLNK|0777, st_size=22, ...}) = 0
unlink("/dev/vg3/lvol18")               = 0
open("/dev/vg3", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=S_IFDIR|0500, st_size=4096, ...}) = 0
fcntl64(3, F_SETFD, FD_CLOEXEC)         = 0
getdents64(3, /* 21 entries */, 4096)   = 656
close(3)                                = 0
lstat64("/dev/vg3/lvol14", {st_mode=S_IFLNK|0777, st_size=22, ...}) = 0
unlink("/dev/vg3/lvol14")               = 0
open("/dev/vg3", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=S_IFDIR|0500, st_size=4096, ...}) = 0
fcntl64(3, F_SETFD, FD_CLOEXEC)         = 0
getdents64(3, /* 20 entries */, 4096)   = 624
close(3)                                = 0
lstat64("/dev/vg3/lvol23", {st_mode=S_IFLNK|0777, st_size=22, ...}) = 0
unlink("/dev/vg3/lvol23")               = 0
open("/dev/vg3", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=S_IFDIR|0500, st_size=4096, ...}) = 0
fcntl64(3, F_SETFD, FD_CLOEXEC)         = 0
getdents64(3, /* 19 entries */, 4096)   = 592
close(3)                                = 0
lstat64("/dev/vg3/lvol17", {st_mode=S_IFLNK|0777, st_size=22, ...}) = 0
unlink("/dev/vg3/lvol17")               = 0
open("/dev/vg3", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=S_IFDIR|0500, st_size=4096, ...}) = 0
fcntl64(3, F_SETFD, FD_CLOEXEC)         = 0
getdents64(3, /* 18 entries */, 4096)   = 560
close(3)                                = 0
lstat64("/dev/vg3/lvol24", {st_mode=S_IFLNK|0777, st_size=22, ...}) = 0
unlink("/dev/vg3/lvol24")               = 0
open("/dev/vg3", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=S_IFDIR|0500, st_size=4096, ...}) = 0
fcntl64(3, F_SETFD, FD_CLOEXEC)         = 0
getdents64(3, /* 17 entries */, 4096)   = 528
close(3)                                = 0
lstat64("/dev/vg3/lvol13", {st_mode=S_IFLNK|0777, st_size=22, ...}) = 0
unlink("/dev/vg3/lvol13")               = 0
open("/dev/vg3", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=S_IFDIR|0500, st_size=4096, ...}) = 0
fcntl64(3, F_SETFD, FD_CLOEXEC)         = 0
getdents64(3, /* 16 entries */, 4096)   = 496
close(3)                                = 0
lstat64("/dev/vg3/lvol4", {st_mode=S_IFLNK|0777, st_size=21, ...}) = 0
unlink("/dev/vg3/lvol4")                = 0
open("/dev/vg3", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=S_IFDIR|0500, st_size=4096, ...}) = 0
fcntl64(3, F_SETFD, FD_CLOEXEC)         = 0
getdents64(3, /* 15 entries */, 4096)   = 464
close(3)                                = 0
lstat64("/dev/vg3/lvol19", {st_mode=S_IFLNK|0777, st_size=22, ...}) = 0
unlink("/dev/vg3/lvol19")               = 0
open("/dev/vg3", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=S_IFDIR|0500, st_size=4096, ...}) = 0
fcntl64(3, F_SETFD, FD_CLOEXEC)         = 0
getdents64(3, /* 14 entries */, 4096)   = 432
close(3)                                = 0
lstat64("/dev/vg3/lvol20", {st_mode=S_IFLNK|0777, st_size=22, ...}) = 0
unlink("/dev/vg3/lvol20")               = 0
open("/dev/vg3", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=S_IFDIR|0500, st_size=4096, ...}) = 0
fcntl64(3, F_SETFD, FD_CLOEXEC)         = 0
getdents64(3, /* 13 entries */, 4096)   = 400
close(3)                                = 0
lstat64("/dev/vg3/lvol6", {st_mode=S_IFLNK|0777, st_size=21, ...}) = 0
unlink("/dev/vg3/lvol6")                = 0
open("/dev/vg3", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=S_IFDIR|0500, st_size=4096, ...}) = 0
fcntl64(3, F_SETFD, FD_CLOEXEC)         = 0
getdents64(3, /* 12 entries */, 4096)   = 368
close(3)                                = 0
lstat64("/dev/vg3/lvol26", {st_mode=S_IFLNK|0777, st_size=22, ...}) = 0
unlink("/dev/vg3/lvol26")               = 0
open("/dev/vg3", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=S_IFDIR|0500, st_size=4096, ...}) = 0
fcntl64(3, F_SETFD, FD_CLOEXEC)         = 0
getdents64(3, /* 11 entries */, 4096)   = 336
close(3)                                = 0
lstat64("/dev/vg3/lvol1", {st_mode=S_IFLNK|0777, st_size=21, ...}) = 0
unlink("/dev/vg3/lvol1")                = 0
open("/dev/vg3", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=S_IFDIR|0500, st_size=4096, ...}) = 0
fcntl64(3, F_SETFD, FD_CLOEXEC)         = 0
getdents64(3, /* 10 entries */, 4096)   = 304
close(3)                                = 0
lstat64("/dev/vg3/lvol16", {st_mode=S_IFLNK|0777, st_size=22, ...}) = 0
unlink("/dev/vg3/lvol16")               = 0
open("/dev/vg3", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=S_IFDIR|0500, st_size=4096, ...}) = 0
fcntl64(3, F_SETFD, FD_CLOEXEC)         = 0
getdents64(3, /* 9 entries */, 4096)    = 272
close(3)                                = 0
lstat64("/dev/vg3/lvol9", {st_mode=S_IFLNK|0777, st_size=21, ...}) = 0
unlink("/dev/vg3/lvol9")                = 0
open("/dev/vg3", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=S_IFDIR|0500, st_size=4096, ...}) = 0
fcntl64(3, F_SETFD, FD_CLOEXEC)         = 0
getdents64(3, /* 8 entries */, 4096)    = 240
close(3)                                = 0
lstat64("/dev/vg3/lvol11", {st_mode=S_IFLNK|0777, st_size=22, ...}) = 0
unlink("/dev/vg3/lvol11")               = 0
open("/dev/vg3", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=S_IFDIR|0500, st_size=4096, ...}) = 0
fcntl64(3, F_SETFD, FD_CLOEXEC)         = 0
getdents64(3, /* 7 entries */, 4096)    = 208
close(3)                                = 0
lstat64("/dev/vg3/lvol25", {st_mode=S_IFLNK|0777, st_size=22, ...}) = 0
unlink("/dev/vg3/lvol25")               = 0
open("/dev/vg3", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=S_IFDIR|0500, st_size=4096, ...}) = 0
fcntl64(3, F_SETFD, FD_CLOEXEC)         = 0
getdents64(3, /* 6 entries */, 4096)    = 176
close(3)                                = 0
lstat64("/dev/vg3/lvol10", {st_mode=S_IFLNK|0777, st_size=22, ...}) = 0
unlink("/dev/vg3/lvol10")               = 0
open("/dev/vg3", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=S_IFDIR|0500, st_size=4096, ...}) = 0
fcntl64(3, F_SETFD, FD_CLOEXEC)         = 0
getdents64(3, /* 5 entries */, 4096)    = 144
close(3)                                = 0
lstat64("/dev/vg3/lvol3", {st_mode=S_IFLNK|0777, st_size=21, ...}) = 0
unlink("/dev/vg3/lvol3")                = 0
open("/dev/vg3", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=S_IFDIR|0500, st_size=4096, ...}) = 0
fcntl64(3, F_SETFD, FD_CLOEXEC)         = 0
getdents64(3, /* 4 entries */, 4096)    = 112
close(3)                                = 0
lstat64("/dev/vg3/lvol5", {st_mode=S_IFLNK|0777, st_size=21, ...}) = 0
unlink("/dev/vg3/lvol5")                = 0
open("/dev/vg3", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=S_IFDIR|0500, st_size=4096, ...}) = 0
fcntl64(3, F_SETFD, FD_CLOEXEC)         = 0
getdents64(3, /* 3 entries */, 4096)    = 80
close(3)                                = 0
stat64("/dev/vg3/lvol27", {st_mode=S_IFBLK|0600, st_rdev=makedev(254, 15), ...}) = 0
stat64("/dev/vg3/lvol27", {st_mode=S_IFBLK|0600, st_rdev=makedev(254, 15), ...}) = 0
stat64("/dev/vg3/lvol27", {st_mode=S_IFBLK|0600, st_rdev=makedev(254, 15), ...}) = 0
open("/dev/vg3/lvol27", O_RDWR|O_DIRECT|O_LARGEFILE) = 3
fstat64(3, {st_mode=S_IFBLK|0600, st_rdev=makedev(254, 15), ...}) = 0
ioctl(3, BLKBSZGET, 0xbfffe7c8)         = 0
_llseek(3, 0, [0], SEEK_SET)            = 0
read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
_llseek(3, 0, [0], SEEK_SET)            = 0
write(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
close(3)                                = 0
uname({sys="Linux", node="dev8-001", ...}) = 0
open("/etc/lvm/backup/.lvm_dev8-001_32674_203547694", O_WRONLY|O_APPEND|O_CREAT|O_EXCL|O_LARGEFILE, 0666) = 3
fcntl64(3, F_SETLK64, {type=F_WRLCK, whence=SEEK_SET, start=0, len=0}, 0xbfffc6f0) = 0
fcntl64(3, F_GETFL)                     = 0x8401 (flags O_WRONLY|O_APPEND|O_LARGEFILE)
fstat64(3, {st_mode=S_IFREG|0600, st_size=0, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb7dd2000
_llseek(3, 0, [0], SEEK_CUR)            = 0
time(NULL)                              = 1089339574
write(3, "# Generated by LVM2: Thu Jul  8 "..., 4096) = 4096
write(3, "G4-NMnd6u\"\n\t\t\tstatus = [\"READ\", "..., 4096) = 4096
fsync(3)                                = 0
write(3, "BEnV-iw4A-2htA-DYVB-iAkF-2Q9R-f1"..., 2342) = 2342
close(3)                                = 0
munmap(0xb7dd2000, 4096)                = 0
rename("/etc/lvm/backup/.lvm_dev8-001_32674_203547694", "/etc/lvm/backup/vg3.tmp") = 0
rename("/etc/lvm/backup/vg3.tmp", "/etc/lvm/backup/vg3") = 0
stat64("/etc/lvm/backup/vg3.tmp", 0xbfffe7a0) = -1 ENOENT (No such file or directory)
open("/etc/lvm/backup", O_RDONLY|O_LARGEFILE) = 3
fsync(3)                                = 0
close(3)                                = 0
fstat64(1, {st_mode=S_IFCHR|0620, st_rdev=makedev(3, 1), ...}) = 0
ioctl(1, SNDCTL_TMR_TIMEBASE or TCGETS, {B38400 opost isig icanon echo ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb7dd2000
write(1, "  Logical volume \"lvol27\" create"..., 34) = 34
stat64("/proc/lvm/VGs/vg3", 0xbffff7a0) = -1 ENOENT (No such file or directory)
flock(4, LOCK_NB|LOCK_UN)               = 0
flock(4, LOCK_EX|LOCK_NB)               = 0
stat64("/var/lock/lvm/V_vg3", {st_mode=S_IFREG|0700, st_size=0, ...}) = 0
fstat64(4, {st_mode=S_IFREG|0700, st_size=0, ...}) = 0
unlink("/var/lock/lvm/V_vg3")           = 0
close(4)                                = 0
close(5)                                = 0
close(6)                                = 0
close(7)                                = 0
close(8)                                = 0
close(9)                                = 0
close(10)                               = 0
close(11)                               = 0
close(12)                               = 0
close(13)                               = 0
close(14)                               = 0
close(15)                               = 0
close(16)                               = 0
close(17)                               = 0
close(18)                               = 0
close(19)                               = 0
close(20)                               = 0
close(21)                               = 0
close(22)                               = 0
close(23)                               = 0
close(24)                               = 0
close(25)                               = 0
close(26)                               = 0
close(27)                               = 0
close(28)                               = 0
close(29)                               = 0
close(30)                               = 0
close(31)                               = 0
close(32)                               = 0
close(33)                               = 0
close(34)                               = 0
close(35)                               = 0
close(36)                               = 0
close(37)                               = 0
close(38)                               = 0
close(39)                               = 0
close(40)                               = 0
close(41)                               = 0
close(42)                               = 0
close(43)                               = 0
close(44)                               = 0
close(45)                               = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
open("/etc/lvm/.cache", O_WRONLY|O_CREAT|O_TRUNC|O_LARGEFILE, 0666) = 3
fstat64(3, {st_mode=S_IFREG|0600, st_size=0, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xb7dd1000
write(3, "# This file is automatically mai"..., 719) = 719
close(3)                                = 0
munmap(0xb7dd1000, 4096)                = 0
brk(0)                                  = 0x814f000
brk(0)                                  = 0x814f000
brk(0x8149000)                          = 0x8149000
brk(0)                                  = 0x8149000
brk(0)                                  = 0x8149000
brk(0)                                  = 0x8149000
brk(0x8143000)                          = 0x8143000
brk(0)                                  = 0x8143000
brk(0)                                  = 0x8143000
brk(0)                                  = 0x8143000
brk(0x8141000)                          = 0x8141000
brk(0)                                  = 0x8141000
brk(0)                                  = 0x8141000
brk(0)                                  = 0x8141000
brk(0x813f000)                          = 0x813f000
brk(0)                                  = 0x813f000
brk(0)                                  = 0x813f000
brk(0)                                  = 0x813f000
brk(0x813d000)                          = 0x813d000
brk(0)                                  = 0x813d000
brk(0)                                  = 0x813d000
brk(0)                                  = 0x813d000
brk(0x813b000)                          = 0x813b000
brk(0)                                  = 0x813b000
brk(0)                                  = 0x813b000
brk(0)                                  = 0x813b000
brk(0x8139000)                          = 0x8139000
brk(0)                                  = 0x8139000
brk(0)                                  = 0x8139000
brk(0)                                  = 0x8139000
brk(0x8137000)                          = 0x8137000
brk(0)                                  = 0x8137000
brk(0)                                  = 0x8137000
brk(0)                                  = 0x8137000
brk(0x8111000)                          = 0x8111000
brk(0)                                  = 0x8111000
brk(0)                                  = 0x8111000
brk(0)                                  = 0x8111000
brk(0x810f000)                          = 0x810f000
brk(0)                                  = 0x810f000
brk(0)                                  = 0x810f000
brk(0)                                  = 0x810f000
brk(0x810d000)                          = 0x810d000
brk(0)                                  = 0x810d000
brk(0)                                  = 0x810d000
brk(0)                                  = 0x810d000
brk(0x810b000)                          = 0x810b000
brk(0)                                  = 0x810b000
brk(0)                                  = 0x810b000
brk(0)                                  = 0x810b000
brk(0x8109000)                          = 0x8109000
brk(0)                                  = 0x8109000
brk(0)                                  = 0x8109000
brk(0)                                  = 0x8109000
brk(0x8107000)                          = 0x8107000
brk(0)                                  = 0x8107000
brk(0)                                  = 0x8107000
brk(0)                                  = 0x8107000
brk(0x8105000)                          = 0x8105000
brk(0)                                  = 0x8105000
brk(0)                                  = 0x8105000
brk(0)                                  = 0x8105000
brk(0x8103000)                          = 0x8103000
brk(0)                                  = 0x8103000
brk(0)                                  = 0x8103000
brk(0)                                  = 0x8103000
brk(0x8101000)                          = 0x8101000
brk(0)                                  = 0x8101000
brk(0)                                  = 0x8101000
brk(0)                                  = 0x8101000
brk(0x80ff000)                          = 0x80ff000
brk(0)                                  = 0x80ff000
brk(0)                                  = 0x80ff000
brk(0)                                  = 0x80ff000
brk(0x80fd000)                          = 0x80fd000
brk(0)                                  = 0x80fd000
brk(0)                                  = 0x80fd000
brk(0)                                  = 0x80fd000
brk(0x80fb000)                          = 0x80fb000
brk(0)                                  = 0x80fb000
brk(0)                                  = 0x80fb000
brk(0)                                  = 0x80fb000
brk(0x80f9000)                          = 0x80f9000
brk(0)                                  = 0x80f9000
brk(0)                                  = 0x80f9000
brk(0)                                  = 0x80f9000
brk(0x80f7000)                          = 0x80f7000
brk(0)                                  = 0x80f7000
brk(0)                                  = 0x80f7000
brk(0)                                  = 0x80f7000
brk(0x80f5000)                          = 0x80f5000
brk(0)                                  = 0x80f5000
brk(0)                                  = 0x80f5000
brk(0)                                  = 0x80f5000
brk(0x80f3000)                          = 0x80f3000
brk(0)                                  = 0x80f3000
brk(0)                                  = 0x80f3000
brk(0)                                  = 0x80f3000
brk(0x80f1000)                          = 0x80f1000
brk(0)                                  = 0x80f1000
brk(0)                                  = 0x80f1000
brk(0)                                  = 0x80f1000
brk(0x80e5000)                          = 0x80e5000
brk(0)                                  = 0x80e5000
brk(0)                                  = 0x80e5000
brk(0)                                  = 0x80e5000
brk(0x80e2000)                          = 0x80e2000
brk(0)                                  = 0x80e2000
brk(0)                                  = 0x80e2000
brk(0)                                  = 0x80e2000
brk(0x80e0000)                          = 0x80e0000
brk(0)                                  = 0x80e0000
brk(0)                                  = 0x80e0000
brk(0)                                  = 0x80e0000
brk(0x80db000)                          = 0x80db000
brk(0)                                  = 0x80db000
munmap(0xb7dd2000, 4096)                = 0
exit_group(0)                           = ?
