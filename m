Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 49CE130012B1
	for <linux-lvm@redhat.com>; Thu, 26 Jul 2018 07:24:48 +0000 (UTC)
Received: from mail1.merlins.org (magic.merlins.org [209.81.13.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 60AEE308A944
	for <linux-lvm@redhat.com>; Thu, 26 Jul 2018 07:24:46 +0000 (UTC)
Date: Thu, 26 Jul 2018 00:24:40 -0700
From: Marc MERLIN <marc@merlins.org>
Message-ID: <20180726072440.372sthb6accswcr4@merlins.org>
References: <20180726004154.xcdjyqv7tkdfpvca@merlins.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180726004154.xcdjyqv7tkdfpvca@merlins.org>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Can't create thin lv
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
To: linux-lvm@redhat.com

On Wed, Jul 25, 2018 at 05:41:54PM -0700, Marc MERLIN wrote:
> Howdy,
> 
> Kernel 4.17, trying thin LV for the first time, and I'm getting this:
> gargamel:~# lvcreate -L 14.50TiB -Zn -T vgds2/thinpool2 
>   Using default stripesize 64.00 KiB.
>   Thin pool volume with chunk size 8.00 MiB can address at most <1.98 PiB of data.
>   /dev/mapper/vgds2-thinpool2_tmeta: open failed: No such file or directory
>   Failed to activate new LV.
> 
> any idea what I should try next?

Interestingly I got a different error, once:
gargamel:~# lvcreate -L 14.50TiB -Zn -T vgds2/thinpool2 
  Using default stripesize 64.00 KiB.
  Thin pool volume with chunk size 8.00 MiB can address at most <1.98 PiB of data.
  /dev/vgds2/lvol0: not found: device not cleared
  Aborting. Failed to wipe start of new LV.

gargamel:~# mkdir /dev/vgds2/
gargamel:~# l /dev/mapper/
total 0
drwxr-xr-x  2 root root     200 Jul 25 17:27 ./
drwxr-xr-x 20 root root    5280 Jul 26 00:15 ../
crw-------  1 root root 10, 236 Jul 25 17:25 control
lrwxrwxrwx  1 root root       7 Jul 23 08:57 cryptroot -> ../dm-0
lrwxrwxrwx  1 root root       7 Jul 25 06:40 dshelf1 -> ../dm-1
lrwxrwxrwx  1 root root       7 Jul 26 00:11 dshelf2 -> ../dm-2
lrwxrwxrwx  1 root root       7 Jul 25 06:40 eswap1 -> ../dm-3
lrwxrwxrwx  1 root root       7 Jul 25 06:40 raid0d1 -> ../dm-4
lrwxrwxrwx  1 root root       7 Jul 25 06:40 raid0d2 -> ../dm-5
lrwxrwxrwx  1 root root       7 Jul 25 06:40 varchange -> ../dm-6
gargamel:~# vgchange -ay
  0 logical volume(s) in volume group "vgds2" now active

gargamel:~# lvcreate -L 14.50TiB -Zn -T vgds2/thinpool2 
  Using default stripesize 64.00 KiB.
  Thin pool volume with chunk size 8.00 MiB can address at most <1.98 PiB of data.
  /dev/mapper/vgds2-thinpool2_tmeta: open failed: No such file or directory
  Failed to activate new LV.

gargamel:~# psg lvm
root      2378  0.0  0.0  31600   488 ?        Ss   Jul25   0:00 /sbin/lvmetad

gargamel:~# lvcreate --version
  LVM version:     2.02.176(2) (2017-11-03)
  Library version: 1.02.145 (2017-11-03)
  Driver version:  4.39.0
  Configuration:   ./configure --build=i686-linux-gnu --prefix=/usr --includedir=${prefix}/include --mandir=${prefix}/share/man --infodir=${prefix}/share/info --sysconfdir=/etc --localstatedir=/var --disable-silent-rules --libdir=${prefix}/lib/i386-linux-gnu --libexecdir=${prefix}/lib/i386-linux-gnu --runstatedir=/run --disable-maintainer-mode --disable-dependency-tracking --exec-prefix= --bindir=/bin --libdir=/lib/i386-linux-gnu --sbindir=/sbin --with-usrlibdir=/usr/lib/i386-linux-gnu --with-optimisation=-O2 --with-cache=internal --with-clvmd=corosync --with-cluster=internal --with-device-uid=0 --with-device-gid=6 --with-device-mode=0660 --with-default-pid-dir=/run --with-default-run-dir=/run/lvm --with-default-locking-dir=/run/lock/lvm --with-thin=internal --with-thin-check=/usr/sbin/thin_check --with-thin-dump=/usr/sbin/thin_dump --with-thin-repair=/usr/sbin/thin_repair --enable-applib --enable-blkid_wiping --enable-cmdlib --enable-cmirrord --enable-dmeventd --enable-dbus-service --enable-lvmetad --enable-lvmlockd-dlm --enable-lvmlockd-sanlock --enable-lvmpolld --enable-notify-dbus --enable-pkgconfig --enable-readline --enable-udev_rules --enable-udev_sync


strace shows:
openat(AT_FDCWD, "/dev/vgds2/lvol0", O_RDWR|O_DIRECT|O_LARGEFILE|O_NOATIME) = 7
openat(AT_FDCWD, "/proc/self/maps", O_RDONLY|O_LARGEFILE) = 7
openat(AT_FDCWD, "/dev/urandom", O_RDONLY|O_LARGEFILE) = 8
openat(AT_FDCWD, "/proc/self/maps", O_RDONLY|O_LARGEFILE) = 7
stat64("/dev/mapper/dshelf2", {st_mode=S_IFBLK|0660, st_rdev=makedev(253, 2), ...}) = 0
stat64("/dev/mapper/dshelf2", {st_mode=S_IFBLK|0660, st_rdev=makedev(253, 2), ...}) = 0
openat(AT_FDCWD, "/sys/dev/block/253:7/bdi/read_ahead_kb", O_RDONLY|O_LARGEFILE) = 7
openat(AT_FDCWD, "/sys/dev/block/253:7/bdi/read_ahead_kb", O_WRONLY|O_LARGEFILE) = 7
stat64("/dev/mapper/control", {st_mode=S_IFCHR|0600, st_rdev=makedev(10, 236), ...}) = 0
openat(AT_FDCWD, "/dev/mapper/control", O_RDWR|O_LARGEFILE) = 4
stat64("/dev/vgds2/thinpool2", {st_mode=S_IFBLK|0660, st_rdev=makedev(253, 7), ...}) = 0
lstat64("/dev/vgds2/thinpool2", {st_mode=S_IFLNK|0777, st_size=7, ...}) = 0
lstat64("/dev/vgds2/lvol0", 0xffe9462c) = -1 ENOENT (No such file or directory)
stat64("/dev/vgds2/thinpool2", {st_mode=S_IFBLK|0660, st_rdev=makedev(253, 7), ...}) = 0
openat(AT_FDCWD, "/dev/vgds2/thinpool2", O_RDWR|O_DIRECT|O_LARGEFILE|O_NOATIME) = 7
openat(AT_FDCWD, "/proc/self/maps", O_RDONLY|O_LARGEFILE) = 7
openat(AT_FDCWD, "/dev/urandom", O_RDONLY|O_LARGEFILE) = 8
openat(AT_FDCWD, "/dev/urandom", O_RDONLY|O_LARGEFILE) = 8
stat64("/sys//dev/block/253:2/queue/minimum_io_size", {st_mode=S_IFREG|0444, st_size=4096, ...}) = 0
openat(AT_FDCWD, "/sys//dev/block/253:2/queue/minimum_io_size", O_RDONLY|O_LARGEFILE) = 7
stat64("/etc/lvm/backup", {st_mode=S_IFDIR|0700, st_size=10, ...}) = 0
access("/etc/lvm/backup", R_OK|W_OK|X_OK) = 0
openat(AT_FDCWD, "/etc/lvm/backup/.lvm_gargamel.svh.merlins.org_19532_130993407", O_WRONLY|O_CREAT|O_EXCL|O_APPEND|O_LARGEFILE, 0666) = 7
rename("/etc/lvm/backup/.lvm_gargamel.svh.merlins.org_19532_130993407", "/etc/lvm/backup/vgds2.tmp") = 0
rename("/etc/lvm/backup/vgds2.tmp", "/etc/lvm/backup/vgds2") = 0
stat64("/etc/lvm/backup/vgds2.tmp", 0xffe96b7c) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/etc/lvm/backup", O_RDONLY|O_LARGEFILE) = 7
openat(AT_FDCWD, "/proc/self/maps", O_RDONLY|O_LARGEFILE) = 7
stat64("/dev/mapper/dshelf2", {st_mode=S_IFBLK|0660, st_rdev=makedev(253, 2), ...}) = 0
stat64("/dev/mapper/dshelf2", {st_mode=S_IFBLK|0660, st_rdev=makedev(253, 2), ...}) = 0
stat64("/dev/mapper/dshelf2", {st_mode=S_IFBLK|0660, st_rdev=makedev(253, 2), ...}) = 0
stat64("/dev/mapper/dshelf2", {st_mode=S_IFBLK|0660, st_rdev=makedev(253, 2), ...}) = 0
openat(AT_FDCWD, "/sys/dev/block/253:7/bdi/read_ahead_kb", O_RDONLY|O_LARGEFILE) = 8
openat(AT_FDCWD, "/sys/dev/block/253:7/bdi/read_ahead_kb", O_WRONLY|O_LARGEFILE) = 8
openat(AT_FDCWD, "/sys/dev/block/253:8/bdi/read_ahead_kb", O_RDONLY|O_LARGEFILE) = 8
openat(AT_FDCWD, "/sys/dev/block/253:8/bdi/read_ahead_kb", O_WRONLY|O_LARGEFILE) = 8
openat(AT_FDCWD, "/dev/mapper/vgds2-thinpool2_tmeta", O_RDONLY|O_LARGEFILE) = -1 ENOENT (No such file or directory)
  /dev/mapper/vgds2-thinpool2_tmeta: open failed: No such file or directory
  Failed to activate new LV.


gargamel:~# strace -etrace=file lvcreate -L 14.50TiB -Zn -T vgds2/thinpool2 2>&1 |grep thinpool2
execve("/sbin/lvcreate", ["lvcreate", "-L", "14.50TiB", "-Zn", "-T", "vgds2/thinpool2"], [/* 33 vars */]) = 0
stat64("/dev/vgds2/thinpool2", {st_mode=S_IFBLK|0660, st_rdev=makedev(253, 7), ...}) = 0
lstat64("/dev/vgds2/thinpool2", {st_mode=S_IFLNK|0777, st_size=7, ...}) = 0
stat64("/dev/vgds2/thinpool2", {st_mode=S_IFBLK|0660, st_rdev=makedev(253, 7), ...}) = 0
openat(AT_FDCWD, "/dev/vgds2/thinpool2", O_RDWR|O_DIRECT|O_LARGEFILE|O_NOATIME) = 7
openat(AT_FDCWD, "/dev/mapper/vgds2-thinpool2_tmeta", O_RDONLY|O_LARGEFILE) = -1 ENOENT (No such file or directory)
  /dev/mapper/vgds2-thinpool2_tmeta: open failed: No such file or directory

Any ideas?

Thanks,
Marc
-- 
"A mouse is a device used to point at the xterm you want to type in" - A.S.R.
Microsoft is to operating systems ....
                                      .... what McDonalds is to gourmet cooking
Home page: http://marc.merlins.org/                       | PGP 7F55D5F27AAF9D08
