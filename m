Message-Id: <2D0AFEFEE711D611923E009027D39F2B02F0C6@cdserv.meridian-data.com>
From: "Stephenson, Dale" <dstephenson@snapserver.com>
Subject: RE: [linux-lvm] snapshots of busy ext2 file system corrupt
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
Date: Wed Feb 27 14:24:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Anselm Kruis writes:

[Of the VFS lock patch]
> 
> It deadlocks for XFS on smp under heavy writeload. I use a writeable
> snapshot patch and replay the log afterwards.
> 
So if you don't have the patch, you don't have a deadlock?  I've been trying
to track down a problem with multiple snapshots of the same volume, but the
presence or absence of the lock patch doesn't seem to make a difference.

> I think, the VFS patch has some principal problems. Creating 
> a snapshot
> with the VFS-lock patch applied is more or less equivalent to 
> unmounting 
> the file system, creating the snapshot of the device and 
> remounting the
> file system. That means that all ongoing write operations must be
> suspended until the filesystem is in a "clean" state. This can take
> some time. Up to 15 minutes from my observations and that is 
> way too long.
> I think the right way is: use a jornaling file system, take a 
> snapshot,
> make the snapshot writeable, replay the log, make the 
> snapshot readonly
> and dump it to tape or whatever you want. No races, no deadlocks, no
> problems.
> 
Except that it's a lot more steps :->.  I only wrote a writable snapshot
patch because I wanted to use XFS with snapshots and they didn't have the
nouuid,norecovery mount options at the time.  Is there any difference
between doing the replay and just mounting norecovery?

Dale Stephenson
steph@snapserver.com
