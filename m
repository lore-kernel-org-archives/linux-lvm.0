Message-ID: <16919C987858D311B35400902778707A29176D@XCHNG1-P-DC>
Subject: [linux-lvm] Setup of LVM
Date: Wed, 23 Aug 2000 15:13:35 -0400
MIME-Version: 1.0
From: "Morris.Marshael" <Morris.Marshael@mccg.org>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@msede.com'" <linux-lvm@msede.com>


I am new to this list and LVM on Linux.
I am trying to install LVM on a Redhat 6.2 using kernel 2.2.16.  I got this
using uname -r.
I see all the patches but do not see anything I think I might need to use.
I have went into the kernel configuration and told it yes to the Logical
volume manager support
And to the LVM information in proc filesystem.  When I compile the kernel I
receive errors of:

make[3]: Entering directory `/usr/src/linux/drivers/block'
gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -O2
-fomit-frame-pointer -fno-strict-aliasing -D__SMP__ -pipe
-fno-strength-reduce -m486 -malign-loops=2 -malign-jumps=2
-malign-functions=2 -DCPU=686   -c -o lvm.o lvm.c
lvm.c:169: linux/blkpg.h: No such file or directory
lvm.c:192: parse error before `*'
lvm.c:192: warning: function declaration isn't a prototype
lvm.c:296: warning: type defaults to `int' in declaration of
`DECLARE_WAIT_QUEUE_HEAD'
lvm.c:296: warning: parameter names (without types) in function declaration
lvm.c:297: warning: type defaults to `int' in declaration of
`DECLARE_WAIT_QUEUE_HEAD'
lvm.c:297: warning: parameter names (without types) in function declaration
lvm.c:298: warning: type defaults to `int' in declaration of
`DECLARE_WAIT_QUEUE_HEAD'
lvm.c:298: warning: parameter names (without types) in function declaration
lvm.c:313: `blkdev_close' undeclared here (not in a function)
lvm.c:313: initializer element for `lvm_blk_fops.release' is not constant
lvm.c:318: initializer element for `lvm_blk_fops' is not constant
lvm.c:322: variable `lvm_blk_dops' has initializer but incomplete type
lvm.c:324: unknown field `open' specified in initializer
lvm.c:324: warning: excess elements in struct initializer after
`lvm_blk_dops'
lvm.c:325: unknown field `release' specified in initializer
lvm.c:325: warning: excess elements in struct initializer after
`lvm_blk_dops'
lvm.c:326: unknown field `ioctl' specified in initializer
lvm.c:327: warning: excess elements in struct initializer after
`lvm_blk_dops'
lvm.c:342: warning: initialization makes integer from pointer without a cast
lvm.c:343: warning: initialization from incompatible pointer type
lvm.c:345: warning: initialization makes pointer from integer without a cast
lvm.c:347: warning: initialization makes integer from pointer without a cast
lvm.c: In function `lvm_init':
lvm.c:374: warning: passing arg 3 of `register_blkdev' from incompatible
pointer type
lvm.c:385: warning: implicit declaration of function
`create_proc_info_entry'
lvm.c:411: warning: implicit declaration of function `blk_init_queue'
lvm.c:411: warning: implicit declaration of function `BLK_DEFAULT_QUEUE'
lvm.c:412: warning: implicit declaration of function
`blk_queue_make_request'
lvm.c: In function `lvm_chr_ioctl':
lvm.c:604: `lvm_wait' undeclared (first use in this function)
lvm.c:604: (Each undeclared identifier is reported only once
lvm.c:604: for each function it appears in.)
lvm.c: In function `lvm_chr_close':
lvm.c:763: `lvm_wait' undeclared (first use in this function)
lvm.c: In function `lvm_map':
lvm.c:1413: `lvm_map_wait' undeclared (first use in this function)
lvm.c: At top level:
lvm.c:1501: parse error before `*'
lvm.c:1502: warning: function declaration isn't a prototype
lvm.c: In function `lvm_make_request_fn':
lvm.c:1519: warning: implicit declaration of function `generic_make_request'
lvm.c: In function `lvm_do_lock_lvm':
lvm.c:1542: `lvm_wait' undeclared (first use in this function)
lvm.c: In function `lvm_do_pe_lock_unlock':
lvm.c:1588: `lvm_map_wait' undeclared (first use in this function)
lvm.c: In function `lvm_do_lv_create':
lvm.c:1984: warning: implicit declaration of function `init_MUTEX'
/usr/src/linux/include/linux/blk.h: At top level:
/usr/src/linux/include/linux/blk.h:453: warning: `DEVICE_REQUEST' declared
`static' but never defined
/usr/src/linux/include/linux/blk.h:479: warning: `end_request' defined but
not used
lvm.c:298: warning: `DECLARE_WAIT_QUEUE_HEAD' declared `static' but never
defined
make[3]: *** [lvm.o] Error 1
make[3]: Leaving directory `/usr/src/linux/drivers/block'
make[2]: *** [first_rule] Error 2
make[2]: Leaving directory `/usr/src/linux/drivers/block'
make[1]: *** [_subdir_block] Error 2
make[1]: Leaving directory `/usr/src/linux/drivers'
make: *** [_dir_drivers] Error 2

Can anyone help?
_________________________________________________________________
Marshael Morris		Phone: (912) 633-2160
Systems Programmer		Fax:    (912) 633-1546
353 First Street			e-mail: morris.marshael@mccg.org
<mailto:morris.marshael@mccg.org> 
Suite 200
Macon, Georgia 31201
