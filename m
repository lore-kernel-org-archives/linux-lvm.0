Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m3B19QQK017229
	for <linux-lvm@redhat.com>; Thu, 10 Apr 2008 21:09:26 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1Jk7le-0004D5-28
	for linux-lvm@redhat.com; Fri, 11 Apr 2008 02:09:26 +0100
Date: Fri, 11 Apr 2008 02:09:26 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20080411010925.GP2572@agk.fab.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] lvm2 release 2.02.34
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I've uploaded lvm2 2.02.34 to ftp://sources.redhat.com/pub/lvm2/ .

It's a couple of months since the last release and some core functionality has
been tweaked, so I won't be surprised if new bugs have crept in - please
give it some testing!

The most significant changes were aimed at beginning to improve the
performance of the some of the tools by reducing the number of times
they go out to disk to read metadata.

The test suite (in the test subdirectory) is also advancing nicely.

Changelog
---------
  Improve preferred_names lvm.conf example.
  Fix vgdisplay 'Cur LV' field to match lvdisplay output.
  Fix lv_count report field to exclude hidden LVs.
  Add vg_is_clustered() helper function.
  Fix vgsplit to only move hidden 'snapshotN' LVs when necessary.
  Update vgsplit tests for lvnames on the cmdline.
  Update vgsplit man page to reflect lvnames on the cmdline.
  Update vgsplit to take "-n LogicalVolumeName" on the cmdline.
  Use clustered mirror log with pvmove in clustered VGs, if available.
  Fix some pvmove error status codes.
  Fix vgsplit error paths to release vg_to lock.
  Indicate whether or not VG is clustered in vgcreate log message.
  Mention default --clustered setting in vgcreate man page.
  Add config file overrides to clvmd when it reads the active LVs list.
  Fix vgreduce to use vg_split_mdas to check sufficient mdas remain.
  Add (empty) orphan VGs to lvmcache during initialisation.
  Fix orphan VG name used for format_pool.
  Create a fid for internal orphan VGs.
  Update lvmcache VG lock state for all locking types now.
  Fix output if overriding command_names on cmdline.
  Add detection of clustered mirror log capability.
  Add check to vg_commit() ensuring VG lock held before writing new VG metadata.
  Add validation of LV name to pvmove -n.
  Make clvmd refresh the context correctly when lvm.conf is updated.
  Add some basic internal VG lock validation.
  Add per-command flags to control which commands use the VG metadata cache.
  Fix vgsplit locking of new VG (2.02.30).
  Avoid erroneous vgsplit error message for new VG. (2.02.29)
  Suppress duplicate message when lvresize fails because of invalid vgname.
  Cache VG metadata internally while VG lock is held.
  Fix redundant lvresize message if vg doesn't exist.
  Fix another allocation bug with clvmd and large node IDs.
  Add find_lv_in_lv_list() and find_pv_in_pv_list().
  Fix uninitialised variable in clvmd that could cause odd hangs.
  Add vgmerge tests.
  Add pvseg_is_allocated() for identifying a PV segment allocated to a LV.
  Add list_move() for moving elements from one list to another.
  Add 'is_reserved_lvname()' for identifying hidden LVs.
  Correct command name in lvmdiskscan man page.
  clvmd no longer crashes if it sees nodeids over 50.
  Fix potential deadlock in clvmd thread handling.
  Refactor text format initialisation into _init_text_import.
  Escape double quotes and backslashes in external metadata and config data.
  Add functions for escaping double quotes in strings.
  Rename count_chars_len to count_chars.
  Use return_0 in a couple more places.
  Correct a function name typo in _line_append error message.
  Include limits.h in clvmd so it compiles with newer headers.
  Add VirtIO disks (virtblk) to filters.
  Fix resetting of MIRROR_IMAGE and VISIBLE_LV after removal of LV. (2.02.30)
  Fix remove_layer_from_lv to empty the LV before removing it. (2.02.30)
  Add missing no-longer-used segs_using_this_lv test to check_lv_segments.
  Remove redundant non-NULL tests before calling free in clvmd.c.
  Avoid a compiler warning: make is_orphan's parameter const.
  Fix lvconvert detection of mirror conversion in progress. (2.02.30)
  Avoid automatic lvconvert polldaemon invocation when -R specified. (2.02.30)
  Fix 'pvs -a' to detect VGs of PVs without metadata areas.
  Divide up internal orphan volume group by format type.
  Update usage message for clvmd.
  Fix clvmd man page not to print <br> and clarified debug options.
  Fix lvresize to support /dev/mapper prefix in the LV name.
  Fix unfilled parameter passed to fsadm from lvresize.
  Update fsadm to call lvresize if the partition size differs (with option -l).
  Fix fsadm to support VG/LV names.

Alasdair
-- 
agk@redhat.com
