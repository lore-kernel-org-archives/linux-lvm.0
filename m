Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o94F6Now009357
	for <linux-lvm@redhat.com>; Mon, 4 Oct 2010 11:06:23 -0400
Received: from mail-ey0-f174.google.com (mail-ey0-f174.google.com
	[209.85.215.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o94F69Zj012098
	for <linux-lvm@redhat.com>; Mon, 4 Oct 2010 11:06:10 -0400
Received: by eyb6 with SMTP id 6so2451413eyb.33
	for <linux-lvm@redhat.com>; Mon, 04 Oct 2010 08:06:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4CA9E8C3.4040106@cfl.rr.com>
References: <AANLkTimHbA1DPLFeK9626dXZ03WVR6qsYFERQSMc8M5j@mail.gmail.com>
	<4CA9E8C3.4040106@cfl.rr.com>
Date: Mon, 4 Oct 2010 20:36:07 +0530
Message-ID: <AANLkTinbZtX1aw9J1Bw-=8=S51i0HcaOo5T8whu49ASt@mail.gmail.com>
From: Tapas Mishra <mightydreams@gmail.com>
Subject: Re: [linux-lvm] mounting a filesystem on LVM2
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Phillip Susi <psusi@cfl.rr.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Oct 4, 2010 at 8:16 PM, Phillip Susi <psusi@cfl.rr.com> wrote:
> Perhaps you should start by reading the howto.


Ok here is some output I feel I should mention

mount output is
/dev/sda1 on / type ext4 (rw,errors=remount-ro)
proc on /proc type proc (rw,noexec,nosuid,nodev)
none on /sys type sysfs (rw,noexec,nosuid,nodev)
none on /sys/fs/fuse/connections type fusectl (rw)
none on /sys/kernel/debug type debugfs (rw)
none on /sys/kernel/security type securityfs (rw)
none on /dev type devtmpfs (rw,mode=0755)
none on /dev/pts type devpts (rw,noexec,nosuid,gid=5,mode=0620)
none on /dev/shm type tmpfs (rw,nosuid,nodev)
none on /var/run type tmpfs (rw,nosuid,mode=0755)
none on /var/lock type tmpfs (rw,noexec,nosuid,nodev)
none on /lib/init/rw type tmpfs (rw,nosuid,mode=0755)
none on /var/lib/ureadahead/debugfs type debugfs (rw,relatime)

nintendo is a volume group which holds these LVMs


> 1. ls -l /mnt/backup

 ls -l /mnt/backup/
total 0


> 2. ls -l /dev/mapper


crw-rw---- 1 root root  10, 59 2010-09-29 17:57 control
brw-rw---- 1 root disk 251,  0 2010-10-04 13:12 nintendo-backupos
brw-rw---- 1 root disk 251,  2 2010-10-04 13:57 nintendo-backupos1
brw-rw---- 1 root disk 251,  3 2010-10-04 13:57 nintendo-backupos2
brw-rw---- 1 root disk 251,  6 2010-10-04 18:56 nintendo-lvm1
brw-rw---- 1 root disk 251,  1 2010-10-04 18:56 nintendo-lvm2
brw-rw---- 1 root disk 251,  5 2010-10-04 18:56 nintendo-lvm3
brw-rw---- 1 root disk 251,  4 2010-10-04 18:56 nintendo-lvm4

> 3. cat /proc/self/mountinfo

15 19 0:0 / /sys rw,nosuid,nodev,noexec,relatime - sysfs none rw
16 19 0:3 / /proc rw,nosuid,nodev,noexec,relatime - proc none rw
17 19 0:5 / /dev rw,relatime - devtmpfs none
rw,size=4086108k,nr_inodes=1021527,mode=755
18 17 0:12 / /dev/pts rw,nosuid,noexec,relatime - devpts none
rw,gid=5,mode=620,ptmxmode=000
19 1 8:1 / / rw,relatime - ext4
/dev/disk/by-uuid/6876c294-0c70-4b4e-87a2-636ea19e5ed6
rw,errors=remount-ro,barrier=1,data=ordered
21 15 0:15 / /sys/fs/fuse/connections rw,relatime - fusectl none rw
22 15 0:7 / /sys/kernel/debug rw,relatime - debugfs none rw
23 15 0:10 / /sys/kernel/security rw,relatime - securityfs none rw
24 17 0:16 / /dev/shm rw,nosuid,nodev,relatime - tmpfs none rw
25 19 0:17 / /var/run rw,nosuid,relatime - tmpfs none rw,mode=755
26 19 0:18 / /var/lock rw,nosuid,nodev,noexec,relatime - tmpfs none rw
27 19 0:19 / /lib/init/rw rw,nosuid,relatime - tmpfs none rw,mode=755

> 4. cat /proc/self/mounts
rootfs / rootfs rw 0 0
none /sys sysfs rw,nosuid,nodev,noexec,relatime 0 0
none /proc proc rw,nosuid,nodev,noexec,relatime 0 0
none /dev devtmpfs rw,relatime,size=4086108k,nr_inodes=1021527,mode=755 0 0
none /dev/pts devpts rw,nosuid,noexec,relatime,gid=5,mode=620,ptmxmode=000 0 0
/dev/disk/by-uuid/6876c294-0c70-4b4e-87a2-636ea19e5ed6 / ext4
rw,relatime,errors=remount-ro,barrier=1,data=ordered 0 0
none /sys/fs/fuse/connections fusectl rw,relatime 0 0
none /sys/kernel/debug debugfs rw,relatime 0 0
none /sys/kernel/security securityfs rw,relatime 0 0
none /dev/shm tmpfs rw,nosuid,nodev,relatime 0 0
none /var/run tmpfs rw,nosuid,relatime,mode=755 0 0
none /var/lock tmpfs rw,nosuid,nodev,noexec,relatime 0 0
none /lib/init/rw tmpfs rw,nosuid,relatime,mode=755 0 0

> 5. cat /proc/1/mountinfo
15 19 0:0 / /sys rw,nosuid,nodev,noexec,relatime - sysfs none rw
16 19 0:3 / /proc rw,nosuid,nodev,noexec,relatime - proc none rw
17 19 0:5 / /dev rw,relatime - devtmpfs none
rw,size=4086108k,nr_inodes=1021527,mode=755
18 17 0:12 / /dev/pts rw,nosuid,noexec,relatime - devpts none
rw,gid=5,mode=620,ptmxmode=000
19 1 8:1 / / rw,relatime - ext4
/dev/disk/by-uuid/6876c294-0c70-4b4e-87a2-636ea19e5ed6
rw,errors=remount-ro,barrier=1,data=ordered
21 15 0:15 / /sys/fs/fuse/connections rw,relatime - fusectl none rw
22 15 0:7 / /sys/kernel/debug rw,relatime - debugfs none rw
23 15 0:10 / /sys/kernel/security rw,relatime - securityfs none rw
24 17 0:16 / /dev/shm rw,nosuid,nodev,relatime - tmpfs none rw
25 19 0:17 / /var/run rw,nosuid,relatime - tmpfs none rw,mode=755
26 19 0:18 / /var/lock rw,nosuid,nodev,noexec,relatime - tmpfs none rw
27 19 0:19 / /lib/init/rw rw,nosuid,relatime - tmpfs none rw,mode=755

> 6. cat /proc/1/mounts
rootfs / rootfs rw 0 0
none /sys sysfs rw,nosuid,nodev,noexec,relatime 0 0
none /proc proc rw,nosuid,nodev,noexec,relatime 0 0
none /dev devtmpfs rw,relatime,size=4086108k,nr_inodes=1021527,mode=755 0 0
none /dev/pts devpts rw,nosuid,noexec,relatime,gid=5,mode=620,ptmxmode=000 0 0
/dev/disk/by-uuid/6876c294-0c70-4b4e-87a2-636ea19e5ed6 / ext4
rw,relatime,errors=remount-ro,barrier=1,data=ordered 0 0
none /sys/fs/fuse/connections fusectl rw,relatime 0 0
none /sys/kernel/debug debugfs rw,relatime 0 0
none /sys/kernel/security securityfs rw,relatime 0 0
none /dev/shm tmpfs rw,nosuid,nodev,relatime 0 0
none /var/run tmpfs rw,nosuid,relatime,mode=755 0 0
none /var/lock tmpfs rw,nosuid,nodev,noexec,relatime 0 0
none /lib/init/rw tmpfs rw,nosuid,relatime,mode=755 0 0

strace -f -ooutout mount /dev/mapper/nintendo-backupos /mnt/backup
>
I got on terminal
mount: /dev/mapper/nintendo-backupos already mounted or /mnt/backup/ busy


and contents of outout
are



20525 execve("/bin/mount", ["mount", "/dev/mapper/nintendo-backu"...,
"/mnt/backup/"], [/* 18 vars */]) = 0
20525 brk(0)                            = 0x18f3000
20525 access("/etc/ld.so.nohwcap", F_OK) = -1 ENOENT (No such file or directory)
20525 mmap(NULL, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f5dea240000
20525 access("/etc/ld.so.preload", R_OK) = -1 ENOENT (No such file or directory)
20525 open("/etc/ld.so.cache", O_RDONLY) = 3
20525 fstat(3, {st_mode=S_IFREG|0644, st_size=34118, ...}) = 0
20525 mmap(NULL, 34118, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f5dea237000
20525 close(3)                          = 0
20525 access("/etc/ld.so.nohwcap", F_OK) = -1 ENOENT (No such file or directory)
20525 open("/lib/libblkid.so.1", O_RDONLY) = 3
20525 read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0@X\0\0\0\0\0\0"...,
832) = 832
20525 fstat(3, {st_mode=S_IFREG|0644, st_size=126536, ...}) = 0
20525 mmap(NULL, 2221608, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f5de9e04000
20525 mprotect(0x7f5de9e20000, 2093056, PROT_NONE) = 0
20525 mmap(0x7f5dea01f000, 16384, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1b000) = 0x7f5dea01f000
20525 close(3)                          = 0
20525 access("/etc/ld.so.nohwcap", F_OK) = -1 ENOENT (No such file or directory)
20525 open("/lib/libuuid.so.1", O_RDONLY) = 3
20525 read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\320\25\0\0\0\0\0\0"...,
832) = 832
20525 fstat(3, {st_mode=S_IFREG|0644, st_size=19008, ...}) = 0
20525 mmap(NULL, 2113920, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f5de9bff000
20525 mprotect(0x7f5de9c03000, 2093056, PROT_NONE) = 0
20525 mmap(0x7f5de9e02000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x3000) = 0x7f5de9e02000
20525 close(3)                          = 0
20525 access("/etc/ld.so.nohwcap", F_OK) = -1 ENOENT (No such file or directory)
20525 open("/lib/libselinux.so.1", O_RDONLY) = 3
20525 read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\20Y\0\0\0\0\0\0"...,
832) = 832
20525 fstat(3, {st_mode=S_IFREG|0644, st_size=117592, ...}) = 0
20525 mmap(NULL, 4096, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f5dea236000
20525 mmap(NULL, 2217480, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f5de99e1000
20525 mprotect(0x7f5de99fd000, 2093056, PROT_NONE) = 0
20525 mmap(0x7f5de9bfc000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1b000) = 0x7f5de9bfc000
20525 mmap(0x7f5de9bfe000, 1544, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f5de9bfe000
20525 close(3)                          = 0
20525 access("/etc/ld.so.nohwcap", F_OK) = -1 ENOENT (No such file or directory)
20525 open("/lib/libsepol.so.1", O_RDONLY) = 3
20525 read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\340D\0\0\0\0\0\0"...,
832) = 832
20525 fstat(3, {st_mode=S_IFREG|0644, st_size=244576, ...}) = 0
20525 mmap(NULL, 2341536, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f5de97a5000
20525 mprotect(0x7f5de97df000, 2097152, PROT_NONE) = 0
20525 mmap(0x7f5de99df000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x3a000) = 0x7f5de99df000
20525 close(3)                          = 0
20525 access("/etc/ld.so.nohwcap", F_OK) = -1 ENOENT (No such file or directory)
20525 open("/lib/libc.so.6", O_RDONLY)  = 3
20525 read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0`\355\1\0\0\0\0\0"...,
832) = 832
20525 fstat(3, {st_mode=S_IFREG|0755, st_size=1568136, ...}) = 0
20525 mmap(NULL, 3676200, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f5de9423000
20525 mprotect(0x7f5de959b000, 2097152, PROT_NONE) = 0
20525 mmap(0x7f5de979b000, 20480, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x178000) = 0x7f5de979b000
20525 mmap(0x7f5de97a0000, 18472, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f5de97a0000
20525 close(3)                          = 0
20525 access("/etc/ld.so.nohwcap", F_OK) = -1 ENOENT (No such file or directory)
20525 open("/lib/libdl.so.2", O_RDONLY) = 3
20525 read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\340\r\0\0\0\0\0\0"...,
832) = 832
20525 fstat(3, {st_mode=S_IFREG|0644, st_size=14696, ...}) = 0
20525 mmap(NULL, 4096, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f5dea235000
20525 mmap(NULL, 2109696, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f5de921f000
20525 mprotect(0x7f5de9221000, 2097152, PROT_NONE) = 0
20525 mmap(0x7f5de9421000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0x7f5de9421000
20525 close(3)                          = 0
20525 mmap(NULL, 4096, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f5dea234000
20525 mmap(NULL, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f5dea232000
20525 arch_prctl(ARCH_SET_FS, 0x7f5dea2327e0) = 0
20525 mprotect(0x7f5de9421000, 4096, PROT_READ) = 0
20525 mprotect(0x7f5de979b000, 16384, PROT_READ) = 0
20525 mprotect(0x7f5de99df000, 4096, PROT_READ) = 0
20525 mprotect(0x7f5de9bfc000, 4096, PROT_READ) = 0
20525 mprotect(0x7f5de9e02000, 4096, PROT_READ) = 0
20525 mprotect(0x7f5dea01f000, 12288, PROT_READ) = 0
20525 mprotect(0x612000, 4096, PROT_READ) = 0
20525 mprotect(0x7f5dea242000, 4096, PROT_READ) = 0
20525 munmap(0x7f5dea237000, 34118)     = 0
20525 statfs("/selinux", {f_type="EXT2_SUPER_MAGIC", f_bsize=4096,
f_blocks=2402873, f_bfree=1379180, f_bavail=1257120, f_files=610800,
f_ffree=527078, f_fsid={-90057489, -1743393107}, f_namelen=255,
f_frsize=4096}) = 0
20525 brk(0)                            = 0x18f3000
20525 brk(0x1914000)                    = 0x1914000
20525 open("/proc/filesystems", O_RDONLY) = 3
20525 fstat(3, {st_mode=S_IFREG|0444, st_size=0, ...}) = 0
20525 mmap(NULL, 4096, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f5dea23f000
20525 read(3, "nodev\tsysfs\nnodev\trootfs\nnodev\tb"..., 1024) = 313
20525 read(3, "", 1024)                 = 0
20525 close(3)                          = 0
20525 munmap(0x7f5dea23f000, 4096)      = 0
20525 open("/usr/lib/locale/locale-archive", O_RDONLY) = -1 ENOENT (No
such file or directory)
20525 open("/usr/share/locale/locale.alias", O_RDONLY) = 3
20525 fstat(3, {st_mode=S_IFREG|0644, st_size=2570, ...}) = 0
20525 mmap(NULL, 4096, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f5dea23f000
20525 read(3, "# Locale name alias data base.\n#"..., 4096) = 2570
20525 read(3, "", 4096)                 = 0
20525 close(3)                          = 0
20525 munmap(0x7f5dea23f000, 4096)      = 0
20525 open("/usr/lib/locale/en_IN/LC_IDENTIFICATION", O_RDONLY) = 3
20525 fstat(3, {st_mode=S_IFREG|0644, st_size=458, ...}) = 0
20525 mmap(NULL, 458, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f5dea23f000
20525 close(3)                          = 0
20525 open("/usr/lib/locale/en_IN/LC_MEASUREMENT", O_RDONLY) = 3
20525 fstat(3, {st_mode=S_IFREG|0644, st_size=23, ...}) = 0
20525 mmap(NULL, 23, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f5dea23e000
20525 close(3)                          = 0
20525 open("/usr/lib/locale/en_IN/LC_TELEPHONE", O_RDONLY) = 3
20525 fstat(3, {st_mode=S_IFREG|0644, st_size=53, ...}) = 0
20525 mmap(NULL, 53, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f5dea23d000
20525 close(3)                          = 0
20525 open("/usr/lib/locale/en_IN/LC_ADDRESS", O_RDONLY) = 3
20525 fstat(3, {st_mode=S_IFREG|0644, st_size=103, ...}) = 0
20525 mmap(NULL, 103, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f5dea23c000
20525 close(3)                          = 0
20525 open("/usr/lib/locale/en_IN/LC_NAME", O_RDONLY) = 3
20525 fstat(3, {st_mode=S_IFREG|0644, st_size=72, ...}) = 0
20525 mmap(NULL, 72, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f5dea23b000
20525 close(3)                          = 0
20525 open("/usr/lib/locale/en_IN/LC_PAPER", O_RDONLY) = 3
20525 fstat(3, {st_mode=S_IFREG|0644, st_size=34, ...}) = 0
20525 mmap(NULL, 34, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f5dea23a000
20525 close(3)                          = 0
20525 open("/usr/lib/locale/en_IN/LC_MESSAGES", O_RDONLY) = 3
20525 fstat(3, {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
20525 close(3)                          = 0
20525 open("/usr/lib/locale/en_IN/LC_MESSAGES/SYS_LC_MESSAGES", O_RDONLY) = 3
20525 fstat(3, {st_mode=S_IFREG|0644, st_size=53, ...}) = 0
20525 mmap(NULL, 53, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f5dea239000
20525 close(3)                          = 0
20525 open("/usr/lib/locale/en_IN/LC_MONETARY", O_RDONLY) = 3
20525 fstat(3, {st_mode=S_IFREG|0644, st_size=294, ...}) = 0
20525 mmap(NULL, 294, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f5dea238000
20525 close(3)                          = 0
20525 open("/usr/lib/locale/en_IN/LC_COLLATE", O_RDONLY) = 3
20525 fstat(3, {st_mode=S_IFREG|0644, st_size=1170770, ...}) = 0
20525 mmap(NULL, 1170770, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f5dea114000
20525 close(3)                          = 0
20525 open("/usr/lib/locale/en_IN/LC_TIME", O_RDONLY) = 3
20525 fstat(3, {st_mode=S_IFREG|0644, st_size=2578, ...}) = 0
20525 mmap(NULL, 2578, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f5dea237000
20525 close(3)                          = 0
20525 open("/usr/lib/locale/en_IN/LC_NUMERIC", O_RDONLY) = 3
20525 fstat(3, {st_mode=S_IFREG|0644, st_size=54, ...}) = 0
20525 mmap(NULL, 54, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f5dea113000
20525 close(3)                          = 0
20525 open("/usr/lib/locale/en_IN/LC_CTYPE", O_RDONLY) = 3
20525 fstat(3, {st_mode=S_IFREG|0644, st_size=256324, ...}) = 0
20525 mmap(NULL, 256324, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f5dea0d4000
20525 close(3)                          = 0
20525 umask(022)                        = 022
20525 open("/dev/null", O_RDWR)         = 3
20525 close(3)                          = 0
20525 getuid()                          = 0
20525 geteuid()                         = 0
20525 stat("/dev/mapper/nintendo-backupos", {st_mode=S_IFBLK|0660,
st_rdev=makedev(251, 0), ...}) = 0
20525 readlink("/dev", 0x7fff0dd219b0, 4096) = -1 EINVAL (Invalid argument)
20525 readlink("/dev/mapper", 0x7fff0dd219b0, 4096) = -1 EINVAL
(Invalid argument)
20525 readlink("/dev/mapper/nintendo-backupos", 0x7fff0dd219b0, 4096)
= -1 EINVAL (Invalid argument)
20525 rt_sigprocmask(SIG_BLOCK, ~[TRAP SEGV RTMIN RT_1], NULL, 8) = 0
20525 open("/dev/mapper/nintendo-backupos", O_RDONLY) = 3
20525 fadvise64(3, 0, 0, POSIX_FADV_RANDOM) = 0
20525 fstat(3, {st_mode=S_IFBLK|0660, st_rdev=makedev(251, 0), ...}) = 0
20525 uname({sys="Linux", node="openworld", ...}) = 0
20525 ioctl(3, BLKGETSIZE64, 0x18f6f60) = 0
20525 lseek(3, 5368643584, SEEK_SET)    = 5368643584
20525 read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
64) = 64
20525 lseek(3, 5368700928, SEEK_SET)    = 5368700928
20525 read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
64) = 64
20525 lseek(3, 0, SEEK_SET)             = 0
20525 read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
64) = 64
20525 lseek(3, 4096, SEEK_SET)          = 4096
20525 read(3, "A\1\0\0Q\1\0\0a\1\0\0hI\1\0v\5\4\0\0\0\0\0\0\0\0\0\0\0\335\315"...,
64) = 64
20525 lseek(3, 5368708608, SEEK_SET)    = 5368708608
20525 read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
40) = 40
20525 lseek(3, 5368577536, SEEK_SET)    = 5368577536
20525 read(3, "\350Jz\245\33\177\0\0\350\367y\245\33\177\0\0\370\370x\245\33\177\0\0h\245w\245\33\177\0\0"...,
40) = 40
20525 lseek(3, 5368708096, SEEK_SET)    = 5368708096
20525 read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
48) = 48
20525 lseek(3, 5368708608, SEEK_SET)    = 5368708608
20525 read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
51) = 51
20525 lseek(3, 5368708608, SEEK_SET)    = 5368708608
20525 read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
292) = 292
20525 lseek(3, 5368676864, SEEK_SET)    = 5368676864
20525 read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0", 24) = 24
20525 lseek(3, 5368578560, SEEK_SET)    = 5368578560
20525 read(3, "\0\37F\245\33\177\0\0\240N\320\220\33\177\0\0\f\0\0\0\5\0\0\0",
24) = 24
20525 lseek(3, 5368578048, SEEK_SET)    = 5368578048
20525 read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\1\0\0\0\0\0\0\0", 24) = 24
20525 lseek(3, 5368504832, SEEK_SET)    = 5368504832
20525 read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0", 24) = 24
20525 lseek(3, 5368703488, SEEK_SET)    = 5368703488
20525 read(3, "\0\0\0\0", 4)            = 4
20525 lseek(3, 4096, SEEK_SET)          = 4096
20525 read(3, "A\1\0\0Q\1\0\0a\1\0\0hI\1\0v\5\4\0\0\0\0\0\0\0\0\0\0\0\335\315"...,
1024) = 1024
20525 lseek(3, 5368708608, SEEK_SET)    = 5368708608
20525 read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
512) = 512
20525 lseek(3, 5368705024, SEEK_SET)    = 5368705024
20525 read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
4096) = 4096
20525 lseek(3, 0, SEEK_SET)             = 0
20525 read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
1024) = 1024
20525 lseek(3, 1024, SEEK_SET)          = 1024
20525 read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
1024) = 1024
20525 lseek(3, 1048576, SEEK_SET)       = 1048576
20525 read(3, "\0\201\0\0\0\201\1\0\0\201\2\0\0\201\3\0\0\201\4\0\0\201\f\0\0\201\r\0\0\0\0\0"...,
1024) = 1024
20525 lseek(3, 3072, SEEK_SET)          = 3072
20525 read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
1024) = 1024
20525 lseek(3, 7168, SEEK_SET)          = 7168
20525 read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
1024) = 1024
20525 lseek(3, 15360, SEEK_SET)         = 15360
20525 read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
1024) = 1024
20525 lseek(3, 31744, SEEK_SET)         = 31744
20525 read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
1024) = 1024
20525 lseek(3, 64512, SEEK_SET)         = 64512
20525 read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
1024) = 1024
20525 lseek(3, 8192, SEEK_SET)          = 8192
20525 read(3, "\2\200\0\0\2\200\1\0\2\200\2\0\2\200\3\0\2\200\4\0\2\200\f\0\2\200\r\0\0\0\0\0"...,
1024) = 1024
20525 lseek(3, 65536, SEEK_SET)         = 65536
20525 read(3, "\20\200\0\0\20\200\1\0\20\200\2\0\20\200\3\0\20\200\4\0\20\200\f\0\20\200\r\0\0\0\0\0"...,
1024) = 1024
20525 lseek(3, 32768, SEEK_SET)         = 32768
20525 read(3, "\10\200\0\0\10\200\1\0\10\200\2\0\10\200\3\0\10\200\4\0\10\200\f\0\10\200\r\0\0\0\0\0"...,
1024) = 1024
20525 lseek(3, 131072, SEEK_SET)        = 131072
20525 read(3, " \200\0\0 \200\1\0 \200\2\0 \200\3\0 \200\4\0 \200\f\0
\200\r\0\0\0\0\0"..., 1024) = 1024
20525 lseek(3, 135168, SEEK_SET)        = 135168
20525 read(3, "!\200\0\0!\200\1\0!\200\2\0!\200\3\0!\200\4\0!\200\f\0!\200\r\0\0\0\0\0"...,
1024) = 1024
20525 lseek(3, 139264, SEEK_SET)        = 139264
20525 read(3, "\"\200\0\0\"\200\1\0\"\200\2\0\"\200\3\0\"\200\4\0\"\200\f\0\"\200\r\0\0\0\0\0"...,
1024) = 1024
20525 lseek(3, 393216, SEEK_SET)        = 393216
20525 read(3, "`\200\0\0`\200\1\0`\200\2\0`\200\3\0`\200\4\0`\200\f\0`\200\r\0\0\0\0\0"...,
1024) = 1024
20525 lseek(3, 397312, SEEK_SET)        = 397312
20525 read(3, "a\200\0\0a\200\1\0a\200\2\0a\200\3\0a\200\4\0a\200\f\0a\200\r\0\0\0\0\0"...,
1024) = 1024
20525 lseek(3, 401408, SEEK_SET)        = 401408
20525 read(3, "b\200\0\0b\200\1\0b\200\2\0b\200\3\0b\200\4\0b\200\f\0b\200\r\0\0\0\0\0"...,
1024) = 1024
20525 lseek(3, 0, SEEK_SET)             = 0
20525 read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
1377) = 1377
20525 lseek(3, 8192, SEEK_SET)          = 8192
20525 read(3, "\2\200\0\0\2\200\1\0\2\200\2\0\2\200\3\0\2\200\4\0\2\200\f\0\2\200\r\0\0\0\0\0"...,
1377) = 1377
20525 lseek(3, 65536, SEEK_SET)         = 65536
20525 read(3, "\20\200\0\0\20\200\1\0\20\200\2\0\20\200\3\0\20\200\4\0\20\200\f\0\20\200\r\0\0\0\0\0"...,
1377) = 1377
20525 lseek(3, 262144, SEEK_SET)        = 262144
20525 read(3, "@\200\0\0@\200\1\0@\200\2\0@\200\3\0@\200\4\0@\200\f\0@\200\r\0\0\0\0\0"...,
1377) = 1377
20525 lseek(3, 9728, SEEK_SET)          = 9728
20525 read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
512) = 512
20525 lseek(3, 18944, SEEK_SET)         = 18944
20525 read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
512) = 512
20525 lseek(3, 2048, SEEK_SET)          = 2048
20525 read(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"...,
1024) = 1024
20525 lseek(3, 2097152, SEEK_SET)       = 2097152
20525 read(3, "\377\201\350\3\301\0\0\0bv\245Lbv\245L\30\246\237A\0\0\0\0\350\3\1\0\10\0\0\0"...,
1024) = 1024
20525 close(3)                          = 0
20525 open("/etc/filesystems", O_RDONLY) = -1 ENOENT (No such file or directory)
20525 open("/proc/filesystems", O_RDONLY) = 3
20525 fstat(3, {st_mode=S_IFREG|0444, st_size=0, ...}) = 0
20525 mmap(NULL, 4096, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f5dea0d3000
20525 read(3, "nodev\tsysfs\nnodev\trootfs\nnodev\tb"..., 1024) = 313
20525 stat("/sbin/mount.fuseblk", 0x7fff0dd22560) = -1 ENOENT (No such
file or directory)
20525 mount("/dev/mapper/nintendo-backupos", "/mnt/backup/",
"fuseblk", MS_MGC_VAL, NULL) = -1 EBUSY (Device or resource busy)
20525 open("/proc/filesystems", O_RDONLY) = 4
20525 fstat(4, {st_mode=S_IFREG|0444, st_size=0, ...}) = 0
20525 mmap(NULL, 4096, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f5dea0d2000
20525 read(4, "nodev\tsysfs\nnodev\trootfs\nnodev\tb"..., 1024) = 313
20525 close(4)                          = 0
20525 munmap(0x7f5dea0d2000, 4096)      = 0
20525 close(3)                          = 0
20525 munmap(0x7f5dea0d3000, 4096)      = 0
20525 rt_sigprocmask(SIG_UNBLOCK, ~[TRAP SEGV RTMIN RT_1], NULL, 8) = 0
20525 open("/usr/share/locale/en_IN/LC_MESSAGES/util-linux-ng.mo",
O_RDONLY) = -1 ENOENT (No such file or directory)
20525 open("/usr/share/locale/en/LC_MESSAGES/util-linux-ng.mo",
O_RDONLY) = -1 ENOENT (No such file or directory)
20525 open("/usr/share/locale-langpack/en_IN/LC_MESSAGES/util-linux-ng.mo",
O_RDONLY) = -1 ENOENT (No such file or directory)
20525 open("/usr/share/locale-langpack/en/LC_MESSAGES/util-linux-ng.mo",
O_RDONLY) = -1 ENOENT (No such file or directory)
20525 write(2, "mount: /dev/mapper/virtualizatio"..., 79) = 79
20525 write(2, "\n", 1)                 = 1
20525 readlink("/dev", 0x7fff0dd216b0, 4096) = -1 EINVAL (Invalid argument)
20525 readlink("/dev/mapper", 0x7fff0dd216b0, 4096) = -1 EINVAL
(Invalid argument)
20525 readlink("/dev/mapper/nintendo-backupos", 0x7fff0dd216b0, 4096)
= -1 EINVAL (Invalid argument)
20525 readlink("/mnt", 0x7fff0dd216c0, 4096) = -1 EINVAL (Invalid argument)
20525 readlink("/mnt/backup", 0x7fff0dd216c0, 4096) = -1 EINVAL
(Invalid argument)
20525 umask(077)                        = 022
20525 open("/etc/mtab", O_RDONLY)       = 3
20525 umask(022)                        = 077
20525 fstat(3, {st_mode=S_IFREG|0644, st_size=586, ...}) = 0
20525 mmap(NULL, 4096, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f5dea0d3000
20525 read(3, "/dev/sda1 / ext4 rw,errors=remou"..., 4096) = 586
20525 read(3, "", 4096)                 = 0
20525 close(3)                          = 0
20525 munmap(0x7f5dea0d3000, 4096)      = 0
20525 exit_group(32)                    = ?
