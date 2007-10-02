Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l92Eoc7F021072
	for <linux-lvm@redhat.com>; Tue, 2 Oct 2007 10:50:38 -0400
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id l92Eobgp019679
	for <linux-lvm@redhat.com>; Tue, 2 Oct 2007 10:50:37 -0400
Content-Type: text/plain; charset="us-ascii"
Date: Tue, 02 Oct 2007 16:50:32 +0200
From: "Paul Muster" <paul.muster@gmx.net>
Message-ID: <20071002145032.118800@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] cannot access LVM1 any more
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
To: linux-lvm@redhat.com

Hello everybody,


I have a really big problem: I cannot access my LVM1 PVs, VGs an LVs any more. So the system does not boot up.

The system was installed with Debian Woody and LVM1. I created 1 PV, 1 VG and some LVs. Later (maybe when changing to Sarge or Etch) I moved to LVM2, so I thought, I could remove the package lvm10 from the system. At some time I added another PV to the VG, resized one of the LVs.

Maybe because of one of this or when changing from Kernel 2.4 to 2.6.18 I obviously lost support for LVM1.

The last messages from the running system were:

# vgdisplay 
    Invalid LV in extent map (PV /dev/sda3, PE 1080, LV 5, LE 0) 
    Couldn't fill logical volume maps. 
    Invalid LV in extent map (PV /dev/sda3, PE 1080, LV 5, LE 0) 
    Couldn't fill logical volume maps. 
    Volume group "volg1" not found

As said before, after a reboot the system did not come up again telling me, it cannot find the LVs.


Please help me as I need the system and don't want to reinstall it. If you need some more information, please drop me a mail.


Maybe there is a live-CD with old LVM1-support available with which I could boot, activate the old LVM, chroot to it and reinstall the lvm10-Package? (I would need the module megaraid since the PVs are on an hardware-RAID.)


Thanks a lot in advance.

Paul


Some details:

# fdisk -l /dev/sda 
 
Disk /dev/sda: 73.4 GB, 73410805760 bytes 
 254 heads, 63 sectors/track, 8960 cylinders 
 Units = cylinders of 16002 * 512 = 8193024 bytes 
 
    Device Boot      Start         End      Blocks   Id  System 
 /dev/sda1   *           1         244     1952212+  83  Linux 
 /dev/sda2             245        4485    33932241   8e  Linux LVM 
 /dev/sda3            4486        8960    35804475   8e  Linux LVM 
 
There are two PVs, because some time the 36GB disk was replaced by a 7GB one. 
 
# pvdisplay 
    --- Physical volume --- 
    PV Name               /dev/sda2 
    VG Name               volg1 
    PV Size               32,36 GB / not usable 48,95 MB 
    Allocatable           yes (but full) 
    PE Size (KByte)       32768 
    Total PE              1034 
    Free PE               0 
    Allocated PE          1034 
    PV UUID               O17ru0-C8v2-3iLh-6isM-Z3n5-mn41-6nhDky 
 
   --- Physical volume --- 
    PV Name               /dev/sda3 
    VG Name               volg1 
    PV Size               34,15 GB / not usable 53,31 MB 
    Allocatable           yes 
    PE Size (KByte)       32768 
    Total PE              1091 
    Free PE               11 
    Allocated PE          1080 
    PV UUID               pe1zVS-YN39-Rw1k-Esfg-WIdG-cl5h-OhDZmF 
 
One VolumeGroup on the PVs: 
 
# vgdisplay 
    --- Volume group --- 
    VG Name               volg1 
    System ID             Knoppix1091952233 
    Format                lvm1 
    VG Access             read/write 
    VG Status             resizable 
    MAX LV                256 
    Cur LV                5 
    Open LV               5 
    Max PV                256 
    Cur PV                2 
    Act PV                2 
    VG Size               66,41 GB 
    PE Size               32,00 MB 
    Total PE              2125 
    Alloc PE / Size       2114 / 66,06 GB 
    Free  PE / Size       11 / 352,00 MB 
    VG UUID               J75sG2-mUcD-aUet-g4EV-y3AS-UNfb-2LRwhj 
 
with some LVs inside: 
 
# lvdisplay 
    --- Logical volume --- 
    LV Name                /dev/volg1/logv1 
    VG Name                volg1 
    LV UUID                000000-0000-0000-0000-0000-0000-000000 
    LV Write Access        read/write 
    LV Status              available 
    # open                 1 
    LV Size                1,97 GB 
    Current LE             63 
    Segments               1 
    Allocation             normal 
    Read ahead sectors     1024 
    Block device           254:0 
 
[...] 
 
