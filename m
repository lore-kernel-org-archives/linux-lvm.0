Message-ID: <3EB07551.87856170@kasenna.com>
From: Alberto <beto@kasenna.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------A61DCE1D409FD6A63FD92EB1"
Subject: [linux-lvm] help using LVM & md for RAID10
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
Date: Sat May 10 08:37:05 2003
List-Id: <linux-lvm.redhat.com>
To: Linux-LVM@sistina.com
Cc: "innocent@kasenna.com" <innocent@kasenna.com>

--------------A61DCE1D409FD6A63FD92EB1
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

I'm trying to use LVM together with md. I know you guys don't
recommend this combination, but I need it to get good performance
from our disks plus some protection. This combination used to work
with 0.3, but stop working with the new 1.0.7. I think the problem is
that after rebooting LVM has problem figuring out that it needs to use
md0-3 and not their corresponding part (/dev/sd?).

Have you done this before?

I'm adding the series of commands we used to create the volume, plus
the status after we reboot the machine.

CREATING THE VOLUME

# cat /proc/mdstat
Personalities : [linear] [raid0] [raid1] [raid5] [multipath]
read_ahead 1024 sectors
md4 : active raid0 md3[3] md2[2] md1[1] md0[0]
      143372288 blocks 512k chunks
md3 : active raid1 sdi[1] sdh[0]
      35843584 blocks [2/2] [UU]
md2 : active raid1 sdg[1] sdf[0]
      35843584 blocks [2/2] [UU]
md1 : active raid1 sde[1] sdd[0]
      35843584 blocks [2/2] [UU]
md0 : active raid1 sdc[1] sdb[0]
      35843584 blocks [2/2] [UU]
unused devices: <none>

#dd bs=256k if=/dev/zero of=/dev/md0 count=1000
#dd bs=256k if=/dev/zero of=/dev/md1 count=1000
#dd bs=256k if=/dev/zero of=/dev/md2 count=1000
#dd bs=256k if=/dev/zero of=/dev/md3 count=1000

# pvcreate /dev/md0
pvcreate -- physical volume "/dev/md0" successfully created

# pvcreate /dev/md1
pvcreate -- physical volume "/dev/md1" successfully created

# pvcreate /dev/md2
pvcreate -- physical volume "/dev/md2" successfully created

# pvcreate /dev/md3
pvcreate -- physical volume "/dev/md3" successfully created

# vgcreate vg01 /dev/md[0-3]
vgcreate -- INFO: using default physical extent size 32 MB
vgcreate -- INFO: maximum logical volume size is 2 Terabyte
vgcreate -- doing automatic backup of volume group "vg01"
vgcreate -- volume group "vg01" successfully created and activated

# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/md0" of VG "vg01" [34.12 GB / 34.12 GB free]

pvscan -- ACTIVE   PV "/dev/md1" of VG "vg01" [34.12 GB / 34.12 GB free]

pvscan -- ACTIVE   PV "/dev/md2" of VG "vg01" [34.12 GB / 34.12 GB free]

pvscan -- ACTIVE   PV "/dev/md3" of VG "vg01" [34.12 GB / 34.12 GB free]

pvscan -- inactive PV "/dev/md4" of VG "vg01" [34.12 GB / 34.12 GB free]

pvscan -- WARNING: physical volume "/dev/sdb" belongs to a meta device
pvscan -- WARNING: physical volume "/dev/sdc" belongs to a meta device
pvscan -- WARNING: physical volume "/dev/sdd" belongs to a meta device
pvscan -- WARNING: physical volume "/dev/sde" belongs to a meta device
pvscan -- WARNING: physical volume "/dev/sdf" belongs to a meta device
pvscan -- WARNING: physical volume "/dev/sdg" belongs to a meta device
pvscan -- WARNING: physical volume "/dev/sdh" belongs to a meta device
pvscan -- WARNING: physical volume "/dev/sdi" belongs to a meta device
pvscan -- total: 13 [170.92 GB] / in use: 13 [170.92 GB] / in no VG: 0
[0]

#lvcreate -i 4 -I 512 -L 130G -n lv01 vg01
lvcreate -- doing automatic backup of "vg01"
lvcreate -- logical volume "/dev/vg01/lv01" successfully created

# vgdisplay -v
--- Volume group ---
VG Name               vg01
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               0
MAX LV Size           2 TB
Max PV                256
Cur PV                4
Act PV                4
VG Size               136.50 GB
PE Size               32 MB
Total PE              4368
Alloc PE / Size       4160 / 130 GB
Free  PE / Size       208 / 6.50 GB
VG UUID               tXh4cm-QVz6-bT6a-yLRl-PnHc-cY16-72aPfp

--- Logical volume ---
LV Name                /dev/vg01/lv01
VG Name                vg01
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 0
LV Size                130 GB
Current LE             4160
Allocated LE           4160
Stripes                4
Stripe size (KByte)    512
Allocation             next free
Read ahead sectors     1024
Block device           58:0


--- Physical volumes ---
PV Name (#)           /dev/md0 (1)
PV Status             available / allocatable
Total PE / Free PE    1092 / 52

PV Name (#)           /dev/md1 (2)
PV Status             available / allocatable
Total PE / Free PE    1092 / 52

PV Name (#)           /dev/md2 (3)
PV Status             available / allocatable
Total PE / Free PE    1092 / 52

PV Name (#)           /dev/md3 (4)
PV Status             available / allocatable
Total PE / Free PE    1092 / 52

AFTER REBOOT

# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/md0" of VG "vg01" [34.12 GB / 1.62 GB free]
pvscan -- inactive PV "/dev/md1" of VG "vg01" [34.12 GB / 1.62 GB free]
pvscan -- inactive PV "/dev/md2" of VG "vg01" [34.12 GB / 1.62 GB free]
pvscan -- inactive PV "/dev/md3" of VG "vg01" [34.12 GB / 1.62 GB free]
pvscan -- inactive PV "/dev/md4" of VG "vg01" [34.12 GB / 1.62 GB free]
pvscan -- WARNING: physical volume "/dev/sdb" belongs to a meta device
pvscan -- WARNING: physical volume "/dev/sdc" belongs to a meta device
pvscan -- WARNING: physical volume "/dev/sdd" belongs to a meta device
pvscan -- WARNING: physical volume "/dev/sde" belongs to a meta device
pvscan -- WARNING: physical volume "/dev/sdf" belongs to a meta device
pvscan -- WARNING: physical volume "/dev/sdg" belongs to a meta device
pvscan -- WARNING: physical volume "/dev/sdh" belongs to a meta device
pvscan -- WARNING: physical volume "/dev/sdi" belongs to a meta device
pvscan -- total: 13 [170.92 GB] / in use: 13 [170.92 GB] / in no VG: 0
[0]

[root@sculpin root]# vgdisplay -v
--- Volume group ---
VG Name               vg01
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               0
MAX LV Size           2 TB
Max PV                256
Cur PV                4
Act PV                4
VG Size               136.50 GB
PE Size               32 MB
Total PE              4368
Alloc PE / Size       4160 / 130 GB
Free  PE / Size       208 / 6.50 GB
VG UUID               tXh4cm-QVz6-bT6a-yLRl-PnHc-cY16-72aPfp

--- Logical volume ---
LV Name                /dev/vg01/lv01
VG Name                vg01
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 0
LV Size                130 GB
Current LE             4160
Allocated LE           4160
Stripes                4
Stripe size (KByte)    512
Allocation             next free
Read ahead sectors     1024
Block device           58:0


--- Physical volumes ---
PV Name (#)           /dev/sdc (1)
PV Status             available / allocatable
Total PE / Free PE    1092 / 52

PV Name (#)           /dev/sde (2)
PV Status             available / allocatable
Total PE / Free PE    1092 / 52

PV Name (#)           /dev/sdg (3)
PV Status             available / allocatable
Total PE / Free PE    1092 / 52

PV Name (#)           /dev/sdi (4)
PV Status             available / allocatable
Total PE / Free PE    1092 / 52


--------------A61DCE1D409FD6A63FD92EB1
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
Hi,
<p>I'm trying to use LVM together with md. I know you guys don't
<br>recommend this combination, but I need it to get good performance
<br>from our disks plus some protection. This combination used to work
<br>with 0.3, but stop working with the new 1.0.7. I think the problem
is
<br>that after rebooting LVM has problem figuring out that it needs to
use
<br>md0-3 and not their corresponding part (/dev/sd?).
<p>Have you done this before?
<p>I'm adding the series of commands we used to create the volume, plus
<br>the status after we reboot the machine.
<p>CREATING THE VOLUME
<p># cat /proc/mdstat
<br>Personalities : [linear] [raid0] [raid1] [raid5] [multipath]
<br>read_ahead 1024 sectors
<br>md4 : active raid0 md3[3] md2[2] md1[1] md0[0]
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 143372288 blocks 512k chunks
<br>md3 : active raid1 sdi[1] sdh[0]
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 35843584 blocks [2/2] [UU]
<br>md2 : active raid1 sdg[1] sdf[0]
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 35843584 blocks [2/2] [UU]
<br>md1 : active raid1 sde[1] sdd[0]
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 35843584 blocks [2/2] [UU]
<br>md0 : active raid1 sdc[1] sdb[0]
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 35843584 blocks [2/2] [UU]
<br>unused devices: &lt;none>
<p>#dd bs=256k if=/dev/zero of=/dev/md0 count=1000
<br>#dd bs=256k if=/dev/zero of=/dev/md1 count=1000
<br>#dd bs=256k if=/dev/zero of=/dev/md2 count=1000
<br>#dd bs=256k if=/dev/zero of=/dev/md3 count=1000
<p># pvcreate /dev/md0
<br>pvcreate -- physical volume "/dev/md0" successfully created
<p># pvcreate /dev/md1
<br>pvcreate -- physical volume "/dev/md1" successfully created
<p># pvcreate /dev/md2
<br>pvcreate -- physical volume "/dev/md2" successfully created
<p># pvcreate /dev/md3
<br>pvcreate -- physical volume "/dev/md3" successfully created
<p># vgcreate vg01 /dev/md[0-3]
<br>vgcreate -- INFO: using default physical extent size 32 MB
<br>vgcreate -- INFO: maximum logical volume size is 2 Terabyte
<br>vgcreate -- doing automatic backup of volume group "vg01"
<br>vgcreate -- volume group "vg01" successfully created and activated
<p># pvscan
<br>pvscan -- reading all physical volumes (this may take a while...)
<br>pvscan -- ACTIVE&nbsp;&nbsp; PV "<b>/dev/md0</b>" of VG "vg01" [34.12
GB / 34.12 GB free]
<br>pvscan -- ACTIVE&nbsp;&nbsp; PV "<b>/dev/md1</b>" of VG "vg01" [34.12
GB / 34.12 GB free]
<br>pvscan -- ACTIVE&nbsp;&nbsp; PV "<b>/dev/md2</b>" of VG "vg01" [34.12
GB / 34.12 GB free]
<br>pvscan -- ACTIVE&nbsp;&nbsp; PV "<b>/dev/md3</b>" of VG "vg01" [34.12
GB / 34.12 GB free]
<br>pvscan -- inactive PV "/dev/md4" of VG "vg01" [34.12 GB / 34.12 GB
free]
<br>pvscan -- WARNING: physical volume "/dev/sdb" belongs to a meta device
<br>pvscan -- WARNING: physical volume "/dev/sdc" belongs to a meta device
<br>pvscan -- WARNING: physical volume "/dev/sdd" belongs to a meta device
<br>pvscan -- WARNING: physical volume "/dev/sde" belongs to a meta device
<br>pvscan -- WARNING: physical volume "/dev/sdf" belongs to a meta device
<br>pvscan -- WARNING: physical volume "/dev/sdg" belongs to a meta device
<br>pvscan -- WARNING: physical volume "/dev/sdh" belongs to a meta device
<br>pvscan -- WARNING: physical volume "/dev/sdi" belongs to a meta device
<br>pvscan -- total: 13 [170.92 GB] / in use: 13 [170.92 GB] / in no VG:
0 [0]
<p>#lvcreate -i 4 -I 512 -L 130G -n lv01 vg01
<br>lvcreate -- doing automatic backup of "vg01"
<br>lvcreate -- logical volume "/dev/vg01/lv01" successfully created
<p># vgdisplay -v
<br>--- Volume group ---
<br>VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
vg01
<br>VG Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
read/write
<br>VG Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
available/resizable
<br>VG #&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0
<br>MAX LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
256
<br>Cur LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
1
<br>Open LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0
<br>MAX LV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
2 TB
<br>Max PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
256
<br>Cur PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
4
<br>Act PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
4
<br>VG Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
136.50 GB
<br>PE Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
32 MB
<br>Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
4368
<br>Alloc PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4160 / 130 GB
<br>Free&nbsp; PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 208 / 6.50
GB
<br>VG UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
tXh4cm-QVz6-bT6a-yLRl-PnHc-cY16-72aPfp
<p>--- Logical volume ---
<br>LV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
/dev/vg01/lv01
<br>VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
vg01
<br>LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write
<br>LV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
available
<br>LV #&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
1
<br># open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0
<br>LV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
130 GB
<br>Current LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
4160
<br>Allocated LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
4160
<br>Stripes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
4
<br>Stripe size (KByte)&nbsp;&nbsp;&nbsp; 512
<br>Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
next free
<br>Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 1024
<br>Block device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
58:0
<br>&nbsp;
<p>--- Physical volumes ---
<br>PV Name (#)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<b>/dev/md0 </b>(1)
<br>PV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
available / allocatable
<br>Total PE / Free PE&nbsp;&nbsp;&nbsp; 1092 / 52
<p>PV Name (#)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<b>/dev/md1</b> (2)
<br>PV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
available / allocatable
<br>Total PE / Free PE&nbsp;&nbsp;&nbsp; 1092 / 52
<p>PV Name (#)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<b>/dev/md2 </b>(3)
<br>PV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
available / allocatable
<br>Total PE / Free PE&nbsp;&nbsp;&nbsp; 1092 / 52
<p>PV Name (#)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<b>/dev/md3</b> (4)
<br>PV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
available / allocatable
<br>Total PE / Free PE&nbsp;&nbsp;&nbsp; 1092 / 52
<p>AFTER REBOOT
<p># pvscan
<br>pvscan -- reading all physical volumes (this may take a while...)
<br>pvscan -- inactive PV "/dev/md0" of VG "vg01" [34.12 GB / 1.62 GB free]
<br>pvscan -- inactive PV "/dev/md1" of VG "vg01" [34.12 GB / 1.62 GB free]
<br>pvscan -- inactive PV "/dev/md2" of VG "vg01" [34.12 GB / 1.62 GB free]
<br>pvscan -- inactive PV "/dev/md3" of VG "vg01" [34.12 GB / 1.62 GB free]
<br>pvscan -- inactive PV "/dev/md4" of VG "vg01" [34.12 GB / 1.62 GB free]
<br>pvscan -- WARNING: physical volume "/dev/sdb" belongs to a meta device
<br>pvscan -- WARNING: physical volume "/dev/sdc" belongs to a meta device
<br>pvscan -- WARNING: physical volume "/dev/sdd" belongs to a meta device
<br>pvscan -- WARNING: physical volume "/dev/sde" belongs to a meta device
<br>pvscan -- WARNING: physical volume "/dev/sdf" belongs to a meta device
<br>pvscan -- WARNING: physical volume "/dev/sdg" belongs to a meta device
<br>pvscan -- WARNING: physical volume "/dev/sdh" belongs to a meta device
<br>pvscan -- WARNING: physical volume "/dev/sdi" belongs to a meta device
<br>pvscan -- total: 13 [170.92 GB] / in use: 13 [170.92 GB] / in no VG:
0 [0]
<p>[root@sculpin root]# vgdisplay -v
<br>--- Volume group ---
<br>VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
vg01
<br>VG Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
read/write
<br>VG Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
available/resizable
<br>VG #&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0
<br>MAX LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
256
<br>Cur LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
1
<br>Open LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0
<br>MAX LV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
2 TB
<br>Max PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
256
<br>Cur PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
4
<br>Act PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
4
<br>VG Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
136.50 GB
<br>PE Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
32 MB
<br>Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
4368
<br>Alloc PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4160 / 130 GB
<br>Free&nbsp; PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 208 / 6.50
GB
<br>VG UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
tXh4cm-QVz6-bT6a-yLRl-PnHc-cY16-72aPfp
<p>--- Logical volume ---
<br>LV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
/dev/vg01/lv01
<br>VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
vg01
<br>LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write
<br>LV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
available
<br>LV #&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
1
<br># open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0
<br>LV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
130 GB
<br>Current LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
4160
<br>Allocated LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
4160
<br>Stripes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
4
<br>Stripe size (KByte)&nbsp;&nbsp;&nbsp; 512
<br>Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
next free
<br>Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 1024
<br>Block device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
58:0
<br>&nbsp;
<p>--- Physical volumes ---
<br>PV Name (#)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<b>/dev/sdc</b> (1)
<br>PV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
available / allocatable
<br>Total PE / Free PE&nbsp;&nbsp;&nbsp; 1092 / 52
<p>PV Name (#)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>
/dev/sde </b>(2)
<br>PV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
available / allocatable
<br>Total PE / Free PE&nbsp;&nbsp;&nbsp; 1092 / 52
<p>PV Name (#)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>
/dev/sdg (</b>3)
<br>PV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
available / allocatable
<br>Total PE / Free PE&nbsp;&nbsp;&nbsp; 1092 / 52
<p>PV Name (#)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<b>/dev/sdi </b>(4)
<br>PV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
available / allocatable
<br>Total PE / Free PE&nbsp;&nbsp;&nbsp; 1092 / 52
<br>&nbsp;</html>

--------------A61DCE1D409FD6A63FD92EB1--
