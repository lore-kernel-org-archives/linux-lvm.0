Message-ID: <20021213115014.GA15675@reti>
Mime-Version: 1.0
Content-Disposition: inline
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
Subject: [linux-lvm] New device-mapper patchset for 2.5.51
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
Date: Fri Dec 13 05:50:06 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Mailing List <linux-kernel@vger.kernel.org>, lvm-devel@sistina.com, linux-lvm@sistina.com

If anyone was experiencing problems with dm could they please try this
patchset and give me feedback.

Thanks,

- Joe



http://people.sistina.com/~thornber/patches/2.5-stable/2.5.51/2.5.51-dm-3.tar.bz2


Changes
-------

Revision 1:
  Four constants:
     DM_DIR,
     DM_MAX_TYPE_NAME,
     DM_NAME_LEN,
     DM_UUID_LEN
  
  Were being declared in device-mapper.h, these are all specific to 
  the ioctl interface, so they've been moved to dm-ioctl.h.  Nobody
  in userland should ever include <linux/device-mapper.h> so remove 
  ifdef __KERNEL guards.

Revision 2:
  An error value was not being checked correctly in open_dev().
  [Kevin Corry]

Revision 3:
  Return -ENOTBLK if lookup_device() finds the inode, but it
  is not a block device. [Cristoph Hellwig]

Revision 4:
  No need to validate the parameters if we are doing a
  REMOVE_ALL command.

Revision 5:
  check_device_area was comparing the bytes with sectors.
  [Stefan Lauterbach]

Revision 6:
  minor change for dm-strip.c. Tests for correct chunksize before it allocates
  the stripe context. [Heinz Mauelshagen]

Revision 7:
  There's a bug in the dm-stripe.c constructor failing top check if enough
  destinations are handed in. [Heinz Mauelshagen]

Revision 8:
  Give each device its own io mempool to avoid a potential
  deadlock with stacked devices.  [HM + EJT]

Revision 9:
  queue_io() was checking the DMF_SUSPENDED flag rather than the new
  DMF_BLOCK_IO flag.  This meant suspend could deadlock under load.

Revision 10:
  dm_suspend(): Stop holding the read lock around the while loop that
  waits for pending io to complete.

Revision 11:
  Add a blk_run_queues() call to encourage pending io to flush
  when we're doing a dm_suspend().

Revision 12:
  dec_pending(): only bother spin locking if io->error is going to be
  updated. [Kevin Corry]

Revision 13:
  md->pending was being incremented for each clone rather than just
  once. [Kevin Corry]

Revision 14:
  Some fields in the duplicated bio weren't being set up properly in
  __split_page(). [Kevin Corry]

Revision 15:
  Remove some paranoia in highmem.c, need to check this with Jens Axboe.

Revision 16:
  Remove verbose debug message 'Splitting page'.

Revision 17:
  o  If there's an error you still need to call bio_endio with bio->bi_size
     as the 'done' param.
  
  o  Simplify clone_endio.
  
  [Kevin Corry]

Revision 18:
  The block layer does not honour bio->bi_size when issuing io, instead
  it performs io to the complete bvecs.  This means we have to change
  the bio splitting code slightly.
  
  Given a bio we repeatedly apply one of the following three operations
  until there is no more io left in the bio:
  
  1) The remaining io does not cross an io/target boundary, so just
     create a clone and issue all of the io.
  
  2) There are some bvecs at the start of the bio that are not split by
     a target boundary.  Create a clone for these bvecs only.
  
  3) The first bvec needs splitting, use bio_alloc() to create *two*
     bios, one for the first half of the bvec, the other for the second
     half.  A bvec can never contain more than one boundary.

Revision 19:
  For large bios it was possible to look up the wrong target.  Bug
  introduced by the recent splitting changes.

Revision 20:
  The linear target was getting the start sector wrong when doing a
  dm_get_device(). [Kevin Corry]
