Subject: Re: [linux-lvm] ext2resize error
Message-ID: <OF4C7BCDD3.EAA70700-ON86256C0E.004A63CB@TEXASMUTUAL.COM>
From: "Jonathan S. Polacheck" <JPolache@texasmutual.com>
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
Date: Wed Aug  7 08:33:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

resize2fs did the trick.  Here is the additional system information;

ext2resize -v -d;
ext2_resize_fs
ext2_shrink_fs
Your filesystem is too occupied to resize it to 160000
blocks. Sorry.
direct hits: 0, indirect hits: 0, misses: 0

strace ext2resize;
ext2resize v1.1.14 - 1999/08/28 for EXT2FS 0.5b
execve("/lvm/ext2resize", ["/lvm/ext2resize", "/dev/sys/usr"], [/* 17 vars
*/]) = 0
uname({sys="Linux", node="netman3", ...}) = 0
brk(0)                                  = 0x8052ab8
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x40016000
open("/etc/ld.so.preload", O_RDONLY)    = -1 ENOENT (No such file or
directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=62598, ...}) = 0
old_mmap(NULL, 62598, PROT_READ, MAP_PRIVATE, 3, 0) = 0x40017000
close(3)                                = 0
open("/lib/libc.so.6", O_RDONLY)        = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\260\306"..., 1024)
= 1024
fstat64(3, {st_mode=S_IFREG|0755, st_size=1285480, ...}) = 0
old_mmap(NULL, 1301800, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) =
0x40027000
mprotect(0x4015c000, 36136, PROT_NONE)  = 0
old_mmap(0x4015c000, 20480, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED, 3,
0x134000) = 0x4015c000
old_mmap(0x40161000, 15656, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40161000
close(3)                                = 0
munmap(0x40017000, 62598)               = 0
fstat64(1, {st_mode=S_IFCHR|0600, st_rdev=makedev(5, 1), ...}) = 0
ioctl(1, 0x5401, {B38400 opost isig icanon echo ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x40017000
write(1, "ext2resize v1.1.14 - 1999/08/28 "..., 48) = 48
brk(0)                                  = 0x8052ab8
brk(0x8052ad8)                          = 0x8052ad8
brk(0x8053000)                          = 0x8053000
open("/dev/sys/usr", O_RDONLY)          = 3
open("/dev/sys/usr", O_WRONLY)          = 4
brk(0x805c000)                          = 0x805c000
_llseek(3, 1024, [1024], SEEK_SET)      = 0
read(3, "\0\350\3\0\0\320\7\0\0d\0\0B\301\0\0\305\1\2\0\0\0\0\0"..., 1024)
= 1024
brk(0x805d000)                          = 0x805d000
old_mmap(NULL, 528384, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x40165000
_llseek(3, 4096, [4096], SEEK_SET)      = 0
read(3, "\2\0\0\0\3\0\0\0\4\0\0\0\323\21\33 ;\2\0\0\0\0\0\0\0\0"..., 4096)
= 4096
ioctl(3, 0x1260, 0xbffffd18)            = 0
old_mmap(NULL, 4198400, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS,
-1, 0) = 0x401e6000
write(2, "Your filesystem is too occupied "..., 55Your filesystem is too
occupied to resize it to 160000
) = 55
write(2, "blocks. Sorry.\n", 15blocks. Sorry.
)        = 15
munmap(0x401e6000, 4198400)             = 0
fdatasync(4)                            = 0
munmap(0x40165000, 528384)              = 0
fdatasync(4)                            = 0
close(3)                                = 0
close(4)                                = 0
munmap(0x40017000, 4096)                = 0
_exit(0)                                = ?

/proc/partitions
major minor  #blocks  name     rio rmerge rsect ruse wio wmerge wsect wuse
running use aveq

  58     0    2560000 lvma 0 0 0 0 0 0 0 0 0 0 0
  58     1     155648 lvmb 0 0 0 0 0 0 0 0 0 0 0
  58     2      20480 lvmc 0 0 0 0 0 0 0 0 0 0 0
  58     3      53248 lvmd 0 0 0 0 0 0 0 0 0 0 0
  58     4     471040 lvme 0 0 0 0 0 0 0 0 0 0 0
  58     5    1048576 lvmf 0 0 0 0 0 0 0 0 0 0 0
   3     0   19551168 ide/host0/bus0/target0/lun0/disc 31762 48151 375856
271600 195205 98603 2015628 30848380 0 646720 31121890
   3     1      16033 ide/host0/bus0/target0/lun0/part1 30 419 898 280 22
21 86 3670 0 1820 3950
   3     2     257040 ide/host0/bus0/target0/lun0/part2 4 11 120 50 27 256
2264 1030 0 340 1080
   3     3     152617 ide/host0/bus0/target0/lun0/part3 2607 10167 25548
18010 8039 11978 40082 1093780 0 472170 1111790
   3     4   19125382 ide/host0/bus0/target0/lun0/part4 29119 37554 349286
253250 187117 86348 1973196 29749900 0 637410 30005060


                                                                                                              
                    Andreas Dilger                                                                            
                    <adilger@clust       To:     "Jonathan S. Polacheck" <JPolache@texasmutual.com>           
                    erfs.com>            cc:     linux-lvm@sistina.com                                        
                                         Subject:     Re: [linux-lvm] ext2resize error                        
                    08/06/2002                                                                                
                    04:25 PM                                                                                  
                                                                                                              
                                                                                                              




On Aug 06, 2002  15:54 -0500, Jonathan S. Polacheck wrote:
> I have a Mandrake Linux 8.1 system with a 2.4.8 kernel.  My logical
volumes
> include /usr, /var and /home (not / or /boot).  I originally set up all
> lv(s) as ext3, which seemed to preclude the ext2_online patch.  My
> /dev/sys/usr lv shows 2.44 gig in lvdisplay.  My one PV shows 3616 free
> PEs.  df shows /usr to be 2,015,824 (k) and 96% utilized.  I run telinit
1
> then umount -a.  /usr unmounts.  I then run ext2resize /dev/sys/usr.  It
> returns "Your filesystem is too occupied to resize it to 16000 bytes."

Can you run "ext2resize -v -d /dev/sys/usr" and send me the output?  If
that doesn't produce anything useful, you may also need to run
"strace ext2resize /dev/sys/user" as well.  What does /proc/partitions
say about /dev/sys/usr?

Cheers, Andreas
--
Andreas Dilger
http://www-mddsp.enel.ucalgary.ca/People/adilger/
http://sourceforge.net/projects/ext2resize/
