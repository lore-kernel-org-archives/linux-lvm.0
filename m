From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: [linux-lvm] Desater Recovery <urgent>
Message-Id: <20020422172436.GE3017@turbolinux.com>
References: <002401c1ea10$873d91a0$6b01a8c0@PC07>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <002401c1ea10$873d91a0$6b01a8c0@PC07>
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
Date: Mon Apr 22 12:25:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Zerres <rzerres@networkx.de>
Cc: linux-lvm@sistina.com

On Apr 22, 2002  17:15 +0200, Ralf Zerres wrote:
> on a production system we do have a serious data destruction problem. 
> Any help leading us to restore the filesystem will be honored. We can dicuss
> financial details later. First I'd like to describe the situation giving you
> a picture wether it is possible to restore the data. 
> Please answer as soon as possible to give me a hint wether I should wait for
> a detailed analysis, if it make sense to dig deeper or if it is more likely
> that people have to reinsert the data from printed information.
> 
> 0. PROBLEM:
> =========
> Destructed Filesystem after resizing LVG running a Postgres Database. 
> 
> ###
> # There is no actual backup, which is the mad point!!!! 
> ### 

Yes, very mad indeed.  I don't know why people persist in not having
backups, especially for production systems...

> I. Environment
> ===========
> 
> System:    Dual Prozessor PIII (2 CPU's 1Mhz)
> OS:    Linux 2.4.9 
> 
> Harddisk:    SCSI-3 (as Raid-5)
> Controller:    GDT 
> LVM version:     1.0.1-rc2(30/08/2001)
> 
> Kernel sees one harddrive (/dev/scsi/host2/bus0/target0)
> 
> Root is on standard ext3 fs (partition 5)
> 
> LVM has a Physical Volumegroup (KI) on partition 7
> The system runs a PostgreSQL Database (version 7.1.3). The Data-Structures
> live on a Logical-Volume-Group which was mounted as /var/lib/postgres as
> a ext3 filesystem. Everything was working until 4 hours ago, before LVG
> was resized.

> II. Changes
> 
> The LVG /dev/ki/postgres was reduced from 8 GB to 800MB. Before we did that
> a df has shown a used size of 366 MB data.
> Postgres was shut down. No other process was writing to /dev/ki/postgres.
> 
>      # e2fsadm --size - 4,5G 
> 
> Worked out, but remounting has shown incorrect structure.

I have never seen it used with "- 4,5G".  I don't know what the
program would do in this case.

> A new LVG was created 
> 
>     # lvcreate    --size 2,5G --name opt /dev/ki/opt

This was created after the other one was shrunk?  Did you create a
filesystem on it?

> The sysadmin was running a vgscan an lvscan. Afterwards he runs 
> 
>     # e2fsck -y -f /dev/ki/postgres
> 
> now the mount on /var/lib/postgres was successful, but all date were gone!
> I found a long list of dir-entries in the lost+found subdir. No file-entries.
> 
> What can we do?

Do you have any output from e2fsck?  It is likely that by running e2fsck
you have removed any chance of further recovery.  If the filesystem was
not resized properly before the LV was shrunk, and then you ran e2fsck
on it, it will have corrupted much of the filesystem data structures
because it was unable to access the larger part of the filesystem.

What is the structure of the filesystem that was in ki/postgres?  Did it
only have a few large DB files, or many smaller files?  What I would
suggest is to look into the directories under lost+found and see if your
database files are located therein.  It may be that the data in them
is corrupt, or that you are missing a lot of files.

If you did not create any filesystems on ki/opt, then it might be
possible to recover some of the data from the rest of the disk.  That
would be quite hard to do, however.

Cheers, Andreas
--
Andreas Dilger
http://www-mddsp.enel.ucalgary.ca/People/adilger/
http://sourceforge.net/projects/ext2resize/
