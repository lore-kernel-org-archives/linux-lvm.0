Return-Path: <boutilpj@ednet.ns.ca>
Message-ID: <3B542E3B.9050202@ednet.ns.ca>
Date: Tue, 17 Jul 2001 09:23:23 -0300
From: Patrick Boutilier <boutilpj@ednet.ns.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Weird UUIDs
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM Mailing List <linux-lvm@mlists.sistina.com>

I tried running pvdata -U on one of my LVM servers and it segfaulted 
(LVM driver version 0.9.1_beta6). Check out the UUIDs. Everything is 
working OK but I wonder if this is a serious problem or not? This is a 
single physical volume LVM running on top of hardware RAID 5.



pvdata -Uvv /dev/sda7

pvdata -- reading physical volume data from disk
pvdata -- reading volume group data from disk
--- List of physical volume UUIDs ---
 
Segmentation fault




pvdata /dev/sda7

--- Physical volume ---
PV Name               /dev/sda7
VG Name               data_vg
PV Size               133.36 GB / NOT usable 321 KB [LVM: 255 KB]
PV#                   1
PV Status             available
Allocatable           yes
Cur LV                6
PE Size (KByte)       4096
Total PE              34140
Free PE               7015
Allocated PE          27125
PV UUID               /dev/s-da7

--- Volume group ---
VG Name
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                256
Cur LV                6
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               133.36 GB
PE Size               4 MB
Total PE              34140
Alloc PE / Size       27125 / 105.96 GB
Free  PE / Size       7015 / 27.4 GB
VG UUID               data_v-g

--- List of logical volumes ---

pvdata -- logical volume "/dev/data_vg/home_lv" at offset   0
pvdata -- logical volume "/dev/data_vg/var_lv" at offset   1
pvdata -- logical volume "/dev/data_vg/usr_lv" at offset   2
pvdata -- logical volume "/dev/data_vg/news_lv" at offset   3
pvdata -- logical volume "/dev/data_vg/test_lv" at offset   4
pvdata -- logical volume "/dev/data_vg/its_lv" at offset   5
pvdata -- logical volume struct at offset   6 is empty
....









vgdisplay

--- Volume group ---
VG Name               data_vg
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                6
Open LV               5
MAX LV Size           255.99 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               133.36 GB
PE Size               4 MB
Total PE              34140
Alloc PE / Size       27125 / 105.96 GB
Free  PE / Size       7015 / 27.4 GB
VG UUID               data_v-g
