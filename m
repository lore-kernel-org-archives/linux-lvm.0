From: Christoph Hellwig <hch@caldera.de>
Subject: Re: [linux-lvm] Re: [RFLART] kdev_t in ioctls
Message-Id: <20020114191342.A3731@caldera.de>
References: <Pine.LNX.4.33.0201140957040.15128-100000@penguin.transmeta.com>
    <20020114190834.A3473@caldera.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020114190834.A3473@caldera.de>; from hch@caldera.de on Mon,
    Jan 14, 2002 at 07:08:34PM +0100
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
Date: Mon Jan 14 12:14:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: Alexander Viro <viro@math.psu.edu>, Linus Torvalds <torvalds@transmeta.com>, linux-kernel@vger.kernel.org

On Mon, Jan 14, 2002 at 07:08:34PM +0100, Christoph Hellwig wrote:
> > The good news is that the bit-for-bit representation of old kdev_t and
> > "dev_t" are obviously 100% the same, so we should just make the damn thing
> > be dev_t, and user land will never notice anything.
> 
> Glibc disagrees with you (bits/types.h):
> 
> typedef __u_quad_t __dev_t;             /* Type of device numbers.  */
> 
> We'd have to use __kernel_dev_t instead which again pulls kernel
> headers in..

Argg.  That's also non-funny:

[hch@sb linux]$ grep __kernel_dev_t; include/asm-*/posix_types.h
include/asm-alpha/posix_types.h:typedef unsigned int	__kernel_dev_t;
include/asm-arm/posix_types.h:typedef unsigned short	__kernel_dev_t;
include/asm-cris/posix_types.h:typedef unsigned short	__kernel_dev_t;
include/asm-i386/posix_types.h:typedef unsigned short	__kernel_dev_t;
include/asm-ia64/posix_types.h:typedef unsigned int	__kernel_dev_t;
include/asm-m68k/posix_types.h:typedef unsigned short	__kernel_dev_t;
include/asm-mips64/posix_types.h:typedef unsigned int	__kernel_dev_t;
include/asm-mips/posix_types.h:typedef unsigned int	__kernel_dev_t;
include/asm-parisc/posix_types.h:typedef unsigned int	__kernel_dev_t;
include/asm-ppc/posix_types.h:typedef unsigned int	__kernel_dev_t;
include/asm-s390/posix_types.h:typedef unsigned short	__kernel_dev_t;
include/asm-s390x/posix_types.h:typedef unsigned int	__kernel_dev_t;
include/asm-sh/posix_types.h:typedef unsigned short	__kernel_dev_t;
include/asm-sparc64/posix_types.h:typedef unsigned int	__kernel_dev_t;
include/asm-sparc/posix_types.h:typedef unsigned short	__kernel_dev_t;
