From: Duane Evenson <devenson@shaw.ca>
Message-id: <3EB85E55.3010202@shaw.ca>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
References: <3EAC2003.5030106@shaw.ca> <20030428105618.A28159@sistina.com>
 <3EAF28A8.5010107@shaw.ca>
Subject: [linux-lvm] vgcfgrestore -- can't restore part of active volume group "vg01"
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
Date: Tue May  6 20:12:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

I'm getting the above error:
vgcfgrestore -- can't restore part of active volume group "vg01"
I'm trying to restore the volume group as vgscan returns:
# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "vg01"
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of 
volume
group "vg01" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume 
group

What's the problem?


vgcfgrestore -d -n vg01 /dev/hde
results in the last few lines being:

<4444> lvm_check_chars -- CALLED with name: "vg01"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<22> vg_status -- LEAVING with ret: 0
<1> vg_check_active -- LEAVING with ret: 1
vgcfgrestore -- can't restore part of active volume group "vg01"


Here are the results of "vgdisplay -v;pvscan;lvmdiskscan" and "pvdata 
-PP /dev/hde"

vgdisplay -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please 
run vgscan

pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/hde"  is associated to unknown VG "vg01" 
(run vgscan)
pvscan -- total: 1 [111.79 GB] / in use: 1 [111.79 GB] / in no VG: 0 [0]

lvmdiskscan -- reading all disks / partitions (this may take a while...)
lvmdiskscan -- /dev/hde   [     111.79 GB] USED LVM whole disk
lvmdiskscan -- /dev/hda1  [      57.25 GB] Primary  LINUX native 
partition [0x83]
lvmdiskscan -- /dev/hdb1  [      57.25 GB] Primary  LINUX native 
partition [0x83]
lvmdiskscan -- 3 disks
lvmdiskscan -- 1 whole disk
lvmdiskscan -- 0 loop devices
lvmdiskscan -- 0 multiple devices
lvmdiskscan -- 0 network block devices
lvmdiskscan -- 2 partitions
lvmdiskscan -- 0 LVM physical volume partitions


--- Physical volume ---
PV Name               /dev/hde
VG Name               vg01
PV Size               111.79 GB [234441648 secs] / NOT usable 32.19 MB 
[LVM: 141 KB]
PV#                   1
PV Status             available
Allocatable           NO
Cur LV                0
PE Size (KByte)       32768
Total PE              3576
Free PE               3576
Allocated PE          0
PV UUID               XAAlct-wQKl-764B-10Yt-N2UK-o9Ss-5fffgF
pv_dev                   0:33
system_id                dave1052256028
pv_on_disk.base          0
pv_on_disk.size          1024
vg_on_disk.base          4096
vg_on_disk.size          4096
pv_uuidlist_on_disk.base 8192
pv_uuidlist_on_disk.size 32896
lv_on_disk.base          45056
lv_on_disk.size          84296
pe_on_disk.base          131072
pe_on_disk.size          33619968
