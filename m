Message-Id: <200201170225.g0H2P4805926@kebi.com>
From: "Sil Lee" <sillee@kebi.com>
In-Reply-To: sillee@kebi.com
MIME-Version: 1.0
Content-Type: multipart/alternative;
    boundary="kebi210.116.116.52.59231011234304284"
Subject: [linux-lvm] (no subject)
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
Date: Wed Jan 16 20:25:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

4YA_ 8^=CAv@T4O4Y.

--kebi210.116.116.52.59231011234304284
Content-type: text/plain; charset=euc-kr
Content-Transfer-Encoding: 8bit

Hi.

I Have a problem to use LVM on Sun Sparc 20...
when I  try to perform a pvcreate a segmentation fault error 
occur.

Hope that help.

Escape character is '^]'.
Debian GNU/%s 2.2 %h
User not authenticated. Using plaintext username and password
login: root
password:

lnxsun00:~# id
uid=0(root) gid=0(root) groups=0(root)

lnxsun00:~# uname -a
Linux lnxsun00 2.4.17 #3 SMP Thu Jan 17 06:52:06 KST 2002 sparc unknown

lnxsun00:~# cat /proc/version
Linux version 2.4.17 (root@lnxsun00) (gcc version 2.95.2 20000220 (Debian GNU/Linux)) #3 SMP Thu Jan 17 06:52:06 KST 2002

lnxsun00:~# cat /proc/lvm/global
LVM module LVM version 1.0.1-rc4(ish)(03/10/2001)

Total:  0 VGs  0 PVs  0 LVs (0 LVs open)
Global: 152 bytes malloced   IOP version: 10   1:58:11 active

lnxsun00:/usr/local/src#tar zxvf  lvm_1.0.1-rc4.tar.gz

lnxsun00:/usr/local/src#cd LVM/1.0.1-rc4/

lnxsun00:/usr/local/src/LVM/1.0.1-rc4#./configure;make;make install

lnxsun00:/usr/local/src/LVM/1.0.1-rc4# fdisk /dev/sdb

Command (m for help): p

Disk /dev/sdb (Sun disk label): 64 heads, 32 sectors, 8635 cylinders
Units = cylinders of 2048 * 512 bytes

   Device Flag    Start       End    Blocks   Id  System
/dev/sdb1             1      1500   1534976   8e  Linux LVM
/dev/sdb2          1501      3000   1534976   8e  Linux LVM
/dev/sdb3             0      8635   8842240    5  Whole disk
/dev/sdb4          3001      4500   1534976   8e  Linux LVM
/dev/sdb5          4501      6000   1534976   8e  Linux LVM
/dev/sdb6          6001      7500   1534976   8e  Linux LVM
/dev/sdb7          7501      8635   1161216   8e  Linux LVM

lnxsun00:/usr/local/src/LVM/1.0.1-rc4# pvcreate /dev/sdb1
Segmentation fault

lnxsun00:/usr/local/src/LVM/1.0.1-rc4# strace pvcreate /dev/sdb1
execve("/sbin/pvcreate", ["pvcreate", "/dev/sdb1"], [/* 17 vars */]) = 0
brk(0)                                  = 0x22f20
open("/etc/ld.so.preload", O_RDONLY)    = -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=12982, ...}) = 0
mmap(NULL, 12982, PROT_READ, MAP_PRIVATE, 3, 0) = 0x5001a000
close(3)                                = 0
open("/lib/liblvm-10.so.1", O_RDONLY)   = 3
fstat(3, {st_mode=S_IFREG|0555, st_size=732249, ...}) = 0
read(3, "\177ELF\1\2\1\0\0\0\0\0\0\0\0\0\0\3\0\2\0\0\0\1\0\0\214"..., 4096) = 40
96
mmap(NULL, 355880, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x5002b000
mprotect(0x5006d000, 85544, PROT_NONE)  = 0
mmap(0x5007b000, 20480, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3
, 0x40000) = 0x5007b000
mmap(0x50080000, 7720, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP
_ANONYMOUS, -1, 0) = 0x50080000
close(3)                                = 0
open("/lib/libc.so.6", O_RDONLY)        = 3
fstat(3, {st_mode=S_IFREG|0755, st_size=975672, ...}) = 0
read(3, "\177ELF\1\2\1\0\0\0\0\0\0\0\0\0\0\3\0\2\0\0\0\1\0\1\345"..., 4096) = 40
96
mmap(NULL, 1050872, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x50082000
mprotect(0x5016a000, 100600, PROT_NONE) = 0
mmap(0x50172000, 53248, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3
, 0xe0000) = 0x50172000
mmap(0x5017f000, 14584, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MA
P_ANONYMOUS, -1, 0) = 0x5017f000
close(3)                                = 0
mprotect(0x5002b000, 270336, PROT_READ|PROT_WRITE) = 0
mprotect(0x5002b000, 270336, PROT_READ|PROT_EXEC) = 0
munmap(0x5001a000, 12982)               = 0
getpid()                                = 7162
--- SIGSEGV (Segmentation fault) ---
+++ killed by SIGSEGV +++
lnxsun00:/usr/local/src/LVM/1.0.1-rc4#


====================================================
Name    : Sil Lee
Address : System Management Dept.
          LG Investment & Securities Building
          184-1, Bangei-dong, Songpa-gu, Seoul, Korea
Phone   : +82-2-2240-6808
C.P     : +82-16-720-9591
E-m@il  : sillee@iflg.com / sillee@kebi.com   

<center>Free webmail hosting service MNARA.NET<br>-- This e-mail was sent by FREE KEBI Mail at http://kebi.com/ --</center>

--kebi210.116.116.52.59231011234304284
Content-type: text/html; charset=euc-kr
Content-Transfer-Encoding: 8bit

Hi.<BR>
<BR>
I Have a problem to use LVM on Sun Sparc 20...<BR>
when I  try to perform a pvcreate a segmentation fault error <BR>
occur.<BR>
<BR>
Hope that help.<BR>
<BR>
Escape character is '^]'.<BR>
Debian GNU/%s 2.2 %h<BR>
User not authenticated. Using plaintext username and password<BR>
login: root<BR>
password:<BR>
<BR>
lnxsun00:~# id<BR>
uid=0(root) gid=0(root) groups=0(root)<BR>
<BR>
lnxsun00:~# uname -a<BR>
Linux lnxsun00 2.4.17 #3 SMP Thu Jan 17 06:52:06 KST 2002 sparc unknown<BR>
<BR>
lnxsun00:~# cat /proc/version<BR>
Linux version 2.4.17 (root@lnxsun00) (gcc version 2.95.2 20000220 (Debian GNU/Linux)) #3 SMP Thu Jan 17 06:52:06 KST 2002<BR>
<BR>
lnxsun00:~# cat /proc/lvm/global<BR>
LVM module LVM version 1.0.1-rc4(ish)(03/10/2001)<BR>
<BR>
Total:  0 VGs  0 PVs  0 LVs (0 LVs open)<BR>
Global: 152 bytes malloced   IOP version: 10   1:58:11 active<BR>
<BR>
lnxsun00:/usr/local/src#tar zxvf  lvm_1.0.1-rc4.tar.gz<BR>
<BR>
lnxsun00:/usr/local/src#cd LVM/1.0.1-rc4/<BR>
<BR>
lnxsun00:/usr/local/src/LVM/1.0.1-rc4#./configure;make;make install<BR>
<BR>
lnxsun00:/usr/local/src/LVM/1.0.1-rc4# fdisk /dev/sdb<BR>
<BR>
Command (m for help): p<BR>
<BR>
Disk /dev/sdb (Sun disk label): 64 heads, 32 sectors, 8635 cylinders<BR>
Units = cylinders of 2048 * 512 bytes<BR>
<BR>
   Device Flag    Start       End    Blocks   Id  System<BR>
/dev/sdb1             1      1500   1534976   8e  Linux LVM<BR>
/dev/sdb2          1501      3000   1534976   8e  Linux LVM<BR>
/dev/sdb3             0      8635   8842240    5  Whole disk<BR>
/dev/sdb4          3001      4500   1534976   8e  Linux LVM<BR>
/dev/sdb5          4501      6000   1534976   8e  Linux LVM<BR>
/dev/sdb6          6001      7500   1534976   8e  Linux LVM<BR>
/dev/sdb7          7501      8635   1161216   8e  Linux LVM<BR>
<BR>
lnxsun00:/usr/local/src/LVM/1.0.1-rc4# pvcreate /dev/sdb1<BR>
Segmentation fault<BR>
<BR>
lnxsun00:/usr/local/src/LVM/1.0.1-rc4# strace pvcreate /dev/sdb1<BR>
execve("/sbin/pvcreate", ["pvcreate", "/dev/sdb1"], [/* 17 vars */]) = 0<BR>
brk(0)                                  = 0x22f20<BR>
open("/etc/ld.so.preload", O_RDONLY)    = -1 ENOENT (No such file or directory)<BR>
open("/etc/ld.so.cache", O_RDONLY)      = 3<BR>
fstat(3, {st_mode=S_IFREG|0644, st_size=12982, ...}) = 0<BR>
mmap(NULL, 12982, PROT_READ, MAP_PRIVATE, 3, 0) = 0x5001a000<BR>
close(3)                                = 0<BR>
open("/lib/liblvm-10.so.1", O_RDONLY)   = 3<BR>
fstat(3, {st_mode=S_IFREG|0555, st_size=732249, ...}) = 0<BR>
read(3, "\177ELF\1\2\1\0\0\0\0\0\0\0\0\0\0\3\0\2\0\0\0\1\0\0\214"..., 4096) = 40<BR>
96<BR>
mmap(NULL, 355880, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x5002b000<BR>
mprotect(0x5006d000, 85544, PROT_NONE)  = 0<BR>
mmap(0x5007b000, 20480, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3<BR>
, 0x40000) = 0x5007b000<BR>
mmap(0x50080000, 7720, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP<BR>
_ANONYMOUS, -1, 0) = 0x50080000<BR>
close(3)                                = 0<BR>
open("/lib/libc.so.6", O_RDONLY)        = 3<BR>
fstat(3, {st_mode=S_IFREG|0755, st_size=975672, ...}) = 0<BR>
read(3, "\177ELF\1\2\1\0\0\0\0\0\0\0\0\0\0\3\0\2\0\0\0\1\0\1\345"..., 4096) = 40<BR>
96<BR>
mmap(NULL, 1050872, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x50082000<BR>
mprotect(0x5016a000, 100600, PROT_NONE) = 0<BR>
mmap(0x50172000, 53248, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3<BR>
, 0xe0000) = 0x50172000<BR>
mmap(0x5017f000, 14584, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MA<BR>
P_ANONYMOUS, -1, 0) = 0x5017f000<BR>
close(3)                                = 0<BR>
mprotect(0x5002b000, 270336, PROT_READ|PROT_WRITE) = 0<BR>
mprotect(0x5002b000, 270336, PROT_READ|PROT_EXEC) = 0<BR>
munmap(0x5001a000, 12982)               = 0<BR>
getpid()                                = 7162<BR>
--- SIGSEGV (Segmentation fault) ---<BR>
+++ killed by SIGSEGV +++<BR>
lnxsun00:/usr/local/src/LVM/1.0.1-rc4#<BR>
<BR>
<PRE><font size=2 color=7080aa>
====================================================
Name    : Sil Lee
Address : System Management Dept.
          LG Investment & Securities Building
          184-1, Bangei-dong, Songpa-gu, Seoul, Korea
Phone   : +82-2-2240-6808
C.P     : +82-16-720-9591
E-m@il  : sillee@iflg.com / sillee@kebi.com   
</font></PRE>
<A HREF=http://www.kebi.lycos.co.kr><IMG SRC=http://www.kebi.lycos.co.kr//k/logo/linux-lvm@sistina.com/sillee.59231011234304336 BORDER=0></A>&nbsp;
<center>Free webmail hosting service MNARA.NET<br>-- This e-mail was sent by FREE KEBI Mail at http://kebi.com/ --</center>

--kebi210.116.116.52.59231011234304284--
