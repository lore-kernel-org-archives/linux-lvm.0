From: "Alois Schneider" <alois@pustertal-info.net>
MIME-Version: 1.0
Message-Id: <E18cyWD-0002f8-00@adroit.an-dns.com>
Subject: [linux-lvm] vgscan -- ERROR
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
Date: Sun Jan 26 19:57:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Using vgscan I get the following error:
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data 
of volume group "scsi_vg" from physical volume(s)
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your 
volume group

I am using LVM 1.0.6 on a Debian-testing-system and had one VG scsi_vg 
consisting of the following PV's: sda1,sdb1,hdb1,hdc1,hdd1
I wanted to remove sdb1 and hdd1 from the VG and issued
pvmove /dev/sdb1 and got an error (don't know the errormessage). I 
then did a pvmove /dev/hdd1 and got no errormessage this time. I then 
did a vgreducce scsi_vg /dev/hdd1 and shut-down the PC.
I removed hdd1 and restarted. I got a SCSI disk error and "unable to 
read partition table" for sdb and LVM did not come up as usual and I 
issued a vgscan. vgchange does not find a volume group.
pvdata gives the following results:
--- Physical volume ---
PV Name               /dev/sda1
VG Name               scsi_vg
PV Size               4.04 GB [8466192 secs] / NOT usable 1.88 MB 
[LVM: 125 KB]
PV#                   1
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              1033
Free PE               0
Allocated PE          1033
PV UUID               pJsMFv-ci9Q-orNK-3cRr-2aTl-w1N9-TEHDI1

--- Volume group ---
VG Name               
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                256
Cur LV                3
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                4
Act PV                4
VG Size               103.97 GB
PE Size               4 MB
Total PE              26616
Alloc PE / Size       24576 / 96 GB
Free  PE / Size       2040 / 7.97 GB
VG UUID               Vkdrqk-vX36-iO98-BQ0v-s0sJ-CQOk-CKw5H5

--- List of logical volumes ---

pvdata -- logical volume "/dev/scsi_vg/lvol1" at offset   0
pvdata -- logical volume "/dev/scsi_vg/mp3" at offset   1
pvdata -- logical volume "/dev/scsi_vg/home" at offset   2
pvdata -- logical volume struct at offset   3 is empty  
... 
--- List of physical volume UUIDs ---

001: pJsMFv-ci9Q-orNK-3cRr-2aTl-w1N9-TEHDI1
002: wT7xuc-iV9K-sNRl-kVdV-zzYw-OcPm-TW96TY
003: u5I40y-Op34-nnVV-aInj-Jekc-VJT7-s2q8OK
004: 3PCGsY-hUr6-QEUt-MkoJ-fKlX-24vG-pS0HJY

and similar results for hdb1 and hdc1.

Is there a chance to restore the data?

Regards
Alois 
