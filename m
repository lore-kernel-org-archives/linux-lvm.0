From: stk@rmi.de
Message-Id: <200004242244.AAA18723@musashi.stan.de>
Date: Tue, 25 Apr 2000 00:44:26 +0200 (CEST)
Subject: [linux-lvm] Tools - Compile Problem
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hello,

i have problems compiling the user space tools from lvm0.8final,
I have already applied patch-lvm_0.8final-2 cleanly.

I wasn't able to find any clues on this in the faq or list archives,
may someone has any ideas on this. 

the environment is: 
	Kernel 2.2.14 (patched)
	Glibc 2.1.1
	egcs 2.91.66
	caldera openlinux 2.3

the error message is:

[...]
make[3]: Entering directory `/usr/local/src/LVM/0.8final/tools/lib'
cc -c -pipe -Wall -O2 -D_GNU_SOURCE -DDEBUG -I/usr/local/src/LVM/0.8final/tools/lib -I/usr/local/src/LVM/0.8final/tools -o basename.o basename.c
In file included from /usr/include/linux/genhd.h:14,
                 from /usr/local/src/LVM/0.8final/tools/lib/liblvm.h:69,
                 from basename.c:34:
/usr/include/linux/devfs_fs_kernel.h:57: warning: `struct file_operations' declared inside parameter list
/usr/include/linux/devfs_fs_kernel.h:57: warning: its scope is only this definition or declaration,
/usr/include/linux/devfs_fs_kernel.h:57: warning: which is probably not what you want.
/usr/include/linux/devfs_fs_kernel.h:67: warning: `struct file' declared inside parameter list
/usr/include/linux/devfs_fs_kernel.h:67: warning: `struct inode' declared inside parameter list
/usr/include/linux/devfs_fs_kernel.h:76: warning: `struct inode' declared inside parameter list
In file included from /usr/local/src/LVM/0.8final/tools/lib/liblvm.h:71,
                 from basename.c:34:
/usr/local/src/LVM/0.8final/tools/lib/lvm.h:393: field `hash' has incomplete type
/usr/local/src/LVM/0.8final/tools/lib/lvm.h:395: parse error before `kdev_t'
/usr/local/src/LVM/0.8final/tools/lib/lvm.h:395: warning: no semicolon at end of struct or union
[...]

I was able to get around the first errors (struct file_operations,
struct file and struct inode) but not the following ones. I havent
included the remaining 400 lines - but could do so if it will help to 
rsolve the problem. 


Hope someone can give me some help on this,

tia 
 /stk





-- 
 Stefan K                                       email:     stk@rmi.de
 Aix-la-Chapelle                                fax/data: +49-241-533353
