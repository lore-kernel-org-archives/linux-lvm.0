From: Andreas Dilger <adilger@turbolabs.com>
Message-Id: <200006270213.e5R2DIb06983@webber.adilger.net>
Subject: Re: [linux-lvm] Re: IBM to release LVM Technology to the Linux
In-Reply-To: <3957E4B8.99CC906C@inet.net.nz> "from Dale Kemp at Jun 27, 2000
 11:18:16 am"
Date: Mon, 26 Jun 2000 20:13:18 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dale Kemp <dale@inet.net.nz>
Cc: Linux LVM mailing list <linux-lvm@msede.com>

Dale writes:
> Looking at the Linux VFS (Virtual FileSystem) seems to show up some
> problems, for example I was more than surprised to find a big union
> with all the inode types from every kind of filesystem in Linux.
> And yet there is still a call to register a filesystem with VFS.
> Linux VFS should know nothing about other filesystems until its told
> about them, for example when you insert a filesystem module into the kernel.

This is a well-known issue with non-kernel linux filesystem development,
but it is not really fatal if your filesystem doesn't need a huge amount
of fs-specific data.  As long as your fs-specific data is smaller than
the largest fs-specific data (ext2), you can simply use the "generic"
pointer and overload it with your own data struct.

It was done this way originally so that inodes would be a fixed size
(so they can be re-used between filesystems) without requiring an
extra malloc for each inode, and not require an extra memory reference.
However, it would be just as easy these days to have the fs-specific
data in a slab cache and have only an pointer in the inode itself.
This would actually make some of the stacked filesystems I work with
much simpler, since you could simply keep a pointer to the underlying
fs inode data struct in your own inode data struct.

See also the current thread "Re: VFS not completely factored, and more"
in the linux-fsdevel mailing list for ideas on how to change this for 2.5.
Not only does it make the VFS more abstract, it also improves kernel
compilation because any change to ext2_fs.h will no longer cause the
recompilation of every file which includes fs.h directly or indirectly
(which seems like 50% of the kernel).

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
