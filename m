Return-Path: <mason@suse.com>
Date: Thu, 22 Feb 2001 12:12:03 -0500
From: Chris Mason <mason@suse.com>
Subject: Re: [linux-lvm] snapshot of Reiserfs
Message-ID: <2725910000.982861923@tiny>
In-Reply-To: <200102212323.f1LNNqH14620@webber.adilger.net>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com


On Wednesday, February 21, 2001 04:23:51 PM -0700 Andreas Dilger
<adilger@turbolinux.com> wrote:
> 
> Some overhead in calling sync_supers() and sync_supers_lockfs() because
> they do both do the same list traversal.  Granted, on most systems the
> total number of superblocks is small...  Last time I had a look at this,
> I suggested that the sync_supers_lockfs() call be changed, namely that
> it is illegal to call it with a zero "dev" parameter, otherwise you
> will lock all filesystems and that may be a bad thing.  This simplifies
> the code a bit.  If we also have it call write_super() if
> write_super_lockfs() is missing, it is better yet.
> 
It might be a stupid thing for the caller to do, but it should still work.
If I tried really hard, I might be able to think of some kind of clustering
deal where we wanted to checkpoint the current system and move it onto
another machine.  It would be a stretch though ;-)

>> It is amost exactly a cut n' paste of fsync_dev, with an extra call to
>> sync_supers_lockfs.  It should do what fsync_dev does, even when there
>> are no sync_super_lockfs methods are provided.  The only reason I didn't
>> just call fsync_dev from fsync_dev_lockfs is because I wanted the
>> sync_buffers call to happen after the lockfs call ;-)
> 
> And the reason for this is?  The first call to sync_buffers doesn't wait
> on completion (unlike the second sync_buffers call), so there is no
> guarantee that they are all written out.

The reason was to avoid a second call to sync_buffers that does wait on
completion....

You make some very good points.  The goal behind the existing call was to
do this:

1) flush as much as you can (inodes, supers, quotas, trigger buffer flushes)
2) ask the FS to lock itself.
3) make sure all dirty buffers are on disk

#2 might involve another set of flushes for anything that was modified
between #1 and the lock.  The FS is resonsible for this, since it might
have odd/complicated ways to figure out what is dirty (inodes under
reiserfs).

#3 is not allowed to deadlock against the FS lock, and it must go after the
lock to prevent new buffers from being dirtied after the sync.

Yes, this means scanning the list of supers twice, but I think it provides
a good mix of responsibilities between fsync_dev_lockfs call and the FS.
Any ideas on cleaning this up further are more than welcome.

-chris
