Return-Path: <lord@sgi.com>
Message-Id: <200105220105.f4M15Oj06924@jen.americas.sgi.com>
In-Reply-To: Message from Dale Stephenson <Steph@connex.com> 
   of "Mon, 21 May 2001 14:47:50 PDT." <B14BF8753E65D211ABCA00104B301EF501C02B92@cairn-gorm.cragtech.com> 
Date: Mon, 21 May 2001 20:05:24 -0500
From: Steve Lord <lord@sgi.com>
Subject: [linux-lvm] Re: LVM writeable snapshot patch for use with XFS
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dale Stephenson <Steph@connex.com>, "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

I should add that all the code I posted as a patch last week for freezing
XFS for snapshotting is now incorporated into the XFS development tree.

One reason for Dale doing this is that an XFS filesystem contains a uuid
(in several places) which is checked by mount and compared against the
uuid of all mounted xfs filesystems on a machine. Duplicate uuids are
not allowed - this is for preventing two mounts of the same filesystem
via alternate hardware paths. The only way to fix this on linux is to
use an admin command to change the uuid of the snapshot.

Steve

> Here is a replacement for the writeable snapshot patch I posted earlier to
> these lists.  Its intended use is for changing the UUID on an XFS snapshot
> so the snapshot can be mounted at the same time as the original.  This patch
> is for beta 7 (the one I posted last week was beta 3) and doesn't have a bug
> the earlier patch did.
> 
> A patch for lvchange follows the lvm.c patch, as snapshots are still created
> read-only and must be changed to writable through lvchange.  This patch is
> against an older version, but still cleanly applies to beta7 for me.
> 
> Dale J. Stephenson
> Software Engineer
> Connex, A Western Digital Company
> steph@connex.com
