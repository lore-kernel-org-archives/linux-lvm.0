Message-Id: <3C77FD46.5010008@sgi.com>
From: Stephen Lord <lord@sgi.com>
MIME-Version: 1.0
References: <2D0AFEFEE711D611923E009027D39F2B02F0AF@cdserv.meridian-data.com>
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
Date: Sat Feb 23 14:35:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Stephenson, Dale" <dstephenson@snapserver.com>
Cc: "'linux-xfs@oss.sgi.com'" <linux-xfs@oss.sgi.com>, "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Stephenson, Dale wrote:

>Klaus Strebel's suggestion to use 2.91.66 (kgcc) for the kernel did solve
>the oops from snapshot umounting, in ordinary circumstances.  Thanks!
>
>However, I still have similar behavior, from umounting an invalid
>(filled-up) snapshot.  I took three snapshots of a single xfs logical
>volume, mounted the snapshots, and ran I-O on the source until the snapshots
>were invalidated.  I then umounted two of the snapshots.  I saw
>xfs_force_shutdown messages in syslog for each umount, and the second umount
>oopsed.
>
>Here's the syslog entries:
>
><6> Feb 14 15:24:11 kernel: lvm -- giving up to snapshot /dev/volgr0/lvol0
>on /dev/volgr0/lvol1: out of space 
><6> Feb 14 15:24:11 kernel: lvm -- giving up to snapshot /dev/volgr0/lvol0
>on /dev/volgr0/lvol2: out of space 
><6> Feb 14 15:24:11 kernel: lvm -- giving up to snapshot /dev/volgr0/lvol0
>on /dev/volgr0/lvol3: out of space 
><1> Feb 14 15:24:43 kernel: lvm - lvm_map: ll_rw_blk for inactive LV
>/dev/volgr0/lvol1 
><1> Feb 14 15:24:43 kernel: lvm - lvm_map: ll_rw_blk for inactive LV
>/dev/volgr0/lvol1 
><4> Feb 14 15:24:43 kernel: I/O error in filesystem ("lvm(58,1)") meta-data
>dev 0x3a01 block 0xa00020 
><4> Feb 14 15:24:43 kernel:        ("xlog_iodone") error 5 buf count 1024 
><4> Feb 14 15:24:43 kernel: xfs_force_shutdown(lvm(58,1),0x2) called from
>line 939 of file xfs_log.c.  Return address = 0xc01b934e 
><4> Feb 14 15:24:43 kernel: Log I/O Error Detected.  Shutting down
>filesystem: lvm(58,1) 
><4> Feb 14 15:24:43 kernel: Please umount the filesystem, and rectify the
>problem(s) 
><1> Feb 14 15:24:48 kernel: lvm - lvm_map: ll_rw_blk for inactive LV
>/dev/volgr0/lvol2 
><1> Feb 14 15:24:48 kernel: lvm - lvm_map: ll_rw_blk for inactive LV
>/dev/volgr0/lvol2 
><4> Feb 14 15:24:48 kernel: I/O error in filesystem ("lvm(58,2)") meta-data
>dev 0x3a02 block 0xa00020 
><4> Feb 14 15:24:48 kernel:        ("xlog_iodone") error 5 buf count 1024 
><4> Feb 14 15:24:48 kernel: xfs_force_shutdown(lvm(58,2),0x2) called from
>line 939 of file xfs_log.c.  Return address = 0xc01b934e 
><4> Feb 14 15:24:48 kernel: Log I/O Error Detected.  Shutting down
>filesystem: lvm(58,2) 
><4> Feb 14 15:24:48 kernel: Please umount the filesystem, and rectify the
>problem(s) 
><1> Feb 14 15:24:48 kernel: Unable to handle kernel NULL pointer dereference
>at virtual address 00000020 
>[oops snipped, but output of ksymoops attached to message]
>
>System details:
>Celeron with 512 MB of RAM and WD 45GB harddrives.
>128 MB swap, one vg consisting of a one-drive RAID 0.
>Kernel 2.4.16 with 12/14/01 xfs CVS.
>LVM CVS of 1/21/02 (functionally identical to 1.0.2, I believe).
>LVM's linux-2.4.11-VFS-lock.patch.
>xfs_fs_freeze() patch posted by Eric Sandeen.
>Anselm Kruis' writable snapshot patch.
>
>Snapshots were mounted ro,nouuid,norecovery.  The only action taken to the
>snapshots was mounting.
>
>I hope to try it soon with 2.4.17, as Adrian Head suggested.
>
>Has anyone else run this case with xfs snapshots?
>
>Why does umount result in I/O activity to a read-only, norecovery file
>system?
>
>Thanks,
>Dale Stephenson
>steph@snapserver.com
>

This is definitely odd, xlog_iodone is the I/O completion function for a 
log write. What
I would suspect is that xfs is not actually seeing the read only state 
somewhere.

I have mounted a regular filesystem with these options and set break points
in various spots during unmount which would do writes, none of them trigger.

Can you build with kdb, run the same test with a breakpoint in 
xfs_forced_shutdown,
and then when it trips do a backtrace for the unmount process.

Thanks

   Steve

>
