Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0V0ckO13830
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2005 19:38:46 -0500
Received: from out2.smtp.messagingengine.com (out2.smtp.messagingengine.com
	[66.111.4.26])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j0V0cjax029025
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2005 19:38:45 -0500
Received: from web3.messagingengine.com (web3.internal [10.202.2.212])
	by frontend1.messagingengine.com (Postfix) with ESMTP id 855BEC539D0
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2005 19:38:44 -0500 (EST)
Message-Id: <1107131925.6822.213924115@webmail.messagingengine.com>
From: fromkth+lvm@fastmail.fm
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
References: <1106517355.26963.213384700@webmail.messagingengine.com>   
	<20050124002632.GA23702@pob>   
	<1106605480.13480.213476562@webmail.messagingengine.com>   
	<41F6A729.9050709@vilain.net>
Subject: Re: [linux-lvm] Reducing/Resizing LVM where "/" filesystem is
	included in the LVM
In-Reply-To: <41F6A729.9050709@vilain.net>
Date: Sun, 30 Jan 2005 16:38:45 -0800
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I am able to partialy solve my problem, so still needs help to complete
it. This may be help full for newbie like me, so i am writing the
steps here.

So first let me define again what i wanted to do.
fromkth+lvm@fastmail.fm wrote:
> Hi,
>
> I am a newbie to linux and I have XP and FC3 on my 30GB HD. I have
> searched through internet to find out how to reduce logical Volume
> based on LVM2, but as my situation is quite different hence could not
> find out any solution. I have total 3 Primary partitions and one
> extended partitions. first 3 primary partitions are
> NTFS(XP),FAT32(data) and NTFS(data) respectively. Extended partition
> contains two partitions, linux boot and linux LVM. Linux LVM contains
> one Group Volume which contains two Logical Volumes. One Logical
> Volume has / root file System and other Logical Volume has SWAP space.
>
>
> Here is the output of fdisk -l and contents of /etc/fstab
>
> fdisk -l
> =======================================================================
> Disk /dev/hda: 30.0 GB, 30005821440 bytes 255 heads, 63 sectors/track,
> 3648 cylinders Units = cylinders of 16065 * 512 = 8225280 bytes
>
> Device     Boot      Start       End      Blocks    Id  System
> /dev/hda1   *          1         637      5116671    7  HPFS/NTFS
> /dev/hda2             638        1274     5116702+   c  W95 FAT32(LBA)
> /dev/hda3            1275        2546    10217340    7  HPFS/NTFS
> /dev/hda4            2547        3648     8851815    f  W95 Ext'd(LBA)
> /dev/hda5            2547        2559      104391    83  Linux
> /dev/hda6            2560        3648     8747361    8e  Linux LVM
> =======================================================================
>
>
> cat /etc/fstab
> ==========================================================================
> # This file is edited by fstab-sync - see 'man fstab-sync' for details
> /dev/VolGroup00/LogVol00 /                    ext3    defaults 1 1
> LABEL=/boot             /boot                 ext3    defaults 1 2
> none                    /dev/pts              devpts  gid=5,mode=620
> none                    /dev/shm              tmpfs   defaults 0 none
> /proc                 proc    defaults 0 none                    /sys
> sysfs   defaults 0 /dev/VolGroup00/LogVol01 swap                 swap
> defaults 0
>
> /dev/hdb                /media/cdrom            auto pamconsole,fscon-
> text=system_u:object_r:removable_t,ro,exec,noauto,managed 0
>
> /dev/fd0               /media/floppy           auto pamconsole, fscontext=system_u:object_r:r-
> removable_t,exec,noauto,managed 0 0
>
> /dev/hda1   /mnt/win_ntfs_c   ntfs   ro,defaults,umask=0222 0 0
> /dev/hda2   /mnt/win_fat32_d   auto   ro,defaults,umask=0222 0 0
> /dev/hda3   /mnt/win_ntfs_e   ntfs   ro,defaults,umask=0222 0 0
> ================================================================================
>
> Now I want to free some space from the linux LVM(hda6) and create a
> FAT32 partition as hda7.
>
> So how to reduce that LVM?


So Robin Suggested:
======================

I suggest you use qtparted. Basically you need to:

1. Resize /
2. Move the swap volume back so it is adjacent to / (as it is swap, you
   could just run swapoff, delete the volume, and then recreate it.)
3. Reduce the physical volume size

I don't know if qtparted can do step 3 but it can do steps 1 and
2, I think.

Oh and of course, to do this, you must be running a separate copy of
Linux
- like a live CD. Knoppix, for example, boots with usually no user
  intervention required, and contains qtparted and everything it needs.


My Reply
> fromkth+lvm@fastmail.fm wrote:
>
>> I ran Knoppix Live CD 3.7 which has qtparted 0.4.4 and it does not
>> recognizes the linux lvm partition and shows it as unknown
>
>   [...]
>
>> so the question remains how to do it.


Sam Vilain wrote:
>
> The knoppix CD also has the commandline lvm utilities and ext2resize
> binaries.  Have fun reading the manpages for vgscan, vgchange,
> ext2resize, lvreduce, pvmove, vgreduce, pvremove, fdisk, pvcreate,
> vgextend, and pvmove.  Not necessarily in that order.
>
> HTH.

My Reply:
==============
Knoppix 3.7(whether you boot in 2.4 or 2.6 kernel) does not have lvm
utilities or ext2resize binaries, so i tried to install over from
internet but somehow i was not able to connect to default
ftp.de.debian.org through "apt-get update", and to change source one
must edit /etc/apt/source.list which i am not able to edit
it as the file is only read-only.

Anyway i booted the system in linux resuce mode with FC3 rescue CD. I
said not to mount any file system(not even read only) when asked
during booting. Now first you need to activate the Volume Group, so
you need to do.

# lvm vgchange -ay

then to reduce the file system(in my case it is root file system of ext3
type) in the activated volume group, first you need to run,

"e2fsck -v -f LogicalVolumeWithFullPath" in my case it was, 
# e2fsck -v -f /dev/VolGroup00/LogVol00

then resize it with

# resize2fs -p /dev/VolGroup00/LogVol00 6G 
Resizes the ext3 file system in LogVol00 to 6GB.

Now after that When i check Logical Volumes with 
# lvm lvdisplay 
i get

--- Logical volume ---
  LV Name                /dev/VolGroup00/LogVol00
  VG Name                VolGroup00
  LV UUID                6WyF9L-t4dJ-8HrR-NdTo-CoZh-NKvl-z6fidr
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                6.00 GB
  Current LE             192
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:0

  --- Logical volume ---
  LV Name                /dev/VolGroup00/LogVol01
  VG Name                VolGroup00
  LV UUID                N3auhB-e9br-76Cw-Eqvw-c31w-mq3Y-T5QBp8
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                1.00 GB
  Current LE             32
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:1

So here i can see that LogVol00 is reduces to 6GB as i wanted. and 
# lvm vgdisplay 
shows,

    VG Name               VolGroup00
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  12
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                2
  Open LV               2
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               8.31 GB
  PE Size               32.00 MB
  Total PE              266
  Alloc PE / Size       224 / 7.00 GB
  Free  PE / Size       42 / 1.31 GB
  VG UUID               cdEPbO-5o71-hUIa-szPC-FAra-E79P-cdbuTS


But it still shows it as 8.31GB which is like before, but it shows that
42 PEs are free.

But now the problem is how to claim those 42 PEs from this Volume Group
as i want to use that free space of this Volume Group to make
hda7(fat32)
which i can use(read/write)both in linux as well as in windows.

Do i have to do as Robin Suggested that,

>2. Move the swap volume back so it is adjacent to / (as it is swap, you
>    could just run swapoff, delete the volume, and then recreate it.)

Can some one guide me step by step how to do it either from running FC3
itself or from rescue CD of FC3 or from Knoppix 3.7

> 3. Reduce the physical volume size

is there any command in lvm2 to do this, i tried 
# lvm pvresize 
but it said command not implemented yet. so how to do it?

Waiting for answers.

-ajeet.
