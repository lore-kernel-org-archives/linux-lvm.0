From: Eric Sandeen <sandeen@sgi.com>
In-Reply-To: <200201042349.g04Nnag26320@oss.sgi.com>
References: <200201020451.g024pPg00867@oss.sgi.com>
    <1010173926.1414.12.camel@stout.americas.sgi.com>
    <200201042349.g04Nnag26320@oss.sgi.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1010186076.1414.22.camel@stout.americas.sgi.com>
MIME-Version: 1.0
Subject: [linux-lvm] Re: Unable to get XFS, ext3, reiserfs & LVM to coexist happily
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
Date: Fri Jan  4 17:12:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Adrian Head <ahead@bigpond.net.au>
Cc: Linux XFS Mailing List <linux-xfs@oss.sgi.com>, linux-lvm@sistina.com

On Fri, 2002-01-04 at 16:49, Adrian Head wrote:

> What does your backtrace look like?  Its the ext3_dirt_inode in my backtrace 
> thats got me.  I have compiled a kernel without ext3 so will also give it a 
> run later.

No, ext3 functions do not show up for me when it oopses on snapshot
creation:

kdb> bt
    EBP       EIP         Function(args)
0xc1c2bf78 0xc013649e path_init+0x36 (0xc1c2a000)
                               kernel .text 0xc0100000 0xc0136468 0xc013659c
0xc1c2bf90 0xc01366cf __user_walk+0x2f (0xc1c2a000, 0x804f1bc)
                               kernel .text 0xc0100000 0xc01366a0 0xc01366f8
0xc1c2bfbc 0xc013381e sys_stat64+0x1a (0x8052474, 0xbfffe980, 0x40196154, 0x804f1bc, 0x3)
                               kernel .text 0xc0100000 0xc0133804 0xc0133874
           0xc0106c5b system_call+0x33
                               kernel .text 0xc0100000 0xc0106c28 0xc0106c60


It's trying to stat64 /dev/sda2, one of my lvm partitions.  I dunno why
this blows up.  :/

The code has some fastcalls & inlines around here, though, so this may
not be the most accurate.

Still looking...

-Eric

-- 
Eric Sandeen      XFS for Linux     http://oss.sgi.com/projects/xfs
sandeen@sgi.com   SGI, Inc.
