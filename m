From: Theo Van Dinter <felicity@kluge.net>
Subject: Re: [linux-lvm] removing a pv from an lv formatted xfs
Message-Id: <20020113160202.C9019@kluge.net>
References: <20020113121241.A6807@kluge.net>
    <Pine.OSX.4.33.0201141203340.387-100000@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.OSX.4.33.0201141203340.387-100000@localhost>;
    from ken@daydream.net on Mon, Jan 14, 2002 at 12:08:32PM -0800
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
Date: Sun Jan 13 15:02:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ken Savich <ken@daydream.net>
Cc: linux-lvm@sistina.com

On Mon, Jan 14, 2002 at 12:08:32PM -0800, Ken Savich wrote:
> Can I ask you, if I do add another disk, is it okay for me to add
> one that is not the same size, but big enough to deal with any data
> that may be on the bad disk? If so, what happens to the fs when I remove
> the bad disk and the lv is no longer as large as it was?

You need the LV to remain the same size.  You can add a new disk
that's diferently sized from the failing one, but it must be at least
the same size.  There's nothing you can do to shrink the FS (save for
backup/recreate/restore), but you can move the data off of the failing
disk onto another one.

> If I can just pvmove everything from the bad disk to one of the
> existing pv's, and remove it thereafter, would this work as well?

If you still have space available on the other PVs that would work fine.
Just pvmove the PEs from the failing disk to the other PVs and then remove
the failing disk from the VG.  (this is the same as adding a new disk to the
VG, doing the move, and removing the failing disk...)

Does this make sense?

> I guess this all boils down to how does xfs deal with being shrunken,
> even if there is still plenty of free space.

You can't shrink the filesystem, so you shoot yourself in the foot if you
shrink the LV that the filesystem is living on.  Don't do that. :)

-- 
Randomly Generated Tagline:
I did this 'cause Linux gives me a woody.  It doesn't generate revenue.
 (Dave '-ddt->` Taylor, announcing DOOM for Linux)
