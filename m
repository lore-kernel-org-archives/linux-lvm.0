Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jAJKgJV31238
	for <linux-lvm@redhat.com>; Sat, 19 Nov 2005 15:42:19 -0500
Received: from viefep14-int.chello.at (viefep14-int.chello.at [213.46.255.13])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jAJKgIhL024936
	for <linux-lvm@redhat.com>; Sat, 19 Nov 2005 15:42:18 -0500
Received: from AthLux.PrivateLAN.at ([84.114.151.31]) by viefep14-int.chello.at
	(InterMail vM.6.01.04.04 201-2131-118-104-20050224) with ESMTP id
	<20051119204212.QQLC18559.viefep14-int.chello.at@AthLux.PrivateLAN.at>
	for <linux-lvm@redhat.com>; Sat, 19 Nov 2005 21:42:12 +0100
From: Matthias Meyer <Matthias.Meyer@gmx.li>
Date: Sat, 19 Nov 2005 21:42:14 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200511192142.14779.Matthias.Meyer@gmx.li>
Subject: [linux-lvm] can't reduce my lvm
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

I've just created a VG called LVM, the PV /dev/hdc1..3 and a LV (called 
Media) containing all three PVs. It have 233 GB free space. Than I copy 198 
GB of data from another device to it.

After this I want to extend my LV. Therefore I add the PVs /dev/hdd1 
and /dev/hdd2 to the VG.
All this will be done with webmin.

vdr:~# vgdisplay LVM
--- Volume group ---
VG Name               LVM
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               0
MAX LV Size           2 TB
Max PV                256
Cur PV                5
Act PV                5
VG Size               418.97 GB
PE Size               32 MB
Total PE              13407
Alloc PE / Size       13407 / 418.97 GB
Free  PE / Size       0 / 0
VG UUID               4lE9xF-g9JE-o98E-y3H6-IqsS-0fbT-SDhR1x

Than I try to resize my LV.
lvextend -L+5959 /dev/LVM/Media /dev/hdd1 /dev/hdd2
e2fsadm -l 13407 /dev/LVM/Media
e2fsadm -- size of "/dev/LVM/Media" would not change

The reason is that my LV can't grow about 256 GB because my physical extend 
is 32MB ?

Ok. I like to remove the two PV /dev/hdd1 and /dev/hdd2 from the VG.
vdr:~# pvmove /dev/hdd2
pvmove -- moving physical extents in active volume group "LVM"
pvmove -- WARNING: if you lose power during the move you may need
        to restore your LVM metadata from backup!
pvmove -- do you want to continue? [y/n] y
pvmove -- not enough free/allocatable physical extents

Whats That !?
I can't use /dev/hdd in the LV and I can't remove it from it?

Please help me!
Matthias
-- 
Don't Panic
