From: Dave Alden <alden@math.ohio-state.edu>
Message-ID: <20011214073506.A12990@math.ohio-state.edu>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Keep snapshots active for 24 hours?
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
Date: Fri Dec 14 06:33:05 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,
  I'm in the process of evaluating LVM (with XFS) for our ~500G RAID NFS
server.  I'm using hardware RAID, so I'm only using LVM is for snapshots.
My original plan was to take a snapshot around midnight everyday, run the
backup, then remove the snapshot (just as the FAQ says to :-).  However,
I'd like to offer my users the ability to have access to the previous days
snapshot (so they can easily restore an accidentally deleted file).  I don't
need all 500G (we're currently using only ~60G), so I was thinking of either
50G or 100G for the snapshot (although I only expect ~5G/day to be changed).
I was wondering what kind of performance hit would I take if I kept the
snapshot for 24 hours?
...thnx,
...dave alden
