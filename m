From: Alexy Khrabrov <braver@pobox.com>
Message-ID: <20030211175123.A5038@pdb-pc-6.rutgers.edu>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] enclosure separation/turnoff
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
Date: Tue Feb 11 16:55:03 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I would like to see what would be a good way to use LVM
with a bunch of external SCSI enclosures ("boxes").  I have
several of these, with the number of drives ranging
from 1 to 2 to 4 per each.  First I created a logical volume
per each box, but then realized the sizes were not exactly
matched, and now I get thrashing when trying to move stuff
from one enclosure box to another.  So the first question
is, (1) how does one create a logical volume exactly corresponding 
to an external box (a set of drives)? (2) Is it a good idea
to stripe an external box, given that data moves occur primarily
between the boxes, not within each?  Then I'd stripe each
box with the number of stripes being the number of drives in it.
(3) Is there a way to resize the logical volumes so they are 
remapped to their enclosures exactly, without reloading the
contents?  (4) To make sure my latest box is done right, I created
a new volume group for it.  Is this a good use for multiple
volume groups (other than the usual lone "system")?

Now, I wanted to temporarily turn off the external enclosures
as I didn't need their contents.  However, Linux would not boot
properly!  Even when I disable the boxes in /etc/fstab,
it fails to boot; even when I deactivate the logical volumes
corresponding to the boxes with lvchange -a n <path>
for each, and deactivate the last box with vgchange -a n <group>,
failure on boot -- can't find many standard paths!  Looks
like vgscan thinks something is still there and I get a message
"spinning sdd", while sdd is in one of the deactivated LVs,
and I'm forced to power on all of the boxes even while none
is mounted nor used.  (5) How do I achieve clean separation so
that I can shut down any or all external enclosures easily?

Cheers,
Alexy Khrabrov
