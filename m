From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] snapshots of busy ext2 file system corrupt
Message-Id: <20020226142731.X12832@lynx.adilger.int>
References: <m28z9guz53.fsf@isnogud.escape.de>
    <20020226095919.F12832@lynx.adilger.int> <2412370000.1014745130@tiny>
    <m2bsecdouv.fsf@isnogud.escape.de> <2621690000.1014757084@tiny>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2621690000.1014757084@tiny>; from mason@suse.com on Tue,
    Feb 26, 2002 at 03:58:05PM -0500
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
Date: Tue Feb 26 15:27:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Feb 26, 2002  15:58 -0500, Chris Mason wrote:
> On Tuesday, February 26, 2002 08:28:40 PM +0100
> Urs Thuermann <urs@isnogud.escape.de> wrote:
> > Chris Mason <mason@suse.com> writes:
> >> For ext2, the best we could do would probably be a hack based on 
> >> locking the super.  As far as I know, nobody is planning on this,

It probably wouldn't be hard to do, just create a function
"ext2_write_super_lockfs()" which is a call to lock an ext2-specific
superblock semaphore and "ext2_unlockfs()" which is a call to
unlock the same semaphore.  You would then change all instances of
"lock_super()" in the ext2 code to be ext2_lock_super() which will
lock this semaphore in addition to the normal lock_super() call.

You can't just call lock_super() directly, because the write_super_lockfs()
call itself calls this, and you would instantly deadlock.

> > Some performance tests I made with ext2, ext3, and reiserfs convinced
> > me to stay with ext2.  ext3 was significantly slower than ext2 on some
> > operations (and reiserfs even worse than that).
> 
> You trade speed for safety sometimes, but you can lower the performance
> hit by mounting ext3 with -o data=writeback, and help both filesystems
> by playing with bdflush values (increment the metadata timeout up from 5
> seconds).

Well, in many cases, data=ordered is actually faster than data=writeback
because you get all of your journal I/O finished before you start writing
to the FS.  In some cases (e.g. mail spool, NFS) it is faster to have
data=journal for the same reason (because sync I/O is very fast when it
is written to the journal).

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
