Message-ID: <20021128120436.GA11436@reti>
Mime-Version: 1.0
Content-Disposition: inline
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
Subject: [linux-lvm] dm patches for 2.5.50
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
Date: Thu Nov 28 06:05:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com, lvm-devel@sistina.com
Cc: Alan Cox <alan@redhat.com>

Latest dm patches for 2.5.50 are available here:

http://people.sistina.com/~thornber/patches/2.5-stable/2.5.50/

- Joe



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
  Joe,
  
  I believe Steve and I found a bug in dm-table.c. The function open_dev()
  has the wrong check after the call to blkdev_get(). Thus, if the
  blkdev_get() call succeeds, bd_claim() is never called. Futhermore, if
  blkdev_get() fails (for instance, if you try to create a target to a
  non-existent device), bd_claim() will fail, and blkdev_put() may segfault.
  
  -- 
  Kevin Corry
  corryk@us.ibm.com
  http://evms.sourceforge.net/
  
  ==============================

Revision 3:
  Return -ENOTBLK if lookup_device() finds the inode, but it
  is not a block device. [Cristoph Hellwig]

Revision 4:
  No need to validate the parameters if we are doing a
  REMOVE_ALL command.

Revision 5:
  check_device_area was comparing the bytes with sectors.
  [Stefan Lauterbach]
