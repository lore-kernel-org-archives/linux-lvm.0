From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] Keep snapshots active for 24 hours?
Message-ID: <20011214113804.I940@lynx.no>
References: <20011214073506.A12990@math.ohio-state.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011214073506.A12990@math.ohio-state.edu>; from alden@math.ohio-state.edu on Fri, Dec 14, 2001 at 07:35:06AM -0500
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
Date: Fri Dec 14 12:36:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Alden <alden@math.ohio-state.edu>
Cc: linux-lvm@sistina.com

On Dec 14, 2001  07:35 -0500, Dave Alden wrote:
>   I'm in the process of evaluating LVM (with XFS) for our ~500G RAID NFS
> server.  I'm using hardware RAID, so I'm only using LVM is for snapshots.
> My original plan was to take a snapshot around midnight everyday, run the
> backup, then remove the snapshot (just as the FAQ says to :-).  However,
> I'd like to offer my users the ability to have access to the previous days
> snapshot (so they can easily restore an accidentally deleted file).  I don't
> need all 500G (we're currently using only ~60G), so I was thinking of either
> 50G or 100G for the snapshot (although I only expect ~5G/day to be changed).
> I was wondering what kind of performance hit would I take if I kept the
> snapshot for 24 hours?

Well, it will basically mean [read-]write-write for all data going to the
disk.  Generally, this will not matter a huge amount unless you are doing
tons of I/O.  You could start with a large snapshot size, and then get an
idea of how much data really changes each day.  You could then actually
keep multiple snapshots if you had the space.  If you were really clever,
you could write a script which checked the free space in the snapshots
every minute, and if they had less than X PEs free, you extend the snapshot
LV to have more free space.  If you run out of free PEs, you delete the
oldest snapshot.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
