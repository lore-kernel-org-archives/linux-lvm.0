Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0H4OCLd032736
	for <linux-lvm@redhat.com>; Fri, 16 Jan 2009 23:24:12 -0500
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n0H4MoDI029394
	for <linux-lvm@redhat.com>; Fri, 16 Jan 2009 23:22:50 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LO2hs-0006D4-3x
	for linux-lvm@redhat.com; Sat, 17 Jan 2009 04:22:48 +0000
Received: from 76-10-156-99.dsl.teksavvy.com ([76.10.156.99])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sat, 17 Jan 2009 04:22:48 +0000
Received: from monnier by 76-10-156-99.dsl.teksavvy.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sat, 17 Jan 2009 04:22:48 +0000
From: Stefan Monnier <monnier@iro.umontreal.ca>
Date: Fri, 16 Jan 2009 23:22:39 -0500
Message-ID: <jwvprimy36y.fsf-monnier+gmane.linux.lvm.general@gnu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: news <news@ger.gmane.org>
Subject: [linux-lvm] Non deterministic errors under OpenWRT
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

I'm trying to get LVM2 working on my WL-700gE running OpenWRT and am
seeing some really odd behavior, I've appended a sample session that
shows that the behavior seems to be non deterministic.

I've tried stracing the execution and diffing the strace of
different executions.  See the diff below the sample session which seems
to show memory corruption, although the program has never dumped core.

Any idea what might be going on?  The kernel is 2.6.25.20 with a bunch
of OpenWRT-specific patches.


        Stefan


# lvm lvs
File descriptor 6 (pipe:[2765]) leaked on lvm invocation. Parent PID 4012: -ash
  LV      VG   Attr   LSize  Origin Snap%  Move Log Copy%  Convert
  voltest Test -wi--- 12.00M                                      
# lvm lvs
File descriptor 6 (pipe:[2765]) leaked on lvm invocation. Parent PID 4012: -ash
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  Volume group "Test" not found
# lvm lvs
File descriptor 6 (pipe:[2765]) leaked on lvm invocation. Parent PID 4012: -ash
# lvm lvs
File descriptor 6 (pipe:[2765]) leaked on lvm invocation. Parent PID 4012: -ash
# lvm lvs
File descriptor 6 (pipe:[2765]) leaked on lvm invocation. Parent PID 4012: -ash
  LV      VG   Attr   LSize  Origin Snap%  Move Log Copy%  Convert
  voltest Test -wi--- 12.00M                                      
# lvm lvs
File descriptor 6 (pipe:[2765]) leaked on lvm invocation. Parent PID 4012: -ash
  Incorrect metadata area header checksum
# lvm lvs
File descriptor 6 (pipe:[2765]) leaked on lvm invocation. Parent PID 4012: -ash
# lvm lvs
File descriptor 6 (pipe:[2765]) leaked on lvm invocation. Parent PID 4012: -ash
# lvm lvs
File descriptor 6 (pipe:[2765]) leaked on lvm invocation. Parent PID 4012: -ash
  LV      VG   Attr   LSize  Origin Snap%  Move Log Copy%  Convert
  voltest Test -wi--- 12.00M                                      
# lvm lvs
File descriptor 6 (pipe:[2765]) leaked on lvm invocation. Parent PID 4012: -ash
  LV      VG   Attr   LSize  Origin Snap%  Move Log Copy%  Convert
  voltest Test -wi--- 12.00M                                      
# lvm lvs
File descriptor 6 (pipe:[2765]) leaked on lvm invocation. Parent PID 4012: -ash
# lvm lvs
File descriptor 6 (pipe:[2765]) leaked on lvm invocation. Parent PID 4012: -ash
  Incorrect metadata area header checksum
# lvm lvs
File descriptor 6 (pipe:[2765]) leaked on lvm invocation. Parent PID 4012: -ash
# lvm lvs
File descriptor 6 (pipe:[2765]) leaked on lvm invocation. Parent PID 4012: -ash
# lvm lvs
File descriptor 6 (pipe:[2765]) leaked on lvm invocation. Parent PID 4012: -ash
  LV      VG   Attr   LSize  Origin Snap%  Move Log Copy%  Convert
  voltest Test -wi--- 12.00M                                      
# lvm lvs
File descriptor 6 (pipe:[2765]) leaked on lvm invocation. Parent PID 4012: -ash
  Incorrect metadata area header checksum
# lvm lvs
File descriptor 6 (pipe:[2765]) leaked on lvm invocation. Parent PID 4012: -ash
# lvm lvs
File descriptor 6 (pipe:[2765]) leaked on lvm invocation. Parent PID 4012: -ash
  LV      VG   Attr   LSize  Origin Snap%  Move Log Copy%  Convert
  voltest Test -wi--- 12.00M                                      
# lvm lvs
File descriptor 6 (pipe:[2765]) leaked on lvm invocation. Parent PID 4012: -ash
# lvm lvs
File descriptor 6 (pipe:[2765]) leaked on lvm invocation. Parent PID 4012: -ash
  /dev/sda2: Checksum error
# lvm lvs
File descriptor 6 (pipe:[2765]) leaked on lvm invocation. Parent PID 4012: -ash
  LV      VG   Attr   LSize  Origin Snap%  Move Log Copy%  Convert
  voltest Test -wi--- 12.00M                                      
# 



# diff /var/log/lvm-lvs-19:51 /var/log/lvm-lvs-19:50
--- /var/log/lvm-lvs-19:51      Thu Jan 15 04:19:52 2009
+++ /var/log/lvm-lvs-19:50      Thu Jan 15 04:19:51 2009
@@ -1,6 +1,6 @@
 execve("/sbin/lvm", ["lvm", "lvs"], [/* 10 vars */]) = 0
 svr4_syscall()                          = -1 ERRNO_4090 (Unknown error 4090)
-stat("/etc/ld.so.cache", 0x7ff11140)    = -1 ENOENT (No such file or directory)
+stat("/etc/ld.so.cache", 0x7fe79530)    = -1 ENOENT (No such file or directory)
 open("", O_RDONLY)                      = -1 ENOENT (No such file or directory)
 open("", O_RDONLY)                      = -1 ENOENT (No such file or directory)
 open("", O_RDONLY)                      = 3
@@ -12,16 +12,16 @@
 old_mmap(0x2ab43000, 5250, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 0, 0) = 0x2ab43000
 close(3)                                = 0
 munmap(0x2aaae000, 4096)                = 0
-open("/lib/lib/usr/lib/libdevmapper.so.1.02", O_RDONLY) = 3
-fstat(3, {st_mode=S_IFREG|0644, st_size=0, ...}) = 0
+open("P��", O_RDONLY)                  = 3
+fstat(3, {st_mode=0, st_size=0, ...})   = 0
 old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, 0, 0) = 0x2aaae000
 read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\10\0\1\0\0\0 \6\0\0004\0\0\0"..., 4096) = 4096
 old_mmap(NULL, 270336, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, 0, 0) = 0x2ab45000
-old_mmap(0x2ab45000, 3444, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 2146502608, 0x2aaaadfc) = 0x2ab45000
+old_mmap(0x2ab45000, 3444, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 2145881024, 0x2aaaadfc) = 0x2ab45000
 old_mmap(0x2ab86000, 54, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 715837732, 0x3) = 0x2ab86000
 close(3)                                = 0
 munmap(0x2aaae000, 4096)                = 0
-open("x��dl.so.0", O_RDONLY)       = 3
+open("h��", O_RDONLY)                  = 3
 fstat(3, {st_mode=0, st_size=0, ...})   = 0
 old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, 0, 0) = 0x2aaae000
 read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\10\0\1\0\0\0p\10\0\0004\0\0\0"..., 4096) = 4096
@@ -30,8 +30,8 @@
 old_mmap(0x2abc8000, 4206, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 716132368, 0x3) = 0x2abc8000
 close(3)                                = 0
 munmap(0x2aaae000, 4096)                = 0
-open("/lib/libH        �谪*/lib/libdl.so.0", O_RDONLY) = 3
-fstat(3, {st_mode=0, st_size=60806, ...}) = 0
+open("", O_RDONLY)                      = 3
+fstat(3, {st_mode=0, st_size=0, ...})   = 0
 old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, 0, 0) = 0x2aaae000
 read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\10\0\1\0\0\0\240\31\0\0004\0\0\0"..., 4096) = 4096
 old_mmap(NULL, 323584, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, 3, 0) = 0x2abca000
@@ -40,7 +40,7 @@
 close(3)                                = 0
 munmap(0x2aaae000, 4096)                = 0
 open("", O_RDONLY)                      = 3
-fstat(3, {st_mode=S_IFREG|0644, st_size=0, ...}) = 0
+fstat(3, {st_mode=0, st_size=0, ...})   = 0
 old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, 0, 0) = 0x2aaae000
 read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\10\0\1\0\0\0\300\247\0\0004\0\0\0"..., 4096) = 4096
 old_mmap(NULL, 671744, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, 3, 0) = 0x2ac19000
@@ -53,39 +53,39 @@
 fstat(3, {st_mode=0, st_size=0, ...})   = 0
 close(3)                                = 0
 open("", O_RDONLY)                      = 3
-fstat(3, {st_mode=0, st_size=8302, ...}) = 0
+fstat(3, {st_mode=0, st_size=195874, ...}) = 0
 close(3)                                = 0
-open("", O_RDONLY)                     = 3
+open("/lib/lib", O_RDONLY)              = 3
 fstat(3, {st_mode=0, st_size=8449, ...}) = 0
 close(3)                                = 0
-open("", O_RDONLY)                      = 3
+open("�        ", O_RDONLY)                   = 3
 fstat(3, {st_mode=0, st_size=4294967295, ...}) = 0
 close(3)                                = 0
-open("", O_RDONLY)                     = 3
+open(">", O_RDONLY)                    = 3
 fstat(3, {st_mode=0, st_size=4294967295, ...}) = 0
 close(3)                                = 0
 open("", O_RDONLY)                      = 3
 fstat(3, {st_mode=0, st_size=4294967295, ...}) = 0
 close(3)                                = 0
 open("", O_RDONLY)                      = 3
-fstat(3, {st_mode=0, st_size=4294967295, ...}) = 0
+fstat(3, {st_mode=0, st_size=0, ...})   = 0
 close(3)                                = 0
 stat("", {st_mode=S_IFREG|0755, st_size=20694, ...}) = 0
 mprotect(0x2abc8000, 4096, PROT_READ)   = 0
 mprotect(0x2acb6000, 4096, PROT_READ)   = 0
 mprotect(0x2aaec000, 4096, PROT_READ)   = 0
-ioctl(0, TIOCNXCL, {B0 -opost -isig -icanon -echo ...}) = 0
-ioctl(1, TIOCNXCL, {B0 -opost -isig -icanon -echo ...}) = 0
-getppid()                               = 9127
+ioctl(0, TIOCNXCL, {B38400 opost isig icanon echo ...}) = 0
+ioctl(1, TIOCNXCL, {B38400 opost isig icanon echo ...}) = 0
+getppid()                               = 9123
 open("", O_RDONLY|O_LARGEFILE)          = 3
 read(3, "strace\0-f\0lvm\0lvs\0", 31)   = 18
 close(3)                                = 0
-getrlimit(RLIMIT_NOFILE, {rlim_cur=2, rlim_max=4766556}) = 0
+getrlimit(RLIMIT_NOFILE, {rlim_cur=718009696, rlim_max=0}) = 0
 fcntl64(3, F_GETFD)                     = -1 EBADF (Bad file descriptor)
 fcntl64(4, F_GETFD)                     = -1 EBADF (Bad file descriptor)
 fcntl64(5, F_GETFD)                     = -1 EBADF (Bad file descriptor)
 fcntl64(6, F_GETFD)                     = 0
-readlink("/proc/91", "pipe:[2765]", 4095) = 11
+readlink("", "pipe:[2765]", 4095)       = 11
 close(6)                                = 0
 write(2, "File descriptor ", 16File descriptor )        = 16
 write(2, "\0", 16)                       = 1
@@ -95,7 +95,7 @@
 write(2, "lvm", 3lvm)                      = 3
 write(2, " invocation.", 12 invocation.)            = 12
 write(2, " Parent PID ", 12 Parent PID )            = 12
-write(2, "\0\0\0\0", 49127)                 = 4
+write(2, "\0\0\0\0", 49123)                 = 4
 write(2, ": ", 2: )                       = 2
 write(2, "strace", 6strace)                   = 6
 write(2, "\n", 1
@@ -1119,16 +1119,16 @@
 fcntl64(1023, F_GETFD)                  = -1 EBADF (Bad file descriptor)
 brk(0)                                  = 0x4ed000
 brk(0x4f2000)                           = 0x4f2000
-stat64(0x4ed108, 0x7ff0f270)            = 0
+stat64(0x4ed108, 0x7fe77660)            = 0
 brk(0x4f4000)                           = 0x4f4000
 brk(0x4f8000)                           = 0x4f8000
-stat64(0x7ff0e398, 0x7ff0e258)          = 0
-stat64(0x4f3178, 0x7ff0e170)            = 0
+stat64(0x7fe76788, 0x7fe76648)          = 0
+stat64(0x4f3178, 0x7fe76560)            = 0
 open("", O_RDONLY|O_LARGEFILE)          = 3
 mmap(NULL, 16352, PROT_READ, MAP_PRIVATE, 3, 0) = 0x2aaae000
 munmap(0x2aaae000, 16352)               = 0
 close(3)                                = 0
-time(NULL)                              = 1231993192
+time(NULL)                              = 1231993191
 open("/etc/TZ", O_RDONLY)               = 3
 read(3, "UTC\n", 68)                    = 4
 read(3, "", 64)                         = 0
@@ -1136,77 +1136,77 @@
 uname({sys="Linux", node="wl700ge", ...}) = 0
 brk(0x4fc000)                           = 0x4fc000
 umask(077)                              = 022
-stat64(0x4ef108, 0x7ff0f1b0)            = 0
+stat64(0x4ef108, 0x7fe775a0)            = 0
 open("", O_RDONLY|O_LARGEFILE)          = 3
-ioctl(3, TIOCNXCL, 0x7ff0f208)          = -1 ENOTTY (Inappropriate ioctl for device)
+ioctl(3, TIOCNXCL, 0x7fe775f8)          = -1 ENOTTY (Inappropriate ioctl for device)
 brk(0x4fd000)                           = 0x4fd000
-read(3, "rootfs / rootfs rw 0 0\n/dev/root"..., 4096) = 383
+read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 383
 close(3)                                = 0
 brk(0x500000)                           = 0x500000
-stat64(0x4f3268, 0x7ff0f258)            = 0
-stat64(0x7ff0d2c8, 0x7ff0d190)          = -1 ENOENT (No such file or directory)
-stat64(0x7ff0d2c8, 0x7ff0d190)          = 0
+stat64(0x4f3268, 0x7fe77648)            = 0
+stat64(0x7fe756b8, 0x7fe75580)          = -1 ENOENT (No such file or directory)
+stat64(0x7fe756b8, 0x7fe75580)          = 0
 brk(0x504000)                           = 0x504000
 brk(0x505000)                           = 0x505000
 brk(0x509000)                           = 0x509000
-open("", O_RDONLY|O_LARGEFILE)          = 3
-ioctl(3, TIOCNXCL, 0x7ff0d148)          = -1 ENOTTY (Inappropriate ioctl for device)
+open("/proc/devices", O_RDONLY|O_LARGEFILE) = 3
+ioctl(3, TIOCNXCL, 0x7fe75538)          = -1 ENOTTY (Inappropriate ioctl for device)
 read(3, "Character devices:\n  1 mem\n  4 t"..., 4096) = 359
 read(3, "", 4096)                       = 0
 close(3)                                = 0
-stat64(0x7ff0e3b8, 0x7ff0e268)          = 0
-stat64(0x503850, 0x7ff0e188)            = 0
-stat64(0x503ae0, 0x7ff0e0a0)            = 0
-open("", O_RDONLY|O_LARGEFILE)          = 3
+stat64(0x7fe767a8, 0x7fe76658)          = 0
+stat64(0x503850, 0x7fe76578)            = 0
+stat64(0x503ae0, 0x7fe76490)            = 0
+open("/etc/lvm/cache/.cache", O_RDONLY|O_LARGEFILE) = 3
 mmap(NULL, 156, PROT_READ, MAP_PRIVATE, 3, 0) = 0x2aaae000
 munmap(0x2aaae000, 156)                 = 0
-stat64(0x503ba0, 0x7ff0dfe0)            = 0
-stat64(0x503bd0, 0x7ff0dfe0)            = 0
-stat64(0x503c00, 0x7ff0dfe0)            = 0
-stat64(0x503c30, 0x7ff0dfe0)            = 0
+stat64(0x503ba0, 0x7fe763d0)            = 0
+stat64(0x503bd0, 0x7fe763d0)            = 0
+stat64(0x503c00, 0x7fe763d0)            = 0
+stat64(0x503c30, 0x7fe763d0)            = 0
 close(3)                                = 0
-time(NULL)                              = 1231993192
-getpid()                                = 9128
+time(NULL)                              = 1231993191
+getpid()                                = 9124
 getuid()                                = 0
 geteuid()                               = 0
-stat64(0x4f3178, 0x7ff0fb18)            = 0
-stat64(0x4ec2a8, 0x7ff0fad8)            = 0
-access("/var/lock/lvm", R_OK|W_OK|X_OK) = 0
+stat64(0x4f3178, 0x7fe77f08)            = 0
+stat64(0x4ec2a8, 0x7fe77ec8)            = 0
+access("/var/loc", R_OK|W_OK|X_OK)      = 0
 brk(0x50c000)                           = 0x50c000
-stat64(0x4fb538, 0x7ff0f698)            = 0
-stat64(0x4fb538, 0x7ff0f780)            = 0
+stat64(0x4fb538, 0x7fe77a88)            = 0
+stat64(0x4fb538, 0x7fe77b70)            = 0
 open("/dev/sda1", O_RDONLY|O_DIRECT|O_LARGEFILE|O_NOATIME) = 3
 fstat64(3, {st_mode=S_IFBLK|0644, st_rdev=makedev(8, 1), ...}) = 0
 ioctl(3, BLKBSZGET, 0x4fb4c8)           = 0
 _llseek(3, 0, [0], SEEK_SET)            = 0
 read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 2048) = 2048
 close(3)                                = 0
-stat64(0x4fb4a0, 0x7ff0f698)            = 0
-stat64(0x4fb4a0, 0x7ff0f780)            = 0
+stat64(0x4fb4a0, 0x7fe77a88)            = 0
+stat64(0x4fb4a0, 0x7fe77b70)            = 0
 open("/dev/hde1", O_RDONLY|O_DIRECT|O_LARGEFILE|O_NOATIME) = 3
 fstat64(3, {st_mode=S_IFBLK|0644, st_rdev=makedev(33, 1), ...}) = 0
 ioctl(3, BLKBSZGET, 0x4fb430)           = 0
-_llseek(3, 0, [5160496], 0x4ebe30 /* SEEK_??? */) = 0
+_llseek(3, 0, [0], SEEK_SET)            = 0
 read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
 close(3)                                = 0
-stat64(0x4fb668, 0x7ff0f698)            = 0
-stat64(0x4fb668, 0x7ff0f780)            = 0
+stat64(0x4fb668, 0x7fe77a88)            = 0
+stat64(0x4fb668, 0x7fe77b70)            = 0
 open("/dev/sda2", O_RDONLY|O_DIRECT|O_LARGEFILE|O_NOATIME) = 3
 fstat64(3, {st_mode=S_IFBLK|0644, st_rdev=makedev(8, 2), ...}) = 0
 ioctl(3, BLKBSZGET, 0x4fb5f8)           = 0
 _llseek(3, 0, [0], SEEK_SET)            = 0
 read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
-_llseek(3, 4096, [0], SEEK_SET)         = 0
+_llseek(3, 4096, [4096], SEEK_SET)      = 0
 read(3, "\177\7U\372 LVM2 x[5A%r0N*>\1\0\0\0\0\20\0\0\0\0\0\0"..., 4096) = 4096
-_llseek(3, 4096, [0], SEEK_SET)         = 0
+_llseek(3, 4096, [4096], SEEK_SET)      = 0
 read(3, "\177\7U\372 LVM2 x[5A%r0N*>\1\0\0\0\0\20\0\0\0\0\0\0"..., 4096) = 4096
 brk(0x510000)                           = 0x510000
 brk(0x511000)                           = 0x511000
-_llseek(3, 4096, [0], SEEK_SET)         = 0
+_llseek(3, 4096, [4096], SEEK_SET)      = 0
 read(3, "\177\7U\372 LVM2 x[5A%r0N*>\1\0\0\0\0\20\0\0\0\0\0\0"..., 4096) = 4096
 close(3)                                = 0
-stat64(0x4fb5d0, 0x7ff0f698)            = 0
-stat64(0x4fb5d0, 0x7ff0f780)            = 0
+stat64(0x4fb5d0, 0x7fe77a88)            = 0
+stat64(0x4fb5d0, 0x7fe77b70)            = 0
 open("/dev/hde2", O_RDONLY|O_DIRECT|O_LARGEFILE|O_NOATIME) = 3
 fstat64(3, {st_mode=S_IFBLK|0644, st_rdev=makedev(33, 2), ...}) = 0
 ioctl(3, BLKBSZGET, 0x4fb560)           = 0
@@ -1224,24 +1224,64 @@
 rt_sigaction(SIGINT, {0x10000000, [], SA_NOCLDWAIT|0x46fbc0}, NULL, 16) = 0
 rt_sigprocmask(SIG_SETMASK, ~[], NULL, 16) = 0
 rt_sigaction(SIGINT, {0x10000000, [], 0}, {0x10000000, [], SA_NOCLDWAIT|0x46fbc0}, 16) = 0
-stat64(0x50bde8, 0x7ff0e790)            = 0
+stat64(0x50bde8, 0x7fe76b80)            = 0
 fstat64(3, {st_mode=S_IFREG|0700, st_size=0, ...}) = 0
-stat64(0x4fb668, 0x7ff0f5b8)            = 0
-stat64(0x4fb668, 0x7ff0f6a0)            = 0
+stat64(0x4fb668, 0x7fe779a8)            = 0
+stat64(0x4fb668, 0x7fe77a90)            = 0
 open("/dev/sda2", O_RDONLY|O_DIRECT|O_LARGEFILE|O_NOATIME) = 4
 fstat64(4, {st_mode=S_IFBLK|0644, st_rdev=makedev(8, 2), ...}) = 0
 ioctl(4, BLKBSZGET, 0x4fb5f8)           = 0
-_llseek(4, 0, [2146497224], 0x7ff0f290 /* SEEK_??? */) = 0
+_llseek(4, 0, [0], SEEK_SET)            = 0
 read(4, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 4096) = 4096
-_llseek(4, 4096, [0], SEEK_SET)         = 0
+_llseek(4, 4096, [4096], SEEK_SET)      = 0
 read(4, "\177\7U\372 LVM2 x[5A%r0N*>\1\0\0\0\0\20\0\0\0\0\0\0"..., 4096) = 4096
-_llseek(4, 4096, [0], SEEK_SET)         = 0
+_llseek(4, 4096, [4096], SEEK_SET)      = 0
 read(4, "\177\7U\372 LVM2 x[5A%r0N*>\1\0\0\0\0\20\0\0\0\0\0\0"..., 4096) = 4096
-_llseek(4, 4096, [0], SEEK_SET)         = 0
+_llseek(4, 4096, [4096], SEEK_SET)      = 0
 read(4, "\177\7U\372 LVM2 x[5A%r0N*>\1\0\0\0\0\20\0\0\0\0\0\0"..., 4096) = 4096
-_llseek(4, 4096, [6940339858230797569], 0x2ca72314 /* SEEK_??? */) = 0
+_llseek(4, 4096, [4096], SEEK_SET)      = 0
 read(4, "\177\7U\372 LVM2 x[5A%r0N*>\1\0\0\0\0\20\0\0\0\0\0\0"..., 4096) = 4096
-_llseek(4, 4096, [10020746462041731188], 0x590f0eeb /* SEEK_??? */) = 0
+_llseek(4, 4096, [4096], SEEK_SET)      = 0
 read(4, "\177\7U\372 LVM2 x[5A%r0N*>\1\0\0\0\0\20\0\0\0\0\0\0"..., 4096) = 4096
-_llseek(4, 4096, [6466080423658065102], 0x87efd2b5 /* SEEK_??? */) = 0
-read(4,  <unfinished ...>
+_llseek(4, 4096, [4096], SEEK_SET)      = 0
+read(4, "\177\7U\372 LVM2 x[5A%r0N*>\1\0\0\0\0\20\0\0\0\0\0\0"..., 4096) = 4096
+open("/proc/devices", O_RDONLY|O_LARGEFILE) = 5
+ioctl(5, TIOCNXCL, 0x7fe76928)          = -1 ENOTTY (Inappropriate ioctl for device)
+read(5, "Character devices:\n  1 mem\n  4 t"..., 4096) = 359
+close(5)                                = 0
+open("/proc/misc", O_RDONLY|O_LARGEFILE) = 5
+ioctl(5, TIOCNXCL, 0x7fe76928)          = -1 ENOTTY (Inappropriate ioctl for device)
+read(5, "183 hw_random\n229 fuse\n135 rtc\n "..., 4096) = 112
+close(5)                                = 0
+stat64(0x7fe76c28, 0x7fe76ad8)          = 0
+open("/dev/mapper/control", O_RDWR|O_LARGEFILE) = 5
+open("/proc/devices", O_RDONLY|O_LARGEFILE) = 6
+ioctl(6, TIOCNXCL, 0x7fe76908)          = -1 ENOTTY (Inappropriate ioctl for device)
+read(6, "Character devices:\n  1 mem\n  4 t"..., 4096) = 359
+read(6, "", 4096)                       = 0
+close(6)                                = 0
+ioctl(5, 0xc138fd00, 0x50c138)          = 0
+ioctl(5, 0xc138fd07, 0x50c138)          = -1 ENXIO (No such device or address)
+ioctl(5, 0xc138fd07, 0x50c138)          = -1 ENXIO (No such device or address)
+ioctl(5, 0xc138fd07, 0x50c138)          = -1 ENXIO (No such device or address)
+flock(3, LOCK_NB|LOCK_UN)               = 0
+flock(3, LOCK_EX|LOCK_NB)               = -1 EAGAIN (Resource temporarily unavailable)
+close(3)                                = 0
+close(4)                                = 0
+rt_sigprocmask(SIG_SETMASK, [], NULL, 16) = 0
+write(1, "  LV      VG   Attr   LSize  Ori"..., 67) = 67
+write(1, "  voltest Test -wi--- 12.00M    "..., 67) = 67
+stat64(0x50bde8, 0x7fe784c8)            = 0
+open("/etc/lvm/cache/.cache", O_RDWR|O_CREAT|O_LARGEFILE, 0777) = 3
+fcntl64(3, F_SETLKW64, {type=F_WRLCK, whence=SEEK_SET, start=0, len=47962649952}, 0x7fe78650) = 0
+fstat64(3, {st_mode=0, st_size=3081674545669603329, ...}) = 0
+stat64(0x503850, 0x7fe78610)            = 0
D", O_WRONLY|O_CREAT|O_TRUNC|O_LARGEFILE, 0666) = 4
+ioctl(4, TIOCNXCL, 0x7fe78580)          = -1 ENOTTY (Inappropriate ioctl for device)
+write(4, "# This file is automatically mai"..., 156) = 156
+close(4)                                = 0
+rename("/etc/lvm/cache/.cache.tmp", "/etc/lvm/cache/.cache") = 0
+fcntl64(3, F_SETLK64, {type=0xffff8680 /* F_??? */, whence=0x7fe7 /* SEEK_??? */, start=0, len=22579811311440264}, 0x7fe78630) = 0
+close(3)                                = 0
+close(5)                                = 0
+exit(0)                                 = ?
# 
