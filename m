Message-ID: <3957E4B8.99CC906C@inet.net.nz>
Date: Tue, 27 Jun 2000 11:18:16 +1200
From: Dale Kemp <dale@inet.net.nz>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: IBM to release LVM Technology to the Linux
References: <299BF5F5EF5ED31196760008C7D9AE5D03AFCA1F@STLABCEXG022>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "Wilson, Eric" <Eric.Wilson@anheuser-busch.com>
Cc: Linux LVM mailing list <linux-lvm@msede.com>

"Wilson, Eric" wrote:

> I have to agree with Dale on this. So far the Linux LVM implementation seems
> less than "Enterprise server mission critical." I don't mean to seem harsh or
> negative, but my person life mission is to replace NT with Linux in every
> instance possible. To widen the usage of Linux, Linux MUST be seen as reliable,
> mission critical, but also easy to get it that way and keep it that way. (for
> the point and click boys)
>
> I will openly admit to being in love with the AIX LVM. the reasons are really
> quite simple: A database server running several Terabytes of data can easily be
> massaged without  fear of screwup or failure. The LINUX LVM must adhere to these
> same all or nothing, rock solid philosophies to crush Microsoft.
>
> I realize I'm preaching to the choir, but Dale's primary premise holds true: To
> get Linux and it's LVM out of the Uni. or LAB and into the Enterprise
> datacenter; it must be foolproof.

Hi Eric,

I think you mean "Ben" not "Dale" in the above reply? You could just as easily
apply your "Enterprise server mission critical" badge to the whole on Linux, but
the facts are Linux is moving into these areas even with the "Uni. or LAB"
development process. I agree with everything else you say, stability is one of the
main things that Linux has over NT. I've used NT for a short period of time and
it wasn't a pleasant experience, it crashed four times just trying to install it.
And
people treat this as a "enterprise level" system !?!

Looking at the Linux VFS (Virtual FileSystem) seems to show up some problems,
for example I was more than surprised to find a big union with all the inode types
from every kind of filesystem in Linux. And yet there is still a call to register a
filesystem
with VFS. VFS is certainly not abstract. Any good OO programmer would have never
done it this way. Maybe we need SGIs Irix/vfs system more than we
need their XVM. See the white paper at SGI - "Porting the SGI XFS
File System to Linux", for more on this.
Linux VFS should know nothing about other filesystems until its told about them,
for example when you insert a filesystem module into the kernel.
[ Sorry this is a bit off topic for this list, but I feel its still important
to the overall linux filesystem itself. ]

From File: fs.h

struct inode {
        struct list_head        i_hash;
        struct list_head        i_list;
        struct list_head        i_dentry;

        unsigned long           i_ino;
        unsigned int            i_count;
        kdev_t                  i_dev;
        umode_t                 i_mode;
        nlink_t                 i_nlink;
        uid_t                   i_uid;
        gid_t                   i_gid;
        kdev_t                  i_rdev;
        loff_t                  i_size;
        time_t                  i_atime;
        time_t                  i_mtime;
        time_t                  i_ctime;
        unsigned long           i_blksize;
        unsigned long           i_blocks;
        unsigned long           i_version;
        struct semaphore        i_sem;
        struct semaphore        i_zombie;
        struct inode_operations *i_op;
        struct file_operations  *i_fop; /* former ->i_op->default_file_ops */
        struct super_block      *i_sb;
        wait_queue_head_t       i_wait;
        struct file_lock        *i_flock;
        struct address_space    *i_mapping;
        struct address_space    i_data;
        struct address_space    i_data;
        struct dquot            *i_dquot[MAXQUOTAS];
        struct pipe_inode_info  *i_pipe;
        struct block_device     *i_bdev;

        unsigned long           i_state;

        unsigned int            i_flags;
        unsigned char           i_sock;

        atomic_t                i_writecount;
        unsigned int            i_attr_flags;
        __u32                   i_generation;
        union {
                struct minix_inode_info         minix_i;
                struct ext2_inode_info          ext2_i;
                struct hpfs_inode_info          hpfs_i;
                struct ntfs_inode_info          ntfs_i;
                struct msdos_inode_info         msdos_i;
                struct umsdos_inode_info        umsdos_i;
                struct iso_inode_info           isofs_i;
                struct nfs_inode_info           nfs_i;
                struct sysv_inode_info          sysv_i;
                struct affs_inode_info          affs_i;
                struct ufs_inode_info           ufs_i;
                struct efs_inode_info           efs_i;
                struct romfs_inode_info         romfs_i;
                struct coda_inode_info          coda_i;
                struct smb_inode_info           smbfs_i;
                struct hfs_inode_info           hfs_i;
                struct adfs_inode_info          adfs_i;
                struct qnx4_inode_info          qnx4_i;
                struct bfs_inode_info           bfs_i;
                struct udf_inode_info           udf_i;
                struct ncp_inode_info           ncpfs_i;
                struct ncp_inode_info           ncpfs_i;
                struct proc_inode_info          proc_i;
                struct socket                   socket_i;
                struct usbdev_inode_info        usbdev_i;
                void                            *generic_ip;
        } u;
};


-- Dale.
