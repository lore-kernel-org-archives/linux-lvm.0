Return-Path: <fox@theendoftime.net>
Date: Tue, 15 May 2001 11:56:18 -0600 (MDT)
From: <fox@theendoftime.net>
Message-ID: <Pine.LNX.4.31L2.0105151152590.25751-100000@theendoftime.net>
MIME-Version: 1.0
Subject: [linux-lvm] Problems adding pv to new volume group
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi all;

Having problems adding a new pv into a vg.  Here is the output.  I've done
this with another 3 disks in the machine (all scsi) and had no problems.
This is the only IDE drive in the machine.  Any suggestions?  I did a
search through the mailing list, but didn't notice anything.  I am running
kernel revision 2.4.2 (clean Linus) with the ReiserFS patches and the LVM
patches (LVM 0.9.1-Beta7 with supporting tools)

If any more details are needed, please let me know.

Thanks,

Tren.

=-= Start =-=

[root@web /root]# fdisk /dev/hda

The number of cylinders for this disk is set to 2491.
There is nothing wrong with that, but this is larger than 1024,
and could in certain setups cause problems with:
1) software that runs at boot time (e.g., old versions of LILO)
2) booting and partitioning software from other OSs
   (e.g., DOS FDISK, OS/2 FDISK)

Command (m for help): p

Disk /dev/hda: 255 heads, 63 sectors, 2491 cylinders
Units = cylinders of 16065 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/hda1             1       128   1028128+  83  Linux
/dev/hda2           129       145    136552+  82  Linux swap
/dev/hda3           146       540   3172837+  83  Linux
/dev/hda4           541      2491  15671407+  8e  Linux LVM

Command (m for help): q

[root@web /root]# pvcreate /dev/hda4
pvcreate -- physical volume "/dev/hda4" successfully created

[root@web /root]# vgcreate apps /dev/hda4
vgcreate -- INFO: using default physical extent size 4 MB
vgcreate -- INFO: maximum logical volume size is 255.99 Gigabyte
vgcreate -- ERROR "vg_write(): write" storing data of volume group "apps"
on disk(s)

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
- Tren Blackburn - Owner                mailto:fox@theendoftime.net  =
= End of Time Networks                  http://www.theendoftime.net  -
- (403) 269-2122                                                     =
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
