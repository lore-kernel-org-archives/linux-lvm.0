From: Joe Thornber <thornber@sistina.com>
Subject: Re: [linux-lvm] LVM2 strangeness.
Message-ID: <20030602101820.GD448@fib011235813.fsnet.co.uk>
References: <17160000.1054244981@valkyrie.lsit.ucsb.edu> <20030530075602.GB445@fib011235813.fsnet.co.uk> <1263569343.1054370235@[192.168.23.5]>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1263569343.1054370235@[192.168.23.5]>
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
Date: Mon Jun  2 05:17:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, May 31, 2003 at 08:37:15AM -0700, Max Kalika wrote:
> I'm going to turn off snapshotting for now and see if things become more
> stable.
> 
> Perhaps I also don't quite understand how snapshots are supposed to work.
> Is one supposed to stop all the daemons that are writing to a target volume
> before a snapshot can be created?  Are "online" snapshots not the intent of
> this system?

If you want online snapshots you should have applied the VFS patch
which tell the fs to checkpoint itself ready for the snapshot to be
taken.  If you are using a database you will have to instruct the
database to do this checkpointing yourself.

It might be worth you waiting a few days for the 2.0 release which
will have the 'invalidate busy buffer' problem fixed.

- Joe
