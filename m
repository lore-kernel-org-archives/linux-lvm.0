Date: Sun, 30 Jan 2000 19:11:04 -0500 (EST)
From: Jim Cain <jec+list.lvm@mgmt-inc.com>
Subject: [linux-lvm] Patch 0.8i to 2.3.40: error during make
Message-ID: <Pine.LNX.4.20.0001301910280.5714-100000@claudius.mgmt-inc.com>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

All,

After applying the patch and running make config and make dep, make shows
the following:

gcc -D__KERNEL__ -I/usr/src/linux-2.3.40-lvm/include -D__SMP__ -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -fno-strict-aliasing -pipe -fno-strength-reduce  -DCPU=686 -march=i686  -c -o init/main.o init/main.c
gcc -D__KERNEL__ -I/usr/src/linux-2.3.40-lvm/include -D__SMP__ -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -fno-strict-aliasing -pipe -fno-strength-reduce  -DCPU=686 -march=i686 -DUTS_MACHINE='"i386"' -c -o init/version.o init/version.c
make -C  kernel
make[1]: Entering directory `/usr/src/linux-2.3.40-lvm/kernel'
make all_targets
make[2]: Entering directory `/usr/src/linux-2.3.40-lvm/kernel'
gcc -D__KERNEL__ -I/usr/src/linux-2.3.40-lvm/include -D__SMP__ -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -fno-strict-aliasing -pipe -fno-strength-reduce  -DCPU=686 -march=i686   -DEXPORT_SYMTAB -c signal.c
gcc -D__KERNEL__ -I/usr/src/linux-2.3.40-lvm/include -D__SMP__ -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -fno-strict-aliasing -pipe -fno-strength-reduce  -DCPU=686 -march=i686   -DEXPORT_SYMTAB -c ksyms.c
ksyms.c:258: `block_fsync' undeclared here (not in a function)
ksyms.c:258: initializer element for `__ksymtab_block_fsync.value' is not constant
ksyms.c:269: `blkdev_close' undeclared here (not in a function)
ksyms.c:269: initializer element for `__ksymtab_blkdev_close.value' is not constant
make[2]: *** [ksyms.o] Error 1
make[2]: Leaving directory `/usr/src/linux-2.3.40-lvm/kernel'
make[1]: *** [first_rule] Error 2
make[1]: Leaving directory `/usr/src/linux-2.3.40-lvm/kernel'
make: *** [_dir_kernel] Error 2

Has anyone else had a similar problem with this patch?

Cheers,
Jim
