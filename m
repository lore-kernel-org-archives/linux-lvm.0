From: Thomas Mellenthin <melle@gmx.at>
MIME-Version: 1.0
Message-ID: <9282.1037748645@www19.gmx.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Recovery of LVM after kernelupdate (2.4.10 -> 2.4.19)
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
Date: Tue Nov 19 17:31:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

Hello,

does anyone of you know, whether it is possible to restore an LVM=20
just from the physical volumes and the VG.conf file ?

I did an update from Kernel 2.4.10 (SuSE 7.3) to 2.4.19 (SuSE 8.1)=20
with the result that no volume groups are found :-(

My LVM structure is like this:
The only volume group is "hxvg01" which contains two volumes
"hxlv01" (pv: hdc1, hdd1) and "hxlv02" (pv: hdb1)

I tried to use vgcfgrestore (@SuSE 8.1), but it failed with this messages:

vgcfgrestore -- INFO: using backup file "/etc/lvmconf/hxvg01.conf"
vgcfgrestore -- ERROR: different structure size stored in
"/etc/lvmconf/hxvg01.conf" than expected in file vg_cfgrestore.c [line 139]
vgcfgrestore -- ERROR "vg_cfgrestore(): read" restoring volume group
"hxvg01"

Is this the often discussed "compatibility problem" ? How can I safe migrate
to
the new LVM Version without loosing all my data OR (if it is not possible)
how
can I access my LVM on a Linux 2.4.10 System ?

The vgcfgrestore-step taken on a minimal Linux (SuSE 7.3) with Kernel 2.4.10
shows that
following result. Which steps are necessary to access my volumes under
Kernel 2.4.10 ?
Is it possible to import the VG using the -f parameter of vgimport ?

# vgcfgrestore -ll  -n hxvg01  -t -v
vgcfgrestore -- locking logical volume manager
vgcfgrestore -- restoring volume group "hxvg01" from
"/etc/lvmconf/hxvg01.conf"
vgcfgrestore -- checking existence of "/etc/lvmconf/hxvg01.conf"
vgcfgrestore -- reading volume group data for "hxvg01" from
"/etc/lvmconf/hxvg01.conf"
vgcfgrestore -- reading physical volume data for "hxvg01" from
"/etc/lvmconf/hxvg01.conf"
vgcfgrestore -- reading logical volume data for "hxvg01" from
"/etc/lvmconf/hxvg01.conf"
vgcfgrestore -- checking volume group consistency of "hxvg01"
vgcfgrestore -- checking volume group consistency of "hxvg01"
vgcfgrestore -- backup of volume group "hxvg01"  is consistent
--- Volume group ---
VG Name               hxvg01
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                256
Cur LV                2
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                3
Act PV                3
VG Size               160.53 GB
PE Size               4.00 MB
Total PE              41096
Alloc PE / Size       41075 / 160.45 GB
Free  PE / Size       21 / 84.00 MB
VG UUID               cXz5yh-KTaG-XRxy-v30t-ajxu-dV2W-Bpu1W0

--- Logical volume ---
LV Name                /dev/hxvg01/hxlv01
VG Name                hxvg01
LV Write Access        read/write
LV Status              NOT available
LV #                   1
# open                 0
LV Size                83.85 GB
Current LE             21465
Allocated LE           21465
Allocation             next free
Read ahead sectors     128
Block device           58:0

--- Logical volume ---
LV Name                /dev/hxvg01/hxlv02
VG Name                hxvg01
LV Write Access        read/write
LV Status              NOT available
LV #                   2
# open                 0
LV Size                76.60 GB
Current LE             19610
Allocated LE           19610
Allocation             next free
Read ahead sectors     120
Block device           58:1


--- Physical volume ---
PV Name               /dev/hdd1
VG Name               hxvg01
PV Size               41.93 GB / NOT usable 3.49 MB [LVM: 271.00 KB]
PV#                   1
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              10732
Free PE               0
Allocated PE          10732
PV UUID               5SaSBe-zk7g-3XR6-5X7a-H21x-3mW4-EJyHHN

--- Physical volume ---
PV Name               /dev/hdc1
VG Name               hxvg01
PV Size               41.93 GB / NOT usable 2.96 MB [LVM: 271.00 KB]
PV#                   2
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              10733
Free PE               0
Allocated PE          10733
PV UUID               gQYeny-bpfF-IoQl-8dtG-867E-OXIj-FBqmlj

--- Physical volume ---
PV Name               /dev/hdb1
VG Name               hxvg01
PV Size               76.69 GB / NOT usable 4.64 MB [LVM: 308.00 KB]
PV#                   3
PV Status             NOT available
Allocatable           yes
Cur LV                1
PE Size (KByte)       4096
Total PE              19631
Free PE               21
Allocated PE          19610
PV UUID               3cQksh-0OAA-ar9H-3fms-AgGQ-tOIO-eREM8v



vgcfgrestore -- unlocking logical volume manager

Which of the pv* vg* lv* commands are changing the physical volume=20
(=3Dwhich are dangerous for me) ?

// melle

--=20
+++ GMX - Mail, Messaging & more  http://www.gmx.net +++
NEU: Mit GMX ins Internet. Rund um die Uhr f=EF=BF=BDr 1 ct/ Min. surfen!
