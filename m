From: Juhapekka Tolvanen <juhtolv@st.jyu.fi>
Message-ID: <20020613002104.A18315@verso.st.jyu.fi>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] My LVM does not work at all.
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
Date: Wed Jun 12 16:21:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: Linux-LVM@sistina.com, rvdm@debian.org, patrick@debian.org, marcelo@conectiva.com.br

LVM does not work at all. I have tried LVM as a modules and as compiled i=
n
driver. All in vain. I started last sunday or monday with 2.4.19-pre10 wi=
th and
without Alan Cox patch number 2 and with and without preemptible patch by=
 Robert
Love. Now, few days later I am totally frustrated and mad.

My latest attempts was this:

- Kernel 2.4.18
- Patches from LVM sources version 1.0.4

I use Debian GNU/Linux 3.0 Woody on a x86. I also use devfs and devfsd.
Versions of LVM-tools is this:

Desired=3DUnknown/Install/Remove/Purge/Hold
| Status=3DNot/Installed/Config-files/Unpacked/Failed-config/Half-install=
ed
|/ Err?=3D(none)/Hold/Reinst-required/X=3Dboth-problems (Status,Err: uppe=
rcase=3Dbad)
||/ Name           Version   Description
+++-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
ii  lvm-common     1.5.5     The Logical Volume Manager for Linux (common=
 files)
ii  lvm10          1.0.4-4   The Logical Volume Manager for Linux


And now: Let the show begin:

-=3D*[ROOT ZSH]*=3D- root@heresy:/root # uname -a
Linux heresy 2.4.18-LVM-1.0.4 #2 Wed Jun 12 21:16:17 EEST 2002 i586 unkno=
wn
-=3D*[ROOT ZSH]*=3D- root@heresy:/root # dmesg | grep LVM
Linux version 2.4.18-LVM-1.0.4 (root@heresy) (gcc version 3.0.4) #2 Wed J=
un 12 21:16:17 EEST 2002
LVM version 1.0.4(02/05/2002)
-=3D*[ROOT ZSH]*=3D- root@heresy:/root # tree /proc/lvm/
/proc/lvm/
|-- VGs
`-- global


1 directory, 1 file
-=3D*[ROOT ZSH]*=3D- root@heresy:/root # cat /proc/lvm/global=20
LVM driver LVM version 1.0.4(02/05/2002)

Total:  0 VGs  0 PVs  0 LVs (0 LVs open)
Global: 143 bytes malloced   IOP version: 10   5:47:14 active
-=3D*[ROOT ZSH]*=3D- root@heresy:/root # pvcreate --version
pvcreate: Logical Volume Manager 1.0.4
Heinz Mauelshagen, Sistina Software  02/05/2002 (IOP 10)
-=3D*[ROOT ZSH]*=3D- root@heresy:/root # pvcreate -d -v /dev/scsi/host0/b=
us0/target0/lun0/part3
<1> lvm_get_iop_version -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_get_iop_version -- AFTER ioctl ret: -102
<1> lvm_get_iop_version -- LEAVING with ret: -102
pvcreate -- LVM driver/module not loaded?

zsh: 5602 exit 95    pvcreate -d -v /dev/scsi/host0/bus0/target0/lun0/par=
t3
-=3D*[ROOT ZSH]*=3D- root@heresy:/root # pvcreate -f -d -v /dev/scsi/host=
0/bus0/target0/lun0/part3
<1> lvm_get_iop_version -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_get_iop_version -- AFTER ioctl ret: -102
<1> lvm_get_iop_version -- LEAVING with ret: -102
pvcreate -- LVM driver/module not loaded?

zsh: 5606 exit 95    pvcreate -f -d -v /dev/scsi/host0/bus0/target0/lun0/=
part3
-=3D*[ROOT ZSH]*=3D- root@heresy:/root # ls -la /dev/lvm
crw-r-----    1 root     root     109,   0 Jun 13  2002 /dev/lvm
-=3D*[ROOT ZSH]*=3D- root@heresy:/root # file /dev/lvm
/dev/lvm: character special (109/0)

And now something completely different:

strace -o /tmp/lvm.err.2.log pvcreate -f -d -v /dev/scsi/host0/bus0/targe=
t0/lun0/part3

execve("/sbin/pvcreate", ["pvcreate", "-f", "-d", "-v", "/dev/scsi/host0/=
bus0/target0/lun0/part3"], [/* 78 vars */]) =3D 0
uname({sys=3D"Linux", node=3D"heresy", ...}) =3D 0
brk(0)                                  =3D 0x8049bf4
open("/etc/ld.so.preload", O_RDONLY)    =3D -1 ENOENT (No such file or di=
rectory)
open("/etc/ld.so.cache", O_RDONLY)      =3D 3
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D60644, ...}) =3D 0
old_mmap(NULL, 60644, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0x40014000
close(3)                                =3D 0
open("/lib/libc.so.6", O_RDONLY)        =3D 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\30\222"..., 1024=
) =3D 1024
fstat64(3, {st_mode=3DS_IFREG|0755, st_size=3D1153784, ...}) =3D 0
old_mmap(NULL, 1166560, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) =3D 0x400=
23000
mprotect(0x40136000, 40160, PROT_NONE)  =3D 0
old_mmap(0x40136000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, =
3, 0x113000) =3D 0x40136000
old_mmap(0x4013c000, 15584, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|M=
AP_ANONYMOUS, -1, 0) =3D 0x4013c000
close(3)                                =3D 0
munmap(0x40014000, 60644)               =3D 0
stat64("/dev/lvm", {st_mode=3DS_IFCHR|0640, st_rdev=3Dmakedev(109, 0), ..=
.}) =3D 0
open("/dev/lvm", O_RDONLY)              =3D -1 ENOSYS (Function not imple=
mented)
open("/dev/lvm", O_RDONLY)              =3D -1 ENOSYS (Function not imple=
mented)
open("/dev/lvm", O_RDONLY)              =3D -1 ENODEV (No such device)
stat64("/lib/lvm-default/pvcreate", {st_mode=3DS_IFREG|0755, st_size=3D13=
036, ...}) =3D 0
execve("/lib/lvm-default/pvcreate", ["pvcreate", "-f", "-d", "-v", "/dev/=
scsi/host0/bus0/target0/lun"...], [/* 78 vars */]) =3D 0
uname({sys=3D"Linux", node=3D"heresy", ...}) =3D 0
brk(0)                                  =3D 0x804becc
open("/etc/ld.so.preload", O_RDONLY)    =3D -1 ENOENT (No such file or di=
rectory)
open("/etc/ld.so.cache", O_RDONLY)      =3D 3
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D60644, ...}) =3D 0
old_mmap(NULL, 60644, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0x40014000
close(3)                                =3D 0
open("/lib/liblvm-10.so.1", O_RDONLY)   =3D 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\0T\0\000"..., 10=
24) =3D 1024
fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D219908, ...}) =3D 0
old_mmap(NULL, 235008, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) =3D 0x4002=
3000
mprotect(0x40058000, 17920, PROT_NONE)  =3D 0
old_mmap(0x40058000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3=
, 0x34000) =3D 0x40058000
old_mmap(0x4005a000, 9728, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MA=
P_ANONYMOUS, -1, 0) =3D 0x4005a000
close(3)                                =3D 0
open("/lib/libc.so.6", O_RDONLY)        =3D 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\30\222"..., 1024=
) =3D 1024
fstat64(3, {st_mode=3DS_IFREG|0755, st_size=3D1153784, ...}) =3D 0
old_mmap(NULL, 1166560, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) =3D 0x400=
5d000
mprotect(0x40170000, 40160, PROT_NONE)  =3D 0
old_mmap(0x40170000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, =
3, 0x113000) =3D 0x40170000
old_mmap(0x40176000, 15584, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|M=
AP_ANONYMOUS, -1, 0) =3D 0x40176000
close(3)                                =3D 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,=
 0) =3D 0x4017a000
munmap(0x40014000, 60644)               =3D 0
open("/etc/lvmtab", O_RDONLY)           =3D 3
close(3)                                =3D 0
open("/etc/lvmtab.d", O_RDONLY)         =3D 3
close(3)                                =3D 0
open("/dev/lvm", O_RDONLY)              =3D -1 ENOSYS (Function not imple=
mented)
open("/dev/lvm", O_RDONLY)              =3D -1 ENOSYS (Function not imple=
mented)
open("/dev/lvm", O_RDONLY)              =3D -1 ENODEV (No such device)
open("/etc/lvmtab", O_RDONLY)           =3D 3
fstat64(3, {st_mode=3DS_IFREG|0640, st_size=3D1, ...}) =3D 0
brk(0)                                  =3D 0x804becc
brk(0x804beec)                          =3D 0x804beec
brk(0x804c000)                          =3D 0x804c000
read(3, "\0", 1)                        =3D 1
close(3)                                =3D 0
write(2, "<1> lvm_get_iop_version -- CALLE"..., 34) =3D 34
write(2, "<22> lvm_check_special -- CALLED"..., 33) =3D 33
stat64("/dev/lvm", {st_mode=3DS_IFCHR|0640, st_rdev=3Dmakedev(109, 0), ..=
.}) =3D 0
write(2, "<22> lvm_check_special -- LEAVIN"..., 34) =3D 34
open("/dev/lvm", O_RDONLY)              =3D -1 ENOSYS (Function not imple=
mented)
open("/dev/lvm", O_RDONLY)              =3D -1 ENOSYS (Function not imple=
mented)
open("/dev/lvm", O_RDONLY)              =3D -1 ENODEV (No such device)
write(2, "<1> lvm_get_iop_version -- AFTER"..., 49) =3D 49
write(2, "<1> lvm_get_iop_version -- LEAVI"..., 50) =3D 50
write(2, "pvcreate -- LVM driver/module no"..., 43) =3D 43
_exit(95)                               =3D ?




--=20
Juhapekka "naula" Tolvanen * * http://www.st.jyu.fi/~juhtolv/
"Pettymyst=E4 kahmalolla, on ammennettu sovinnolla ja laarit
vastoink=E4ymisien eiv=E4t ehdy aivan hetimmiten. Vaan kun multaa
suussa maistuu, on katkeruus j=E4=E4nyt taa."             Viikate
