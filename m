Message-ID: <20021121101101.GA2725@reti>
Mime-Version: 1.0
Content-Disposition: inline
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
Subject: [linux-lvm] New stable dm patches for 2.4.19
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
Date: Thu Nov 21 04:11:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com, lvm-devel@sistina.com

New stable device-mapper patches for 2.4.19 are available:

http://people.sistina.com/~thornber/patches/2.4-stable/

Changes
-------

Revision 1:
  2.5 backport

Revision 2:
  The locking when leaving __request was broken.
  
  Split off __deferring()

Revision 3:
  s->table wasn't being set in the snapshot contructor

Revision 4:
  I don't know why dm-ioctl.c was including <linux/compatmac.h>
  rather than <asm/uaccess.h>

Revision 5:
  Four constants:
     DM_DIR,
     DM_MAX_TYPE_NAME,
     DM_NAME_LEN,
     DM_UUID_LEN
  
  Were being declared in device-mapper.h, these are all specific to 
  the ioctl interface, so they've been moved to dm-ioctl.h.  Nobody
  in userland should ever include <linux/device-mapper.h> so remove 
  ifdef __KERNEL guards.

Revision 6:
  No need to validate the parameters if we are doing a
  REMOVE_ALL command.

Revision 7:
  Fluff

Revision 8:
  Mempool version by Christoph Hellwig that holds the free objects
  in an array rather than a list.  This prevents the objects getting
  dirtied, eg, people maybe expecting them to come out of a slab with
  a particular state.

Revision 9:
  Return -ENOTBLK if lookup_device() finds the inode, but it
  is not a block device. [Cristoph Hellwig]

Revision 10:
  get_kdev() was locking _minor_lock rather than
  &_minor_lock. [Heinz Mauelshagen]
