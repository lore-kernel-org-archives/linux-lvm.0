Message-Id: <4.1.19990212192108.00958d40@mail.msy.bellsouth.net>
Date: Fri, 12 Feb 1999 19:23:31 -0600
From: Daniel Whicker <heimdall@mail.org>
Subject: [linux-lvm] Snapshot compile...
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
Reply-To: linux-lvm@msede.com
List-Id: <linux-lvm.redhat.com>
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Heinz,
I was able to get the kernel compiled fine.  Ran into a problem compiling
the modules, though.  I think that it may be due to attempting to compile
it under a 2.0.36 kernel as opposed to a 2.2.0 kernel, but I'm unsure.
Here's the output:
----------------------------------------------------------------------------
--------------------------------------------
[root@Bifrost linux]# make modules
make[1]: Entering directory `/usr/src/linux-2.0.36/kernel'
make[1]: Nothing to be done for `modules'.
make[1]: Leaving directory `/usr/src/linux-2.0.36/kernel'
make[1]: Entering directory `/usr/src/linux-2.0.36/drivers'
set -e; for i in block char net  scsi sound cdrom isdn; do make -C $i
modules; done
make[2]: Entering directory `/usr/src/linux-2.0.36/drivers/block'
updating /usr/src/linux-2.0.36/include/linux/modversions.h
gcc -D__KERNEL__ -I/usr/src/linux-2.0.36/include -Wall -Wstrict-prototypes
-O2 -fomit-frame-pointer -fno-strength-reduce -pipe -m386 -DCPU=386
-DMODULE -DMODVERSIONS -include
/usr/src/linux-2.0.36/include/linux/modversions.h  -c -o loop.o loop.c
gcc -D__KERNEL__ -I/usr/src/linux-2.0.36/include -Wall -Wstrict-prototypes
-O2 -fomit-frame-pointer -fno-strength-reduce -pipe -m386 -DCPU=386
-DMODULE -DMODVERSIONS -include
/usr/src/linux-2.0.36/include/linux/modversions.h  -c -o lvm.o lvm.c
lvm.c:250: `LVM_DRIVER_IOP_VERSION' undeclared here (not in a function)
lvm.c:336: warning: excess elements in struct initializer after `lvm_gendisk'
lvm.c:1363: `inode' undeclared here (not in a function)
lvm.c:1363: initializer element is not constant
lvm.c:1364: `inode' undeclared here (not in a function)
lvm.c:1364: initializer element is not constant
lvm.c:1367: variable-size type declared outside of any function
lvm.c:1367: variable-sized object may not be initialized
lvm.c:1367: warning: data definition has no type or storage class
lvm.c:1371: parse error before `return'
make[2]: *** [lvm.o] Error 1
make[2]: Leaving directory `/usr/src/linux-2.0.36/drivers/block'
make[1]: *** [modules] Error 2
make[1]: Leaving directory `/usr/src/linux-2.0.36/drivers'
make: *** [modules] Error 2
----------------------------------------------------------------------------
--------------------------------------------
									-Daniel
		------------------------------------------
		Daniel Whicker  (heimdall@mail.org)
