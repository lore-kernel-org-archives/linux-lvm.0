Return-Path: <mason@suse.com>
Date: Thu, 07 Dec 2000 15:56:11 -0500
From: Chris Mason <mason@suse.com>
Subject: Re: [linux-lvm] How do you mount a snapshot?
Message-ID: <24530000.976222571@coffee>
In-Reply-To: <20001207123743.B24307@ultraviolet.org>
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


On Thursday, December 07, 2000 12:37:43 -0800 Tracy R Reed
<treed@ultraviolet.org> wrote:

> So...can I or can I not use snapshots with reiserfs? The snapshot was
> taken of a currently mounted and functioning (reiserfs module
> loaded...compiled into the kernel, actually) so if I did the snapshot
> correctly there should be a filesystem there. I'm going to wipe it out
> (nothing on it but some test files) and try again with ext2 and see what
> happens. 
> 
> This should work, shouldn't it?
> 

It should work with ext2.

You can make reiserfs snapshots, but you also need to apply the
linux-2.4.0-test10-VFS-lock.patch that comes with the LVM 0.9 code.  This
adds the hooks LVM needs to ask reiserfs to make the FS consistent before
creating the snapshot.

And, you need to edit linux/drivers/block/lvm.c, and uncomment the
LVM_VFS_ENHANCEMENT #define.  This enables the LVM code that uses the hooks.

-chris
