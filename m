From: Chris Lyttle <chris@e-ppraisal.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1007514053.2472.14.camel@pohutakawa.hut.loc>
Mime-Version: 1.0
Subject: [linux-lvm] Unable to resize volume
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
Date: Tue Dec  4 18:59:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I am having a problem where I cannot resize a volume past 200GB.
lvextend just sets the size to what it is now and will not extend
further. The total disk available is 322GB

RH 7.1 / 2.4.6 kernel with 
lvm_0.9.1_beta7
ext3-2.4.0.9.0-246
ext2resize-1.1.17-1

# vgdisplay -v
--- Volume group ---
VG Name               backup
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               1
MAX LV Size           511.98 GB
Max PV                256
Cur PV                3
Act PV                3
VG Size               294.61 GB
PE Size               8 MB
Total PE              37710
Alloc PE / Size       25612 / 200.09 GB
Free  PE / Size       12098 / 94.52 GB
VG UUID               4WlpTP-ZuZ8-pO0X-Q2ne-edsv-4O3W-2rY246

--- Logical volume ---
LV Name                /dev/backup/backup1
VG Name                backup
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                200.09 GB
Current LE             25612
Allocated LE           25612
Allocation             next free
Read ahead sectors     120
Block device           58:0


--- Physical volumes ---
PV Name (#)           /dev/sda6 (1)
PV Status             available / allocatable
Total PE / Free PE    11921 / 0

PV Name (#)           /dev/sda7 (2)
PV Status             available / allocatable
Total PE / Free PE    11921 / 0

PV Name (#)           /dev/sda8 (3)
PV Status             available / allocatable
Total PE / Free PE    13868 / 12098

TIA for your help
Chris Lyttle
