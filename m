Message-ID: <004c01c2af72$d49d8220$820d2a3e@Desiportatil>
From: "fnt" <FNT@mail.ono.es>
Subject: [linux-lvm] vgcreate -- no valid physical volumes in command line
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
Date: Sun Dec 29 13:45:02 2002
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

i have fallow this order of make LVM:
root]# pvdisplay /dev/hde1 /dev/hdg1 /dev/hdf1 /dev/hdh1
pvdisplay -- "/dev/hde1" is a new physical volume of 19.08 GB
pvdisplay -- "/dev/hdg1" is a new physical volume of 37.27 GB
pvdisplay -- "/dev/hdf1" is a new physical volume of 19.07 GB
pvdisplay -- "/dev/hdh1" is a new physical volume of 74.53 GB
----------------------------------------------------------------------------
root]# pvdata /dev/hde1 /dev/hdg1 /dev/hdf1 /dev/hdh1
--- NEW Physical volume ---
PV Name               /dev/hde1
VG Name
PV Size               19.08 GB
PV#                   0
PV Status             NOT available
Allocatable           NO
Cur LV                0
PE Size (KByte)       0
Total PE              0
Free PE               0
Allocated PE          0
PV UUID               Freu4z-rtFG-3LWO-DwoW-KQJQ-kPdH-TFrgod

--- Volume group ---
VG Name
VG Access             error
VG Status             NOT available/NOT resizable
VG #                  0
MAX LV                0
Cur LV                0
Open LV               0
MAX LV Size           0
Max PV                0
Cur PV                0
Act PV                0
VG Size               0
PE Size               0
Total PE              0
Alloc PE / Size       0 / 0
Free  PE / Size       0 / 0
VG UUID               HM

--- List of logical volumes ---

--- List of physical volume UUIDs ---

--- NEW Physical volume ---
PV Name               /dev/hdg1
VG Name
PV Size               37.27 GB
PV#                   0
PV Status             NOT available
Allocatable           NO
Cur LV                0
PE Size (KByte)       0
Total PE              0
Free PE               0
Allocated PE          0
PV UUID               oo7uc1-eFc6-wlO0-co9Z-oPf7-U0ss-cnitXm

--- Volume group ---
VG Name
VG Access             error
VG Status             NOT available/NOT resizable
VG #                  0
MAX LV                0
Cur LV                0
Open LV               0
MAX LV Size           0
Max PV                0
Cur PV                0
Act PV                0
VG Size               0
PE Size               0
Total PE              0
Alloc PE / Size       0 / 0
Free  PE / Size       0 / 0
VG UUID               HM

--- List of logical volumes ---

--- List of physical volume UUIDs ---

--- NEW Physical volume ---
PV Name               /dev/hdf1
VG Name
PV Size               19.07 GB
PV#                   0
PV Status             NOT available
Allocatable           NO
Cur LV                0
PE Size (KByte)       0
Total PE              0
Free PE               0
Allocated PE          0
PV UUID               AeUf2I-823S-r24W-QFg0-4WYJ-s4qS-Df7SBi

--- Volume group ---
VG Name
VG Access             error
VG Status             NOT available/NOT resizable
VG #                  0
MAX LV                0
Cur LV                0
Open LV               0
MAX LV Size           0
Max PV                0
Cur PV                0
Act PV                0
VG Size               0
PE Size               0
Total PE              0
Alloc PE / Size       0 / 0
Free  PE / Size       0 / 0
VG UUID               HM

--- List of logical volumes ---

--- List of physical volume UUIDs ---

--- NEW Physical volume ---
PV Name               /dev/hdh1
VG Name
PV Size               74.53 GB
PV#                   0
PV Status             NOT available
Allocatable           NO
Cur LV                0
PE Size (KByte)       0
Total PE              0
Free PE               0
Allocated PE          0
PV UUID               t2Y5MW-WhMO-asqF-PZTS-9WFi-SLR5-pZR5fY

--- Volume group ---
VG Name
VG Access             error
VG Status             NOT available/NOT resizable
VG #                  0
MAX LV                0
Cur LV                0
Open LV               0
MAX LV Size           0
Max PV                0
Cur PV                0
Act PV                0
VG Size               0
PE Size               0
Total PE              0
Alloc PE / Size       0 / 0
Free  PE / Size       0 / 0
VG UUID               HM

--- List of logical volumes ---

--- List of physical volume UUIDs ---
------------------------------------------------------
root]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/ide/host2/bus1/target0/lun0/part1" is in no VG
[37.27 GB]
pvscan -- inactive PV "/dev/ide/host2/bus1/target1/lun0/part1" is in no VG
[74.53 GB]
pvscan -- inactive PV "/dev/ide/host2/bus0/target0/lun0/part1" is in no VG
[19.08 GB]
pvscan -- inactive PV "/dev/ide/host2/bus0/target1/lun0/part1" is in no VG
[19.07 GB]
pvscan -- total: 4 [149.96 GB] / in use: 0 [0] / in no VG: 4 [149.96 GB]
----------------------------------------------------------------------------
---------

 root]# vgcreate test-vg /dev/hd[e-h]1
vgcreate -- no valid physical volumes in command line


i have this error, can samebady help me out?

thanks on davance.
chimo
