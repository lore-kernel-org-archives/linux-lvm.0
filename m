Return-Path: <austin@coremetrics.com>
Date: Tue, 22 May 2001 15:25:02 -0500 (CDT)
From: Austin Gonyou <austin@coremetrics.com>
Subject: Re: [linux-lvm] Snapshotting concatenated devices.
In-Reply-To: <Pine.LNX.4.30.0105221204020.5395-100000@shells.valinux.com>
Message-ID: <Pine.LNX.4.33.0105221523150.16636-100000@UberGeek.coremetrics.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Have you tried to fsck that fs? It sounds like a similar problem I'm
having with resizing volumes and XFS. It's not an XFS issue, a single
drive resize with xfs_growfs works fine, but when resizing a volume to
make it bigger, then trying to grow the FS, I get a FS corrupted
error.(990). That said, running xfs_repair FS shows that the superblock is
in a different place and it repairs it and I can move on.

-- 
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-796-9023
email: austin@coremetrics.com

On Tue, 22 May 2001, Jay Weber wrote:

> Hi folks,
>
> Here's an odd one for you.  When using concatenated logical volumes (an
> LV that consists of multiple PVs in the VG) snapshots don't appears to be
> proper after they are taken.  It doesn't generate any errors when the
> snapshot is performed.  But, if you dumpe2fs or attempt to mount the
> snapshot it doesn't see the filesystem superblock, etc.
>
> To expand on this a bit further, the above isn't always true.  It only
> seems to occur when I use a larger volume which uses larger extent sizes.
> The larger volume in total consists of about 400G in the VG.  So, for
> example, I create an LV of 350G and leave myself 50G for snapshot
> purposes.
>
> It does work properly for me using my memorystick, which is a total of 16M
> and I use an extent size of 1M.
>
> In both cases I just make two partitions on the underlying device and
> concat them into the one VG.
>
> Lastly, in the case where snapshots aren't readable after being created,
> there is one step of events I can perform to make the snapshot usable
> again.  It consists of:
>
> 	umount the LV
> 	vgchange -an VG
> 	vghcnage -ay VG
> 	mount the snapshot of the LV first
> 	then mount the LV
>
> If I mount the LV first though, I end up with the unusable snapshot again.
> In the above example after the snapshot is mounted, it appears to look
> okay and appears to be functioning (COW, etc) properly.
>
> Any ideas?
>
> I haven't seen this occur on non concattenated devices.  We also seem to
> have this issue when using striped devices.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
>
