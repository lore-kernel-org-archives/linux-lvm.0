From: Eric Sandeen <sandeen@sgi.com>
In-Reply-To: <200201020451.g024pPg00867@oss.sgi.com>
References: <200201020451.g024pPg00867@oss.sgi.com>
Content-Type: multipart/mixed; boundary="=-3JA8M45IzWcayTxBRmV3"
Message-Id: <1010615039.17321.2.camel@stout.americas.sgi.com>
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
Date: Wed Jan  9 16:25:01 2002
List-Id: <linux-lvm.redhat.com>
To: Adrian Head <ahead@bigpond.net.au>
Cc: Linux XFS Mailing List <linux-xfs@oss.sgi.com>, linux-lvm@sistina.com

--=-3JA8M45IzWcayTxBRmV3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2002-01-01 at 21:51, Adrian Head wrote:

> I'm starting to play around with LVM with the goal of having XFS, ext3, 
> reiserfs and LVM coexist nicely together.  
> 
> Has anyone been able to get , ext3, reiserfs, XFS and LVM running nicely 
> together?  

This patch, on top of xfs cvs (2.4.17-xfs), with the LVM 1.0.1 upgrade
patch applied, then the VFS lock patch, works for me.  Note that this is
stolen from the 1.0.1rc4(ish) version of LVM in Linus' kernel.  It uses
the built-in blocks from lv_snap->lv_iobuf->blocks rather than declaring
a new chunk of blocks.

I tested snapshot creation & overflow with ext2, ext3, reiser, and xfs. 
I have not looked closely enough to see why xfs breaks w/o this patch,
and why it works with it, but... give it a shot.

-Eric

-- 
Eric Sandeen      XFS for Linux     http://oss.sgi.com/projects/xfs
sandeen@sgi.com   SGI, Inc.

--=-3JA8M45IzWcayTxBRmV3
Content-Disposition: attachment; filename=lvm-1.0.1-xfs-fix.patch
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=ISO-8859-1

--- lvm-snap.c	Wed Jan  9 16:10:01 2002
+++ /localhome/eric/lvm-1.0.1-works/lvm-snap.c	Wed Jan  9 16:07:52 2002
@@ -349,7 +349,6 @@
 	unsigned long phys_start;
 	int idx =3D lv_snap->lv_remap_ptr, chunk_size =3D lv_snap->lv_chunk_size;
 	struct kiobuf * iobuf;
-	unsigned long blocks[KIO_MAX_SECTORS];
 	int blksize_snap, blksize_org, min_blksize, max_blksize;
 	int max_sectors, nr_sectors;
=20
@@ -400,19 +399,19 @@
=20
 		iobuf->length =3D nr_sectors << 9;
=20
-		if (!lvm_snapshot_prepare_blocks(blocks, phys_start,
+		if (!lvm_snapshot_prepare_blocks(iobuf->blocks, phys_start,
 						 nr_sectors, blksize_org))
 			goto fail_prepare;
=20
-		if (__brw_kiovec(READ, 1, &iobuf, org_phys_dev, blocks,
+		if (__brw_kiovec(READ, 1, &iobuf, org_phys_dev, iobuf->blocks,
 				 blksize_org, lv_snap) !=3D (nr_sectors<<9))
 			goto fail_raw_read;
=20
-		if (!lvm_snapshot_prepare_blocks(blocks, snap_start,
+		if (!lvm_snapshot_prepare_blocks(iobuf->blocks, snap_start,
 						 nr_sectors, blksize_snap))
 			goto fail_prepare;
=20
-		if (__brw_kiovec(WRITE, 1, &iobuf, snap_phys_dev, blocks,
+		if (__brw_kiovec(WRITE, 1, &iobuf, snap_phys_dev, iobuf->blocks,
 				 blksize_snap, lv_snap) !=3D (nr_sectors<<9))
 			goto fail_raw_write;
=20

--=-3JA8M45IzWcayTxBRmV3--
