Message-ID: <FDF162266E09D81193350008C7E6346425091C@pinemail1>
From: CLeon@phs.org
Subject: RE: [linux-lvm] RE: [ADMIN] [PERFORM] backup/restore - another
 ar ea.
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Thu Oct 30 16:54:05 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, tgl@sss.pgh.pa.us
Cc: threshar@torgo.978.org, josh@agliodbs.com, markw@osdl.org, pgsql-performance@postgresql.org, pgsql-admin@postgresql.org

Does xfs_freeze work on red hat 7.3?
  
Cynthia Leon

-----Original Message-----
From: Murthy Kambhampaty [mailto:murthy.kambhampaty@goeci.com]
Sent: Friday, October 17, 2003 11:34 AM
To: 'Tom Lane'; Murthy Kambhampaty
Cc: 'Jeff'; Josh Berkus; markw@osdl.org;
pgsql-performance@postgresql.org; linux-lvm@sistina.com;
pgsql-admin@postgresql.org
Subject: [linux-lvm] RE: [ADMIN] [PERFORM] backup/restore - another
area.


Friday, October 17, 2003 12:05, Tom Lane [mailto:tgl@sss.pgh.pa.us] wrote:

>Murthy Kambhampaty <murthy.kambhampaty@goeci.com> writes:
>> ... The script handles situations
>> where (i) the XFS filesystem containing $PGDATA has an 
>external log and (ii)
>> the postmaster log ($PGDATA/pg_xlog) is written to a 
>filesystem different
>> than the one containing the $PGDATA folder.
>
>It does?  How exactly can you ensure snapshot consistency between
>data files and XLOG if they are on different filesystem

Say, you're setup looks something like this:

mount -t xfs /dev/VG1/LV_data /home/pgdata
mount -t xfs /dev/VG1/LV_xlog /home/pgdata/pg_xlog

When you want to take the filesystem backup, you do:

Step 1:
xfs_freeze -f /dev/VG1/LV_xlog
xfs_freeze -f /dev/VG1/LV_data
	This should finish any checkpoints that were in progress, and not
start any new ones
	till you unfreeze. (writes to an xfs_frozen filesystem wait for the
xfs_freeze -u, 
	but reads proceed; see text from xfs_freeze manpage in postcript
below.)


Step2: 
create snapshots of /dev/VG1/LV_xlog and /dev/VG1/LV_xlog

Step 3: 
xfs_freeze -u /dev/VG1/LV_data
xfs_freeze -u /dev/VG1/LV_xlog
	Unfreezing in this order should assure that checkpoints resume where
they left off, then log writes commence.


Step4:
mount the snapshots taken in Step2 somewhere; e.g. /mnt/snap_data and
/mnt/snap_xlog. Copy (or rsync or whatever) /mnt/snap_data to /mnt/pgbackup/
and /mnt/snap_xlog to /mnt/pgbackup/pg_xlog. Upon completion, /mnt/pgbackup/
looks to the postmaster like /home/pgdata would if the server had crashed at
the moment that Step1 was initiated. As I understand it, during recovery
(startup) the postmaster will roll the database forward to this point,
"checkpoint-ing" all the transactions that made it into the log before the
crash.

Step5:
remove the snapshots created in Step2.

The key is 
(i) xfs_freeze allows you to "quiesce" any filesystem at any point in time
and, if I'm not mistaken, the order (LIFO) in which you freeze and unfreeze
the two filesystems: freeze $PGDATA/pg_xlog then $PGDATA; unfreeze $PGDATA
then $PGDATA/pg_xlog.
(ii) WAL recovery assures consistency after a (file)sytem crash.

Presently, the test server for my backup scripts is set-up this way, and the
backup works flawlessly, AFAICT. (Note that the backup script starts a
postmaster on the filesystem copy each time, so you get early warning of
problems. Moreover the data in the "production" and "backup" copies are
tested and found to be identical.

Comments? Any suggestions for additional tests?

Thanks,
	Murthy

PS: From the xfs_freeze manpage:
"xfs_freeze suspends and resumes access to an XFS filesystem (see
xfs(5)). 

xfs_freeze halts new access to the filesystem and creates a stable image
on disk. xfs_freeze is intended to be used with volume managers and
hardware RAID devices that support the creation of snapshots. 

The mount-point argument is the pathname of the directory where the
filesystem is mounted. The filesystem must be mounted to be frozen (see
mount(8)). 

The -f flag requests the specified XFS filesystem to be frozen from new
modifications. When this is selected, all ongoing transactions in the
filesystem are allowed to complete, new write system calls are halted,
other calls which modify the filesystem are halted, and all dirty data,
metadata, and log information are written to disk. Any process
attempting to write to the frozen filesystem will block waiting for the
filesystem to be unfrozen. 

Note that even after freezing, the on-disk filesystem can contain
information on files that are still in the process of unlinking. These
files will not be unlinked until the filesystem is unfrozen or a clean
mount of the snapshot is complete. 

The -u option is used to un-freeze the filesystem and allow operations
to continue. Any filesystem modifications that were blocked by the
freeze are unblocked and allowed to complete."

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

==============================================================================
--- PRESBYTERIAN HEALTHCARE SERVICES DISCLAIMER ---

This message originates from Presbyterian Healthcare Services or one of its
affiliated organizations. It contains information, which may be confidential
or privileged, and is intended only for the individual or entity named above.
It is prohibited for anyone else to disclose, copy, distribute or use the
contents of this message. All personal messages express views solely of the
sender, which are not to be attributed to Presbyterian Healthcare Services or
any of its affiliated organizations, and may not be distributed without this
disclaimer. If you received this message in error, please notify us
immediately at postmaster@phs.org. 
==============================================================================
