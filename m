Return-Path: <tomlins@cam.org>
From: Ed Tomlinson <tomlins@cam.org>
Date: Thu, 26 Jul 2001 08:27:38 -0400
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20010726122738.E052917573@oscar.casa.dyndns.org>
Subject: [linux-lvm] [BUG] segmentation fault on snapshot with beta8
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

Hi,

After upgrading to beta8 I tried to backup.   I do this by taking a 
snapshot and backing it up.  

oscar# lvcreate -L1G -s -n snap /dev/lv/root /dev/hda3
lvcreate -- WARNING: the snapshot will be automatically disabled once it gets full
lvcreate -- INFO: using default snapshot chunk size of 64.00 KB for "/dev/lv/snap"
lvcreate -- doing automatic backup of "lv"
lvcreate -- logical volume "/dev/lv/snap" successfully created

oscar# mount /snap
oscar# time tob -f - -full snap > snap-0725.tob
 Ok, got resource /etc/tob/tob.rc.
 Using alternative backup device -
 This is the tob script.
 About to make a full backup of volume snap.
 Building list of all files of volume snap.. patience.
 Now starting backup program to write to -.
/sbin/tob: line -142:  3954 Segmentation fault      afio $BLOCKSIZE $BUFFERBLK $GZIPFACTOR -o $BACKUPDEV <$FILELIST
  Fatal tob error: backup command failed.
 Bye.
tob -f - -full snap > snap-0725.tob  1134.65s user 153.65s system 75% cpu 28:37.45 total

tob is a wrapper script for afio that can installed from a debian
package.  The snapshotted fs is reiserfs.  I have the vfs locking
patch installed along with:

--------
diff -Nru a/fs/reiserfs/super.c b/fs/reiserfs/super.c
--- a/fs/reiserfs/super.c       Sun Apr 29 20:44:38 2001
+++ b/fs/reiserfs/super.c       Sun Apr 29 20:44:38 2001
@@ -80,7 +80,7 @@
     reiserfs_prepare_for_journal(s, SB_BUFFER_WITH_SB(s), 1);
     journal_mark_dirty(&th, s, SB_BUFFER_WITH_SB (s));
     reiserfs_block_writes(&th) ;
-    journal_end(&th, s, 1) ;
+    journal_end_sync(&th, s, 1) ;
   }
   s->s_dirt = dirty;
   unlock_kernel() ;
--------

which may or may not be needed with beta8 - without it beta7 and friends would
often fail to snapshot.  ie the lvcreate would work but mounting the lv would
fail.  The patch is from Chris Mason and was created shortly after the VFS locking
update for 2.4.4

The snapshot is unusable after the error.  Even ls gets a segfault, umount /snap hangs.
After killing it /snap is busy an cannot be umounted.  lvdisplay shows:

oscar# lvdisplay snap
--- Logical volume ---
LV Name                /dev/lv/snap
VG Name                lv
LV Write Access        read only
LV snapshot status     INACTIVE destination for /dev/lv/root
LV Status              NOT available
LV #                   5
# open                 1
LV Size                14.00 GB
Current LE             3584
Allocated LE           3584
snapshot chunk size    64.00 KB
Allocated to snapshot  100.00% [1008.00 MB/1008.00 MB]
Allocated to COW-table 16.00 MB
Allocation             next free
Read ahead sectors     120
Block device           58:4

which is strange since the snapshot, created with 1G, should take about a day to
fill (or did with beta7).

kernel is 2.4.7

Ideas?
Ed Tomlinson
