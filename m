From: Urs Thuermann <urs@isnogud.escape.de>
Date: 14 Oct 2001 11:01:10 +0200
Message-ID: <m2u1x238a1.fsf@isnogud.escape.de>
Subject: [linux-lvm] Problem with LVM over RAID-1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

This problem has occrued on this mailing list before by another user
but I haven't read a solution to it here.

We want to setup LVM over a RAID-1 array, i.e. LVM on /dev/md0.  But
the pvcreate on /dev/md0 fails:


    oker:~# uname -a
    Linux oker 2.4.7oker #1 SMP Sat Oct 13 18:31:47 CEST 2001 i586 unknown
    oker:~# dmesg|grep -i lvm
    LVM version 0.9.1_beta2  by Heinz Mauelshagen  (18/01/2001)
    lvm -- Driver successfully initialized
    oker:~# pvcreate --version
    pvcreate: Logical Volume Manager 1.0.1-rc3
    Heinz Mauelshagen, Sistina Software  01/10/2001 (IOP 10)
    oker:~# grep md/0 /proc/partitions 
       9     0   17775808 md/0
    oker:~# pvcreate -v /dev/md0
    pvcreate -- locking logical volume manager
    pvcreate -- checking physical volume name "/dev/md0"
    pvcreate -- getting physical volume size
    pvcreate -- device "/dev/md0" has a partition table
    
    
    pvcreate [-d|--debug] [-f[f]|--force [--force]] [-h|--help] [-y|--yes]
    	    [-v|--verbose] [--version] PhysicalVolume [PhysicalVolume...]
    
    oker:~# dd if=/dev/zero of=/dev/md0 count=256 bs=512
    256+0 records in
    256+0 records out
    oker:~# pvcreate -v /dev/md0
    pvcreate -- locking logical volume manager
    pvcreate -- checking physical volume name "/dev/md0"
    pvcreate -- getting physical volume size
    pvcreate -- device "/dev/md0" has a partition table
    
    
    pvcreate [-d|--debug] [-f[f]|--force [--force]] [-h|--help] [-y|--yes]
    	    [-v|--verbose] [--version] PhysicalVolume [PhysicalVolume...]
    

However, /dev/md0 seems to be ok.  I can dd to/from it, I can mkfs on
it.  The RAID-array is configured as

    oker:~# cat /etc/raidtab 
    raiddev /dev/md0
    	    raid-level              1
    	    nr-raid-disks           2
    	    nr-spare-disks          0
    	    chunk-size              4
    	    persistent-superblock   1
    	    device                  /dev/sdb3
    	    raid-disk               0
    	    device                  /dev/sda3
    	    failed-disk             1

/dev/sda3 is marked as "failed" currently, since there is now an ext2
FS on sda3 on which the system was installed and is currently running
(debain sid, BTW).  We plan to install LVM on /dev/md0, copy
everything over to it and then mirror sdb3 to sda3.

Can anyone help us with creating a PV on /dev/md0, please?
    

Another question on Linux-Software RAID-1:  We want to use it to get
more reliability by mirroring.  But I'd like to know if the Linux
kernel will also make use of both disks to increase the read
performance, i.e. when reading a large file, read some parts from one
disk, other parts from the other disk.  Or when accessing two files,
read one file from one disk and the other file from the second disk.
Will the Linux kernel do this?


urs
