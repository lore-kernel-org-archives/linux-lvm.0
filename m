From: Andreas Dilger <adilger@turbolabs.com>
Date: Fri, 5 Oct 2001 03:31:59 -0600
Subject: Re: [linux-lvm] pvcreate fails on a software RAID metadisk
Message-ID: <20011005033158.J31725@turbolinux.com>
References: <3BBC8B5B.1A484028@legis.state.ak.us> <3BBCBF87.5520C8F9@legis.state.ak.us> <20011004144643.B31725@turbolinux.com> <20011005103053.A2938@colombina.comedia.it>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011005103053.A2938@colombina.comedia.it>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Oct 05, 2001  10:30 +0200, Luca Berra wrote:
> On Thu, Oct 04, 2001 at 02:46:43PM -0600, Andreas Dilger wrote:
> > On Oct 04, 2001  11:59 -0800, Bill Ellis wrote:
> > > <55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
> > 
> > This is a problem - MD devices are not partitioned.  Have a look at
> > this function to see why it thinks so.
> 
> no this should be normal
> i believe the problem lies somewhere else in the damned cache
> i tested it on one of my systems, i have 4 disks and 4 md devices there
> md/0 is not detected
> md/1 to md/3 are

Well, a quick look into lvm_check_partitioned_dev.c makes me think the
whole thing is broken.  lvm_check_partitioned_dev() is only checking
if this is a block device (via lvm_get_device_type()).  If you look at
pv_get_size(), it is depending on this to return FALSE if it is not a
partitioned device type (which it never does now).

Running "cvs annotate tools/lib/lvm_check_partitioned_dev.c" shows that
"akergon" is in the hot seat now (having re-written 90% of this file).
What is probably needed is to move the unpartitioned devices code out
from lvm_check_dev() into another helper function, which can be called
from lvm_check_dev(), lvm_check_partitioned_dev(), lvm_partition_count(),
and lvm_check_whole_disk_dev().

Then lvm_check_partitioned_dev() can return FALSE if it is a whole disk
device, lvm_check_whole_disk_dev() will return TRUE, lvm_partition_count()
should probably return 1 for a whole disk device.

Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
