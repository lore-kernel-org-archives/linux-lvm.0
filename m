Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102212323.f1LNNqH14620@webber.adilger.net>
Subject: Re: [linux-lvm] snapshot of Reiserfs
In-Reply-To: <2320640000.982783047@tiny> from Chris Mason at "Feb 21, 2001 02:17:27
 pm"
Date: Wed, 21 Feb 2001 16:23:51 -0700 (MST)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: mason@suse.com

Chris Mason writes:
> Hmmm, fsync_dev_lockfs should look like this:
> 
> +int fsync_dev_lockfs(kdev_t dev)
> +{
> +	sync_buffers(dev, 0);
> +
> +	lock_kernel();
> +	sync_supers(dev);
>  	^^^^^^^^^^^^^^^^^^
> 
> +	/* note, the FS might need to start transactions to 
> +	** sync the inodes, or the quota, no locking until
> +	** after these are done
> +	*/
> +	sync_inodes(dev);          
> +	DQUOT_SYNC(dev);
> +	/* if inodes or quotas could be dirtied during the
> +	** sync_supers_lockfs call, the FS is responsible for getting
> +	** them on disk, without deadlocking against the lock
> +	*/
> +	sync_supers_lockfs(dev) ;
> +	unlock_kernel();
> +
> +	return sync_buffers(dev, 1) ;
> +}

Some overhead in calling sync_supers() and sync_supers_lockfs() because
they do both do the same list traversal.  Granted, on most systems the
total number of superblocks is small...  Last time I had a look at this,
I suggested that the sync_supers_lockfs() call be changed, namely that
it is illegal to call it with a zero "dev" parameter, otherwise you
will lock all filesystems and that may be a bad thing.  This simplifies
the code a bit.  If we also have it call write_super() if write_super_lockfs()
is missing, it is better yet.

> It is amost exactly a cut n' paste of fsync_dev, with an extra call to
> sync_supers_lockfs.  It should do what fsync_dev does, even when there are
> no sync_super_lockfs methods are provided.  The only reason I didn't just
> call fsync_dev from fsync_dev_lockfs is because I wanted the sync_buffers
> call to happen after the lockfs call ;-)

And the reason for this is?  The first call to sync_buffers doesn't wait
on completion (unlike the second sync_buffers call), so there is no
guarantee that they are all written out.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
