Return-Path: <julien@atix.de>
Message-ID: <3B3AE6F7.3B07C1E@atix.de>
Date: Thu, 28 Jun 2001 10:12:39 +0200
From: Julien Baboud <julien@atix.de>
MIME-Version: 1.0
Subject: Re:[linux-lvm] Request for misalignement tests
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@sistina.com

pvdisplay -v /dev/hda6  | grep "^ *00000"
   00000 /dev/vg1/lv1_1            00000   4097
pvdisplay /dev/hda6
--- Physical volume ---
PV Name               /dev/hda6
VG Name               vg1
PV Size               502 MB / NOT usable 2 MB [LVM: 121 KB]
PV#                   1
PV Status             available
Allocatable           yes
Cur LV                4
PE Size (KByte)       4096
Total PE              125
Free PE               25
Allocated PE          100
PV UUID               4cBAdM-rqql-GnOd-yQok-nhxN-EjLM-c3TpeJ

------------------------------

pvdisplay -v /dev/hda8  | grep "^ *00000"
   00000 /dev/vg2/lv2_1            00000   4097
pvdisplay /dev/hda8
--- Physical volume ---
PV Name               /dev/hda8
VG Name               vg2
PV Size               502 MB / NOT usable 2 MB [LVM: 121 KB]
PV#                   1
PV Status             available
Allocatable           yes (but full)
Cur LV                3
PE Size (KByte)       4096
Total PE              125
Free PE               0
Allocated PE          125
PV UUID               Z5ZI0K-Vrld-nnEC-WGjv-Kx00-70W4-2NO2XG

------------------------------

pvdisplay -v /dev/hda9  | grep "^ *00000"
   00000 /dev/vg2/lv2_1_snap       00025   4097
pvdisplay /dev/hda9
--- Physical volume ---
PV Name               /dev/hda9
VG Name               vg2
PV Size               502 MB / NOT usable 2 MB [LVM: 121 KB]
PV#                   2
PV Status             available
Allocatable           yes
Cur LV                2
PE Size (KByte)       4096
Total PE              125
Free PE               50
Allocated PE          75
PV UUID               Sw7aAR-LoBl-14eX-si0U-RIha-iUxI-awSC3I

------------------------------

pvdisplay -v /dev/hda10 | grep "^ *00000"
   00000 /dev/vg3/lv3_1            00000   4097
pvdisplay /dev/hda10
--- Physical volume ---
PV Name               /dev/hda10
VG Name               vg3
PV Size               502 MB / NOT usable 2 MB [LVM: 121 KB]
PV#                   1
PV Status             available
Allocatable           yes (but full)
Cur LV                2
PE Size (KByte)       4096
Total PE              125
Free PE               0
Allocated PE          125
PV UUID               TYJAJN-OQAz-W7RV-g10Y-Baz2-kheL-GQfHcf

------------------------------

pvdisplay -v /dev/hda11 | grep "^ *00000"
   00000 /dev/vg3/lv3_2            00050   4097
pvdisplay /dev/hda11
--- Physical volume ---
PV Name               /dev/hda11
VG Name               vg3
PV Size               502 MB / NOT usable 2 MB [LVM: 121 KB]
PV#                   2
PV Status             available
Allocatable           yes (but full)
Cur LV                3
PE Size (KByte)       4096
Total PE              125
Free PE               0
Allocated PE          125
PV UUID               YWa9pH-Bpka-7U2b-0yGO-7A7s-XJSq-CmEGsR

------------------------------

pvdisplay -v /dev/hda12 | grep "^ *00000"
   00000 /dev/vg3/lv3_1_snap       00050   4097
pvdisplay /dev/hda12
--- Physical volume ---
PV Name               /dev/hda12
VG Name               vg3
PV Size               502 MB / NOT usable 2 MB [LVM: 121 KB]
PV#                   3
PV Status             available
Allocatable           yes (but full)
Cur LV                2
PE Size (KByte)       4096
Total PE              125
Free PE               0
Allocated PE          125
PV UUID               rU28XZ-NC2a-qCBq-4W0p-cpTf-7fJa-0hFPcM
