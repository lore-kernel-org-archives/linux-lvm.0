Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jALIYPV03245
	for <linux-lvm@redhat.com>; Mon, 21 Nov 2005 13:34:25 -0500
Received: from viefep13-int.chello.at (viefep13-int.chello.at [213.46.255.15])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jALIYKGp008262
	for <linux-lvm@redhat.com>; Mon, 21 Nov 2005 13:34:20 -0500
Received: from AthLux.PrivateLAN.at ([84.114.151.31]) by viefep13-int.chello.at
	(InterMail vM.6.01.04.04 201-2131-118-104-20050224) with ESMTP id
	<20051121183412.XHAO11640.viefep13-int.chello.at@AthLux.PrivateLAN.at>
	for <linux-lvm@redhat.com>; Mon, 21 Nov 2005 19:34:12 +0100
From: Matthias Meyer <Matthias.Meyer@gmx.li>
Date: Mon, 21 Nov 2005 19:34:13 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200511211934.13943.Matthias.Meyer@gmx.li>
Subject: [linux-lvm] can't resize my lvm
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

Hello,

I have a Volume Group with one pysical volume. I try to add another physical 
volume (which was in another Volume group before).
All seems to work fine but e2fsadm do not change the size of the filesystem.
What is wrong?

vdr:~# vgdisplay LVM2
--- Volume group ---
VG Name               LVM2
VG Access             read/write
VG Status             available/resizable
VG #                  1
MAX LV                256
Cur LV                1
Open LV               0
MAX LV Size           2 TB
Max PV                256
Cur PV                1
Act PV                1
VG Size               186 GB
PE Size               256 MB
Total PE              744
Alloc PE / Size       744 / 186 GB
Free  PE / Size       0 / 0
VG UUID               a4BzYX-fkun-VZuG-jnFA-kgLK-dmLz-eUe79w

vdr:~# vgextend LVM2 /dev/hdc1
vgextend -- INFO: maximum logical volume size is 2 Terabyte
vgextend -- doing automatic backup of volume group "LVM2"
vgextend -- volume group "LVM2" successfully extended

vdr:~# pvdisplay /dev/hdc1
--- Physical volume ---
PV Name               /dev/hdc1
VG Name               LVM2
PV Size               93.13 GB [195318207 secs] / NOT usable 256.19 MB [LVM: 
129 KB]
PV#                   2
PV Status             NOT available
Allocatable           yes
Cur LV                0
PE Size (KByte)       262144
Total PE              371
Free PE               371
Allocated PE          0
PV UUID               HfCAkU-DEmn-4FE0-8OyR-E9Vw-eJV9-KTNTer

vdr:~# lvextend -l+371 /dev/LVM2/Media /dev/hdc1
lvextend -- extending logical volume "/dev/LVM2/Media" to 278.75 GB
lvextend -- doing automatic backup of volume group "LVM2"
lvextend -- logical volume "/dev/LVM2/Media" successfully extended

vdr:~# lvdisplay /dev/LVM2/Media
--- Logical volume ---
LV Name                /dev/LVM2/Media
VG Name                LVM2
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 0
LV Size                278.75 GB
Current LE             1115
Allocated LE           1115
Allocation             next free
Read ahead sectors     1024
Block device           58:1

vdr:~# e2fsadm -l 1115 /dev/LVM2/Media
e2fsadm -- size of "/dev/LVM2/Media" would not change

-- 
Don't Panic
