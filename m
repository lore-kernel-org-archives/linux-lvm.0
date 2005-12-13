Subject: Re: [linux-lvm] LVM onFly features
From: "Stephen C. Tweedie" <sct@redhat.com>
In-Reply-To: <A8AB02E392149E55AC45BF7A@dhcp-2-206.wgops.com>
References: <1cbd6f830512101138t10ec4f77j217ee8830a60a97b@mail.gmail.com>
	<20051210194827.GE3103@mjk.myfqdn.de>
	<CB9E5AC681BF4CD0966C6872@dhcp-2-206.wgops.com>
	<20051210200646.GF3103@mjk.myfqdn.de>
	<A8AB02E392149E55AC45BF7A@dhcp-2-206.wgops.com>
Date: Tue, 13 Dec 2005 11:56:10 -0500
Message-Id: <1134492971.3991.9.camel@orbit.scot.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Stephen Tweedie <sct@redhat.com>

Hi,

On Sat, 2005-12-10 at 13:14 -0700, Michael Loftis wrote:

> ReiserFS has hot expansion capabilities, but no (yet?) hot shrinking 
> capabilities.  One of the reasons it has these features and ext2/3 does not 
> is because ext2/3 are very old filesystems designed on a different 
> mentality of a static filesystem.  On-line expansion of ext2 based 
> filesystems is an extremely complicated venture, it might honestly even be 
> impossible.

I guess that the code that went into fs/ext3/resize.c last year must
have been in my imagination, then. :-)  And the 

        # lvextend -L+20g /dev/ext/backup
        # ext2online /disk/backup
        
that I did 2 days ago to add another 20G to the mounted backup volume
must have been a dream... (I've used these same commands while the
backup was actively in progress in the past, too.)

Seriously, it's really no big deal to grow ext2/3 filesystems, with one
exception --- there's a single data structure, the group descriptor
table, that we're saddled with for backwards compatibility purposes
which needs to grow in-place when we add new block groups to the fs. 

Andreas Dilger did work a while ago to add pre-allocation for that
space; mkfs with "-O resize_inode" and a new hidden inode is created
with space reserved for the group descriptor table to grow into.  After
that, online resize has no trouble with ext2 on-disk format issues.

> ReiserFS has the advantage here because it doesn't necessarily pre-write 
> out a lot of filesystem meta-information (superblocks, inodes, bitmaps, 
> etc)

ext2/3 writes that metadata out in discrete block groups, so adding new
block groups to grow a fs is really very simple.  

> Ext2 resizing requires actually rewriting a lot 
> of filesystem metadata.

No; it only requires adding new metadata.  Even that troublesome group
descriptor table only needs new entries added, not existing ones
modified.  And once all the new metadata is written, a single write to
the superblock's number-of-block-groups field enables all the new space
atomically.

--Stephen
