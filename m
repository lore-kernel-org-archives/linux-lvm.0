Return-Path: <lda@winux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <14993.17840.666402.870140@nv.winux.com>
Date: Mon, 19 Feb 2001 11:11:28 -0500
From: lvm@winux.com
Subject: [linux-lvm] snapshot of Reiserfs
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

I am using LVM 0.9.1 beta 4 on Linux 2.4.1 with Reiserfs.

Snapshots created when the filesystem is active cannot be mounted.
If I `umount' the filesystem before creating the snapshot, all is well.

I searched the mailing list archives and found a thread that dealt
with this problem on Linux 2.4.0 by applying a patch that flushed
the buffers before creating the snapshot:

  http://lists.sistina.com/pipermail/linux-lvm/2000-December/005512.html

This is clearly the problem I'm seeing.

Is there a comparable patch for 2.4.1?

Will the fix become "standard" in 2.4.2
so that patching is no longer necessary?

Larry
