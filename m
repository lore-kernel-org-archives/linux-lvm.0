Message-Id: <m10srwW-0000YZC@duffy1.franken.de>
From: Rolf Jakob <rjakob@duffy1.franken.de>
Subject: [linux-lvm] lvm-0.6, Linux 2.2.9 and devfs-patch-v99.2
Date: Sat, 12 Jun 1999 19:51:43 +0200 (MET DST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Hi,

Is lvm-0.6 (patched with lvm_0.6-patch-15031999a.gz) supposed to
work with Linux 2.2.9 and devfs-patch-v99-2 ?

What I did:
Unpack lvm_0.6.tar.gz to /usr/src/LVM
cd to /usr/src/LVM/0.6
zcat lvm_0.6-patch-15031999a.gz | patch -p1
edit make.tmpl
make

What I get:
A lot of error messages starting with :

make[1]: Entering directory `/usr/src/LVM/0.6/tools'
make[2]: Entering directory `/usr/src/LVM/0.6/tools/lib'
make[3]: Entering directory `/usr/src/LVM/0.6/tools/lib'
cc -pipe -c -Wall -I/usr/src/LVM/0.6/tools -I/usr/src/LVM/0.6/tools/lib -I/usr/src/LVM/0.6/kernel -D__KERNEL__ -O2 -DDEBUG -o basename.o basename.c
In file included from /usr/include/linux/fs.h:20,
                 from /usr/include/linux/devfs_fs.h:4,
                 from /usr/include/linux/genhd.h:14,
                 from /usr/src/LVM/0.6/tools/lib/liblvm.h:100,
                 from basename.c:26:
/usr/include/linux/stat.h:12: warning: `S_IFMT' redefined
/usr/include/sys/stat.h:35: warning: this is the location of the previous definition
/usr/include/linux/stat.h:13: warning: `S_IFSOCK' redefined
/usr/include/sys/stat.h:44: warning: this is the location of the previous definition
/usr/include/linux/stat.h:14: warning: `S_IFLNK' redefined
/usr/include/sys/stat.h:41: warning: this is the location of the previous definition

The same goes for all other stat macros, resulting in more than 300 lines
of error messages (I do not want to quote them all here).

Beside the stat macros I get :
In file included from /usr/include/linux/devfs_fs.h:4,
                 from /usr/include/linux/genhd.h:14,
                 from /usr/src/LVM/0.6/tools/lib/liblvm.h:100,
                 from basename.c:26:
/usr/include/linux/fs.h:43: warning: `BLOCK_SIZE' redefined
/usr/src/LVM/0.6/tools/lib/liblvm.h:64: warning: this is the location of the previous definition
In file included from /usr/include/linux/affs_fs_i.h:5,
                 from /usr/include/linux/fs.h:270,
                 from /usr/include/linux/devfs_fs.h:4,
                 from /usr/include/linux/genhd.h:14,
                 from /usr/src/LVM/0.6/tools/lib/liblvm.h:100,
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
                 from /usr/include/linux/fs.h:472,
                 from /usr/include/linux/devfs_fs.h:4,
                 from /usr/include/linux/genhd.h:14,
                 from /usr/src/LVM/0.6/tools/lib/liblvm.h:100,
                 from basename.c:26:
/usr/include/asm/fcntl.h:18: warning: `FASYNC' redefined
/usr/include/fcntlbits.h:94: warning: this is the location of the previous definition
In file included from /usr/include/linux/ufs_fs_sb.h:17,
                 from /usr/include/linux/fs.h:507,
                 from /usr/include/linux/devfs_fs.h:4,
                 from /usr/include/linux/genhd.h:14,
                 from /usr/src/LVM/0.6/tools/lib/liblvm.h:100,
                 from basename.c:26:
/usr/include/linux/ufs_fs.h:226: warning: `DT_UNKNOWN' redefined
/usr/include/dirent.h:86: warning: this is the location of the previous definition
/usr/include/linux/ufs_fs.h:227: warning: `DT_FIFO' redefined
/usr/include/dirent.h:88: warning: this is the location of the previous definition
/usr/include/linux/ufs_fs.h:228: warning: `DT_CHR' redefined
/usr/include/dirent.h:90: warning: this is the location of the previous definition
/usr/include/linux/ufs_fs.h:229: warning: `DT_DIR' redefined
/usr/include/dirent.h:92: warning: this is the location of the previous definition
/usr/include/linux/ufs_fs.h:230: warning: `DT_BLK' redefined
/usr/include/dirent.h:94: warning: this is the location of the previous definition
/usr/include/linux/ufs_fs.h:231: warning: `DT_REG' redefined
/usr/include/dirent.h:96: warning: this is the location of the previous definition
/usr/include/linux/ufs_fs.h:232: warning: `DT_LNK' redefined
/usr/include/dirent.h:98: warning: this is the location of the previous definition
/usr/include/linux/ufs_fs.h:233: warning: `DT_SOCK' redefined
/usr/include/dirent.h:100: warning: this is the location of the previous definition
In file included from /usr/include/linux/stat.h:6,
                 from /usr/include/linux/fs.h:20,
                 from /usr/include/linux/devfs_fs.h:4,
                 from /usr/include/linux/genhd.h:14,
                 from /usr/src/LVM/0.6/tools/lib/liblvm.h:100,
                 from basename.c:26:
/usr/include/asm/stat.h:18: redefinition of `struct stat'
In file included from /usr/include/linux/affs_fs_i.h:5,
                 from /usr/include/linux/fs.h:270,
                 from /usr/include/linux/devfs_fs.h:4,
                 from /usr/include/linux/genhd.h:14,
                 from /usr/src/LVM/0.6/tools/lib/liblvm.h:100,
                 from basename.c:26:
/usr/include/linux/time.h:9: redefinition of `struct timespec'
/usr/include/linux/time.h:51: parse error before `suseconds_t'
/usr/include/linux/time.h:51: warning: no semicolon at end of struct or union
/usr/include/linux/time.h:88: field `it_interval' has incomplete type
/usr/include/linux/time.h:89: field `it_value' has incomplete type
In file included from /usr/include/linux/fs.h:270,
                 from /usr/include/linux/devfs_fs.h:4,
                 from /usr/include/linux/genhd.h:14,
                 from /usr/src/LVM/0.6/tools/lib/liblvm.h:100,
                 from basename.c:26:
/usr/include/linux/affs_fs_i.h:11: field `kc_lru_time' has incomplete type
In file included from /usr/include/linux/fcntl.h:4,
                 from /usr/include/linux/fs.h:472,
                 from /usr/include/linux/devfs_fs.h:4,
                 from /usr/include/linux/genhd.h:14,
                 from /usr/src/LVM/0.6/tools/lib/liblvm.h:100,
                 from basename.c:26:
/usr/include/asm/fcntl.h:57: redefinition of `struct flock'
make[3]: *** [basename.o] Error 1
make[3]: Leaving directory `/usr/src/LVM/0.6/tools/lib'
make[2]: *** [all] Error 2

The same follows for the other sources.

The problem seems to be in liblvm.h which includes other files, so
that a lot of things are defined twice. This all happened after upgrading
the kernel to 2.2.9, with 2.2.1 there was no such problem.
The kernel is patched with the latest devfs patch and I'm using glibc 2.0
(__GLIBC__ 2, __GLIBC_MINOR__ 0 acc. to features.h).

-- 
Rolf Jakob at home (rjakob@duffy1.franken.de)
WWW : http://www.franken.de/users/duffy1/rjakob (KDE-Utils and CCS)
