From: Rich Scheller <richs@dev.tivoli.com>
Message-ID: <Pine.GSO.4.21.0111300950270.5383-100000@devmail.dev.tivoli.com>
MIME-Version: 1.0
Subject: [linux-lvm] lvm-1.0.1 patch causes kernel compile errors on SPARC64
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
Date: Fri Nov 30 10:47:07 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I just tried to build a generic 2.4.16 kernel with lvm-1.0.1 patches on a
Sun Enterprise 250, following the directions in lvm_1.0.1.tar.gz.  I got
an error in the SPARC 64/32-bit ioctl conversion code.  Does anyone have
any ideas on how to proceed?  Is LVM even supported on SPARC64 platforms?

Here's the compile error:

sparc64-linux-gcc -D__KERNEL__ -I/usr/src/linux-2.4.16/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fomit-frame-pointer
-fno-strict-aliasing -fno-common -m64 -pipe -mno-fpu -mcpu=ultrasparc
-mcmodel=medlow -ffixed-g4 -fcall-used-g5 -fcall-used-g7 -Wno-sign-compare
-Wa,--undeclared-regs    -c -o ioctl32.o ioctl32.c
ioctl32.c: In function `do_lvm_ioctl':
ioctl32.c:2636: warning: assignment makes pointer from integer without a cast
ioctl32.c:2670: structure has no member named `inode'
ioctl32.c:2711: warning: assignment from incompatible pointer type
ioctl32.c:2712: structure has no member named `inode'
ioctl32.c:2719: structure has no member named `inode'
ioctl32.c:2732: structure has no member named `inode'
ioctl32.c:2611: warning: `v' might be used uninitialized in this function
make[1]: *** [ioctl32.o] Error 1
make[1]: Leaving directory `/usr/src/linux-2.4.16/arch/sparc64/kernel'
make: *** [_dir_arch/sparc64/kernel] Error 2


-- 
Rich Scheller    Build Strategy and Infrastructure Group
IBM SWG          rschelle@us.ibm.com
(Tivoli)         Voice: 512-436-8563  Tie-Line: 749-8563

    The love of Lotus Notes is the root of all evil.
