Return-Path: <anders@schlund.de>
Date: Sat, 28 Jul 2001 18:27:41 +0200
From: Anders Henke <anders@schlund.de>
Message-ID: <20010728182741.S13121@schlund.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] rw-snapshot as an addition for lvm
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

Hi,

Currently, you take a snapshot from a logical volume and define a bufferlimit
after which the snapshot becomes invalid. As long as this limit has not
been reached, the snapshot is mountable as a readonly device.

Since journaled filesystems see a unclean fs, they do want to replay
their journal - which currently fails if the fs has not been prepared for
exactly this case where their unclean fs resides on a readonly-volume.


I think it's also quite interesting to have a rw-snapshot in which changes
of both real and snapshot are being written to a smaller bufferspace on disk:
the snapshot always represents the state of the LV when taking the snapshot,
but permits changes on 'its copy'.

However, if you're changing data on snapshot or original lv, this bufferspace
has to be used to keep the snapshot 'old' (to the time of snapshotting the lv)
as well as current (when you're writing to your snapshot). When the bufferspace
fills up, the snapshot has to return a 'disk full'-error at some point and
finally becomes invalid when too much data has been altered.

With such a function you might 
-replay a journaled fs without changes for the journaled fs.
 So if I want to use a snapshot for backup, I don't have to
 take down the fs before snapshotting it or applying patches
 to a kernel release you don't yet prefer on your systems.

-put a snapshotted database back online and perform e.g. perform
 additional integrity checks (if the system really came down clean before
 the snapshot has been performed or you've just a bad timing) before doing
 a tape backup of the snapshots files.

-doing 'critical' or development work on a testbed without altering the
 original system, e.g. test if e2fsck will unlink your critical files or
 you'd better try to copy them from the unclean fs.
 Or just to learn 'how can I manually try to recover this system in case
 the vendor-supplied check fails'.

What do you think about such a system?


Anders
-- 
Schlund + Partner AG              System Administration and Security
Erbprinzenstrasse 4-12            v://49.721.91374.50
D-76133 Karlsruhe                 f://49.721.91374.212
