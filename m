From: "Robert L. Harris" <Robert.L.Harris@rdlg.net>
Message-ID: <20021122200742.GE8618@rdlg.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] problem with vgcreate
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
Date: Fri Nov 22 14:08:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-LVM@Sistina.com
Cc: robert@rdlg.net


I'm trying to create a LVM for a system.  I partitioned my drives,
rebooted and do my pvcreates but then it blows up on vgcreate.  The
drives are both 18Gig, I've duplicated the partitions so they're
identicle size even though they're going to be concats, not stripes.

Here's a screen dump just made a bit readable.

root@performance:/root# pvcreate /dev/sda2
pvcreate -- physical volume "/dev/sda2" successfully created

root@performance:/root# pvcreate /dev/sdb2
pvcreate -- physical volume "/dev/sda2" successfully created

root@performance:/root# pvscan -v
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- walking through all physical volumes found
pvscan -- no valid physical volumes found

performanc:/root# vgcreate -v lvm-vg1 /dev/scsi/host0/bus0/target0/lun0/part2 /dev/scsi/host0/bus0/target1/lun0/part2
vgcreate -- checking volume group name
vgcreate -- checking volume group directory existence
vgcreate -- locking logical volume manager
vgcreate -- checking volume group "lvm-vg1" existence
vgcreate -- counting all existing volume groups
vgcreate -- reading all physical volume data from disks
vgcreate -- checking if all given physical volumes in command line are new
vgcreate -- no valid physical volumes in command line

root@performance:/root# vgcreate -v lvm-vg1 /dev/scsi/host0/bus0/target0/lun0/part2 
vgcreate -- checking volume group name
vgcreate -- checking volume group directory existence
vgcreate -- locking logical volume manager
vgcreate -- checking volume group "lvm-vg1" existence
vgcreate -- counting all existing volume groups
vgcreate -- reading all physical volume data from disks
vgcreate -- checking if all given physical volumes in command line are new
vgcreate -- no valid physical volumes in command line


---

Just to verify my devices, etc

root@performance:/# mkfs -t ext2 /dev/scsi/host0/bus0/target0/lun0/part2
mke2fs 1.18, 11-Nov-1999 for EXT2 FS 0.5b, 95/08/09
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
2228224 inodes, 4454021 blocks
222701 blocks (5.00%) reserved for the super user
First data block=0
136 block groups
32768 blocks per group, 32768 fragments per group
16384 inodes per group
Superblock backups stored on blocks: 
        32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208, 
        4096000

Writing inode tables: done                            
Writing superblocks and filesystem accounting information: 

root@performance:/root# mount /usr
root@performance:/# df -k
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/scsi/host0/bus0/target0/lun0/part1
                        101140     37536     58384  39% /
/dev/sda2             17536336        20  16645512   0% /usr


Thoughts???




:wq!
---------------------------------------------------------------------------
Robert L. Harris                     | PGP Key ID: FC96D405
                               
DISCLAIMER:
      These are MY OPINIONS ALONE.  I speak for no-one else.
FYI:
 perl -e 'print $i=pack(c5,(41*2),sqrt(7056),(unpack(c,H)-2),oct(115),10);'
