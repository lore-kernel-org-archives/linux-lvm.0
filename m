Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6HKY3a08445
	for <linux-lvm@redhat.com>; Sat, 17 Jul 2004 16:34:03 -0400
Received: from meuh.csquad.org (ALagny-151-1-11-87.w82-121.abo.wanadoo.fr
	[82.121.249.87])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i6HKXxe1007604
	for <linux-lvm@redhat.com>; Sat, 17 Jul 2004 16:34:00 -0400
Date: Sat, 17 Jul 2004 22:33:52 +0200
From: Christophe Nowicki <cscm@meuh.dyndns.org>
Subject: Re: [linux-lvm] vgscan can not find active volume group when i add a
	cdrom
Message-ID: <20040717203352.GA8683@TuX>
References: <20040715124328.GJ25352@meuh.dyndns.org>
	<20040715212701.10322.qmail@web11806.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="61jdw2sOBCFtR2d/"
Content-Disposition: inline
In-Reply-To: <20040715212701.10322.qmail@web11806.mail.yahoo.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>


--61jdw2sOBCFtR2d/
Content-Type: multipart/mixed; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 15, 2004 at 02:27:01PM -0700, bowmailtmp-lvm@yahoo.com wrote:
Hi,

Thanks for the answer dave, but is still does not work.
> Have you tried using the "filter" directive in the
> /etc/lvm/lvm.cnf  to force vgscan to ignore the
> /dev/hdd device? =20
I don't have a /etc/lvm directory on my system.
I've only a /etc/lvmconf directory with binary configuration=20
files.
> In my config it ignores /dev/cdrom
> which does not actually point to my real cdrom on
> /dev/hdc and it still has no issues, but it may be
> worth a shot anyway.
>=20
> Also, it might be worth strace-ing the vgscan to see
> what happens when it tries to fstat the /dev/hdd
> device:
> strace vgscan >& output.log
vgscan stat and open /dev/hdd without a problem :

$ grep hdd strace_output.log
stat64("/dev/hdd", {st_mode=3DS_IFBLK|0660, st_rdev=3Dmakedev(22, 64), ...}=
) =3D 0
open("/dev/hdd", O_RDONLY)              =3D 5
stat64("/dev/hdd", {st_mode=3DS_IFBLK|0660, st_rdev=3Dmakedev(22, 64), ...}=
) =3D 0
open("/dev/hdd", O_RDONLY)              =3D 4

the full strace log is attached to this mail.

thanks=20

--=20
Nowicki Christophe                                 =20
EPITECH Promo 2006                                =20
http://etudiant.epita.fr/~nowick_c/                =20

--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="strace_output.log"

execve("/sbin/vgscan", ["/sbin/vgscan"], [/* 14 vars */]) = 0
uname({sys="Linux", node="rescue", ...}) = 0
brk(0)                                  = 0x8049e6c
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40017000
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
open("/etc/ld.so.preload", O_RDONLY)    = -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=11349, ...}) = 0
old_mmap(NULL, 11349, PROT_READ, MAP_PRIVATE, 3, 0) = 0x40018000
close(3)                                = 0
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
open("/lib/libc.so.6", O_RDONLY)        = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\200^\1"..., 512) = 512
fstat64(3, {st_mode=S_IFREG|0644, st_size=1243856, ...}) = 0
old_mmap(NULL, 1254020, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x4001b000
old_mmap(0x40143000, 32768, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x127000) = 0x40143000
old_mmap(0x4014b000, 8836, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x4014b000
close(3)                                = 0
munmap(0x40018000, 11349)               = 0
brk(0)                                  = 0x8049e6c
brk(0x806ae6c)                          = 0x806ae6c
brk(0)                                  = 0x806ae6c
brk(0x806b000)                          = 0x806b000
open("/proc/misc", O_RDONLY)            = 3
fstat64(3, {st_mode=S_IFREG|0444, st_size=0, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40018000
read(3, " 63 device-mapper\n134 apm_bios\n1"..., 4096) = 49
close(3)                                = 0
munmap(0x40018000, 4096)                = 0
brk(0)                                  = 0x806b000
brk(0)                                  = 0x806b000
brk(0x806a000)                          = 0x806a000
brk(0)                                  = 0x806a000
open("/dev/null", O_RDONLY|O_NONBLOCK|O_DIRECTORY) = -1 ENOTDIR (Not a directory)
open("/proc/lvm/VGs", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
fstat64(3, {st_mode=S_IFDIR|0555, st_size=0, ...}) = 0
fcntl64(3, F_SETFD, FD_CLOEXEC)         = 0
getdents64(3, /* 2 entries */, 4096)    = 48
getdents64(3, /* 0 entries */, 4096)    = 0
close(3)                                = 0
stat64("/lib/lvm-200/vgscan", 0xbffffb3c) = -1 ENOENT (No such file or directory)
open("/dev/lvm", O_RDONLY)              = 3
ioctl(3, LVM_GET_IOP_VERSION, 0xbffffbde) = 0
close(3)                                = 0
stat64("/lib/lvm-10/vgscan", {st_mode=S_IFREG|0755, st_size=12828, ...}) = 0
execve("/lib/lvm-10/vgscan", ["/sbin/vgscan"], [/* 14 vars */]) = 0
uname({sys="Linux", node="rescue", ...}) = 0
brk(0)                                  = 0x804bdc4
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40017000
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
open("/etc/ld.so.preload", O_RDONLY)    = -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=11349, ...}) = 0
old_mmap(NULL, 11349, PROT_READ, MAP_PRIVATE, 3, 0) = 0x40018000
close(3)                                = 0
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
open("/lib/liblvm-10.so.1", O_RDONLY)   = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0PQ\0\000"..., 512) = 512
fstat64(3, {st_mode=S_IFREG|0644, st_size=140328, ...}) = 0
old_mmap(NULL, 156308, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x4001b000
old_mmap(0x4003d000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x21000) = 0x4003d000
old_mmap(0x4003e000, 12948, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x4003e000
close(3)                                = 0
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
open("/lib/libc.so.6", O_RDONLY)        = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\200^\1"..., 512) = 512
fstat64(3, {st_mode=S_IFREG|0644, st_size=1243856, ...}) = 0
old_mmap(NULL, 1254020, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x40042000
old_mmap(0x4016a000, 32768, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, 0x127000) = 0x4016a000
old_mmap(0x40172000, 8836, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40172000
close(3)                                = 0
munmap(0x40018000, 11349)               = 0
stat64("/dev/lvm", {st_mode=S_IFCHR|0640, st_rdev=makedev(109, 0), ...}) = 0
open("/dev/lvm", O_RDONLY)              = 3
ioctl(3, LVM_GET_IOP_VERSION, 0xbffffc1a) = 0
close(3)                                = 0
stat64("/dev/lvm", {st_mode=S_IFCHR|0640, st_rdev=makedev(109, 0), ...}) = 0
open("/dev/lvm", O_RDONLY)              = 3
ioctl(3, 0xff00, 0x4003dc7c)            = 0
rt_sigprocmask(SIG_SETMASK, ~[], [], 8) = 0
unlink("/etc/lvmtab")                   = 0
lstat64("/etc/lvmtab.d", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
open("/dev/null", O_RDONLY|O_NONBLOCK|O_DIRECTORY) = -1 ENOTDIR (Not a directory)
open("/etc/lvmtab.d", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 4
fstat64(4, {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
fcntl64(4, F_SETFD, FD_CLOEXEC)         = 0
brk(0)                                  = 0x804bdc4
brk(0x806cdc4)                          = 0x806cdc4
brk(0)                                  = 0x806cdc4
brk(0x806d000)                          = 0x806d000
getdents64(4, /* 2 entries */, 4096)    = 48
getdents64(4, /* 0 entries */, 4096)    = 0
brk(0)                                  = 0x806d000
brk(0)                                  = 0x806d000
brk(0x806c000)                          = 0x806c000
brk(0)                                  = 0x806c000
close(4)                                = 0
rmdir("/etc/lvmtab.d")                  = 0
open("/etc/lvmtab", O_WRONLY|O_CREAT|O_TRUNC, 0640) = 4
write(4, "\0", 1)                       = 1
fchmod(4, 0640)                         = 0
fsync(4)                                = 0
close(4)                                = 0
mkdir("/etc/lvmtab.d", 0755)            = 0
fstat64(1, {st_mode=S_IFREG|0644, st_size=6209, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40018000
open("/proc/partitions", O_RDONLY)      = 4
fstat64(4, {st_mode=S_IFREG|0444, st_size=0, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40019000
read(4, "major minor  #blocks  name     r"..., 4096) = 840
stat64("/dev/hdd", {st_mode=S_IFBLK|0660, st_rdev=makedev(22, 64), ...}) = 0
open("/proc/devices", O_RDONLY)         = 5
fstat64(5, {st_mode=S_IFREG|0444, st_size=0, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4001a000
read(5, "Character devices:\n  1 mem\n  2 p"..., 4096) = 202
close(5)                                = 0
munmap(0x4001a000, 4096)                = 0
open("/dev/hdd", O_RDONLY)              = 5
close(5)                                = 0
stat64("/dev/ide/host0/bus0/target0/lun0/disc", 0xbffff75c) = -1 ENOENT (No such file or directory)
stat64("/dev/ide/host0/bus0/target0/lun0/part1", 0xbffff75c) = -1 ENOENT (No such file or directory)
stat64("/dev/ide/host0/bus0/target0/lun0/part2", 0xbffff75c) = -1 ENOENT (No such file or directory)
stat64("/dev/ide/host0/bus0/target0/lun0/part5", 0xbffff75c) = -1 ENOENT (No such file or directory)
stat64("/dev/ide/host0/bus0/target0/lun0/part6", 0xbffff75c) = -1 ENOENT (No such file or directory)
stat64("/dev/ide/host0/bus0/target1/lun0/disc", 0xbffff75c) = -1 ENOENT (No such file or directory)
stat64("/dev/ide/host0/bus0/target1/lun0/part1", 0xbffff75c) = -1 ENOENT (No such file or directory)
read(4, "", 4096)                       = 0
stat64("/dev/ide/host0/bus0/target1/lun0/part1", 0xbffff75c) = -1 ENOENT (No such file or directory)
close(4)                                = 0
munmap(0x40019000, 4096)                = 0
open("/dev/loop", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = -1 ENOENT (No such file or directory)
open("/dev/", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 4
fstat64(4, {st_mode=S_IFDIR|0755, st_size=24576, ...}) = 0
fcntl64(4, F_SETFD, FD_CLOEXEC)         = 0
getdents64(4, /* 139 entries */, 4096)  = 4088
getdents64(4, /* 150 entries */, 4096)  = 4080
getdents64(4, /* 132 entries */, 4096)  = 4072
getdents64(4, /* 128 entries */, 4096)  = 4096
getdents64(4, /* 1 entries */, 4096)    = 24
getdents64(4, /* 128 entries */, 4096)  = 4096
getdents64(4, /* 128 entries */, 4096)  = 4096
getdents64(4, /* 133 entries */, 4096)  = 4088
getdents64(4, /* 131 entries */, 4096)  = 4072
getdents64(4, /* 140 entries */, 4096)  = 4072
getdents64(4, /* 141 entries */, 4096)  = 3928
getdents64(4, /* 50 entries */, 4096)   = 1424
getdents64(4, /* 0 entries */, 4096)    = 0
open("/etc/mtab", O_RDONLY)             = 5
fstat64(5, {st_mode=S_IFREG|0644, st_size=141, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40019000
read(5, "/dev/hda1 / unknown rw,errors=re"..., 4096) = 141
close(5)                                = 0
munmap(0x40019000, 4096)                = 0
open("/proc/meminfo", O_RDONLY)         = 5
fstat64(5, {st_mode=S_IFREG|0444, st_size=0, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40019000
read(5, "        total:    used:    free:"..., 4096) = 524
close(5)                                = 0
munmap(0x40019000, 4096)                = 0
close(4)                                = 0
stat64("/dev/loop0", {st_mode=S_IFBLK|0660, st_rdev=makedev(7, 0), ...}) = 0
open("/proc/devices", O_RDONLY)         = 4
fstat64(4, {st_mode=S_IFREG|0444, st_size=0, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40019000
read(4, "Character devices:\n  1 mem\n  2 p"..., 4096) = 202
close(4)                                = 0
munmap(0x40019000, 4096)                = 0
open("/dev/loop0", O_RDONLY)            = 4
close(4)                                = 0
stat64("/dev/loop1", {st_mode=S_IFBLK|0660, st_rdev=makedev(7, 1), ...}) = 0
open("/proc/devices", O_RDONLY)         = 4
fstat64(4, {st_mode=S_IFREG|0444, st_size=0, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40019000
read(4, "Character devices:\n  1 mem\n  2 p"..., 4096) = 202
close(4)                                = 0
munmap(0x40019000, 4096)                = 0
open("/dev/loop1", O_RDONLY)            = 4
close(4)                                = 0
stat64("/dev/loop2", {st_mode=S_IFBLK|0660, st_rdev=makedev(7, 2), ...}) = 0
open("/proc/devices", O_RDONLY)         = 4
fstat64(4, {st_mode=S_IFREG|0444, st_size=0, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40019000
read(4, "Character devices:\n  1 mem\n  2 p"..., 4096) = 202
close(4)                                = 0
munmap(0x40019000, 4096)                = 0
open("/dev/loop2", O_RDONLY)            = 4
close(4)                                = 0
stat64("/dev/loop3", {st_mode=S_IFBLK|0660, st_rdev=makedev(7, 3), ...}) = 0
open("/proc/devices", O_RDONLY)         = 4
fstat64(4, {st_mode=S_IFREG|0444, st_size=0, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40019000
read(4, "Character devices:\n  1 mem\n  2 p"..., 4096) = 202
close(4)                                = 0
munmap(0x40019000, 4096)                = 0
open("/dev/loop3", O_RDONLY)            = 4
close(4)                                = 0
stat64("/dev/loop4", {st_mode=S_IFBLK|0660, st_rdev=makedev(7, 4), ...}) = 0
open("/proc/devices", O_RDONLY)         = 4
fstat64(4, {st_mode=S_IFREG|0444, st_size=0, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40019000
read(4, "Character devices:\n  1 mem\n  2 p"..., 4096) = 202
close(4)                                = 0
munmap(0x40019000, 4096)                = 0
open("/dev/loop4", O_RDONLY)            = 4
close(4)                                = 0
stat64("/dev/loop5", {st_mode=S_IFBLK|0660, st_rdev=makedev(7, 5), ...}) = 0
open("/proc/devices", O_RDONLY)         = 4
fstat64(4, {st_mode=S_IFREG|0444, st_size=0, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40019000
read(4, "Character devices:\n  1 mem\n  2 p"..., 4096) = 202
close(4)                                = 0
munmap(0x40019000, 4096)                = 0
open("/dev/loop5", O_RDONLY)            = 4
close(4)                                = 0
stat64("/dev/loop6", {st_mode=S_IFBLK|0660, st_rdev=makedev(7, 6), ...}) = 0
open("/proc/devices", O_RDONLY)         = 4
fstat64(4, {st_mode=S_IFREG|0444, st_size=0, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40019000
read(4, "Character devices:\n  1 mem\n  2 p"..., 4096) = 202
close(4)                                = 0
munmap(0x40019000, 4096)                = 0
open("/dev/loop6", O_RDONLY)            = 4
close(4)                                = 0
stat64("/dev/loop7", {st_mode=S_IFBLK|0660, st_rdev=makedev(7, 7), ...}) = 0
open("/proc/devices", O_RDONLY)         = 4
fstat64(4, {st_mode=S_IFREG|0444, st_size=0, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40019000
read(4, "Character devices:\n  1 mem\n  2 p"..., 4096) = 202
close(4)                                = 0
munmap(0x40019000, 4096)                = 0
open("/dev/loop7", O_RDONLY)            = 4
close(4)                                = 0
open("/dev/nb", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = -1 ENOENT (No such file or directory)
open("/dev/", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 4
fstat64(4, {st_mode=S_IFDIR|0755, st_size=24576, ...}) = 0
fcntl64(4, F_SETFD, FD_CLOEXEC)         = 0
getdents64(4, /* 139 entries */, 4096)  = 4088
getdents64(4, /* 150 entries */, 4096)  = 4080
getdents64(4, /* 132 entries */, 4096)  = 4072
getdents64(4, /* 128 entries */, 4096)  = 4096
getdents64(4, /* 1 entries */, 4096)    = 24
getdents64(4, /* 128 entries */, 4096)  = 4096
getdents64(4, /* 128 entries */, 4096)  = 4096
getdents64(4, /* 133 entries */, 4096)  = 4088
getdents64(4, /* 131 entries */, 4096)  = 4072
getdents64(4, /* 140 entries */, 4096)  = 4072
getdents64(4, /* 141 entries */, 4096)  = 3928
getdents64(4, /* 50 entries */, 4096)   = 1424
getdents64(4, /* 0 entries */, 4096)    = 0
close(4)                                = 0
stat64("/dev/hdd", {st_mode=S_IFBLK|0660, st_rdev=makedev(22, 64), ...}) = 0
open("/dev/hdd", O_RDONLY)              = 4
fstat64(4, {st_mode=S_IFBLK|0660, st_rdev=makedev(22, 64), ...}) = 0
read(4, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 468) = 468
open("/proc/devices", O_RDONLY)         = 5
fstat64(5, {st_mode=S_IFREG|0444, st_size=0, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40019000
read(5, "Character devices:\n  1 mem\n  2 p"..., 4096) = 202
close(5)                                = 0
munmap(0x40019000, 4096)                = 0
open("/proc/devices", O_RDONLY)         = 5
fstat64(5, {st_mode=S_IFREG|0444, st_size=0, ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40019000
read(5, "Character devices:\n  1 mem\n  2 p"..., 4096) = 202
close(5)                                = 0
munmap(0x40019000, 4096)                = 0
close(4)                                = 0
stat64("/dev/loop0", {st_mode=S_IFBLK|0660, st_rdev=makedev(7, 0), ...}) = 0
open("/dev/loop0", O_RDONLY)            = 4
fstat64(4, {st_mode=S_IFBLK|0660, st_rdev=makedev(7, 0), ...}) = 0
read(4, "", 468)                        = 0
close(4)                                = 0
stat64("/dev/loop1", {st_mode=S_IFBLK|0660, st_rdev=makedev(7, 1), ...}) = 0
open("/dev/loop1", O_RDONLY)            = 4
fstat64(4, {st_mode=S_IFBLK|0660, st_rdev=makedev(7, 1), ...}) = 0
read(4, "", 468)                        = 0
close(4)                                = 0
stat64("/dev/loop2", {st_mode=S_IFBLK|0660, st_rdev=makedev(7, 2), ...}) = 0
open("/dev/loop2", O_RDONLY)            = 4
fstat64(4, {st_mode=S_IFBLK|0660, st_rdev=makedev(7, 2), ...}) = 0
read(4, "", 468)                        = 0
close(4)                                = 0
stat64("/dev/loop3", {st_mode=S_IFBLK|0660, st_rdev=makedev(7, 3), ...}) = 0
open("/dev/loop3", O_RDONLY)            = 4
fstat64(4, {st_mode=S_IFBLK|0660, st_rdev=makedev(7, 3), ...}) = 0
read(4, "", 468)                        = 0
close(4)                                = 0
stat64("/dev/loop4", {st_mode=S_IFBLK|0660, st_rdev=makedev(7, 4), ...}) = 0
open("/dev/loop4", O_RDONLY)            = 4
fstat64(4, {st_mode=S_IFBLK|0660, st_rdev=makedev(7, 4), ...}) = 0
read(4, "", 468)                        = 0
close(4)                                = 0
stat64("/dev/loop5", {st_mode=S_IFBLK|0660, st_rdev=makedev(7, 5), ...}) = 0
open("/dev/loop5", O_RDONLY)            = 4
fstat64(4, {st_mode=S_IFBLK|0660, st_rdev=makedev(7, 5), ...}) = 0
read(4, "", 468)                        = 0
close(4)                                = 0
stat64("/dev/loop6", {st_mode=S_IFBLK|0660, st_rdev=makedev(7, 6), ...}) = 0
open("/dev/loop6", O_RDONLY)            = 4
fstat64(4, {st_mode=S_IFBLK|0660, st_rdev=makedev(7, 6), ...}) = 0
read(4, "", 468)                        = 0
close(4)                                = 0
stat64("/dev/loop7", {st_mode=S_IFBLK|0660, st_rdev=makedev(7, 7), ...}) = 0
open("/dev/loop7", O_RDONLY)            = 4
fstat64(4, {st_mode=S_IFBLK|0660, st_rdev=makedev(7, 7), ...}) = 0
read(4, "", 468)                        = 0
close(4)                                = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
close(3)                                = 0
write(1, "vgscan -- reading all physical v"..., 211vgscan -- reading all physical volumes (this may take a while...)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group

) = 211
munmap(0x40018000, 4096)                = 0
exit_group(0)                           = ?

--EVF5PPMfhYS0aIcm--

--61jdw2sOBCFtR2d/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFA+Y0w3jtE0lRnlNoRAjTCAJ94Vyia5UcRskUKps8nmJRTYZCd5wCgmjpt
lutBxKYgrxM8YPV7nTFJHUQ=
=P9o3
-----END PGP SIGNATURE-----

--61jdw2sOBCFtR2d/--
