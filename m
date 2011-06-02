Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p52GR3FX027655
	for <linux-lvm@redhat.com>; Thu, 2 Jun 2011 12:27:04 -0400
Received: from out3.smtp.messagingengine.com (out3.smtp.messagingengine.com
	[66.111.4.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p52GR2sZ017760
	for <linux-lvm@redhat.com>; Thu, 2 Jun 2011 12:27:02 -0400
Received: from compute4.internal (compute4.nyi.mail.srv.osa [10.202.2.44])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 1E5E1210E5
	for <linux-lvm@redhat.com>; Thu,  2 Jun 2011 12:27:02 -0400 (EDT)
Message-Id: <1307032021.3508.1458812517@webmail.messagingengine.com>
From: "Lee Gold" <leegold@operamail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"
Date: Thu, 02 Jun 2011 09:27:01 -0700
Subject: [linux-lvm] LVM - Adding a Disk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

Hi,

I installed Ubuntu 10.04 Server using LVM during the install. This is a
intranet/home/personal server - it works well so far. I will run out of
space and want to add a hard drive. AFAIK I specifically need more space
in the web "document root" - in /var/www . I have 60 out of a 100 GB
hard disk devoted to that area right now and I continue to load video
and audio files under /var/www - it will fill up.

I stand ready to provide any info needed. I think I can fill in the
details from the manual...

But generally speaking what should I do? 

Below I'm taking a stab at what info is needed. Thanks:


$ sudo fdisk -l
Disk /dev/sda: 100.0 GB, 100030242816 bytes
255 heads, 63 sectors/track, 12161 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x69add380

   Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *           1          25      194560   83  Linux
Partition 1 does not end on cylinder boundary.
/dev/sda2              25       12162    97489920   8e  Linux LVM


$ sudo parted /dev/sda print
Model: ATA WDC WD1000JB-00C (scsi)
Disk /dev/sda: 100GB
Sector size (logical/physical): 512B/512B
Partition Table: msdos

Number  Start   End    Size    Type     File system  Flags
 1      1049kB  200MB  199MB   primary  ext2         boot
 2      200MB   100GB  99.8GB  primary               lvm



$ sudo lvm version
  LVM version:     2.02.54(1) (2009-10-26)
  Library version: 1.02.39 (2009-10-26)
  Driver version:  4.15.0


$ sudo vgdisplay 
  --- Volume group ---
  VG Name               system
  System ID             
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  5
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                4
  Open LV               4
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               92.97 GiB
  PE Size               4.00 MiB
  Total PE              23801
  Alloc PE / Size       23801 / 92.97 GiB
  Free  PE / Size       0 / 0   
  VG UUID               vvUrmr-sP9W-H5me-Axol-5pYk-4Cit-AoqwjV


$ sudo lvdisplay
  --- Logical volume ---
  LV Name                /dev/system/root
  VG Name                system
  LV UUID                8T4l84-UzUn-poOl-CUuc-flj4-JHwd-rWaARc
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                18.62 GiB
  Current LE             4768
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           251:0
   
  --- Logical volume ---
  LV Name                /dev/system/var
  VG Name                system
  LV UUID                7wVbH1-vHGU-b719-BPyd-gM0i-4eV6-i4PvY3
  LV Write Access        read/write
  LV Status              available
  # open                 2
  LV Size                60.54 GiB
  Current LE             15497
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           251:1
   
  --- Logical volume ---
  LV Name                /dev/system/home
  VG Name                system
  LV UUID                rzMoJJ-EGnB-3lDG-LJZP-SFKP-AAui-YzwlZP
  LV Write Access        read/write
  LV Status              available
  # open                 2
  LV Size                11.02 GiB
  Current LE             2820
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           251:2
   
  --- Logical volume ---
  LV Name                /dev/system/swap
  VG Name                system
  LV UUID                91ohFo-KzaI-T5bQ-dVne-HZxT-dfON-M49JL2
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                2.80 GiB
  Current LE             716
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           251:3


$ df -Th
Filesystem    Type    Size  Used Avail Use% Mounted on
/dev/mapper/system-root
              ext3     19G 1010M   17G   6% /
none      devtmpfs    497M  228K  497M   1% /dev
none         tmpfs    501M     0  501M   0% /dev/shm
none         tmpfs    501M   36K  501M   1% /var/run
none         tmpfs    501M     0  501M   0% /var/lock
none         tmpfs    501M     0  501M   0% /lib/init/rw
/dev/sda1     ext2    179M   31M  138M  19% /boot
/dev/mapper/system-home
          reiserfs     12G   44M   11G   1% /home
/dev/mapper/system-var
          reiserfs     61G   19G   43G  31% /var


----end of post----Thanks.




-- 
http://www.fastmail.fm - Choose from over 50 domains or use your own
