From: Andrew Morton <akpm@osdl.org>
Message-Id: <20031230034239.27950054.akpm@osdl.org>
In-Reply-To: <20031229130055.GA30647@cistron.nl>
References: <20031229130055.GA30647@cistron.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: System hangs after echo value >
 /sys/block/dm-0/queue/nr_requests
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
Date: Tue Dec 30 09:32:20 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Miquel van Smoorenburg <miquels@cistron.nl>
Cc: linux-lvm@sistina.com, linux-kernel@vger.kernel.org, Nick Piggin <piggin@cyberone.com.au>, Jens Axboe <axboe@suse.de>

Miquel van Smoorenburg <miquels@cistron.nl> wrote:
>
> If you echo a value (any value; for example the default 128) to
> /sys/block/dm-0/queue/nr_requests the shell you are in hangs.
> After about 5 seconds, the whole system hangs 100%.

hm, nice.  It does the same thing for /sys/block/md0/queue/nr-requests.

With CONFIG_DEBUG_SPINLOCK enabled we go BUG in __wake_up():

Program received signal SIGTRAP, Trace/breakpoint trap.
__wake_up (q=0xcf299e90, mode=3, nr_exclusive=1) at include/asm/spinlock.h:137
137                     BUG();
(gdb) bt
#0  __wake_up (q=0xcf299e90, mode=3, nr_exclusive=1) at include/asm/spinlock.h:137
#1  0xc02cc847 in queue_requests_store (q=0xcf299df8, page=0xe <Address 0xe out of bounds>, count=14)
    at drivers/block/ll_rw_blk.c:2843
#2  0xc02cc907 in queue_attr_store (kobj=0xcf299f68, attr=0xe, page=0xe <Address 0xe out of bounds>, 
    length=14) at drivers/block/ll_rw_blk.c:2892
#3  0xc01aa84f in flush_write_buffer (file=0xe, buffer=0xc0456100, count=14) at fs/sysfs/file.c:205
#4  0xc01aa8ac in sysfs_write_file (file=0xc0493550, buf=0xe <Address 0xe out of bounds>, count=2, 
    ppos=0xc851cf84) at fs/sysfs/file.c:233
#5  0xc016f458 in vfs_write (file=0xc0493550, buf=0x80b2d00 "128\n", count=4, pos=0xc851cf84)
    at fs/read_write.c:257
#6  0xc016f55e in sys_write (fd=14, buf=0xe <Address 0xe out of bounds>, count=14) at fs/read_write.c:293


Where queue_requests_store() does wake_up(&rl->wait[READ]);

It looks like nobody has called blk_init_queue() for this queue and the
waitqueue head is uninitialised.

No md was in use on this machine: it was simply enabled in kernel config.
