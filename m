Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lB7IwPfI016714
	for <linux-lvm@redhat.com>; Fri, 7 Dec 2007 13:58:25 -0500
Received: from gwa5.webcontrolcenter.com (gwa5.webcontrolcenter.com
	[63.134.207.25])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lB7Ivoto015915
	for <linux-lvm@redhat.com>; Fri, 7 Dec 2007 13:57:50 -0500
Received: from maila61.webcontrolcenter.com (unverified [216.119.106.87]) 
	by gwa5.webcontrolcenter.com (SurgeMail 3.8k4) with ESMTP id
	31103246-1777419 
	for <linux-lvm@redhat.com>; Fri, 07 Dec 2007 11:57:45 -0700
From: "Ian Puleston" <ian@underpressuredivers.com>
Date: Fri, 7 Dec 2007 10:57:05 -0800
Message-ID: <06a601c83902$f88ac160$01a8a8c0@sv.us.sonicwall.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] RAID mapper device size wrong after replacing drives
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Hi, 

I posted this question on linux-raid@vger.kernel.org and was told it might
be more appropriate here, so apologies to anyone on both lists who might be
seeing it twice.

I have a problem with my RAID array under Linux after upgrading to larger
drives. I have a machine with Windows and Linux dual-boot which had a pair
of 160GB drives in a RAID-1 mirror with 3 partitions: partiton 1 = Windows
boot partition (FAT32), partiton 2 = Linux /boot (ext3), partiton 3 =
Windows system (NTFS). The Linux /root is on a separate physical drive. The
dual boot is via Grub installed on the /boot partiton, and this was all
working fine. 

But I just upgraded the drives in the RAID pair, replacing them with 500GB
drives. I did this by replacing one of the 160s with a new 500 and letting
the RAID copy the drive, splitting the drives out of the RAID array and
increasing the size of the last partition of the 500 (which I did under
Windows since its the Windows partiton) then replacing the last 160 with the
other 500 and having the RAID controller create a new array with the two
500s, copying the drive that I'd copied from the 160. This worked great for
Windows, and that now boots and sees a 500GB RAID drive with all the data
intact. 

However, Linux has a problem and will not now boot all the way. It reports
that the RAID /dev/mapper volume failed - the partition is beyond the
boundaries of the disk. Running fdisk shows that it is seeing the larger
partiton, but still sees the size of the RAID /dev/mapper drive as 160GB.
Here is the fdisk output for one of the physical drives and for the RAID
mapper drive: 

Disk /dev/sda: 500.1 GB, 500107862016 bytes 
255 heads, 63 sectors/track, 60801 cylinders 
Units = cylinders of 16065 * 512 = 8225280 bytes 

� �Device Boot � � �Start � � � � End � � �Blocks � Id �System 
/dev/sda1 � � � � � � � 1 � � � � 625 � � 5018624 � �b �W95 FAT32 
Partition 1 does not end on cylinder boundary. 
/dev/sda2 � � � � � � 626 � � � � 637 � � � 96390 � 83 �Linux 
/dev/sda3 � * � � � � 638 � � � 60802 � 483264512 � �7 �HPFS/NTFS 


Disk /dev/mapper/isw_bcifcijdi_Raid-0: 163.9 GB, 163925983232 bytes 
255 heads, 63 sectors/track, 19929 cylinders 
Units = cylinders of 16065 * 512 = 8225280 bytes 

� � � � � � � � � � � � � � Device Boot � � �Start � � � � End � � �Blocks �
Id �System 
/dev/mapper/isw_bcifcijdi_Raid-0p1 � � � � � � � 1 � � � � 625 � � 5018624 �
�b �W95 FAT32 
Partition 1 does not end on cylinder boundary. 
/dev/mapper/isw_bcifcijdi_Raid-0p2 � � � � � � 626 � � � � 637 � � � 96390 �
83 �Linux 
/dev/mapper/isw_bcifcijdi_Raid-0p3 � * � � � � 638 � � � 60802 � 483264512 �
�7 �HPFS/NTFS 


They differ only in the drive capacity and number of cylinders. 

I started to try to run a Linux reinstall, but it reports that the partiion
table on the mapper drive is invalid, giving an option to re-initialize it
but saying that doing so will lose all the data on the drive. 

So questions: 

1. Where is the drive size information for the RAID mapper drive kept, and
is there some way to patch it? 

2. Is there some way to re-initialize the RAID mapper drive without
destroying the data on the drive? 

By the way, this is a software RAID with an Intel chipset.

Thanks, 
Ian
