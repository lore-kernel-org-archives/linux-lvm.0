Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9OHSnV06117
	for <linux-lvm@redhat.com>; Mon, 24 Oct 2005 13:28:49 -0400
Received: from guru.unisinos.br (guru.unisinos.br [200.188.161.88])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j9OHSfaN023388
	for <linux-lvm@redhat.com>; Mon, 24 Oct 2005 13:28:42 -0400
Received: from pascal.unisinos.br (pascal.unisinos.br [10.16.163.2])
	by guru.unisinos.br (8.12.10/8.12.10/SuSE Linux 0.7) with ESMTP id
	j9OHSWfj009295
	for <linux-lvm@redhat.com>; Mon, 24 Oct 2005 15:28:33 -0200
Mime-Version: 1.0 (Apple Message framework v734)
Content-Transfer-Encoding: 7bit
Message-Id: <AFA2305A-CC3E-4E66-8702-2C047466CB0C@exatas.unisinos.br>
From: Fernando Costa <fcaprio@exatas.unisinos.br>
Date: Mon, 24 Oct 2005 15:28:13 -0200
Subject: [linux-lvm] Recover Help Needed
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: linux-lvm@redhat.com

Hello all,

I have a computer running Debian which I had some partitions under  
LVM. Mostly my Home and Work folder. After a power loss my lvm  
stopped working and I can't seen to find a way to recover data. I've  
tried lots of FAQs, tutorials, etc. Nothing seens to work.

Here is what it looks like:

:~# uname -a
Linux freemmg 2.4.25-1-386 #2 Wed Apr 14 19:38:08 EST 2004 i686 GNU/ 
Linux
:~#

:~# dpkg -l |grep lvm
ii  lvm-common                  1.5.17                         The  
Logical Volume Manager for Linux (common
ii  lvm10                       1.0.8-10                       The  
Logical Volume Manager for Linux
:~#

]:~# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- no valid physical volumes found
:~#

:~# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your  
volume group
:~#

Ok, what I tried to do:

:~# pvcreate -ff /dev/hda3
pvcreate -- WARNING: forcing physical volume creation on "/dev/hda3"
pvcreate -- physical volume "/dev/hda3" successfully created
:~#

:~# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- no valid physical volumes found
:~#

No idea why it wont work.

:~# vgcfgrestore -v -n freemmg -b 1 /dev/hda3
vgcfgrestore -- INFO: using backup file "/etc/lvmconf/freemmg.conf. 
1.old"
vgcfgrestore -- locking logical volume manager
vgcfgrestore -- restoring volume group "freemmg" from "/etc/lvmconf/ 
freemmg.conf.1.old"
vgcfgrestore -- checking existence of "/etc/lvmconf/freemmg.conf.1.old"
vgcfgrestore -- reading volume group data for "freemmg" from "/etc/ 
lvmconf/freemmg.conf.1.old"
vgcfgrestore -- reading physical volume data for "freemmg" from "/etc/ 
lvmconf/freemmg.conf.1.old"
vgcfgrestore -- reading logical volume data for "freemmg" from "/etc/ 
lvmconf/freemmg.conf.1.old"
vgcfgrestore -- checking volume group consistency of "freemmg"
vgcfgrestore -- checking volume group consistency of "freemmg"
vgcfgrestore -- reading physical volume "/dev/hda3"
vgcfgrestore -- ERROR "pv_read(): pv_create_name_from_kdev_t" reading  
physical volume "/dev/hda3"
:~#

:~# pvdata /dev/hda3
--- NEW Physical volume ---
PV Name               /dev/hda3
VG Name
PV Size               66.06 GB [138544560 secs]
PV#                   0
PV Status             NOT available
Allocatable           NO
Cur LV                0
PE Size (KByte)       0
Total PE              0
Free PE               0
Allocated PE          0
PV UUID               TonPmb-gO77-WiEE-8Tqp-nwCd-zi04-9Dv4ly

--- Volume group ---
VG Name
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                256
Cur LV                2
Open LV               0
MAX LV Size           2 TB
Max PV                256
Cur PV                1
Act PV                1
VG Size               66.03 GB
PE Size               32 MB
Total PE              2113
Alloc PE / Size       2113 / 66.03 GB
Free  PE / Size       0 / 0
VG UUID               sFMAaS-slYD-HGtk-rnh2-TbjY-Z0xy-lx0ICs

--- List of logical volumes ---

pvdata -- logical volume struct at offset   0 is inconsistent
pvdata -- logical volume struct at offset   1 is empty
pvdata -- logical volume struct at offset   2 is empty
pvdata -- logical volume struct at offset   3 is empty
pvdata -- logical volume struct at offset   4 is empty
pvdata -- logical volume struct at offset   5 is empty
pvdata -- logical volume struct at offset   6 is empty
pvdata -- logical volume struct at offset   7 is empty
pvdata -- logical volume struct at offset   8 is empty
pvdata -- logical volume struct at offset   9 is empty
pvdata -- logical volume struct at offset  10 is empty
pvdata -- logical volume struct at offset  11 is empty
pvdata -- logical volume struct at offset  12 is empty
pvdata -- logical volume struct at offset  13 is inconsistent
pvdata -- logical volume struct at offset  14 is inconsistent
pvdata -- logical volume struct at offset  15 is inconsistent
pvdata -- logical volume struct at offset  16 is inconsistent
pvdata -- logical volume struct at offset  17 is inconsistent
pvdata -- logical volume struct at offset  18 is inconsistent
pvdata -- logical volume struct at offset  19 is inconsistent
pvdata -- logical volume struct at offset  20 is inconsistent
pvdata -- logical volume struct at offset  21 is inconsistent
pvdata -- logical volume struct at offset  22 is inconsistent
pvdata -- logical volume struct at offset  23 is inconsistent
pvdata -- logical volume struct at offset  24 is inconsistent
pvdata -- logical volume struct at offset  25 is inconsistent
pvdata -- logical volume struct at offset  26 is empty
pvdata -- logical volume struct at offset  27 is empty
... list goes on until
--- List of physical volume UUIDs ---

Segmentation fault
:~#

So, any ideas? Any help would be apreciated.

Thanks

Fernando Costa
