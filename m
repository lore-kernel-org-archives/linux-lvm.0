Subject: Re: [linux-lvm] Re: [RFLART] kdev_t in ioctls
In-Reply-To: <20020114191342.A3731@caldera.de> from
    "Christoph Hellwig"
    at Jan 14, 2002 07:13:42 PM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <E16QCHl-0002XJ-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
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
Date: Mon Jan 14 12:45:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@caldera.de>
Cc: linux-lvm@sistina.com, Alexander Viro <viro@math.psu.edu>, Linus Torvalds <torvalds@transmeta.com>, linux-kernel@vger.kernel.org

> > Glibc disagrees with you (bits/types.h):
> > 
> > typedef __u_quad_t __dev_t;             /* Type of device numbers.  */
> > 
> > We'd have to use __kernel_dev_t instead which again pulls kernel
> > headers in..
> 
> Argg.  That's also non-funny:

glibc is meant to disagree. glibc provides a virtualised dev_t to user space
so that the kernel one can be expanded in future without application
breakage.
