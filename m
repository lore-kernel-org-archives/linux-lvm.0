Date: Mon, 10 May 1999 12:06:33 -0500 (CDT)
From: David Teigland <teigland@lcse.umn.edu>
Subject: Re: [linux-lvm] Local GFS on lvm
In-Reply-To: <37371CFE.F8B329D4@ep-ag.com>
Message-ID: <Pine.LNX.3.96.990510112517.25667E-100000@orinoco.lcse.umn.edu>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Klaus Strebel <stb@ep-ag.com>
Cc: linux-lvm@msede.com, gfs-devel@lcse.umn.edu

On Mon, 10 May 1999, Klaus Strebel wrote:

> Hi all,
> 
> has anybody got a working local gfs (without dlocks) on an lvm-volume.
> After hacking passemble i could manage to activate the pool device, but
> when i dd from it, all i get is a lvm oops (should never happen ;-)) and
> my dd hangs :-(. I tried the latest GFS from 08/05/1999.
> 
> Any ideas?
> 
> Ciao
> Klaus


The problem comes from using both pool (a very minimal volume manager) and
LVM at the same time.  Both pool and LVM need to call their own mapping
functions in ll_rw_block().  The mdmod.patch distributed with GFS allows
pool to do this, assuming pool is the only volume layer above the actual
devices.  (LVM also assumes this last I saw.)  It is conceivable to
enhance the patch to allow a more arbitrary layering of multiple volumes. 
This would also require changes to LVM to follow the generic mapping
suggested by the patch.  

However, GFS no longer requires pool if you're not using Dlocks.  You can
make a GFS filesystem on a logical volume directly by using the nolock
locking module and the -l option with mkfs_gfs.

Hope this helps,

Dave Teigland
gfs.lcse.umn.edu
