MIME-Version: 1.0
Message-ID: <OFDDDFDAC9.CDBEAD7D-ONC1256D72.004CF0D2@paris.cnp.fr>
From: eric.boissier@cnp.fr
Content-Type: text/plain; charset="us-ascii"
Subject: [linux-lvm] pvcreate problem on ia64 with GPT
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
Date: Tue Jul 29 09:05:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello,

I created on my boot disk a partition with parted (/dev/sda6).
But when I want to create a pv with that partition, no way, it does not 
work.
It seems that the pvcreate command still use the MBR informations :-(

Did anybody have a clue (or better, a solution) to solve this issue ?

Thank's,
Eric.

-----------------------------------------

[root@pss913 /]# fdisk -l /dev/sda

Disk /dev/sda: 64 heads, 32 sectors, 34732 cylinders
Units = cylinders of 2048 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/sda1             1     34733  35566479+  ee  EFI GPT
Partition 1 does not end on cylinder boundary:
     phys=(1023, 254, 63) should be (1023, 63, 32)
[root@pss913 /]# parted /dev/sda print
Disk geometry for /dev/sda: 0.000-34732.890 megabytes
Disk label type: GPT
Minor    Start       End     Filesystem  Name                  Flags
1          0.017    100.000  FAT                               boot, lba
2        100.000    500.000  FAT                               hp-service, 
lba
3        500.000   2548.000  ext3                              lba
4       2548.000   4596.000  linux-swap                        lba
5       4596.000   6644.000  ext3                              lba
6       6645.000  34732.874                                    lvm, lba
[root@pss913 /]# pvcreate /dev/sda6
pvcreate
pvcreate -- extended partition "/dev/sda6" doesn't exist

pvcreate [-d|--debug] [-f[f]|--force [--force]] [-h|--help] [-y|--yes]
        [-v|--verbose] [-V|--version] PhysicalVolume [PhysicalVolume...]

-----------------------------------------------
