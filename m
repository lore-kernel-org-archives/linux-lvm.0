Return-Path: <treed@ultraviolet.org>
Date: Wed, 7 Feb 2001 14:25:10 -0800
From: Tracy R Reed <treed@ultraviolet.org>
Message-ID: <20010207142510.D16262@ultraviolet.org>
References: <20010202103049.B872@66bassett.freeserve.co.uk> <Pine.LNX.4.30.0102021124370.2352-100000@tweetie.comstar.net> <20010202165642.A1955@66bassett.freeserve.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010202165642.A1955@66bassett.freeserve.co.uk>; from joe@66bassett.freeserve.co.uk on Fri, Feb 02, 2001 at 04:56:42PM +0000
Subject: [linux-lvm] Snapshots with 2.4.1?
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

On Fri, Feb 02, 2001 at 04:56:42PM +0000, Joe Thornber wrote:
> 2.4.1 hadn't been released when we made the beta3 tarball.  If you
> want to make a beta3 patch for the kernel create an empty file call
> PATCHES/fragments-2.4.1 (2.4.1 needs no extra fragments) then run
> PATCHES/make.  That should remove all the conflicts.

I need to get snapshots working with 2.4.1. I've tried using just the
straight LVM that comes with the kernel and I have tried applying the
patches as described above. I either case, when I uncomment:

#define LVM_VFS_ENHANCEMENT 

in drivers/md/lvm.c to enable the hooks for snapshots the compile fails:

drivers/md/mddev.o: In function `lvm_do_lv_create':
drivers/md/mddev.o(.text+0x11bdb): undefined reference to `fsync_dev_lockfs'
drivers/md/mddev.o(.text+0x11c90): undefined reference to `unlockfs'

Can someone point out what else I am missing?

--
Tracy Reed      http://www.ultraviolet.org
Those who do not understand Unix are condemned to reinvent it, poorly.
-- Henry Spencer
