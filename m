Message-ID: <2D0AFEFEE711D611923E009027D39F2B02F233@nasexs1.meridian-data.com>
From: Dale Stephenson <dale.stephenson@quantum.com>
MIME-Version: 1.0
Subject: [linux-lvm] OOPS in free_pages_ok, caused by locked page
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
Date: Fri Oct 11 17:26:55 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-xfs@oss.sgi.com'" <linux-xfs@oss.sgi.com>
Cc: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Using CVS XFS from back in june (2.4.18), using some LVM and extended
permission patches, but no patches of the memory system.  The processing
oopsing was an lvcreate, but lvcreate doesn't use mmap as far as I know.  At
the time the oops occurred I had one regular LVM volume and was creating the
121st snapshot of it.  I've seen the same oops under similar conditions
twice (lots of volumes), once with a cgi program and once with a userspace
daemon.  All had the same backtrace as this one pulled from kdb:

kdb> bt
    EBP       EIP         Function(args)
0xce835efc 0xc0128573 __free_pages_ok+0x53
                               kernel .text 0xc0100000 0xc0128520 0xc0128704
0xce835f04 0xc0128c0a __free_pages+0x1e (0xc180e980)
                               kernel .text 0xc0100000 0xc0128bec 0xc0128c10
0xce835f10 0xc0129085 free_page_and_swap_cache+0x35 (0xc180e980, 0x2e5000)
                               kernel .text 0xc0100000 0xc0129050 0xc012908c
0xce835f20 0xc011e04c __free_pte+0x3c (0x203a666f, 0xcf9e8390, 0xcfa85254,
0x40\179000, 0xd29f8014)
                               kernel .text 0xc0100000 0xc011e010 0xc011e054
0xce835f60 0xc011e3e0 zap_page_range+0x158 (0xcfa85254, 0x40179000,
0x196c000, \0xcfa85254, 0xce834000)
                               kernel .text 0xc0100000 0xc011e288 0xc011e488
0xce835f88 0xc01207ab exit_mmap+0xbb (0xcfa85254, 0xcfa85254)
                               kernel .text 0xc0100000 0xc01206f0 0xc0120808
0xce835f98 0xc0111018 mmput+0x3c (0xcfa85254, 0xce834000, 0x40175900, 0x0)
                               kernel .text 0xc0100000 0xc0110fdc 0xc0111038
0xce835fb0 0xc0114f0b do_exit+0x7f (0x0, 0xbffffcf8)
                               kernel .text 0xc0100000 0xc0114e8c 0xc0115050
0xce835fbc 0xc0115078 sys_wait4 (0x0, 0x1000, 0x4017763c, 0x40175900, 0x0)
                               kernel .text 0xc0100000 0xc0115078 0xc011541c
           0xc0106edb system_call+0x33
                               kernel .text 0xc0100000 0xc0106ea8 0xc0106ee0
 
kdb> page 0xc180e980
struct page at 0xc180e980
  next 0xc0365220 prev 0xc0365220 addr space 0x00000000 index 0 (offset 0x0)
  count 0 flags PG_locked PG_dirty virtual 0xe03a6000
  buffers 0x00000000

Clearly, the BUG() call was called by a locked page being freed.  I looked
around the users of __free_pages(), and most of them seem to unlock the page
before making that call [uniprocessor system, so page_cache_release()
becomes __free_pages()].
However, free_page_and_swap_cache() assumes the page is unlocked (see the
function below).

Can anyone help me out?

Thanks,
Dale Stephenson
steph@snapserver.com

free_page_and_swap_cache() follows below:

/*
 * Perform a free_page(), also freeing any swap cache associated with
 * this page if it is the last user of the page. Can not do a lock_page,
 * as we are holding the page_table_lock spinlock.
 */
void free_page_and_swap_cache(struct page *page)
{
        /*
         * If we are the only user, then try to free up the swap cache.
         *
         * Its ok to check for PageSwapCache without the page lock
         * here because we are going to recheck again inside
         * exclusive_swap_page() _with_ the lock.
         *                                      - Marcelo
         */
        if (PageSwapCache(page) && !TryLockPage(page)) {
                remove_exclusive_swap_page(page);
                UnlockPage(page);
        }
        page_cache_release(page);
}
