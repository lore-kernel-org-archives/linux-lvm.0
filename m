Return-Path: <root@srv.sistina.com>
Date: Mon, 30 Apr 2001 16:03:35 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: [mason@suse.com: [linux-lvm] Re: VFS locking patch fails on 2.4.4] 
Message-ID: <20010430160335.G19810@sistina.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Thanks Chris for the patch!

Cheers,
Heinz

On Sun, Apr 29, 2001 at 09:53:58PM -0400, Chris Mason wrote:
> 
> The only rejects were in fs.h, but here is a new patch against 2.4.4
> 
> diff -Nru a/drivers/md/lvm.c b/drivers/md/lvm.c
> --- a/drivers/md/lvm.c	Sun Apr 29 20:48:50 2001
> +++ b/drivers/md/lvm.c	Sun Apr 29 20:48:50 2001
> @@ -207,7 +207,7 @@
>  #define LOCAL_END_REQUEST
>  
>  /* lvm_do_lv_create calls fsync_dev_lockfs()/unlockfs() */
> -/* #define	LVM_VFS_ENHANCEMENT */
> +#define	LVM_VFS_ENHANCEMENT
>  
>  #include <linux/config.h>
>  #include <linux/module.h>
> diff -Nru a/fs/buffer.c b/fs/buffer.c
> --- a/fs/buffer.c	Sun Apr 29 20:48:50 2001
> +++ b/fs/buffer.c	Sun Apr 29 20:48:50 2001
> @@ -331,6 +331,28 @@
>  	return sync_buffers(dev, 1);
>  }
>  
> +int fsync_dev_lockfs(kdev_t dev)
> +{
> +	sync_buffers(dev, 0);
> +
> +	lock_kernel();
> +	sync_supers(dev);
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
> +
>  asmlinkage long sys_sync(void)
>  {
>  	fsync_dev(0);
> diff -Nru a/fs/super.c b/fs/super.c
> --- a/fs/super.c	Sun Apr 29 20:48:49 2001
> +++ b/fs/super.c	Sun Apr 29 20:48:49 2001
> @@ -630,6 +630,46 @@
>  	}
>  }
>  
> +/*
> + * Note: don't check the dirty flag before waiting, we want the lock
> + * to happen every time this is called.
> + */
> +void sync_supers_lockfs(kdev_t dev)
> +{
> +	struct super_block * sb;
> +
> +	for (sb = sb_entry(super_blocks.next);
> +	     sb != sb_entry(&super_blocks); 
> +	     sb = sb_entry(sb->s_list.next)) {
> +		if (!sb->s_dev)
> +			continue;
> +		if (dev && sb->s_dev != dev)
> +			continue;
> +		lock_super(sb);
> +		if (sb->s_dev && (!dev || dev == sb->s_dev))
> +			if (sb->s_op && sb->s_op->write_super_lockfs)
> +				sb->s_op->write_super_lockfs(sb);
> +		unlock_super(sb);
> +	}
> +}
> +
> +void unlockfs(kdev_t dev)
> +{
> +	struct super_block * sb;
> +
> +	for (sb = sb_entry(super_blocks.next);
> +	     sb != sb_entry(&super_blocks); 
> +	     sb = sb_entry(sb->s_list.next)) {
> +		if (!sb->s_dev)
> +			continue;
> +		if (dev && sb->s_dev != dev)
> +			continue;
> +		if (sb->s_dev && (!dev || dev == sb->s_dev))
> +			if (sb->s_op && sb->s_op->unlockfs)
> +				sb->s_op->unlockfs(sb);
> +	}
> +}
> +
>  /**
>   *	get_super	-	get the superblock of a device
>   *	@dev: device to get the superblock for
> diff -Nru a/include/linux/fs.h b/include/linux/fs.h
> --- a/include/linux/fs.h	Sun Apr 29 20:48:50 2001
> +++ b/include/linux/fs.h	Sun Apr 29 20:48:50 2001
> @@ -1107,6 +1107,7 @@
>  extern void write_inode_now(struct inode *, int);
>  extern void sync_dev(kdev_t);
>  extern int fsync_dev(kdev_t);
> +extern int fsync_dev_lockfs(kdev_t);
>  extern int fsync_super(struct super_block *);
>  extern void sync_inodes_sb(struct super_block *);
>  extern int osync_inode_buffers(struct inode *);
> @@ -1117,6 +1118,8 @@
>  extern void filemap_fdatasync(struct address_space *);
>  extern void filemap_fdatawait(struct address_space *);
>  extern void sync_supers(kdev_t);
> +extern void sync_supers_lockfs(kdev_t);
> +extern void unlockfs(kdev_t);
>  extern int bmap(struct inode *, int);
>  extern int notify_change(struct dentry *, struct iattr *);
>  extern int permission(struct inode *, int);
> diff -Nru a/kernel/ksyms.c b/kernel/ksyms.c
> --- a/kernel/ksyms.c	Sun Apr 29 20:48:50 2001
> +++ b/kernel/ksyms.c	Sun Apr 29 20:48:50 2001
> @@ -179,6 +179,8 @@
>  EXPORT_SYMBOL(invalidate_inode_pages);
>  EXPORT_SYMBOL(truncate_inode_pages);
>  EXPORT_SYMBOL(fsync_dev);
> +EXPORT_SYMBOL(fsync_dev_lockfs);
> +EXPORT_SYMBOL(unlockfs);
>  EXPORT_SYMBOL(permission);
>  EXPORT_SYMBOL(vfs_permission);
>  EXPORT_SYMBOL(inode_setattr);
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
