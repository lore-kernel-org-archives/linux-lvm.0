From: Chris Mason <mason@suse.com>
Subject: RE: [linux-lvm] snapshots of busy ext2 file system corrupt
Message-Id: <3303790000.1014842549@tiny>
In-Reply-To: <2D0AFEFEE711D611923E009027D39F2B02F0C6@cdserv.meridian-data.com>
References: <2D0AFEFEE711D611923E009027D39F2B02F0C6@cdserv.meridian-data.com>
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
Date: Wed Feb 27 14:43:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com


On Wednesday, February 27, 2002 12:27:00 PM -0800 "Stephenson, Dale" <dstephenson@snapserver.com> wrote:

> Anselm Kruis writes:
> 
> [Of the VFS lock patch]
>> 
>> It deadlocks for XFS on smp under heavy writeload. I use a writeable
>> snapshot patch and replay the log afterwards.
>> 
> So if you don't have the patch, you don't have a deadlock?  I've been trying
> to track down a problem with multiple snapshots of the same volume, but the
> presence or absence of the lock patch doesn't seem to make a difference.

The slow part is in fsync_dev (and fsync_dev_lockfs), where we call
sync_buffers(dev, 0).  If there is heavy FS traffic, the buffer list
keeps refilling.

The whole thing would be much faster if the sync_buffers(dev, 0) call
were moved after the lockfs call, but that would require the filesystem
to be able to start buffer writes while the FS was locked.

For all the in-kernel filesystems, this is not a problem, but I was
assuming XFS was going to do strange things during the sync_buffers
call.
 
> 
>> I think, the VFS patch has some principal problems. Creating 
>> a snapshot
>> with the VFS-lock patch applied is more or less equivalent to 
>> unmounting 
>> the file system, creating the snapshot of the device and 
>> remounting the
>> file system. That means that all ongoing write operations must be
>> suspended until the filesystem is in a "clean" state. This can take
>> some time. Up to 15 minutes from my observations and that is 
>> way too long.
>> I think the right way is: use a jornaling file system, take a 
>> snapshot,
>> make the snapshot writeable, replay the log, make the 
>> snapshot readonly
>> and dump it to tape or whatever you want. No races, no deadlocks, no
>> problems.

There is a problem with this method, namely the FS you get after
replaying the log will not be the same FS you had at the time of
the snapshot.  Any transactions that had not been committed yet will
not be replayed.  It will be consistent, but probably not the FS you
were expecting.

-chris
