Content-Type: text/plain; charset="us-ascii"
From: Adrian Head <ahead@bigpond.net.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E16LcO0-0006VI-00@hermes.sistina.com>
Subject: [linux-lvm] Unable to get XFS, ext3, reiserfs & LVM to coexist happily
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
Date: Tue Jan  1 21:49:02 2002
List-Id: <linux-lvm.redhat.com>
To: Linux XFS Mailing List <linux-xfs@oss.sgi.com>, linux-lvm@sistina.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hope everyone had a happy new year  :-)

I'm starting to play around with LVM with the goal of having XFS, ext3, 
reiserfs and LVM coexist nicely together.  

Has anyone been able to get , ext3, reiserfs, XFS and LVM running nicely 
together?  

A week ago I posted a problem I was having with XFS and LVM in that the 
machine would Oops if the snapshot ever overflowed:
Original post:
http://marc.theaimsgroup.com/?l=linux-lvm&m=100942205812492&w=2
My followup:
http://marc.theaimsgroup.com/?l=linux-lvm&m=100946566202294&w=2

At the time I thought I had solved the problem but upon further tests I found 
that the problems had just moved elsewhere.

What I did was to run a series of tests using the SGI, CVS kernel (for XFS) 
as the base and added the appropriate LVM patches.  The LVM patches were the 
VFS-lock patch and the lvm-1.0.1 upgrade patch.  I ran various tests like 
creating snapshots and attempting to mount them, and then if that was 
successful would then overflow the snapshot to see if there were any 
problems. (I have not attempting to test pvmove or any of the others yet.)  
Attached below is the summary from the tests.

After running all the tests I have found that there is not one case where 
ext3, reiserfs and xfs successfully coexist.  Does anyone have any 
suggestions? as I'm completely stumped at the moment.

The SGI CVS kernel is from the 26th Dec 2001 and is a 2.4.17 kernel.
The LVM source is directly from the LVM download site.
The system is based on RH7.2 with the default gcc compiler.
There were no changes of the default kernel or LVM compile flags.

If I have left out any important info please let me know.

Any ideas or suggestions would be appreciated.

Adrian

NOTE: The back traces were done in kdb and are written here in shorthand only 
for the moment.  
NOTE: The LVM_VFS_ENHANCEMENT in lvm.c seems to disappear when using the 
lvm-1.0.1 upgrade patch.

CVS XFS kernel & lvm Test results
============================

2.4.17-xfs
While source volume mounted:
* Can create ext3 snapshot?			| yes
* Can mount a ext3 snapshot?			| no:
	EXT3-fs: INFO: recovery required on readonly filesystem.
	EXT3-fs: write access unavailable, cannot proceed.
* Can create resierfs snapshot?			| yes
* Can mount a resierfs snapshot?		| yes
* Can create xfs snapshot?			| yes
* Can mount a xfs snapshot?			| yes
NOTE: For some reason kernel thinks xfs is resierfs when mounted without -t 
xfs!
When source & snapshot mounted:
* Cause oops when snapshot overflows?	|
 - ext3						| Cannot test
 - resierfs					| OK - Stable
 - xfs						| Oops
 btp 1207 (cp)
 lvm_snapshot_remap_block
 lvm_map
 md_make_request
 generic_makw_request
 [pagebuf]_pagebuf_page
 [pagebuf]_page_buf_page_apply
 [xfs]xlog_sync
 [xfs]xlog_state_release_iclog
 [xfs]xlog_write
 [xfs]xfs_log_write
 [xfs]xfs_trans_commit
 [xfs]xfs_create
 [xfslinvfs_common_cr
 [xfs]linvfs_create
 lookup_hash
Running process (cp)

2.4.17-xfs
 + VFS-lock
While source volume mounted:
* Can create ext3 snapshot?			| yes
* Can mount a ext3 snapshot?			| yes
* Can create resierfs snapshot?			| yes
* Can mount a resierfs snapshot?		| yes
* Can create xfs snapshot?			| yes
* Can mount a xfs snapshot?			| yes
When source & snapshot mounted:
* Cause oops when snapshot overflows?	|
 - ext3						| Oops
 btp 5 (bdflush)
 lvm_snapshot_remap_block
 lvm_map
 lvm_make_request
 submit_bh
 write_locked_buffers
 write_some_buffers
 bdflush
 kernel_thread
Running processes (bdflush, kjournald, klogd, cp)
 - resierfs					| Oops
 btp 6 (kupdated)
 lvm_snapshot_remap_block
 lvm_map
 lvm_make_request
 generic_make_request
 submit_bh
 write_locked_buffers
 write_some_buffers
 balance_dirty
 sync_supers
 sync_old_buffers
 kupdated
 kernel_thread
Running processes (kupdated, kreiserfsd, klogd)
 - xfs						| OK - Stable

2.4.17-xfs
 + lvm-1.0.1 upgrade
 (without LVM_VFS_ENHANCEMENT)
While source volume mounted:
* Can create ext3 snapshot?			| yes
* Can mount a ext3 snapshot?			| no
	EXT3-fs: INFO: recovery required on readonly filesystem.
	EXT3-fs: write access unavailable, cannot proceed.
* Can create resierfs snapshot?			| yes
* Can mount a resierfs snapshot?		| no
	resierfs: checking trasaction log (device 3a:04) ...
	clm-2076: device is readonly, unable to replay log
	Replay Failure, unable to mount
	resierfs_read_super: unable to initialize journal space
* Can create xfs snapshot?			| yes
* Can mount a xfs snapshot?			| yes
When source & snapshot mounted:
* Cause oops when snapshot overflows?	|
 - ext3						| Cannot test
 - resierfs					| Cannot test
 - xfs						| OK - Stable

2.4.17-xfs
 + lvm-1.0.1 upgrade
 (with LVM_VFS_ENHANCEMENT)
While source volume mounted:
* Can create ext3 snapshot?			| Cannot test
* Can mount a ext3 snapshot?			| Cannot test
* Can create resierfs snapshot?			| Cannot test
* Can mount a resierfs snapshot?		| Cannot test
* Can create xfs snapshot?			| Cannot test
* Can mount a xfs snapshot?			| Cannot test
When source & snapshot mounted:
* Cause oops when snapshot overflows?	|
 - ext3						| Cannot test
 - resierfs					| Cannot test
 - xfs						| Cannot test
Note: Kernel compile dies with:
undefined reference to `fsync_dev_lockfs'
undefined reference to `unlockfs'

2.4.17-xfs
While source volume mounted:
 + VFS-lock
 + lvm-1.0.1 upgrade
 (VFS-lock patch removes LVM_VFS_ENHANCEMENT)
* Can create ext3 snapshot?			| yes
* Can mount a ext3 snapshot?			| yes
* Can create resierfs snapshot?			| yes
* Can mount a resierfs snapshot?		| yes
* Can create xfs snapshot?			| no - Oops
 btp 1356 (lvcreate)
 journal_start
 ext3_dirty_inode
 __mark_inode_dirty
 update_atime
 do_generic_file_read
 generic_file_read
 sys_read
 system_call
Running processes (lvcreate)
* Can mount a xfs snapshot?			| Cannot test
When source & snapshot mounted:
* Cause oops when snapshot overflows?	|
 - ext3						| OK - Stable
 - resierfs					| OK - Stable
 - xfs						| Cannot test
Cannot complete boot sequence (RH scripts) after attempting to create xfs
snapshot because of Oops - need to do full recovery!
 btp 154 (mount)
 send_signal
 deliver_signal
 send_sig_info
 error_code
Running processes (none)


- -- 
Adrian Head

(Public Key available on request.)

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8MoOq8ZJI8OvSkAcRArVHAJ0UkaOT2/agPlr667k/d+UAT0i2igCfedA7
3EDNqrrDDvRL7GWoBuglytk=
=GwyP
-----END PGP SIGNATURE-----
