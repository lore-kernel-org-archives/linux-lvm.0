Message-Id: <3C67A0D3.9060803@eigner.com>
From: Klaus Strebel <klaus.strebel@eigner.com>
MIME-Version: 1.0
References: <2D0AFEFEE711D611923E009027D39F2B02F08F@cdserv.meridian-data.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: Oops unmounting snapshot of xfs filesystem
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
Date: Mon Feb 11 04:46:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Stephenson, Dale" <dstephenson@snapserver.com>
Cc: "'linux-xfs@oss.sgi.com'" <linux-xfs@oss.sgi.com>, "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Stephenson, Dale wrote:
> I have been running into an oops when umounting the snapshot of an xfs
> filesystem, or following the umount.  For instance, a umount followed by an
> lvremove will oops in the lvremove, while a mount/umount/mount/umount
> sequence will oops on the second or third umount.
> 
> What does seem consistent is the error message logged on each umount.  Here
> are the messages from a mount/umount sequence:
> 
> <4> Feb  7 11:20:00 kernel: Mounting filesystem "lvm(58,1)" in no-recovery
> mode.  Filesystem will be inconsistent. 
> <2> Feb  7 11:20:02 kernel: lvm - lvm_map: ll_rw_blk write for readonly LV
> /dev/volgr0/lvol1 
> <2> Feb  7 11:20:02 kernel: lvm - lvm_map: ll_rw_blk write for readonly LV
> /dev/volgr0/lvol1 
> <4> Feb  7 11:20:02 kernel: I/O error in filesystem ("lvm(58,1)") meta-data
> dev 0x3a01 block 0xa00020 
> <4> Feb  7 11:20:02 kernel:        ("xlog_iodone") error 5 buf count 1024 
> <4> Feb  7 11:20:02 kernel: xfs_force_shutdown(lvm(58,1),0x2) called from
> line 939 of file xfs_log.c.  Return address = 0xc01b3cbc 
> <4> Feb  7 11:20:02 kernel: Log I/O Error Detected.  Shutting down
> filesystem: lvm(58,1) 
> <4> Feb  7 11:20:02 kernel: Please umount the filesystem, and rectify the
> problem(s) 
> 
> I've attached the oops (run through ksymoops) from this particular umount.
> The snapshot is mounted ro,nouuid,norecovery.  The source of the snapshot
> contains an unmounted xfs filesystem, which was unmounted at the time of
> snapshot creation.  There has been no intentional I/O activity to the
> snapshot, either.
> 
> It looks to me like xfs is trying to flush something to disk on the umount,
> even though the filesystem is read only and no recovery.  I would not have
> expected this.  Is it correct behavior?
> 
> I made the snapshot writeable, but kept the mount options the same.  I was
> able to mount/umount many times without oops, I/O errors, or
> xfs_force_shutdown.
> 
> I did notice similar behavior when a full snapshot returns an I/O error --
> xfs_force_shutdown, with an oops following soon thereafter.
> 
> System details:
> Celeron with 512 MB of RAM and WD 45GB harddrives.
> 128 MB swap, one vg consisting of a one-drive RAID 0.
> Kernel 2.4.16 with 12/14/01 xfs CVS.
> LVM CVS of 1/21/02 (functionally identical to 1.0.2, I believe).
> LVM's linux-2.4.11-VFS-lock.patch.
> xfs_fs_freeze() patch posted by Eric Sandeen.
> Anselm Kruis' writable snapshot patch.

Had the same, disappeared when compiled the kernel with gcc-2.91.66 ! 
Seems to be a compiler issue.

Ciao
Klaus

-- 
Klaus Strebel
UNIX-Engineer
klaus.strebel@eigner.com
EIGNER - Precision Lifecycle Management -
<http://www.eigner.com>
