Message-ID: <20011110224327.54616.qmail@web10406.mail.yahoo.com>
From: BOIK MOON <mooasun@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] Help on LVM/SW-RAID build problems
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
Date: Sat Nov 10 16:42:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com



Hello,

I am totally in trouble after I changed the partition
type to 0x8e. On SUSE7.2 I am trying to configure
LVM on SW-RAID1 with two IDEs. 

I did not have any problem to configure md0, md1, md2
and then create volume group and logical volume using
the attached "raidtab" in the end.

These problems are come after I changed the partition
type to 0x8e. So I deleted all of patitions from two
IDEs and re-partition them. I still have the same
problems as follow;

1) fdisk error

Disk /dev/hdb: 255 heads, 63 sectors, 2434 cylinders
Units = cylinders of 16065 * 512 bytes
 
   Device Boot    Start       End    Blocks   Id 
System
/dev/hdb1             1        64    514048+  8e 
Linux LVM
/dev/hdb2            65       702   5124735   8e 
Linux LVM
/dev/hdb3           703      1340   5124735   8e 
Linux LVM
 
Command (m for help): w
The partition table has been altered!
 
Calling ioctl() to re-read partition table.
Re-read table failed with error 16: Device or resource
busy.


2) No such file error
 
root@bo:~ > raidstop --all
cannot determine md version: No such file or directory
 
kingate@bo:~ > /sbin/mkraid
cannot determine md version: No such file or directory
 
kingate@bo:~ > /sbin/mkraid --really-force /dev/md1
cannot determine md version: No such file or directory

3) Partiton type

 Is it OK to use the partition type "0x8e" for
LVM/SW-RAID?  How about "0xfd"?

Thanks in advance,

Bo

-----------------raidtab------------
raiddev /dev/md0
        raid-level 0
        nr-raid-disks 2
        nr-spare-disks 0
        chunk-size 4
        persistent-superblock 1
        device     /dev/hdb1
        raid-disk 0
        device     /dev/hdc1
        raid-disk 1
 
raiddev /dev/md1
        raid-level 1
        nr-raid-disks 2
        nr-spare-disks 0
        chunk-size 4
        persistent-superblock 1
        device     /dev/hdb2
        raid-disk 0
        device     /dev/hdc2
        raid-disk 1

raiddev /dev/md2
        raid-level 1
        nr-raid-disks 2
        nr-spare-disks 0
        chunk-size 4
        persistent-superblock 1
        device     /dev/hdb3
        raid-disk 0
        device     /dev/hdc3
        raid-disk 1

__________________________________________________
Do You Yahoo!?
Find a job, post your resume.
http://careers.yahoo.com
