Subject: Re: [linux-lvm] Keep snapshots active for 24 hours?
References: <20011214073506.A12990@math.ohio-state.edu>
	<20011214113804.I940@lynx.no>
From: Terje Kvernes <terjekv@math.uio.no>
In-Reply-To: <20011214113804.I940@lynx.no>
Message-ID: <wxxn10lcn70.fsf@nommo.uio.no>
MIME-Version: 1.0
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
Date: Fri Dec 14 18:58:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

* Dave Alden

> I'm in the process of evaluating LVM (with XFS) for our ~500G RAID
> NFS server. I'm using hardware RAID, so I'm only using LVM is for
> snapshots. My original plan was to take a snapshot around midnight
> everyday, run the backup, then remove the snapshot (just as the FAQ
> says to :-). However, I'd like to offer my users the ability to have
> access to the previous days snapshot (so they can easily restore an
> accidentally deleted file). I don't need all 500G (we're currently
> using only ~60G), so I was thinking of either 50G or 100G for the
> snapshot (although I only expect ~5G/day to be changed). I was
> wondering what kind of performance hit would I take if I kept the
> snapshot for 24 hours?

* Andreas Dilger

> Well, it will basically mean [read-]write-write for all data going
> to the disk. Generally, this will not matter a huge amount unless
> you are doing tons of I/O. You could start with a large snapshot
> size, and then get an idea of how much data really changes each day.

  this is something I'm hoping to get done -- eventually. the idea of
  having at least a snapshot taken an hour ago will be very nice for
  our dearest tape-robot-backup-thingy. not to mention the network. :)

> You could then actually keep multiple snapshots if you had the
> space. 

  hm. this will add one extra write for every currently open snapshot,
  right? 

> If you were really clever, you could write a script which checked
> the free space in the snapshots every minute, and if they had less
> than X PEs free, you extend the snapshot LV to have more free space.
> If you run out of free PEs, you delete the oldest snapshot.

  heh. I was thinking of trying to get a snapshot taken every three
  hours or so, and storing it until the next one came about. but of
  course, you're right, I should check how much free space I have, and
  keep a backlog until I _need_ the space. 

  come to think of it, it doesn't take that complicated a shell-script
  to get this working. hm... :)

-- 
Terje - who finally gets to be with his girlfriend again, after 4
        months and 10 days... *yay*!
