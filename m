From: Alexander Viro <viro@math.psu.edu>
In-Reply-To: <Pine.LNX.4.33.0201140957040.15128-100000@penguin.transmeta.com>
Message-Id: <Pine.GSO.4.21.0201141309270.224-100000@weyl.math.psu.edu>
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
Date: Mon Jan 14 12:21:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@transmeta.com>
Cc: linux-kernel@vger.kernel.org, linux-LVM@sistina.com


On Mon, 14 Jan 2002, Linus Torvalds wrote:

> The good news is that the bit-for-bit representation of old kdev_t and
> "dev_t" are obviously 100% the same, so we should just make the damn thing
> be dev_t, and user land will never notice anything.
> 
> So we can just change all structures that are exported to user land to use
> "dev_t", and add the required conversion magic. Possibly by duplicating
> the structure, and having "used_lvm_struct_x" and functions to read and
> write them from/to user space.

... that, BTW, would kill the crap like

typedef struct ...
	...
#ifdef __KERNEL__
        struct kiobuf *lv_iobuf;
        sector_t blocks[LVM_MAX_SECTORS];
        struct kiobuf *lv_COW_table_iobuf;
        struct rw_semaphore lv_lock;
        struct list_head *lv_snapshot_hash_table;
        uint32_t lv_snapshot_hash_table_size;
        uint32_t lv_snapshot_hash_mask;
        wait_queue_head_t lv_snapshot_wait;
        int     lv_snapshot_use_rate;
        struct vg_v3    *vg;

        uint lv_allocated_snapshot_le;
#else
        char dummy[200];
#endif
} lv_t;

Yup, structure "shared" by kernel and userland.  Look through the
include/linux/lvm.h - it's choke-full of that.  And quite a few
of them contain fields like
	struct proc_dir_entry *foo
	struct block_device *bar
	struct list_head baz
outside of these #ifdef __KERNEL__...
 
> > Public statement along the lines "any API that passes kdev_t values
> > across the kernel boundary is unacceptable" would be a nice thing...
> 
> Consider that done. ANYTHING that exports kdev_t to user space is
> incredibly broken, and will not work in a few months when the actual bit
> representation (and size) will change.
> 
> Do we have any lvm people willing to fix this? (linux-lvm cc'd, but I know
> they've been very silent on the 2.5.x changes so far)

Umm...  Is the version in main tree actually maintained?
