Content-Type: text/plain; charset="us-ascii"
From: Adrian Head <ahead@bigpond.net.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E16JQhG-0003WI-00@hermes.sistina.com>
Subject: [linux-lvm] Problem getting snapshots mounted for ext3 & resierfs on
 2.4.17-xfs+lvm-1.0.1
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
Date: Wed Dec 26 20:56:02 2001
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com, linux-xfs@oss.sgi.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I'm starting to play around with LVM with the goal of having XFS, ext3, 
reiserfs and LVM coexist nicely together.  

Using the latest XFS CVS + the vfs-lock patch everything seemed fine except 
if a snapshot ever got full it would oops the machine.  Because the LVM 
version in the XFS CVS is 1.0.1-rc4(ish) I decided to generate the 
appropriate 1.0.1 patch and recompile to see if this fixed the problem.  

The order of patches was:
Standard 2.4.17-xfs CVS tree
+ VFS-lock patch
+ lvm-1.0.1 self generated patch
There were no rejects

The problem I have now is that I cannot mount the snapshot - I get the 
standard "wrong fs type, bad option, bad superblock" etc..... error.  Has 
anyone with the XFS CVS kernel ever come up against this before?  This mount 
error occurs for ext3, reiserfs filesystems.  Snapshots on XFS volumes work 
fine as long as they are done with xfs_freeze.

mount command I use for ext3 & resierfs is:
mount -o ro /dev/VG/LV_SNAP /mnt/snapshot

In /var/log/messages I have:
reiserfs: checking transaction log (device 3a:04) ...
clm-2076: device is readonly, unable to reply log
Replay Failure, unable to mount
reiserfs_read_super: unable to initialize journal space
......
EXT3-fs: INFO: recovery required on readonly filesystem
EXT3-fs: write access unavailable, cannot proceed
EXT3-fs: lvm(58,4): could't mount because of unsupported optional features (4)

It appears that the VFS-lock patch is not doing its stuff.

This is on a RH7.2 base install using the SGI XFS CVS kernel (obtained 
20011226)

Are there any tricks I should be using?  Any help appreciated.

2.4.17-xfs  with lvm-1.0.1-rc4(ish)
* When the snapshot became full - instead of nicely disabling it - it would 
oops the kernel.
Using kdb it appeared that kswapd was where the problem occured.
A shorthand trace on kswapd gave:
lvm_snapshot_remap_block
lvm_map
lvm_make_request_fn
generic_make_request
submit_bh
sync_page_buffers
try_to_free_buffers
kerel_thread

Thanks

- -- 
Adrian Head

(Public Key available on request.)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8Ko488ZJI8OvSkAcRAlggAJ9jryDPxDOmkrHEDXRISim5n/l5OwCfYfe3
UJ01pWubqOHoR3X6uAU+a2E=
=rkcN
-----END PGP SIGNATURE-----
