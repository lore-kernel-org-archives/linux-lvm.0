Return-Path: <paulo_fessel@optiglobe.com.br>
Message-ID: <1D15D20781EB404E9EA6129359E02439097844@sp1email.optiglobe.com.br>
From: Paulo Fessel <paulo_fessel@optiglobe.com.br>
Date: Thu, 19 Apr 2001 18:08:58 -0300
MIME-Version: 1.0
Return-Path: paulo_fessel@optiglobe.com.br
Subject: [linux-lvm] Problems compiling Kernel 2.4.3+lvm-0.91beta7
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Hello, people at linux-lvm.

I'm not getting to compile Linux Kernel 2.4.3 together with lvm 0.91 beta7.
Here are the warning and error messages I get:

gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -O2
-fomit-f
rame-pointer -fno-strict-aliasing -pipe -mpreferred-stack-boundary=3D2
-march=3Di686
 -DMODULE -DMODVERSIONS -include /usr/src/linux/include/linux/modversions.h
-c
 -o lvm.o lvm.c
In file included from /usr/src/linux/include/linux/lvm.h:122,
                 from lvm.c:242:
/usr/src/linux/include/asm/spinlock.h:36: warning: `SPIN_LOCK_UNLOCKED'
redefine
d
/usr/src/linux/include/linux/spinlock.h:55: warning: this is the location of
the
 previous definition
/usr/src/linux/include/asm/spinlock.h:38: warning: `spin_lock_init'
redefined
/usr/src/linux/include/linux/spinlock.h:58: warning: this is the location of
the
 previous definition
/usr/src/linux/include/asm/spinlock.h:47: warning: `spin_is_locked'
redefined
/usr/src/linux/include/linux/spinlock.h:60: warning: this is the location of
the
 previous definition
/usr/src/linux/include/asm/spinlock.h:48: warning: `spin_unlock_wait'
redefined
/usr/src/linux/include/linux/spinlock.h:62: warning: this is the location of
the
 previous definition
/usr/src/linux/include/asm/spinlock.h:131: warning: `RW_LOCK_UNLOCKED'
redefined
/usr/src/linux/include/linux/spinlock.h:118: warning: this is the location
of th
e previous definition
/usr/src/linux/include/asm/spinlock.h:133: warning: `rwlock_init' redefined
/usr/src/linux/include/linux/spinlock.h:121: warning: this is the location
of th
e previous definition
/usr/src/linux/include/asm/spinlock.h:164: warning: `read_unlock' redefined
/usr/src/linux/include/linux/spinlock.h:123: warning: this is the location
of th
e previous definition
/usr/src/linux/include/asm/spinlock.h:165: warning: `write_unlock' redefined
/usr/src/linux/include/linux/spinlock.h:125: warning: this is the location
of th
e previous definition
In file included from /usr/src/linux/include/linux/lvm.h:122,
                 from lvm.c:242:
/usr/src/linux/include/asm/spinlock.h:26: conflicting types for `spinlock_t'
/usr/src/linux/include/linux/spinlock.h:54: previous declaration of
`spinlock_t'
/usr/src/linux/include/asm/spinlock.h:68: parse error before `{'
/usr/src/linux/include/asm/spinlock.h:78: parse error before `void'
/usr/src/linux/include/asm/spinlock.h:93: parse error before `do'
/usr/src/linux/include/asm/spinlock.h:121: conflicting types for `rwlock_t'
/usr/src/linux/include/linux/spinlock.h:117: previous declaration of
`rwlock_t'
/usr/src/linux/include/asm/spinlock.h:146: parse error before `void'
/usr/src/linux/include/asm/spinlock.h:155: parse error before `void'
lvm.c:386: `block_fsync' undeclared here (not in a function)
lvm.c:386: initializer element is not constant
lvm.c:386: (near initialization for `lvm_blk_fops.fsync')
lvm.c:387: initializer element is not constant
lvm.c:387: (near initialization for `lvm_blk_fops')
lvm.c:403: warning: initialization makes pointer from integer without a cast
lvm.c:404: warning: initialization from incompatible pointer type
lvm.c:406: warning: initialization makes integer from pointer without a cast
lvm.c:409: warning: initialization makes pointer from integer without a cast
lvm.c: In function `lvm_init':
lvm.c:425: warning: passing arg 3 of `register_blkdev_Rbb21f1bf' from
incompatib
le pointer type
lvm.c:456: structure has no member named `request_fn'
lvm.c:457: structure has no member named `current_request'
lvm.c:459: structure has no member named `make_req_fn'
lvm.c: In function `lvm_cleanup':
lvm.c:498: structure has no member named `request_fn'
lvm.c:499: structure has no member named `current_request'
lvm.c:501: structure has no member named `make_req_fn'
lvm.c: In function `lvm_chr_ioctl':
lvm.c:651: warning: passing arg 1 of `__wake_up_R2c77a2af' from incompatible
poi
nter type
lvm.c: In function `lvm_chr_close':
lvm.c:831: warning: passing arg 1 of `__wake_up_R2c77a2af' from incompatible
poi
nter type
lvm.c: In function `lvm_get_snapshot_use_rate':
lvm.c:1081: warning: passing arg 1 of `interruptible_sleep_on_R15e26425'
from in
compatible pointer type
lvm.c: At top level:
lvm.c:1311: conflicting types for `lvm_dummy_device_request'
/usr/src/linux/include/linux/blk.h:358: previous declaration of
`lvm_dummy_devic
e_request'
lvm.c: In function `lvm_do_lock_lvm':
lvm.c:1343: warning: passing arg 1 of `interruptible_sleep_on_R15e26425'
from in
compatible pointer type
lvm.c: In function `lvm_do_lv_create':
lvm.c:1890: `MUTEX' undeclared (first use in this function)
lvm.c:1890: (Each undeclared identifier is reported only once
lvm.c:1890: for each function it appears in.)
make[2]: *** [lvm.o] Error 1
make[2]: Leaving directory `/usr/src/linux/drivers/md'
make[1]: *** [_modsubdir_md] Error 2
make[1]: Leaving directory `/usr/src/linux/drivers'
make: *** [_mod_drivers] Error 2

These problems don't happen at all when I compile lvm-0.91beta6. But I need
beta 7 because with beta 6 I'm not being able to remove a deactivated
logical volume:

[root@softmachine linux]# lvremove /dev/datavg/datalv
lvm -- Module successfully initialized
lvremove -- can't remove logical volume in inactive volume group "datavg"

[root@softmachine linux]# lvremove -f /dev/datavg/datalv
lvremove -- can't remove logical volume in inactive volume group "datavg"

[root@softmachine linux]#

There are no messages in /var/log/kernel/*.

I'm running Mandrake Linux 7.2 with pristine 2.4.3+ext2resize+lvm-0.91beta7.
The errors occur regardless of application of ext2resize or not.

What could be wrong?

TIA,

Paulo Afonso Graner Fessel
Suporte de Sistemas
OptiGlobe Telecom, Ltda. - The Internet Lives Here
R.Bento Branco de Andrade Filho, 621
S=EF=BF=BDo Paulo, SP, 04757-000
Brasil
http://www.optiglobe.com.br

Tel.:+55 11 3365-4478
Fax:+55 11 3365-4445
Cel.:+55 11 9198-9985
E-mail: paulo_fessel@optiglobe.com.br
