From: "Erick Calder" <e@arix.com>
Date: Sun, 26 Aug 2001 14:36:44 -0700
Message-ID: <000e01c12e77$3382ca80$0300000a@pacbell.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.33.0108260910540.1071-100000@leopard.dorfam.ca>
Subject: [linux-lvm] troubled Guiness
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi all,

I'm running RH 7.0 (Guiness) with the 2.2.16-22 kernel and gcc-2.96-85 and
have downloaded the Linus 2.4.9 stock kernel which I'm trying to make... I
built the patch and applied it with no apparent problem but when I try to
build the kernel I get the errors in the log below.

has anyone been here before?

1k thx - e

make[2]: Leaving directory `/usr/src/linux/drivers/ide'
make -C md
make[2]: Entering directory `/usr/src/linux/drivers/md'
make all_targets
make[3]: Entering directory `/usr/src/linux/drivers/md'
gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -Wno-tri
graphs -O2 -fomit-frame-pointer -fno-strict-aliasing -fno-common -pipe -mpre
ferred-stack-boundary=2 -march=i586    -c -o lvm.o lvm.c
lvm.c:2329:71: macro "min" requires 3 arguments, but only 2 given
lvm.c:2343:59: macro "min" requires 3 arguments, but only 2 given
lvm.c: In function `__extend_reduce':
lvm.c:2329: `min' undeclared (first use in this function)
lvm.c:2329: (Each undeclared identifier is reported only once
lvm.c:2329: for each function it appears in.)
lvm.c:2280: warning: `end' might be used uninitialized in this function
lvm.c:2339: warning: `end' might be used uninitialized in this function
make[3]: *** [lvm.o] Error 1
make[3]: Leaving directory `/usr/src/linux/drivers/md'
make[2]: *** [first_rule] Error 2
make[2]: Leaving directory `/usr/src/linux/drivers/md'
make[1]: *** [_subdir_md] Error 2
make[1]: Leaving directory `/usr/src/linux/drivers'
make: *** [_dir_drivers] Error 2

-----Original Message-----
From:	linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com] On
Behalf Of gerry@dorfam.ca
Sent:	Sunday, August 26, 2001 6:21 AM
To:	linux-lvm@sistina.com
Subject:	RE: [linux-lvm] Successful Upgrade to 1.0 with RH 7.1

On Sat, 25 Aug 2001, Erick Calder wrote:

> > started with a clean Redhat 2.4.3-12 kernel
>
> I'm running a stock 7.0 version and downloaded the above-named kernel...
> patch and compilation went ok but I can't seem to make modules... I get a
> ton of errors... I realised that I needed to install the kernel-headers
for
> this version but even after that I can't make the modules... I've seen a
lot
> of other guys out there suffering with this but no solutions... I even
tried
> changing the HOSTCC to "kgcc" in the Makefile but no dice.... so I'm
> wondering what you did right... can you share?
>
> (sorry everyone else that isn't running RH)
>
Well, all I did was follow the install instructions that came with the LVM
tarball to create the patch.  I didn't do anything special.  I wasn't able
to successfully install the newly created patch until I replaced the
kernel source with a fresh "clean" rpm.

Are you running the 2.4 kernel or are you using 2.2?  That makes a big
difference as you need to add the raw.io patch to the 2.2 kernel.  Also, I
don't believe that the shipped RH kernel config enables LVM as a default.

I still have the patch for 2.4.3-12.  However, I doubt it would work for a
7.0 install since I'm using 7.1.


Gerry
--
"The lyfe so short, the craft so long to learne"  Geoffrey Chaucer


_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
