From: "Steve Wray" <steve.wray@the.net.nz>
Subject: RE: [linux-lvm] Keep snapshots active for 24 hours?
Message-ID: <NBBBKLKHMJHIJLHOGAOJKELIJCAA.steve.wray@the.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-reply-to: <20011214113804.I940@lynx.no>
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
Date: Fri Dec 14 15:50:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I'd been wondering if snapshotting could be used for;

- providing 'virtual journalling' any filesystem that happens to
be on a logical volume.

- take a snapshot, install something or try something out
that might break something, then restore *directly* from
the snapshot if anything goes wrong; without having to actually
back it up to media and restore it.


> -----Original Message-----
> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of Andreas Dilger
> Sent: Saturday, 15 December 2001 07:38
> To: Dave Alden
> Cc: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] Keep snapshots active for 24 hours?
>
>
> On Dec 14, 2001  07:35 -0500, Dave Alden wrote:
> >   I'm in the process of evaluating LVM (with XFS) for our ~500G RAID NFS
> > server.  I'm using hardware RAID, so I'm only using LVM is for
> snapshots.
> > My original plan was to take a snapshot around midnight
> everyday, run the
> > backup, then remove the snapshot (just as the FAQ says to :-).  However,
> > I'd like to offer my users the ability to have access to the
> previous days
> > snapshot (so they can easily restore an accidentally deleted
> file).  I don't
> > need all 500G (we're currently using only ~60G), so I was
> thinking of either
> > 50G or 100G for the snapshot (although I only expect ~5G/day to
> be changed).
> > I was wondering what kind of performance hit would I take if I kept the
> > snapshot for 24 hours?
>
> Well, it will basically mean [read-]write-write for all data going to the
> disk.  Generally, this will not matter a huge amount unless you are doing
> tons of I/O.  You could start with a large snapshot size, and then get an
> idea of how much data really changes each day.  You could then actually
> keep multiple snapshots if you had the space.  If you were really clever,
> you could write a script which checked the free space in the snapshots
> every minute, and if they had less than X PEs free, you extend
> the snapshot
> LV to have more free space.  If you run out of free PEs, you delete the
> oldest snapshot.
>
> Cheers, Andreas
> --
> Andreas Dilger
> http://sourceforge.net/projects/ext2resize/
> http://www-mddsp.enel.ucalgary.ca/People/adilger/
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
