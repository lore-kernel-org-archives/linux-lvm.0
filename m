Return-Path: <joe@66bassett.freeserve.co.uk>
Date: Mon, 19 Feb 2001 16:12:26 +0000
From: Joe Thornber <joe@66bassett.freeserve.co.uk>
Subject: Re: [linux-lvm] snapshot of Reiserfs
Message-ID: <20010219161226.B1774@66bassett.freeserve.co.uk>
References: <14993.17840.666402.870140@nv.winux.com>
Mime-Version: 1.0
In-Reply-To: <14993.17840.666402.870140@nv.winux.com>; from lvm@winux.com on Mon, Feb 19, 2001 at 11:11:28AM -0500
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

On Mon, Feb 19, 2001 at 11:11:28AM -0500, lvm@winux.com wrote:
> I am using LVM 0.9.1 beta 4 on Linux 2.4.1 with Reiserfs.
> 
> Snapshots created when the filesystem is active cannot be mounted.
> If I `umount' the filesystem before creating the snapshot, all is well.
> 
> I searched the mailing list archives and found a thread that dealt
> with this problem on Linux 2.4.0 by applying a patch that flushed
> the buffers before creating the snapshot:
> 
>   http://lists.sistina.com/pipermail/linux-lvm/2000-December/005512.html
> 
> This is clearly the problem I'm seeing.
> 
> Is there a comparable patch for 2.4.1?

Try the PATCHES/linux-2.4.0-test10-VFS-lock.patch in the latest
release, it should apply ok.

- Joe
