Subject: Re: [linux-lvm] xfs quota on lvm
From: Christophe Zwecker <doc@zwecker.de>
In-Reply-To: <20020116213756.A31578@wobbly.melbourne.sgi.com>
References: <1011111148.3294.8.camel@fry.sysctl-office.de>
    <20020116181545.E30220@wobbly.melbourne.sgi.com>
    <1011175583.3295.18.camel@fry.sysctl-office.de>
    <20020116213756.A31578@wobbly.melbourne.sgi.com>
Content-Type: multipart/mixed; boundary="=-7mddxiYJjp4IrMQu28OH"
Message-Id: <1011182440.3294.30.camel@fry.sysctl-office.de>
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
Date: Wed Jan 16 06:00:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=-7mddxiYJjp4IrMQu28OH
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


> 
> Hmm... from your boot info we can tell that quota is being
> activated on all filesystems, but for some reason it looks
> like the quotactl syscall is failing for these LVM devices
> (but not the non-LVM device, which is wierd).
> 
> The strace output might be useful - could you send me that?

ok, I created a 100MB exct2 partition on lvm, doesnt work either,
attached youll find the strace output for:

 strace -o setquota.trace setquota -u doc 500 501 100 101
/dev/bender/test



The part is mounted user and groupquota.

Hope this helps clearing things up.

Cheers,

Christophe

--=-7mddxiYJjp4IrMQu28OH
Content-Disposition: attachment; filename=setquota.trace
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=ISO-8859-1

execve("/usr/sbin/setquota", ["setquota", "-u", "doc", "500", "501", "100",=
 "101", "/dev/bender/test"], [/* 25 vars */]) =3D 0
uname({sys=3D"Linux", node=3D"bender.zwecker.de", ...}) =3D 0
brk(0)                                  =3D 0x8053c8c
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0=
) =3D 0x40016000
open("/etc/ld.so.preload", O_RDONLY)    =3D -1 ENOENT (No such file or dire=
ctory)
open("/etc/ld.so.cache", O_RDONLY)      =3D 3
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D39350, ...}) =3D 0
old_mmap(NULL, 39350, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0x40017000
close(3)                                =3D 0
open("/lib/libc.so.6", O_RDONLY)        =3D 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\360\303"..., 1024)=
 =3D 1024
fstat64(3, {st_mode=3DS_IFREG|0755, st_size=3D5723311, ...}) =3D 0
old_mmap(NULL, 1265288, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) =3D 0x40021=
000
mprotect(0x4014d000, 36488, PROT_NONE)  =3D 0
old_mmap(0x4014d000, 20480, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3,=
 0x12b000) =3D 0x4014d000
old_mmap(0x40152000, 16008, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP=
_ANONYMOUS, -1, 0) =3D 0x40152000
close(3)                                =3D 0
munmap(0x40017000, 39350)               =3D 0
brk(0)                                  =3D 0x8053c8c
brk(0x8053cb4)                          =3D 0x8053cb4
brk(0x8054000)                          =3D 0x8054000
open("/usr/share/locale/locale.alias", O_RDONLY) =3D 3
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D2601, ...}) =3D 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0=
) =3D 0x40017000
read(3, "# Locale name alias data base.\n#"..., 4096) =3D 2601
brk(0x8055000)                          =3D 0x8055000
read(3, "", 4096)                       =3D 0
close(3)                                =3D 0
munmap(0x40017000, 4096)                =3D 0
open("/usr/lib/locale/en_US/LC_IDENTIFICATION", O_RDONLY) =3D 3
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D370, ...}) =3D 0
old_mmap(NULL, 370, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0x40017000
close(3)                                =3D 0
open("/usr/lib/locale/en_US/LC_MEASUREMENT", O_RDONLY) =3D 3
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D28, ...}) =3D 0
old_mmap(NULL, 28, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0x40018000
close(3)                                =3D 0
open("/usr/lib/locale/en_US/LC_TELEPHONE", O_RDONLY) =3D 3
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D64, ...}) =3D 0
old_mmap(NULL, 64, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0x40019000
close(3)                                =3D 0
open("/usr/lib/locale/en_US/LC_ADDRESS", O_RDONLY) =3D 3
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D160, ...}) =3D 0
old_mmap(NULL, 160, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0x4001a000
close(3)                                =3D 0
open("/usr/lib/locale/en_US/LC_NAME", O_RDONLY) =3D 3
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D82, ...}) =3D 0
old_mmap(NULL, 82, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0x4001b000
close(3)                                =3D 0
open("/usr/lib/locale/en_US/LC_PAPER", O_RDONLY) =3D 3
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D39, ...}) =3D 0
old_mmap(NULL, 39, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0x4001c000
close(3)                                =3D 0
open("/usr/lib/locale/en_US/LC_MESSAGES", O_RDONLY) =3D 3
fstat64(3, {st_mode=3DS_IFDIR|0755, st_size=3D28, ...}) =3D 0
close(3)                                =3D 0
open("/usr/lib/locale/en_US/LC_MESSAGES/SYS_LC_MESSAGES", O_RDONLY) =3D 3
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D57, ...}) =3D 0
old_mmap(NULL, 57, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0x4001d000
close(3)                                =3D 0
open("/usr/lib/locale/en_US/LC_MONETARY", O_RDONLY) =3D 3
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D291, ...}) =3D 0
old_mmap(NULL, 291, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0x4001e000
brk(0x8056000)                          =3D 0x8056000
close(3)                                =3D 0
open("/usr/lib/locale/en_US/LC_COLLATE", O_RDONLY) =3D 3
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D21499, ...}) =3D 0
old_mmap(NULL, 21499, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0x40156000
close(3)                                =3D 0
open("/usr/lib/locale/en_US/LC_TIME", O_RDONLY) =3D 3
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D2456, ...}) =3D 0
old_mmap(NULL, 2456, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0x4001f000
close(3)                                =3D 0
open("/usr/lib/locale/en_US/LC_NUMERIC", O_RDONLY) =3D 3
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D59, ...}) =3D 0
old_mmap(NULL, 59, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0x40020000
close(3)                                =3D 0
open("/usr/lib/locale/en_US/LC_CTYPE", O_RDONLY) =3D 3
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D173408, ...}) =3D 0
old_mmap(NULL, 173408, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0x4015c000
close(3)                                =3D 0
socket(PF_UNIX, SOCK_STREAM, 0)         =3D 3
connect(3, {sin_family=3DAF_UNIX, path=3D"                                 =
                                                      /var/run/.nscd_socket=
"}, 110) =3D -1 ENOENT (No such file or directory)
close(3)                                =3D 0
open("/etc/nsswitch.conf", O_RDONLY)    =3D 3
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D1750, ...}) =3D 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0=
) =3D 0x40187000
read(3, "#\n# /etc/nsswitch.conf\n#\n# An ex"..., 4096) =3D 1750
brk(0x8057000)                          =3D 0x8057000
read(3, "", 4096)                       =3D 0
close(3)                                =3D 0
munmap(0x40187000, 4096)                =3D 0
open("/etc/ld.so.cache", O_RDONLY)      =3D 3
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D39350, ...}) =3D 0
old_mmap(NULL, 39350, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0x40187000
close(3)                                =3D 0
open("/lib/libnss_files.so.2", O_RDONLY) =3D 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\360 \0"..., 1024) =
=3D 1024
fstat64(3, {st_mode=3DS_IFREG|0755, st_size=3D256603, ...}) =3D 0
old_mmap(NULL, 41584, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) =3D 0x4019100=
0
mprotect(0x4019a000, 4720, PROT_NONE)   =3D 0
old_mmap(0x4019a000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3, =
0x8000) =3D 0x4019a000
close(3)                                =3D 0
munmap(0x40187000, 39350)               =3D 0
open("/etc/passwd", O_RDONLY)           =3D 3
fcntl64(3, F_GETFD)                     =3D 0
fcntl64(3, F_SETFD, FD_CLOEXEC)         =3D 0
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D2896, ...}) =3D 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0=
) =3D 0x40187000
read(3, "root:x:0:0:root:/root:/bin/bash\n"..., 4096) =3D 2896
close(3)                                =3D 0
munmap(0x40187000, 4096)                =3D 0
open("/usr/share/locale/en_US/LC_MESSAGES/quota.mo", O_RDONLY) =3D -1 ENOEN=
T (No such file or directory)
open("/usr/share/locale/en/LC_MESSAGES/quota.mo", O_RDONLY) =3D -1 ENOENT (=
No such file or directory)
stat64("/proc/fs/xfs/stat", {st_mode=3DS_IFREG|0444, st_size=3D0, ...}) =3D=
 0
quotactl(0x1100 /* Q_??? */|USRQUOTA, NULL, 0, {10, 0, 3221224132, 0, 32212=
24441, 3221224000, 134519360, 3221224438}) =3D -1 EFAULT (Bad address)
open("/etc/mtab", O_RDONLY)             =3D 3
brk(0x8059000)                          =3D 0x8059000
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D312, ...}) =3D 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0=
) =3D 0x40187000
read(3, "/dev/sda2 / xfs rw,usrquota,grpq"..., 4096) =3D 312
stat64("/dev/sda2", {st_mode=3DS_IFBLK|0660, st_rdev=3Dmakedev(8, 2), ...})=
 =3D 0
stat64("/dev/bender/test", {st_mode=3DS_IFBLK|0660, st_rdev=3Dmakedev(58, 4=
), ...}) =3D 0
stat64("/", {st_mode=3DS_IFDIR|0755, st_size=3D4096, ...}) =3D 0
stat64("/dev/bender/test", {st_mode=3DS_IFBLK|0660, st_rdev=3Dmakedev(58, 4=
), ...}) =3D 0
stat64("none", 0xbffff87c)              =3D -1 ENOENT (No such file or dire=
ctory)
stat64("/proc", {st_mode=3DS_IFDIR|0555, st_size=3D0, ...}) =3D 0
stat64("/dev/bender/test", {st_mode=3DS_IFBLK|0660, st_rdev=3Dmakedev(58, 4=
), ...}) =3D 0
stat64("/dev/bender/home", {st_mode=3DS_IFBLK|0660, st_rdev=3Dmakedev(58, 1=
), ...}) =3D 0
stat64("/dev/bender/test", {st_mode=3DS_IFBLK|0660, st_rdev=3Dmakedev(58, 4=
), ...}) =3D 0
stat64("/home", {st_mode=3DS_IFDIR|0755, st_size=3D4096, ...}) =3D 0
stat64("/dev/bender/test", {st_mode=3DS_IFBLK|0660, st_rdev=3Dmakedev(58, 4=
), ...}) =3D 0
stat64("/dev/bender/usr", {st_mode=3DS_IFBLK|0660, st_rdev=3Dmakedev(58, 2)=
, ...}) =3D 0
stat64("/dev/bender/test", {st_mode=3DS_IFBLK|0660, st_rdev=3Dmakedev(58, 4=
), ...}) =3D 0
stat64("/usr", {st_mode=3DS_IFDIR|0755, st_size=3D4096, ...}) =3D 0
stat64("/dev/bender/test", {st_mode=3DS_IFBLK|0660, st_rdev=3Dmakedev(58, 4=
), ...}) =3D 0
stat64("/dev/bender/var", {st_mode=3DS_IFBLK|0660, st_rdev=3Dmakedev(58, 3)=
, ...}) =3D 0
stat64("/dev/bender/test", {st_mode=3DS_IFBLK|0660, st_rdev=3Dmakedev(58, 4=
), ...}) =3D 0
stat64("/var", {st_mode=3DS_IFDIR|0755, st_size=3D4096, ...}) =3D 0
stat64("/dev/bender/test", {st_mode=3DS_IFBLK|0660, st_rdev=3Dmakedev(58, 4=
), ...}) =3D 0
stat64("none", 0xbffff87c)              =3D -1 ENOENT (No such file or dire=
ctory)
stat64("/dev/pts", {st_mode=3DS_IFDIR|0755, st_size=3D0, ...}) =3D 0
stat64("/dev/bender/test", {st_mode=3DS_IFBLK|0660, st_rdev=3Dmakedev(58, 4=
), ...}) =3D 0
stat64("/dev/bender/test", {st_mode=3DS_IFBLK|0660, st_rdev=3Dmakedev(58, 4=
), ...}) =3D 0
stat64("/dev/bender/test", {st_mode=3DS_IFBLK|0660, st_rdev=3Dmakedev(58, 4=
), ...}) =3D 0
stat64("/dev/bender/test", {st_mode=3DS_IFBLK|0660, st_rdev=3Dmakedev(58, 4=
), ...}) =3D 0
stat64("/proc/fs/xfs/stat", {st_mode=3DS_IFREG|0444, st_size=3D0, ...}) =3D=
 0
quotactl(0x1100 /* Q_??? */|USRQUOTA, NULL, 0, {134525453, 134575872, 13456=
9064, 134575864, 134575872, 3221223932, 134530842, 134569064}) =3D -1 EFAUL=
T (Bad address)
quotactl(0x5805 /* Q_??? */|USRQUOTA, "/dev/bender/test", 0, {33060, 1, 0, =
0, 0, 0, 134479872, 0}) =3D -1 EINVAL (Invalid argument)
quotactl(Q_GETQUOTA|USRQUOTA, "/dev/bender/test", 0, {1075089596, 107513192=
0, 1075131924, 1073747802, 3221222856, 1075089406, 134571809, 3}) =3D -1 ES=
RCH (No such process)
stat64("/mnt2/aquota.user", 0xbfffe87c) =3D -1 ENOENT (No such file or dire=
ctory)
stat64("/mnt2/quota.user", {st_mode=3DS_IFREG|0600, st_size=3D0, ...}) =3D =
0
open("/mnt2/quota.user", O_RDWR)        =3D 4
flock(4, LOCK_EX)                       =3D 0
read(4, "", 8)                          =3D 0
lseek(4, 0, SEEK_SET)                   =3D 0
read(4, "", 32)                         =3D 0
flock(4, LOCK_UN)                       =3D 0
read(3, "", 4096)                       =3D 0
close(3)                                =3D 0
munmap(0x40187000, 4096)                =3D 0
write(2, "Not all specified mountpoints ar"..., 47) =3D 47
_exit(1)                                =3D ?

--=-7mddxiYJjp4IrMQu28OH--
