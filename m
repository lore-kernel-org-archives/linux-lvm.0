Return-Path: <andy@redeye.com>
From: Andy Cowling <andy@redeye.com>
Date: 07 Feb 2001 15:30:45 +0000
In-Reply-To: Patrick Caulfield's message of "Wed, 7 Feb 2001 14:28:18 +0000"
Message-ID: <m21ytase6y.fsf_-_@andy.off.redeye.com>
MIME-Version: 1.0
Subject: [linux-lvm] the curious case of the semi-created Logical Volume
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

SuSE 7.0 with 4 x 8Gb SCSI disks. All filesystems are ext2.

I have created PV's, VG's and 2 LV's each of 8Gb and created ext2
filesystems on them and mounted them successfully.

Now I want to extend 'lv02' to 16Gb but lvextend claims the LV is not
active. Similarly lvdisplay only lists the LV using '-d'.

I created this setup using Yast (not the command-line).

Is there any way to retrieve the situation ? I am not at all familiar
with LVM configuration files and this is a live system   :-(

Thanks, as always, for any help.
-- 
Andy Cowling
RedEye International

#  lvextend -L +3920M  /dev/pv01/lv01 /dev/sdb1
lvextend -- logical volume "/dev/pv01/lv01" isn't active
#  lvscan
lvscan -- ACTIVE   "/dev/pv02/lv02" [7.81 GB]
lvscan -- ACTIVE   "/dev/pv01/lv01" [7.84 GB]
lvscan -- 2 logical volumes with 15.65 GB total in 2 volume groups
lvscan -- 2 active logical volumes
#  vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "pv01"
vgscan -- found active volume group "pv02"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: you may not have an actual backup of your volume groups
#  pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/sdb1" of VG "pv01" [3.83 GB / 3.83 GB free]
pvscan -- inactive PV "/dev/sdb2" of VG "pv01" [3.83 GB / 0 free]
pvscan -- inactive PV "/dev/sdc2" of VG "pv02" [4.39 GB / 0 free]
pvscan -- inactive PV "/dev/sdc3" of VG "pv01" [4.01 GB / 0 free]
pvscan -- inactive PV "/dev/sdd2" of VG "pv02" [4.39 GB / 1000 MB free]
pvscan -- inactive PV "/dev/sdd3" of VG "pv01" [4.01 GB / 4.01 GB free]
pvscan -- total: 6 [24.48 GB] / in use: 6 [24.48 GB] / in no VG: 0 [0]
#  lvdisplay /dev/pv01/lv01
lvdisplay -- logical volume "/dev/pv01/lv01" is not active; try -D
#  lvdisplay -D /dev/pv01/lv01
--- Logical volume ---
LV Name               /dev/pv01/lv01
VG Name               pv01
LV Write Access       read/write
LV Status             available
LV #                  1
# open                0
LV Size               7.84 GB
Current LE            2007
Allocated LE          2007
Allocation            next free
Read ahead sectors    128
Block device          58:0
