Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n1KIMIAf003838
	for <linux-lvm@redhat.com>; Fri, 20 Feb 2009 13:22:18 -0500
Received: from mx11.roch.ny.frontiernet.net (mx11.roch.ny.frontiernet.net
	[66.133.183.238])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n1KIM8aX009672
	for <linux-lvm@redhat.com>; Fri, 20 Feb 2009 13:22:08 -0500
Received: from localhost (webmail03.roch.ny.frontiernet.net [66.133.182.102])
	by relay03.roch.ny.frontiernet.net (Postfix) with ESMTP id
	66FBE1A0B3F
	for <linux-lvm@redhat.com>; Fri, 20 Feb 2009 18:22:07 +0000 (UTC)
Message-ID: <20090220182207.nhls9zho744g4koo@webmail.frontiernet.net>
Date: Fri, 20 Feb 2009 18:22:07 +0000
From: "moodyjunk@frontiernet.net" <moodyjunk@frontiernet.net>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Need Help Removing Physical Disk From LVM
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
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: linux-lvm@redhat.com

I'm hoping someone here can give a LVM newbie some basic help.

I have a logical volume with 2 physical volumes, sda1 and sdb1, both  
1T.  I want to permanently remove sdb1 so I can move it to another  
system.  I've manually moved much of the data over to another drive  
not in the logical volume, leaving more than a drives worth of free  
space in the logical volume. I try to evacuate sdb1 via pvmove but I  
get an error message that there are no extents available:
   pvmove /dev/sdb1
   No extents available for allocation

df shows the logical volume has 1.2T available so I would think I  
should be able to evacuate sdb1:

Filesystem            Size  Used Avail Use% Mounted on
/dev/mapper/VolGroup00-LogVol00
                       9.7G  3.0G  6.3G  32% /
/dev/mapper/VolGroup00-LogVol01
                       1.8T  534G  1.2T  32% /storage
/dev/sda1             190M   13M  168M   7% /boot
tmpfs                 1.7G     0  1.7G   0% /dev/shm


I'm thinking that I may need to shrink the filesystem somehow before  
the pvmove and subsequent vgreduce, but I don't know how. And I really  
don't want to experiment and lose my data.

pvdisplay -m reports:

--- Physical volume ---
PV Name /dev/sda2
VG Name VolGroup00
PV Size 931.32 GB / not usable 7.11 MB
Allocatable yes (but full)
PE Size (KByte) 32768
Total PE 29802
Free PE 0
Allocated PE 29802
PV UUID 0uKTxg-SCd9-NA1Z-BYt5-e2vl-fQ72-nrXywf

--- Physical Segments ---
Physical extent 0 to 29801:
Logical volume /dev/VolGroup00/LogVol01
Logical extents 0 to 29801

--- Physical volume ---
PV Name /dev/sdb1
VG Name VolGroup00
PV Size 931.51 GB / not usable 11.19 MB
Allocatable yes
PE Size (KByte) 32768
Total PE 29808
Free PE 2
Allocated PE 29806
PV UUID Mlvnwl-YJ1B-s7Fk-Kz7F-mf5G-1Fvk-BKXIN6

--- Physical Segments ---
Physical extent 0 to 319:
Logical volume /dev/VolGroup00/LogVol00
Logical extents 0 to 319
Physical extent 320 to 29743:
Logical volume /dev/VolGroup00/LogVol01
Logical extents 29802 to 59225
Physical extent 29744 to 29805:
Logical volume /dev/VolGroup00/LogVol02
Logical extents 0 to 61
Physical extent 29806 to 29807:
FREE

Thanks for any pointers.
