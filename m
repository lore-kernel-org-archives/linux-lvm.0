From: Juhapekka Tolvanen <juhtolv@st.jyu.fi>
Message-ID: <20020617014818.A11995@verso.st.jyu.fi>
References: <20020614223602.A20065@verso.st.jyu.fi> <20020615090126.GA1173@tykepenguin.com> <20020615134314.A8160@verso.st.jyu.fi> <20020615110941.GA1663@tykepenguin.com> <20020615141843.A9586@verso.st.jyu.fi> <20020615114712.GA1794@tykepenguin.com> <20020615150026.A10954@verso.st.jyu.fi> <20020615122045.GA1926@tykepenguin.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020615122045.GA1926@tykepenguin.com>; from patrick@debian.org on Sat, Jun 15, 2002 at 01:20:45PM +0100
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Re: Bug#150005: LVM does not fscking work at all
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
Date: Sun Jun 16 17:48:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: Patrick Caulfield <patrick@debian.org>, 150005@bugs.debian.org
Cc: Linux-LVM@sistina.com, marcelo@conectiva.com.br, Alan.Cox@linux.org

On Sat, 15 Jun 2002, +15:20:46 EEST (UTC +0300),
Patrick Caulfield <patrick@debian.org> pressed some keys:

> On Sat, Jun 15, 2002 at 03:00:26PM +0300, Juhapekka Tolvanen wrote:

> > Maybe I should create a brand new .config with a little help from tho=
se
> > aforementioned screenshots. And after that I should always use that
> > "make oldconfig".

> That might be a good thing to do. Make sure you do a "make mrproper"
> first to really clean out the source tree.

> copying a .config and doing "make oldconfig" is what I do most of the
> time but sometimes you do need to do mrproper.

It still does not fscking work! I did this:

I took fresh sources of kernel 2.4.18 and unpacked them. Then I
installed these patches:

patch-2.4.19-pre10
patch-2.4.19-pre10-ac2
preempt-kernel-rml-2.4.19-pre10-ac2-1.patch

Then I did "make mrproper". Then I edited Makefile so that compilation
used gcc-3.0. I also set install path to /boot.

I did NOT copy some old .config to /usr/src/linux . I used some old
screenshots of configuration of older kernel, instead.

After compilation and installation I booted a new kernel. Here is what I
found then:

-=3D*[ROOT ZSH]*=3D- root@heresy:/usr/src # fdisk -l
/dev/scsi/host0/bus0/target0/lun0/disc

Disk /dev/scsi/host0/bus0/target0/lun0/disc: 255 heads, 63 sectors, 2231
cylinders
Units =3D cylinders of 16065 * 512 bytes

                                 Device Boot    Start       End
Blocks   Id  System
/dev/scsi/host0/bus0/target0/lun0/part1   *         1        26208813+  8=
3  Linux
/dev/scsi/host0/bus0/target0/lun0/part2            27        77409657+  8=
2  Linux swap
/dev/scsi/host0/bus0/target0/lun0/part3            78       2051028160   =
8e  Linux LVM
/dev/scsi/host0/bus0/target0/lun0/part4           206      223116273845  =
  5  Extended
/dev/scsi/host0/bus0/target0/lun0/part5           206       3331028128+  =
8e  Linux LVM
/dev/scsi/host0/bus0/target0/lun0/part6           334       4611028128+  =
8e  Linux LVM
(Clip)


-=3D*[ROOT ZSH]*=3D- root@heresy:/root # uname -a
Linux heresy 2.4.19-pre10-ac2-rml1 #2 Mon Jun 17 00:57:35 EEST 2002 i586
unknown
-=3D*[ROOT ZSH]*=3D- root@heresy:/root # ls /proc/devices=20
/proc/devices
-=3D*[ROOT ZSH]*=3D- root@heresy:/root # ls
apu@       bin/          elisp/       softaa@  uptime.txt
audio.sh*  dopefish.txt  install.txt  tmp/     viritys@
-=3D*[ROOT ZSH]*=3D- root@heresy:/root # cat /proc/devices=20
Character devices:
162 raw

Block devices:
  1 ramdisk
-=3D*[ROOT ZSH]*=3D- root@heresy:/root #  =20
-=3D*[ROOT ZSH]*=3D- root@heresy:/root # =20
-=3D*[ROOT ZSH]*=3D- root@heresy:/root # uname -a
Linux heresy 2.4.19-pre10-ac2-rml1 #2 Mon Jun 17 00:57:35 EEST 2002 i586
unknown
-=3D*[ROOT ZSH]*=3D- root@heresy:/root # dmesg | grep LVM
LVM version 1.0.3(19/02/2002)
-=3D*[ROOT ZSH]*=3D- root@heresy:/root # dmesg | grep gcc
Linux version 2.4.19-pre10-ac2-rml1 (root@heresy) (gcc version 3.0.4) #2
Mon Jun 17 00:57:35 EEST 2002
-=3D*[ROOT ZSH]*=3D- root@heresy:/root # tree /proc/lvm/
/proc/lvm/
|-- VGs
`-- global

1 directory, 1 file
-=3D*[ROOT ZSH]*=3D- root@heresy:/root # cat /proc/lvm/global
LVM driver LVM version 1.0.3(19/02/2002)

Total:  0 VGs  0 PVs  0 LVs (0 LVs open)
Global: 143 bytes malloced   IOP version: 10   3:11:51 active
-=3D*[ROOT ZSH]*=3D- root@heresy:/root # cat /proc/devices=20
Character devices:
162 raw

Block devices:
  1 ramdisk
-=3D*[ROOT ZSH]*=3D- root@heresy:/root # pvcreate --version
pvcreate: Logical Volume Manager 1.0.4
Heinz Mauelshagen, Sistina Software  02/05/2002 (IOP 10)
-=3D*[ROOT ZSH]*=3D- root@heresy:/root # pvcreate -f -d -v
/dev/scsi/host0/bus0/target0/lun0/part3
<1> lvm_get_iop_version -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_get_iop_version -- AFTER ioctl ret: -102
<1> lvm_get_iop_version -- LEAVING with ret: -102
pvcreate -- LVM driver/module not loaded?

zsh: 1446 exit 95    pvcreate -f -d -v /dev/scsi/host0/bus0/target0/lun0/=
part3
-=3D*[ROOT ZSH]*=3D- root@heresy:/root # ls -la /dev/lvm
crw-r-----    1 root     root     109,   0 Jun 17  2002 /dev/lvm
-=3D*[ROOT ZSH]*=3D- root@heresy:/root # file /dev/lvm =20
/dev/lvm: character special (109/0)

And now something completely different:

strace -o /tmp/lvm.err.log pvcreate -f -d -v /dev/scsi/host0/bus0/target0=
/lun0/part3


execve("/sbin/pvcreate", ["pvcreate", "-f", "-d", "-v", "/dev/scsi/host0/=
bus0/target0/lun0/part3"], [/* 71 vars */]) =3D 0
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
scsi/host0/bus0/target0/lun"...], [/* 71 vars */]) =3D 0
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

This is really really weird! What should I do? Shall I post you that
latest .config ?

Just in case want to know, here are specs of that hard drive:

IBM Ultrastar 73LZX (IC35L018UWD210-0). Ultra160 SCSI-standardized. 18 gi=
gabytes. 10000 RPM.

http://www.storage.ibm.com/hdd/ultra/ul73lzx.htm

And here is information about my computer:

http://www.cc.jyu.fi/~juhtolv/eng/tietokone.eng.html


--=20
Juhapekka "naula" Tolvanen * * http://www.st.jyu.fi/~juhtolv/
"Pettymyst=E4 kahmalolla, on ammennettu sovinnolla ja laarit
vastoink=E4ymisien eiv=E4t ehdy aivan hetimmiten. Vaan kun multaa
suussa maistuu, on katkeruus j=E4=E4nyt taa."             Viikate
