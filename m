Date: Mon, 20 Mar 2000 02:49:44 -0600 (CST)
From: Michael Bartosh <bartosh@ocean.tamu.edu>
Subject: [linux-lvm] tools make error?
Message-ID: <Pine.OSF.4.02.10003200248050.463935-100000@ocean.tamu.edu>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com



I have 0.8final compiled (w/ patch) into kernel, but am getting the
following when I try to make the new tools. What's up?


make[2]: Entering directory `/root/LVM/0.8final/tools'
cc -c -pipe -Wall -O2 -DDEBUG -I/root/LVM/0.8final/tools/lib
-I/root/LVM/0.8final/tools -o e2fsadm.o e2fsadm.c
In file included from /root/LVM/0.8final/tools/lvm_user.h:44,
                 from e2fsadm.c:45:
/root/LVM/0.8final/tools/lib/liblvm.h:50: gnu/types.h: No such file or
directory
e2fsadm.c: In function `main':
e2fsadm.c:127: warning: implicit declaration of function `basename'
e2fsadm.c:127: warning: assignment makes pointer from integer without a
cast
make[2]: *** [e2fsadm.o] Error 1
make[2]: Leaving directory `/root/LVM/0.8final/tools'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/root/LVM/0.8final/tools'
make: *** [all] Error 2

______________

Thanks-

-mab
