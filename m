From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] (no subject)
Message-Id: <20020117124645.C25970@sistina.com>
References: <200201170225.g0H2P4805926@kebi.com>
MIME-Version: 1.0
In-Reply-To: <200201170225.g0H2P4805926@kebi.com>; from sillee@kebi.com on
    Thu, Jan 17, 2002 at 11:25:04AM +0900
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
Date: Thu Jan 17 05:51:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

The strace output doesn't help to analyze this, because it directly
segfaults after getting the PID.

Please send me the output of "pvcreate -d /dev/sdb1" directly (mge@sistina.com)

Regards,
Heinz    -- The LVM Guy --


On Thu, Jan 17, 2002 at 11:25:04AM +0900, Sil Lee wrote:
> Hi.
> 
> I Have a problem to use LVM on Sun Sparc 20...
> when I  try to perform a pvcreate a segmentation fault error 
> occur.
> 
> Hope that help.
> 
> Escape character is '^]'.
> Debian GNU/%s 2.2 %h
> User not authenticated. Using plaintext username and password
> login: root
> password:
> 
> lnxsun00:~# id
> uid=0(root) gid=0(root) groups=0(root)
> 
> lnxsun00:~# uname -a
> Linux lnxsun00 2.4.17 #3 SMP Thu Jan 17 06:52:06 KST 2002 sparc unknown
> 
> lnxsun00:~# cat /proc/version
> Linux version 2.4.17 (root@lnxsun00) (gcc version 2.95.2 20000220 (Debian GNU/Linux)) #3 SMP Thu Jan 17 06:52:06 KST 2002
> 
> lnxsun00:~# cat /proc/lvm/global
> LVM module LVM version 1.0.1-rc4(ish)(03/10/2001)
> 
> Total:  0 VGs  0 PVs  0 LVs (0 LVs open)
> Global: 152 bytes malloced   IOP version: 10   1:58:11 active
> 
> lnxsun00:/usr/local/src#tar zxvf  lvm_1.0.1-rc4.tar.gz
> 
> lnxsun00:/usr/local/src#cd LVM/1.0.1-rc4/
> 
> lnxsun00:/usr/local/src/LVM/1.0.1-rc4#./configure;make;make install
> 
> lnxsun00:/usr/local/src/LVM/1.0.1-rc4# fdisk /dev/sdb
> 
> Command (m for help): p
> 
> Disk /dev/sdb (Sun disk label): 64 heads, 32 sectors, 8635 cylinders
> Units = cylinders of 2048 * 512 bytes
> 
>    Device Flag    Start       End    Blocks   Id  System
> /dev/sdb1             1      1500   1534976   8e  Linux LVM
> /dev/sdb2          1501      3000   1534976   8e  Linux LVM
> /dev/sdb3             0      8635   8842240    5  Whole disk
> /dev/sdb4          3001      4500   1534976   8e  Linux LVM
> /dev/sdb5          4501      6000   1534976   8e  Linux LVM
> /dev/sdb6          6001      7500   1534976   8e  Linux LVM
> /dev/sdb7          7501      8635   1161216   8e  Linux LVM
> 
> lnxsun00:/usr/local/src/LVM/1.0.1-rc4# pvcreate /dev/sdb1
> Segmentation fault
> 
> lnxsun00:/usr/local/src/LVM/1.0.1-rc4# strace pvcreate /dev/sdb1
> execve("/sbin/pvcreate", ["pvcreate", "/dev/sdb1"], [/* 17 vars */]) = 0
> brk(0)                                  = 0x22f20
> open("/etc/ld.so.preload", O_RDONLY)    = -1 ENOENT (No such file or directory)
> open("/etc/ld.so.cache", O_RDONLY)      = 3
> fstat(3, {st_mode=S_IFREG|0644, st_size=12982, ...}) = 0
> mmap(NULL, 12982, PROT_READ, MAP_PRIVATE, 3, 0) = 0x5001a000
> close(3)                                = 0
> open("/lib/liblvm-10.so.1", O_RDONLY)   = 3
> fstat(3, {st_mode=S_IFREG|0555, st_size=732249, ...}) = 0
> read(3, "\177ELF\1\2\1\0\0\0\0\0\0\0\0\0\0\3\0\2\0\0\0\1\0\0\214"..., 4096) = 40
> 96
> mmap(NULL, 355880, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x5002b000
> mprotect(0x5006d000, 85544, PROT_NONE)  = 0
> mmap(0x5007b000, 20480, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3
> , 0x40000) = 0x5007b000
> mmap(0x50080000, 7720, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP
> _ANONYMOUS, -1, 0) = 0x50080000
> close(3)                                = 0
> open("/lib/libc.so.6", O_RDONLY)        = 3
> fstat(3, {st_mode=S_IFREG|0755, st_size=975672, ...}) = 0
> read(3, "\177ELF\1\2\1\0\0\0\0\0\0\0\0\0\0\3\0\2\0\0\0\1\0\1\345"..., 4096) = 40
> 96
> mmap(NULL, 1050872, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x50082000
> mprotect(0x5016a000, 100600, PROT_NONE) = 0
> mmap(0x50172000, 53248, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3
> , 0xe0000) = 0x50172000
> mmap(0x5017f000, 14584, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MA
> P_ANONYMOUS, -1, 0) = 0x5017f000
> close(3)                                = 0
> mprotect(0x5002b000, 270336, PROT_READ|PROT_WRITE) = 0
> mprotect(0x5002b000, 270336, PROT_READ|PROT_EXEC) = 0
> munmap(0x5001a000, 12982)               = 0
> getpid()                                = 7162
> --- SIGSEGV (Segmentation fault) ---
> +++ killed by SIGSEGV +++
> lnxsun00:/usr/local/src/LVM/1.0.1-rc4#
> 
> 
> ====================================================
> Name    : Sil Lee
> Address : System Management Dept.
>           LG Investment & Securities Building
>           184-1, Bangei-dong, Songpa-gu, Seoul, Korea
> Phone   : +82-2-2240-6808
> C.P     : +82-16-720-9591
> E-m@il  : sillee@iflg.com / sillee@kebi.com   
> 
> <center>Free webmail hosting service MNARA.NET<br>-- This e-mail was sent by FREE KEBI Mail at http://kebi.com/ --</center>

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
