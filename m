From: Bradley M Alexander <storm@tux.org>
Message-ID: <20021106221445.GB32597@sonsofthunder.yi.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] super.c failing in kernel compile
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
Date: Wed Nov  6 16:15:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

I have successfully rebuilt my system after the issues a couple of weeks
ago, and am trying to recompile the kernel with LVM support.

I am using Debian's kernel source 2.4.19 with lvm-1.0.6. The compile stops
with 

gcc -D__KERNEL__ -I/usr/src/kernel-source-2.4.19/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686
-malign-functions=4    -nostdinc -I
/usr/lib/gcc-lib/i386-linux/2.95.4/include -DKBUILD_BASENAME=super  -c -o
super.o super.c
super.c: In function `unlockfs':
super.c:520: `mount_sem' undeclared (first use in this function)
super.c:520: (Each undeclared identifier is reported only once
super.c:520: for each function it appears in.)
make[3]: *** [super.o] Error 1

Am I missing a package I needed? How do I fix this so I can get the kernel
compiled and get on with restoring from backups?

Thanks,
--Brad
