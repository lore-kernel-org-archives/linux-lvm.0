From: Max Kalika <max+lists.lvm-dev@lsit.ucsb.edu>
Subject: Re: [linux-lvm] LVM2 strangeness.
Message-ID: <1263569343.1054370235@[192.168.23.5]>
In-Reply-To: <20030530075602.GB445@fib011235813.fsnet.co.uk>
References: <17160000.1054244981@valkyrie.lsit.ucsb.edu>
 <20030530075602.GB445@fib011235813.fsnet.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Sat May 31 10:34:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Quoting Joe Thornber <thornber@sistina.com>:

> On Thu, May 29, 2003 at 02:49:41PM -0700, Max Kalika wrote:
>>   May 29 14:14:15 butters invalidate: busy buffer
> 
> This is due to us trying to flush the LVM metadata writes to a device
> that also contains a mounted filesystem, it should only happen when
> you change your LVM configuration (eg, take another snapshot).  We're
> using O_DIRECT in the next release, so they will go away soon.

Quick followup and a correction to my previous statement.  I do in fact
change an LVM config: When rsyncing some files to the backup box itself (as
it is easier to have ALL the files in one place -- I know it's silly)  I
create a snapshot of one of the partitions, mount it, rsync the snapshot,
unmount, and remove the snapshot.  It seems that during this time is when I
get all the busy buffer errors and sometimes worse.  Yesterday this caused
the box to stop being able to write to ALL LVM partitions and the process
list shows the following:

root         4     1  0 May30 ?        00:00:14 [kswapd] <defunct>
root         5     1  0 May30 ?        00:00:00 [bdflush] <defunct>

I'm going to turn off snapshotting for now and see if things become more
stable.

Perhaps I also don't quite understand how snapshots are supposed to work.
Is one supposed to stop all the daemons that are writing to a target volume
before a snapshot can be created?  Are "online" snapshots not the intent of
this system?

---max kalika
--max@lsit.ucsb.edu
-lsit systems administrator
