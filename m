Message-ID: <047501c3254d$6066b880$fc6a6d0a@corp.int.digex.com>
From: "Anastasios A. Papadopoulos \(Tas\)" <vze2sjj7@verizon.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Building LVM 2 -- More information
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
Date: Wed May 28 14:13:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

----- Original Message ----- 
From: Anastasios A. Papadopoulos (Tas)
To: linux-lvm@sistina.com
Sent: Wednesday, May 28, 2003 10:42 AM
Subject: Building LVM 2


I'm having a little trouble following directions:

I'm trying to build a new kernel with 'dm'.

Should I be issuing the 'make modules modules-install' after building the
new kernel or not.  This doesn't appear in the LVM pages I've seen, but it
does appear in the Redhat documentation on rebuilding the kernel.

Thanks
Tas


I am getting the following errors during "make modules"

gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-13.8/include -Wall -Wstrict-prototy
pes
-Wno-trigraphs -O2 -fno-strict-aliasing -fno-common -fomit-frame-pointer -pi
pe -
mpreferred-stack-boundary=2 -march=i686 -DMODULE -DMODVERSIONS -include
/usr/src
/linux-2.4.20-13.8/include/linux/modversions.h  -nostdinc -iwithprefix
include -
DKBUILD_BASENAME=lvm_fs  -c -o lvm-fs.o lvm-fs.c
ld -m elf_i386 -r -o lvm-mod.o lvm.o lvm-snap.o lvm-fs.o
gcc -D__KERNEL__ -I/usr/src/linux-2.4.20-13.8/include -Wall -Wstrict-prototy
pes
-Wno-trigraphs -O2 -fno-strict-aliasing -fno-common -fomit-frame-pointer -pi
pe -
mpreferred-stack-boundary=2 -march=i686 -DMODULE -DMODVERSIONS -include
/usr/src
/linux-2.4.20-13.8/include/linux/modversions.h  -nostdinc -iwithprefix
include -
DKBUILD_BASENAME=dm  -c -o dm.o dm.c
In file included from dm.c:7:
dm.h:97: parse error before "sector_t"
dm.h:97: warning: function declaration isn't a prototype
dm.h:100: parse error before "dm_table_get_size"
dm.h:100: warning: type defaults to `int' in declaration of
`dm_table_get_size'
dm.h:100: warning: data definition has no type or storage class
dm.h:102: parse error before "sector_t"
dm.h:102: warning: function declaration isn't a prototype
dm.c: In function `dec_pending':
dm.c:319: `dm_endio_fn' undeclared (first use in this function)
dm.c:319: (Each undeclared identifier is reported only once
dm.c:319: for each function it appears in.)
dm.c:319: parse error before "endio"
dm.c:321: `endio' undeclared (first use in this function)
dm.c:322: `endio' used prior to declaration
dm.c:322: warning: implicit declaration of function `endio'
dm.c: In function `__map_buffer':
dm.c:352: dereferencing pointer to incomplete type
dm.c:365: dereferencing pointer to incomplete type
dm.c: In function `__bmap':
dm.c:484: dereferencing pointer to incomplete type
dm.c:485: dereferencing pointer to incomplete type
make[2]: *** [dm.o] Error 1
make[2]: Leaving directory `/usr/src/linux-2.4.20-13.8/drivers/md'
make[1]: *** [_modsubdir_md] Error 2
make[1]: Leaving directory `/usr/src/linux-2.4.20-13.8/drivers'
make: *** [_mod_drivers] Error 2
