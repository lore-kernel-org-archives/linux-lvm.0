Message-ID: <3862AB76.1FA60D3A@osp.nl>
Date: Fri, 24 Dec 1999 00:08:38 +0100
From: Jos Visser <josv@osp.nl>
MIME-Version: 1.0
Subject: [linux-lvm] Problems compiling client utilities
Content-Type: multipart/mixed;
 boundary="------------B2D984B6B7820A3DD2D04815"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com

This is a multi-part message in MIME format.
--------------B2D984B6B7820A3DD2D04815
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

On the risk of being flamed as a complete newbie: I can't get the client
utilities of LVM (0.7 and/or 0.8i) compiled. I patched and compiled the
kernel, rebooted, and then tried to compile the client utilities, but
unfortunately I get a who bunch of warnings and a few errors (see
attachment).

The system is SuSE 6.1 with kernel 2.2.13 (and devfs patch applied).

The problem seems to be that liblvm.h includes a whole bunch of files
from both the sys/ and the linux/ directory: e.g. sys/types.h and
linux/types.h (either directly, or indirectly through inclusion of
linux/genhd.h). I have been fighting with this problem for a day or so
and I can't get it fixed, every time I fix one problem (e.g. adding -D
_LOOSE_KERNEL_NAMES to the make.tmpl) I introduce another.

What am I doing wrong?

++Jos



-- 
"If anyone wants to be first, he must be the very last, and the servant
of all"
--------------B2D984B6B7820A3DD2D04815
Content-Type: text/plain; charset=us-ascii;
 name="make.out"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="make.out"

josv@jadzia:~/src/LVM/0.8-pre02.10.1999 > make
make[1]: Entering directory `/home/josv/src/LVM/0.8-pre02.10.1999/tools'
make[2]: Entering directory `/home/josv/src/LVM/0.8-pre02.10.1999/tools/lib'
make[3]: Entering directory `/home/josv/src/LVM/0.8-pre02.10.1999/tools/lib'
cc -c -pipe -Wall -I/home/josv/src/LVM/0.8-pre02.10.1999/tools -I/home/josv/src/LVM/0.8-pre02.10.1999/tools/lib -I/home/josv/src/LVM/0.8-pre02.10.1999/kernel -D__KERNEL__ -O2 -DDEBUG -o basename.o basename.c
In file included from /usr/include/linux/fs.h:20,
                 from /usr/include/linux/devfs_fs_kernel.h:4,
                 from /usr/include/linux/genhd.h:14,
                 from /home/josv/src/LVM/0.8-pre02.10.1999/tools/lib/liblvm.h:103,
                 from basename.c:26:
/usr/include/linux/stat.h:12: warning: `S_IFMT' redefined
/usr/include/sys/stat.h:35: warning: this is the location of the previous definition
/usr/include/linux/stat.h:13: warning: `S_IFSOCK' redefined
/usr/include/sys/stat.h:44: warning: this is the location of the previous definition
/usr/include/linux/stat.h:14: warning: `S_IFLNK' redefined
/usr/include/sys/stat.h:41: warning: this is the location of the previous definition
/usr/include/linux/stat.h:15: warning: `S_IFREG' redefined
/usr/include/sys/stat.h:39: warning: this is the location of the previous definition
/usr/include/linux/stat.h:16: warning: `S_IFBLK' redefined
/usr/include/sys/stat.h:38: warning: this is the location of the previous definition
/usr/include/linux/stat.h:17: warning: `S_IFDIR' redefined
/usr/include/sys/stat.h:36: warning: this is the location of the previous definition
/usr/include/linux/stat.h:18: warning: `S_IFCHR' redefined
/usr/include/sys/stat.h:37: warning: this is the location of the previous definition
/usr/include/linux/stat.h:19: warning: `S_IFIFO' redefined
/usr/include/sys/stat.h:47: warning: this is the location of the previous definition
/usr/include/linux/stat.h:20: warning: `S_ISUID' redefined
/usr/include/sys/stat.h:75: warning: this is the location of the previous definition
/usr/include/linux/stat.h:21: warning: `S_ISGID' redefined
/usr/include/sys/stat.h:76: warning: this is the location of the previous definition
/usr/include/linux/stat.h:22: warning: `S_ISVTX' redefined
/usr/include/sys/stat.h:80: warning: this is the location of the previous definition
/usr/include/linux/stat.h:24: warning: `S_ISLNK' redefined
/usr/include/sys/stat.h:65: warning: this is the location of the previous definition
/usr/include/linux/stat.h:25: warning: `S_ISREG' redefined
/usr/include/sys/stat.h:58: warning: this is the location of the previous definition
/usr/include/linux/stat.h:26: warning: `S_ISDIR' redefined
/usr/include/sys/stat.h:55: warning: this is the location of the previous definition
/usr/include/linux/stat.h:27: warning: `S_ISCHR' redefined
/usr/include/sys/stat.h:56: warning: this is the location of the previous definition
/usr/include/linux/stat.h:28: warning: `S_ISBLK' redefined
/usr/include/sys/stat.h:57: warning: this is the location of the previous definition
/usr/include/linux/stat.h:29: warning: `S_ISFIFO' redefined
/usr/include/sys/stat.h:60: warning: this is the location of the previous definition
/usr/include/linux/stat.h:30: warning: `S_ISSOCK' redefined
/usr/include/sys/stat.h:68: warning: this is the location of the previous definition
/usr/include/linux/stat.h:32: warning: `S_IRWXU' redefined
/usr/include/sys/stat.h:87: warning: this is the location of the previous definition
/usr/include/linux/stat.h:33: warning: `S_IRUSR' redefined
/usr/include/sys/stat.h:83: warning: this is the location of the previous definition
/usr/include/linux/stat.h:34: warning: `S_IWUSR' redefined
/usr/include/sys/stat.h:84: warning: this is the location of the previous definition
/usr/include/linux/stat.h:35: warning: `S_IXUSR' redefined
/usr/include/sys/stat.h:85: warning: this is the location of the previous definition
/usr/include/linux/stat.h:37: warning: `S_IRWXG' redefined
/usr/include/sys/stat.h:99: warning: this is the location of the previous definition
/usr/include/linux/stat.h:38: warning: `S_IRGRP' redefined
/usr/include/sys/stat.h:95: warning: this is the location of the previous definition
/usr/include/linux/stat.h:39: warning: `S_IWGRP' redefined
/usr/include/sys/stat.h:96: warning: this is the location of the previous definition
/usr/include/linux/stat.h:40: warning: `S_IXGRP' redefined
/usr/include/sys/stat.h:97: warning: this is the location of the previous definition
/usr/include/linux/stat.h:42: warning: `S_IRWXO' redefined
/usr/include/sys/stat.h:105: warning: this is the location of the previous definition
/usr/include/linux/stat.h:43: warning: `S_IROTH' redefined
/usr/include/sys/stat.h:101: warning: this is the location of the previous definition
/usr/include/linux/stat.h:44: warning: `S_IWOTH' redefined
/usr/include/sys/stat.h:102: warning: this is the location of the previous definition
/usr/include/linux/stat.h:45: warning: `S_IXOTH' redefined
/usr/include/sys/stat.h:103: warning: this is the location of the previous definition
In file included from /usr/include/linux/devfs_fs_kernel.h:4,
                 from /usr/include/linux/genhd.h:14,
                 from /home/josv/src/LVM/0.8-pre02.10.1999/tools/lib/liblvm.h:103,
                 from basename.c:26:
/usr/include/linux/fs.h:46: warning: `BLOCK_SIZE' redefined
/home/josv/src/LVM/0.8-pre02.10.1999/tools/lib/liblvm.h:66: warning: this is the location of the previous definition
In file included from /usr/include/linux/affs_fs_i.h:5,
                 from /usr/include/linux/fs.h:269,
                 from /usr/include/linux/devfs_fs_kernel.h:4,
                 from /usr/include/linux/genhd.h:14,
                 from /home/josv/src/LVM/0.8-pre02.10.1999/tools/lib/liblvm.h:103,
                 from basename.c:26:
/usr/include/linux/time.h:69: warning: `FD_SET' redefined
/usr/include/sys/select.h:60: warning: this is the location of the previous definition
/usr/include/linux/time.h:70: warning: `FD_CLR' redefined
/usr/include/sys/select.h:61: warning: this is the location of the previous definition
/usr/include/linux/time.h:71: warning: `FD_ISSET' redefined
/usr/include/sys/select.h:62: warning: this is the location of the previous definition
/usr/include/linux/time.h:72: warning: `FD_ZERO' redefined
/usr/include/sys/select.h:63: warning: this is the location of the previous definition
In file included from /usr/include/linux/fcntl.h:4,
                 from /usr/include/linux/fs.h:473,
                 from /usr/include/linux/devfs_fs_kernel.h:4,
                 from /usr/include/linux/genhd.h:14,
                 from /home/josv/src/LVM/0.8-pre02.10.1999/tools/lib/liblvm.h:103,
                 from basename.c:26:
/usr/include/asm/fcntl.h:18: warning: `FASYNC' redefined
/usr/include/fcntlbits.h:94: warning: this is the location of the previous definition
In file included from /usr/include/linux/ufs_fs_sb.h:17,
                 from /usr/include/linux/fs.h:506,
                 from /usr/include/linux/devfs_fs_kernel.h:4,
                 from /usr/include/linux/genhd.h:14,
                 from /home/josv/src/LVM/0.8-pre02.10.1999/tools/lib/liblvm.h:103,
                 from basename.c:26:
/usr/include/linux/ufs_fs.h:227: warning: `DT_UNKNOWN' redefined
/usr/include/dirent.h:86: warning: this is the location of the previous definition
/usr/include/linux/ufs_fs.h:228: warning: `DT_FIFO' redefined
/usr/include/dirent.h:88: warning: this is the location of the previous definition
/usr/include/linux/ufs_fs.h:229: warning: `DT_CHR' redefined
/usr/include/dirent.h:90: warning: this is the location of the previous definition
/usr/include/linux/ufs_fs.h:230: warning: `DT_DIR' redefined
/usr/include/dirent.h:92: warning: this is the location of the previous definition
/usr/include/linux/ufs_fs.h:231: warning: `DT_BLK' redefined
/usr/include/dirent.h:94: warning: this is the location of the previous definition
/usr/include/linux/ufs_fs.h:232: warning: `DT_REG' redefined
/usr/include/dirent.h:96: warning: this is the location of the previous definition
/usr/include/linux/ufs_fs.h:233: warning: `DT_LNK' redefined
/usr/include/dirent.h:98: warning: this is the location of the previous definition
/usr/include/linux/ufs_fs.h:234: warning: `DT_SOCK' redefined
/usr/include/dirent.h:100: warning: this is the location of the previous definition
In file included from /usr/include/linux/stat.h:6,
                 from /usr/include/linux/fs.h:20,
                 from /usr/include/linux/devfs_fs_kernel.h:4,
                 from /usr/include/linux/genhd.h:14,
                 from /home/josv/src/LVM/0.8-pre02.10.1999/tools/lib/liblvm.h:103,
                 from basename.c:26:
/usr/include/asm/stat.h:18: redefinition of `struct stat'
In file included from /usr/include/linux/affs_fs_i.h:5,
                 from /usr/include/linux/fs.h:269,
                 from /usr/include/linux/devfs_fs_kernel.h:4,
                 from /usr/include/linux/genhd.h:14,
                 from /home/josv/src/LVM/0.8-pre02.10.1999/tools/lib/liblvm.h:103,
                 from basename.c:26:
/usr/include/linux/time.h:9: redefinition of `struct timespec'
/usr/include/linux/time.h:51: parse error before `suseconds_t'
/usr/include/linux/time.h:51: warning: no semicolon at end of struct or union
/usr/include/linux/time.h:88: field `it_interval' has incomplete type
/usr/include/linux/time.h:89: field `it_value' has incomplete type
In file included from /usr/include/linux/fs.h:269,
                 from /usr/include/linux/devfs_fs_kernel.h:4,
                 from /usr/include/linux/genhd.h:14,
                 from /home/josv/src/LVM/0.8-pre02.10.1999/tools/lib/liblvm.h:103,
                 from basename.c:26:
/usr/include/linux/affs_fs_i.h:11: field `kc_lru_time' has incomplete type
In file included from /usr/include/linux/coda_fs_i.h:14,
                 from /usr/include/linux/fs.h:272,
                 from /usr/include/linux/devfs_fs_kernel.h:4,
                 from /usr/include/linux/genhd.h:14,
                 from /home/josv/src/LVM/0.8-pre02.10.1999/tools/lib/liblvm.h:103,
                 from basename.c:26:
/usr/include/linux/coda.h:109: warning: redefinition of `u_quad_t'
/usr/include/sys/types.h:38: warning: `u_quad_t' previously declared here
In file included from /usr/include/linux/fcntl.h:4,
                 from /usr/include/linux/fs.h:473,
                 from /usr/include/linux/devfs_fs_kernel.h:4,
                 from /usr/include/linux/genhd.h:14,
                 from /home/josv/src/LVM/0.8-pre02.10.1999/tools/lib/liblvm.h:103,
                 from basename.c:26:
/usr/include/asm/fcntl.h:57: redefinition of `struct flock'
make[3]: *** [basename.o] Error 1
make[3]: Leaving directory `/home/josv/src/LVM/0.8-pre02.10.1999/tools/lib'
make[2]: *** [all] Error 2
make[2]: Leaving directory `/home/josv/src/LVM/0.8-pre02.10.1999/tools/lib'
make[2]: Entering directory `/home/josv/src/LVM/0.8-pre02.10.1999/tools/man8'
make[3]: Entering directory `/home/josv/src/LVM/0.8-pre02.10.1999/tools/man8'
make[3]: Leaving directory `/home/josv/src/LVM/0.8-pre02.10.1999/tools/man8'
make[2]: Leaving directory `/home/josv/src/LVM/0.8-pre02.10.1999/tools/man8'
make[2]: Entering directory `/home/josv/src/LVM/0.8-pre02.10.1999/tools'
cc -c -pipe -Wall -I/home/josv/src/LVM/0.8-pre02.10.1999/tools -I/home/josv/src/LVM/0.8-pre02.10.1999/tools/lib -I/home/josv/src/LVM/0.8-pre02.10.1999/kernel -D__KERNEL__ -O2 -DDEBUG -o e2fsadm.o e2fsadm.c
In file included from /usr/include/linux/fs.h:20,
                 from /usr/include/linux/devfs_fs_kernel.h:4,
                 from /usr/include/linux/genhd.h:14,
                 from /home/josv/src/LVM/0.8-pre02.10.1999/tools/lib/liblvm.h:103,
                 from /home/josv/src/LVM/0.8-pre02.10.1999/tools/lvm_user.h:44,
                 from e2fsadm.c:40:
/usr/include/linux/stat.h:12: warning: `S_IFMT' redefined
/usr/include/sys/stat.h:35: warning: this is the location of the previous definition
/usr/include/linux/stat.h:13: warning: `S_IFSOCK' redefined
/usr/include/sys/stat.h:44: warning: this is the location of the previous definition
/usr/include/linux/stat.h:14: warning: `S_IFLNK' redefined
/usr/include/sys/stat.h:41: warning: this is the location of the previous definition
/usr/include/linux/stat.h:15: warning: `S_IFREG' redefined
/usr/include/sys/stat.h:39: warning: this is the location of the previous definition
/usr/include/linux/stat.h:16: warning: `S_IFBLK' redefined
/usr/include/sys/stat.h:38: warning: this is the location of the previous definition
/usr/include/linux/stat.h:17: warning: `S_IFDIR' redefined
/usr/include/sys/stat.h:36: warning: this is the location of the previous definition
/usr/include/linux/stat.h:18: warning: `S_IFCHR' redefined
/usr/include/sys/stat.h:37: warning: this is the location of the previous definition
/usr/include/linux/stat.h:19: warning: `S_IFIFO' redefined
/usr/include/sys/stat.h:47: warning: this is the location of the previous definition
/usr/include/linux/stat.h:20: warning: `S_ISUID' redefined
/usr/include/sys/stat.h:75: warning: this is the location of the previous definition
/usr/include/linux/stat.h:21: warning: `S_ISGID' redefined
/usr/include/sys/stat.h:76: warning: this is the location of the previous definition
/usr/include/linux/stat.h:22: warning: `S_ISVTX' redefined
/usr/include/sys/stat.h:80: warning: this is the location of the previous definition
/usr/include/linux/stat.h:24: warning: `S_ISLNK' redefined
/usr/include/sys/stat.h:65: warning: this is the location of the previous definition
/usr/include/linux/stat.h:25: warning: `S_ISREG' redefined
/usr/include/sys/stat.h:58: warning: this is the location of the previous definition
/usr/include/linux/stat.h:26: warning: `S_ISDIR' redefined
/usr/include/sys/stat.h:55: warning: this is the location of the previous definition
/usr/include/linux/stat.h:27: warning: `S_ISCHR' redefined
/usr/include/sys/stat.h:56: warning: this is the location of the previous definition
/usr/include/linux/stat.h:28: warning: `S_ISBLK' redefined
/usr/include/sys/stat.h:57: warning: this is the location of the previous definition
/usr/include/linux/stat.h:29: warning: `S_ISFIFO' redefined
/usr/include/sys/stat.h:60: warning: this is the location of the previous definition
/usr/include/linux/stat.h:30: warning: `S_ISSOCK' redefined
/usr/include/sys/stat.h:68: warning: this is the location of the previous definition
/usr/include/linux/stat.h:32: warning: `S_IRWXU' redefined
/usr/include/sys/stat.h:87: warning: this is the location of the previous definition
/usr/include/linux/stat.h:33: warning: `S_IRUSR' redefined
/usr/include/sys/stat.h:83: warning: this is the location of the previous definition
/usr/include/linux/stat.h:34: warning: `S_IWUSR' redefined
/usr/include/sys/stat.h:84: warning: this is the location of the previous definition
/usr/include/linux/stat.h:35: warning: `S_IXUSR' redefined
/usr/include/sys/stat.h:85: warning: this is the location of the previous definition
/usr/include/linux/stat.h:37: warning: `S_IRWXG' redefined
/usr/include/sys/stat.h:99: warning: this is the location of the previous definition
/usr/include/linux/stat.h:38: warning: `S_IRGRP' redefined
/usr/include/sys/stat.h:95: warning: this is the location of the previous definition
/usr/include/linux/stat.h:39: warning: `S_IWGRP' redefined
/usr/include/sys/stat.h:96: warning: this is the location of the previous definition
/usr/include/linux/stat.h:40: warning: `S_IXGRP' redefined
/usr/include/sys/stat.h:97: warning: this is the location of the previous definition
/usr/include/linux/stat.h:42: warning: `S_IRWXO' redefined
/usr/include/sys/stat.h:105: warning: this is the location of the previous definition
/usr/include/linux/stat.h:43: warning: `S_IROTH' redefined
/usr/include/sys/stat.h:101: warning: this is the location of the previous definition
/usr/include/linux/stat.h:44: warning: `S_IWOTH' redefined
/usr/include/sys/stat.h:102: warning: this is the location of the previous definition
/usr/include/linux/stat.h:45: warning: `S_IXOTH' redefined
/usr/include/sys/stat.h:103: warning: this is the location of the previous definition
In file included from /usr/include/linux/devfs_fs_kernel.h:4,
                 from /usr/include/linux/genhd.h:14,
                 from /home/josv/src/LVM/0.8-pre02.10.1999/tools/lib/liblvm.h:103,
                 from /home/josv/src/LVM/0.8-pre02.10.1999/tools/lvm_user.h:44,
                 from e2fsadm.c:40:
/usr/include/linux/fs.h:46: warning: `BLOCK_SIZE' redefined
/home/josv/src/LVM/0.8-pre02.10.1999/tools/lib/liblvm.h:66: warning: this is the location of the previous definition
In file included from /usr/include/linux/affs_fs_i.h:5,
                 from /usr/include/linux/fs.h:269,
                 from /usr/include/linux/devfs_fs_kernel.h:4,
                 from /usr/include/linux/genhd.h:14,
                 from /home/josv/src/LVM/0.8-pre02.10.1999/tools/lib/liblvm.h:103,
                 from /home/josv/src/LVM/0.8-pre02.10.1999/tools/lvm_user.h:44,
                 from e2fsadm.c:40:
/usr/include/linux/time.h:69: warning: `FD_SET' redefined
/usr/include/sys/select.h:60: warning: this is the location of the previous definition
/usr/include/linux/time.h:70: warning: `FD_CLR' redefined
/usr/include/sys/select.h:61: warning: this is the location of the previous definition
/usr/include/linux/time.h:71: warning: `FD_ISSET' redefined
/usr/include/sys/select.h:62: warning: this is the location of the previous definition
/usr/include/linux/time.h:72: warning: `FD_ZERO' redefined
/usr/include/sys/select.h:63: warning: this is the location of the previous definition
In file included from /usr/include/linux/fcntl.h:4,
                 from /usr/include/linux/fs.h:473,
                 from /usr/include/linux/devfs_fs_kernel.h:4,
                 from /usr/include/linux/genhd.h:14,
                 from /home/josv/src/LVM/0.8-pre02.10.1999/tools/lib/liblvm.h:103,
                 from /home/josv/src/LVM/0.8-pre02.10.1999/tools/lvm_user.h:44,
                 from e2fsadm.c:40:
/usr/include/asm/fcntl.h:18: warning: `FASYNC' redefined
/usr/include/fcntlbits.h:94: warning: this is the location of the previous definition
In file included from /usr/include/linux/ufs_fs_sb.h:17,
                 from /usr/include/linux/fs.h:506,
                 from /usr/include/linux/devfs_fs_kernel.h:4,
                 from /usr/include/linux/genhd.h:14,
                 from /home/josv/src/LVM/0.8-pre02.10.1999/tools/lib/liblvm.h:103,
                 from /home/josv/src/LVM/0.8-pre02.10.1999/tools/lvm_user.h:44,
                 from e2fsadm.c:40:
/usr/include/linux/ufs_fs.h:227: warning: `DT_UNKNOWN' redefined
/usr/include/dirent.h:86: warning: this is the location of the previous definition
/usr/include/linux/ufs_fs.h:228: warning: `DT_FIFO' redefined
/usr/include/dirent.h:88: warning: this is the location of the previous definition
/usr/include/linux/ufs_fs.h:229: warning: `DT_CHR' redefined
/usr/include/dirent.h:90: warning: this is the location of the previous definition
/usr/include/linux/ufs_fs.h:230: warning: `DT_DIR' redefined
/usr/include/dirent.h:92: warning: this is the location of the previous definition
/usr/include/linux/ufs_fs.h:231: warning: `DT_BLK' redefined
/usr/include/dirent.h:94: warning: this is the location of the previous definition
/usr/include/linux/ufs_fs.h:232: warning: `DT_REG' redefined
/usr/include/dirent.h:96: warning: this is the location of the previous definition
/usr/include/linux/ufs_fs.h:233: warning: `DT_LNK' redefined
/usr/include/dirent.h:98: warning: this is the location of the previous definition
/usr/include/linux/ufs_fs.h:234: warning: `DT_SOCK' redefined
/usr/include/dirent.h:100: warning: this is the location of the previous definition
In file included from /usr/include/linux/stat.h:6,
                 from /usr/include/linux/fs.h:20,
                 from /usr/include/linux/devfs_fs_kernel.h:4,
                 from /usr/include/linux/genhd.h:14,
                 from /home/josv/src/LVM/0.8-pre02.10.1999/tools/lib/liblvm.h:103,
                 from /home/josv/src/LVM/0.8-pre02.10.1999/tools/lvm_user.h:44,
                 from e2fsadm.c:40:
/usr/include/asm/stat.h:18: redefinition of `struct stat'
In file included from /usr/include/linux/affs_fs_i.h:5,
                 from /usr/include/linux/fs.h:269,
                 from /usr/include/linux/devfs_fs_kernel.h:4,
                 from /usr/include/linux/genhd.h:14,
                 from /home/josv/src/LVM/0.8-pre02.10.1999/tools/lib/liblvm.h:103,
                 from /home/josv/src/LVM/0.8-pre02.10.1999/tools/lvm_user.h:44,
                 from e2fsadm.c:40:
/usr/include/linux/time.h:9: redefinition of `struct timespec'
/usr/include/linux/time.h:51: parse error before `suseconds_t'
/usr/include/linux/time.h:51: warning: no semicolon at end of struct or union
/usr/include/linux/time.h:88: field `it_interval' has incomplete type
/usr/include/linux/time.h:89: field `it_value' has incomplete type
In file included from /usr/include/linux/fs.h:269,
                 from /usr/include/linux/devfs_fs_kernel.h:4,
                 from /usr/include/linux/genhd.h:14,
                 from /home/josv/src/LVM/0.8-pre02.10.1999/tools/lib/liblvm.h:103,
                 from /home/josv/src/LVM/0.8-pre02.10.1999/tools/lvm_user.h:44,
                 from e2fsadm.c:40:
/usr/include/linux/affs_fs_i.h:11: field `kc_lru_time' has incomplete type
In file included from /usr/include/linux/coda_fs_i.h:14,
                 from /usr/include/linux/fs.h:272,
                 from /usr/include/linux/devfs_fs_kernel.h:4,
                 from /usr/include/linux/genhd.h:14,
                 from /home/josv/src/LVM/0.8-pre02.10.1999/tools/lib/liblvm.h:103,
                 from /home/josv/src/LVM/0.8-pre02.10.1999/tools/lvm_user.h:44,
                 from e2fsadm.c:40:
/usr/include/linux/coda.h:109: warning: redefinition of `u_quad_t'
/usr/include/sys/types.h:38: warning: `u_quad_t' previously declared here
In file included from /usr/include/linux/fcntl.h:4,
                 from /usr/include/linux/fs.h:473,
                 from /usr/include/linux/devfs_fs_kernel.h:4,
                 from /usr/include/linux/genhd.h:14,
                 from /home/josv/src/LVM/0.8-pre02.10.1999/tools/lib/liblvm.h:103,
                 from /home/josv/src/LVM/0.8-pre02.10.1999/tools/lvm_user.h:44,
                 from e2fsadm.c:40:
/usr/include/asm/fcntl.h:57: redefinition of `struct flock'
make[2]: *** [e2fsadm.o] Error 1
make[2]: Leaving directory `/home/josv/src/LVM/0.8-pre02.10.1999/tools'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/josv/src/LVM/0.8-pre02.10.1999/tools'
make: *** [all] Error 2

--------------B2D984B6B7820A3DD2D04815--
