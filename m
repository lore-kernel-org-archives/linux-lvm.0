From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200011142240.eAEMehq12172@webber.adilger.net>
Subject: Re: [linux-lvm] LVM in shared parallel SCSI environment
In-Reply-To: <20001114170305.A27524@kevorkian.evcom.net> "from Jesse Sipprell
 at Nov 14, 2000 05:03:05 pm"
Date: Tue, 14 Nov 2000 15:40:43 -0700 (MST)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jesse Sipprell <jss@evcom.net>
Cc: Andreas Dilger <adilger@turbolinux.com>, Paul Jakma <paulj@itg.ie>, Jos Visser <josv@osp.nl>, linux-lvm@marxmeier.com

Jesse Sipprell writes:
> > Far safer to simply have a separate VG for each node, and import it on the
> > backup node when you do a failover.  Since you have to have some sort of
> > external control for the filesystems, doing the import at the same time is
> > not any more overhead.
> 
> Safer, certainly, but won't this make extending/reducing an LV problematic?
> For example, say that in 6 months from now it becomes necessary to move 100MB
> of capacity from LV0 to LV1; now per your assumption that LV0 and LV1 on are
> on separate VGs, one can only extend and/or reduce the involved VGs by this
> amount if the increment/decrement size is a multiple of the PV sizes.

I guess it depends on how your cluster is set up.  If you really need to
move that much storage from one node to another, you could simply vgreduce
the one VG by a few disks, and vgextend the other - only affecting the
two nodes you are working on, and also able to do it without taking
either VG offline and with much less risk.

This may be problematic if you have only a single giant RAID device or
similar, unless you carved the RAID into multiple logical disks of a
convenient size (e.g. 10GB or so).

For lesser amounts of storage, I assume that there is at least some
extra space within a VG on any given node.

Of course it's not quite as good as cluster LVM, but much much safer.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
