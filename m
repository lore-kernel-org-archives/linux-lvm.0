From: Linus Torvalds <torvalds@transmeta.com>
In-Reply-To: <Pine.GSO.4.21.0201141227260.224-100000@weyl.math.psu.edu>
Message-Id: <Pine.LNX.4.33.0201140957040.15128-100000@penguin.transmeta.com>
MIME-Version: 1.0
Subject: [linux-lvm] Re: [RFLART] kdev_t in ioctls
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
Date: Mon Jan 14 12:04:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@math.psu.edu>
Cc: linux-kernel@vger.kernel.org, linux-LVM@sistina.com

On Mon, 14 Jan 2002, Alexander Viro wrote:
>
> 	Linus, at least some ioctls (e.g. lvm ones) pass kdev_t from/to
> userland.  While the common policy with ioctls is "anything goes", this
> kind of abuse is IMNSHO over the top.

That's completely bogus.

The good news is that the bit-for-bit representation of old kdev_t and
"dev_t" are obviously 100% the same, so we should just make the damn thing
be dev_t, and user land will never notice anything.

So we can just change all structures that are exported to user land to use
"dev_t", and add the required conversion magic. Possibly by duplicating
the structure, and having "used_lvm_struct_x" and functions to read and
write them from/to user space.

> Public statement along the lines "any API that passes kdev_t values
> across the kernel boundary is unacceptable" would be a nice thing...

Consider that done. ANYTHING that exports kdev_t to user space is
incredibly broken, and will not work in a few months when the actual bit
representation (and size) will change.

Do we have any lvm people willing to fix this? (linux-lvm cc'd, but I know
they've been very silent on the 2.5.x changes so far)

		Linus
