Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0NLtuO17504
	for <linux-lvm@redhat.com>; Sun, 23 Jan 2005 16:55:56 -0500
Received: from out2.smtp.messagingengine.com (out2.smtp.messagingengine.com
	[66.111.4.26])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j0NLttUi014558
	for <linux-lvm@redhat.com>; Sun, 23 Jan 2005 16:55:55 -0500
Received: from web3.messagingengine.com (web3.internal [10.202.2.212])
	by frontend1.messagingengine.com (Postfix) with ESMTP id 752ECC5298A
	for <linux-lvm@redhat.com>; Sun, 23 Jan 2005 16:55:54 -0500 (EST)
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Date: Sun, 23 Jan 2005 13:55:55 -0800
From: fromkth+lvm@fastmail.fm
Message-Id: <1106517355.26963.213384700@webmail.messagingengine.com>
Subject: [linux-lvm] Reducing/Resizing LVM where "/" filesystem is included
	in the LVM
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi,

I am a newbie to linux and I have XP and FC3 on my 30GB HD.
I have searched through internet to find out how to reduce logical
Volume based on LVM2, but as my situation is quite different hence could
not find out any solution.
I have total 3 Primary partions and one extended partitions.
first 3 primary paritions are NTFS(XP),FAT32(data) and NTFS(data)
respectively.
Extended partition contains two partitions, linux boot and linux LVM.
Linux LVM contains one Group Volume which contains two Logical Volumes.
One Logical Volume has / root file System
and other Logical Volume has SWAP space.


Here is the ouput of fdisk -l and contents of /etc/fstab

fdisk -l
=======================================================================
Disk /dev/hda: 30.0 GB, 30005821440 bytes
255 heads, 63 sectors/track, 3648 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/hda1   *           1         637     5116671    7  HPFS/NTFS
/dev/hda2             638        1274     5116702+   c  W95 FAT32 (LBA)
/dev/hda3            1275        2546    10217340    7  HPFS/NTFS
/dev/hda4            2547        3648     8851815    f  W95 Ext'd (LBA)
/dev/hda5            2547        2559      104391   83  Linux
/dev/hda6            2560        3648     8747361   8e  Linux LVM
=======================================================================


cat /etc/fstab
==========================================================================
# This file is edited by fstab-sync - see 'man fstab-sync' for details
/dev/VolGroup00/LogVol00 /                       ext3    defaults       
1 1
LABEL=/boot             /boot                   ext3    defaults       
1 2
none                    /dev/pts                devpts  gid=5,mode=620 
0 0
none                    /dev/shm                tmpfs   defaults       
0 0
none                    /proc                   proc    defaults       
0 0
none                    /sys                    sysfs   defaults       
0 0
/dev/VolGroup00/LogVol01 swap                    swap    defaults       
0 0
/dev/hdb                /media/cdrom            auto   
pamconsole,fscontext=system_u:object_r:removable_t,ro,exec,noauto,managed
0 0
/dev/fd0                /media/floppy           auto   
pamconsole,fscontext=system_u:object_r:removable_t,exec,noauto,managed 0
0
/dev/hda1   /mnt/win_ntfs_c     ntfs    ro,defaults,umask=0222 0 0
/dev/hda2   /mnt/win_fat32_d     auto    ro,defaults,umask=0222 0 0
/dev/hda3   /mnt/win_ntfs_e     ntfs    ro,defaults,umask=0222 0 0
================================================================================

Now I want to free some space from the linux LVM(hda6) and create a
FAT32 partition as hda7.

So how to reduce that LVM?


one more questions my /boot parition is /dev/hda5 but in fstab it shows
it as LABEL=/boot
so how is that?

Thanks.

-ajeet.
