From: Christoph Hellwig <hch@caldera.de>
Subject: Re: [linux-lvm] Re: [RFLART] kdev_t in ioctls
Message-Id: <20020114190834.A3473@caldera.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0201140957040.15128-100000@penguin.transmeta.com>;
    from torvalds@transmeta.com on Mon, Jan 14, 2002 at 10:01:25AM -0800
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
Date: Mon Jan 14 12:09:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: Alexander Viro <viro@math.psu.edu>, linux-kernel@vger.kernel.org

On Mon, Jan 14, 2002 at 10:01:25AM -0800, Linus Torvalds wrote:
> 
> On Mon, 14 Jan 2002, Alexander Viro wrote:
> >
> > 	Linus, at least some ioctls (e.g. lvm ones) pass kdev_t from/to
> > userland.  While the common policy with ioctls is "anything goes", this
> > kind of abuse is IMNSHO over the top.
> 
> That's completely bogus.
> 
> The good news is that the bit-for-bit representation of old kdev_t and
> "dev_t" are obviously 100% the same, so we should just make the damn thing
> be dev_t, and user land will never notice anything.

Glibc disagrees with you (bits/types.h):

typedef __u_quad_t __dev_t;             /* Type of device numbers.  */

We'd have to use __kernel_dev_t instead which again pulls kernel
headers in..

	Christoph
