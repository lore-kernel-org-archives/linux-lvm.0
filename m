Return-Path: <mason@suse.com>
Date: Wed, 21 Feb 2001 14:17:27 -0500
From: Chris Mason <mason@suse.com>
Subject: Re: [linux-lvm] snapshot of Reiserfs
Message-ID: <2320640000.982783047@tiny>
In-Reply-To: <200102211855.f1LItGq04889@webber.adilger.net>
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


On Wednesday, February 21, 2001 11:55:14 AM -0700 Andreas Dilger
<adilger@turbolinux.com> wrote:

>> > Given that the VFS support for the *unlockfs methods is included in
>> > 2.4.1, this should probably become something like:
>> > 
>> > /* lvm_do_lv_create calls fsync_dev_lockfs()/unlockfs() */
>> > #if LINUX_KERNEL_VERSION >= KERNEL_VERSION(2,4,1)
>> > #define     LVM_VFS_ENHANCEMENT
>> > #else
>> > /* Need to apply a kernel patch to add lockfs/unlockfs VFS methods */
>> > /* #define  LVM_VFS_ENHANCEMENT */
>> > #endif
>> > 
>> 
>> I like this idea.
> 
> Note that I thought the fsync_dev_lockfs() code was added to 2.4.1 when
> reiserfs was added.  However, it appears that only the *lockfs pointers
> were added to the super_operations, and the actual code that uses them
> was NOT added.  This means we can't do the above until fsync_dev_lockfs()
> is actually there.
> 
Yes, it would have been smarter for me to push for the entire lockfs patch
a long time ago.

>> > Also, if the sync_supers_lockfs() method is changed to call
>> > write_super() if write_super_lockfs() doesn't exist, like:
>> 
>> The fsync_dev_lockfs call does this for us, if there is no
>> write_super_lockfs provided, fsync_dev_lockfs is effectively the same as
>> calling fsync_dev.
> 
> Except that fsync_dev() calls the write_super() method, and
> fsync_dev_lockfs() only calls the write_super_lockfs() method if it
> exists - it does not call write_super() if write_super_lockfs() does not
> exist.  If it were changed as I suggest, then the two would be the same.

Hmmm, fsync_dev_lockfs should look like this:

+int fsync_dev_lockfs(kdev_t dev)
+{
+	sync_buffers(dev, 0);
+
+	lock_kernel();
+	sync_supers(dev);

        ^^^^^^^^^^^^^^^^^^

+	/* note, the FS might need to start transactions to 
+	** sync the inodes, or the quota, no locking until
+	** after these are done
+	*/
+	sync_inodes(dev);          
+	DQUOT_SYNC(dev);
+	/* if inodes or quotas could be dirtied during the
+	** sync_supers_lockfs call, the FS is responsible for getting
+	** them on disk, without deadlocking against the lock
+	*/
+	sync_supers_lockfs(dev) ;
+	unlock_kernel();
+
+	return sync_buffers(dev, 1) ;
+}
+

It is amost exactly a cut n' paste of fsync_dev, with an extra call to
sync_supers_lockfs.  It should do what fsync_dev does, even when there are
no sync_super_lockfs methods are provided.  The only reason I didn't just
call fsync_dev from fsync_dev_lockfs is because I wanted the sync_buffers
call to happen after the lockfs call ;-)

-chris
