Return-Path: <cabalzer@gmx.de>
Message-ID: <3B136D02.2B4C5178@gmx.de>
Date: Tue, 29 May 2001 11:33:54 +0200
From: Carsten Balzer <cabalzer@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Problem extending a LV
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
Content-Type: text/plain; charset="iso-8859-1"
To: "linux-lvm@sistina.com" <linux-lvm@sistina.com>

Hi

I have a strange problem with kernel 2.2.19 an lvm-tools 0.9.1_beta7.

I have a existing VG with 2 80GB disks containing one 160GB LV.
I added a additional 80GB disk and wanted to extend the LV. But that
didn't
work.

seven:/ # pvdisplay /dev/hdf1
--- Physical volume ---
PV Name               /dev/hdf1
VG Name               NVolGroup
PV Size               76.34 GB / NOT usable 3.22 MB [LVM: 306 KB]
PV#                   3
PV Status             available
Allocatable           yes
Cur LV                0
PE Size (KByte)       4096
Total PE              19541
Free PE               19541
Allocated PE          0
PV UUID               o593Dd-Uo4Z-Hv1Z-yTI0-QtYy-p0Wq-a4XL3q

seven:/ # vgdisplay
--- Volume group ---
VG Name               NVolGroup
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               1
MAX LV Size           255.99 GB
Max PV                256
Cur PV                3
Act PV                3
VG Size               229 GB
PE Size               4 MB
Total PE              58623
Alloc PE / Size       39082 / 152.66 GB
Free  PE / Size       19541 / 76.33 GB
VG UUID               lHyDca-e7yA-4Rkt-keGF-uJHY-YCRk-3qqw7N

seven:/ # lvdisplay /dev/NVolGroup/nVol
--- Logical volume ---
LV Name                /dev/NVolGroup/nVol
VG Name                NVolGroup
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                152.66 GB
Current LE             39082
Allocated LE           39082
Stripes                2
Stripe size (KByte)    16
Allocation             next free
Read ahead sectors     120
Block device           58:0

If I try to extend the LV with:
lvextend -L+78164M /dev/NVolGroup/nVol
then I get:
lvextend -- rounding size 240119808 KB to stripe boundary size 240123904
KB
lvextend -- only 19541 free physical extents in volume group "NVolGroup"

Next try with: lvextend -l+19541 /dev/NVolGroup/nVol
lvextend -- rounding size 240119808 KB to stripe boundary size 240123904
KB
lvextend -- only 19541 free physical extents in volume group "NVolGroup"

Where is the error?

Gru=EF=BF=BD
  Carsten

--
"Who the fuck is General Failure and why is he reading my disk?"
