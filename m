Return-Path: <tomlins@cam.org>
From: Ed Tomlinson <tomlins@cam.org>
Date: Mon, 30 Apr 2001 00:31:29 -0400
References: <688980000.988595283@tiny> <01043000231400.00694@oscar>
In-Reply-To: <01043000231400.00694@oscar>
MIME-Version: 1.0
Message-Id: <01043000312901.00694@oscar>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Re: [reiserfs-list] mounting reiserfs snapshot fails
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
To: Chris Mason <mason@suse.com>, reiserfs-list@namesys.com
Cc: linux-lvm@sistina.com

On Monday 30 April 2001 00:23, Ed Tomlinson wrote:

> > The bug is that reiserfs needs to try harder to wait for the current
> > transaction to end.  A slight change in the semantics there didn't get
> > carried into the reiserfs write_super_lockfs call (reiserfs_block_writes
> > used to be enough on its own).
> >
> > But, it only hits when LVM can create the snapshot faster than the next
> > reiserfs writer can commit the transaction, which doesn't happen often
> > for me.
>
> This is not fixing the problem here.  What else do you need to figure this
> one out?  I did verify that I built from souce with both the fix VFS
> locking the the reiserfs fix applied.  Symptoms remain the same,
> debugreiserfs is still finding a null block where it expects the sb.

Some more info.  

If I use: lvcreate -L1G -s -n snap /dev/lv/root /dev/hdg1
the snapshoot is corrupt

if I use: lvcreate -L1G -s -n snap /dev/lv/root /dev/hde1
the snapshoot works

The difference being that /dev/lv/root is on /dev/hde1.  hdg1 is basicly
empty right now.  Suspect there is still race in this process.

Ed
