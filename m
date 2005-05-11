Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4BDICO16774
	for <linux-lvm@redhat.com>; Wed, 11 May 2005 09:18:12 -0400
Received: from sophos2.lnf.infn.it (sophos2.lnf.infn.it [193.206.84.202])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j4BDIBeJ031537
	for <linux-lvm@redhat.com>; Wed, 11 May 2005 09:18:11 -0400
Message-ID: <42820786.70401@lnf.infn.it>
Date: Wed, 11 May 2005 15:24:22 +0200
From: Claudio Soprano <Claudio.Soprano@lnf.infn.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM 1.0.8 problems with vgscan ERROR
 "vg_read_with_pv_and_lv(): allocated LE of LV"
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi all, i'm not subscribed to the mailing list, but i searched on it to 
find a solution to my problem

I had (up to 1 hour ago) a Redhat 7.3 machine kernel 2.4.20 with LVM 
1.0.8 and data disks in a
lvm environment 1,5 TB of datas.

I didn't backup nothing about the LVM configuration (i know it is an error)

I had to reinstall the OS to a new version, so i did

shutdown -r now

installated Scientific Linux 3.0.4 that has inside the LVM 1.0.8 rpm 
revision 9

so now when i run vgscan it tells me

 >vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- only found 0 of 1600 LEs for LV 
/dev/flat00_exp_local/exp_software (0)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get 
data of volume group "flat00_exp_local" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume 
group

if i run pvscan

 >pvscanpvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/cciss/c2d0"  is associated to unknown VG 
"flat00_exp_local" (run vgscan)
pvscan -- inactive PV "/dev/cciss/c1d0"  is associated to unknown VG 
"flat00_exp_local" (run vgscan)
pvscan -- total: 2 [44.05 MB] / in use: 2 [44.05 MB] / in no VG: 0 [0]

if i run pvdata

 >pvdata /dev/cciss/c2d0PV Name               /dev/cciss/c2d0
--- NEW Physical volume ---
VG Name               flat00_exp_local
PV Size               17.12 MB [35056 secs]
PV#                   2
PV Status             available
Allocatable           NO
Cur LV                0
PE Size (KByte)       0
Total PE              0
Free PE               0
Allocated PE          0
PV UUID               MqVhs1-qzZm-twiY-6U9Q-mC1S-JqO1-SBFurI

--- Volume group ---
VG Name
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                256
Cur LV                3
Open LV               0
MAX LV Size           2 TB
Max PV                256
Cur PV                2
Act PV                2
VG Size               1.47 TB
PE Size               32 MB
Total PE              48125
Alloc PE / Size       48125 / 1.47 TB
Free  PE / Size       0 / 0
VG UUID               NZunhD-g2fK-5Sl4-nRWN-i2jQ-IBnw-477uDP

--- List of logical volumes ---

pvdata -- logical volume "/dev/flat00_exp_local/exp_software" at offset   0
pvdata -- logical volume "/dev/flat00_exp_local/local" at offset   1
pvdata -- logical volume "/dev/flat00_exp_local/flatfiles_00" at 
offset   2pvdata -- logical volume struct at offset   3 is empty
pvdata -- logical volume struct at offset   4 is empty
pvdata -- logical volume struct at offset   5 is empty
pvdata -- logical volume struct at offset   6 is empty
pvdata -- logical volume struct at offset   7 is empty
pvdata -- logical volume struct at offset   8 is empty
pvdata -- logical volume struct at offset   9 is empty
pvdata -- logical volume struct at offset  10 is empty
.......
pvdata -- logical volume struct at offset  255 is empty

--- List of physical volume UUIDs ---

001: wutXUY-gDbu-d7Ma-hgQ3-7qfZ-Q2cM-dx5UXD
002: MqVhs1-qzZm-twiY-6U9Q-mC1S-JqO1-SBFurI


and


 >pvdata /dev/cciss/c1d0
--- NEW Physical volume ---
PV Name               /dev/cciss/c1d0
VG Name               flat00_exp_local
PV Size               26.93 MB [55152 secs]
PV#                   1
PV Status             available
Allocatable           NO
Cur LV                0
PE Size (KByte)       0
Total PE              0
Free PE               0
Allocated PE          0
PV UUID               wutXUY-gDbu-d7Ma-hgQ3-7qfZ-Q2cM-dx5UXD

--- Volume group ---
VG Name
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                256
Cur LV                3
Open LV               0
MAX LV Size           2 TB
Max PV                256
Cur PV                2
Act PV                2
VG Size               1.47 TB
PE Size               32 MB
Total PE              48125
Alloc PE / Size       48125 / 1.47 TB
Free  PE / Size       0 / 0
VG UUID               NZunhD-g2fK-5Sl4-nRWN-i2jQ-IBnw-477uDP

--- List of logical volumes ---

pvdata -- logical volume "/dev/flat00_exp_local/exp_software" at offset   0
pvdata -- logical volume "/dev/flat00_exp_local/local" at offset   1
pvdata -- logical volume "/dev/flat00_exp_local/flatfiles_00" at offset   2
pvdata -- logical volume struct at offset   4 is empty
pvdata -- logical volume struct at offset   5 is empty
pvdata -- logical volume struct at offset   6 is empty
pvdata -- logical volume struct at offset   7 is empty
pvdata -- logical volume struct at offset   8 is empty
pvdata -- logical volume struct at offset   9 is empty
pvdata -- logical volume struct at offset  10 is empty
.......
pvdata -- logical volume struct at offset  255 is empty

--- List of physical volume UUIDs ---

001: wutXUY-gDbu-d7Ma-hgQ3-7qfZ-Q2cM-dx5UXD
002: MqVhs1-qzZm-twiY-6U9Q-mC1S-JqO1-SBFurI


My question is this

Is There a way to recover all the datas on the 3 Logical Volumes ?

If i try with vgcfgrestore it doesn't work because it try to look in 
/etc/lvmtab.d/ that is empty (i reinstalled the OS)

Any hint to recover the lvmtab in someway or to create one with the info 
needed ?

Thanks for any suggestion or hint

Claudio Soprano
(please answer to my email address too, thanks in advance)
