Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0CGpgr18816
	for <linux-lvm@redhat.com>; Wed, 12 Jan 2005 11:51:42 -0500
Received: from netra27.desy.de (netra27.desy.de [131.169.40.141])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j0CGpZOc012367
	for <linux-lvm@redhat.com>; Wed, 12 Jan 2005 11:51:41 -0500
Received: from mx4.desy.de (mx4.desy.de [131.169.69.104])
	by netra27 (DesyMail_Map_27) with ESMTP id B032AFE3E
	for <linux-lvm@redhat.com>; Wed, 12 Jan 2005 17:51:24 +0100 (MET)
Received: from netra27.desy.de (netra27.desy.de [131.169.40.141]) by 
	mx4.desy.de (Content Technologies SMTPRS 4.3.14) with ESMTP id 
	<T6e7475df3d83a945689b0@mx4.desy.de> for <linux-lvm@redhat.com>;
	Wed, 12 Jan 2005 17:51:24 +0100
Received: from isis.desy.de (lb-40-251.desy.de [131.169.40.251]) by netra27 
	(DesyMail_In_27) with ESMTP id 458DEFB907 for <linux-lvm@redhat.com>;
	Wed , 12 Jan 2005 17:51:24 +0100 (MET)
Received: (from salvaire@localhost) by isis.desy.de (8.11.3/8.8.5) id 
	j0CGpOR01690 for linux-lvm@redhat.com; Wed, 12 Jan 2005 17:51:24 +0100
Date: Wed, 12 Jan 2005 17:51:24 +0100
From: Fabrice Salvaire <fabrice.salvaire@desy.de>
Message-ID: <20050112165123.GA1228@isis.desy.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Volume group problem after tried to extend it
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
To: linux-lvm@redhat.com

Hello,

I use LVM 1.

I tried to extend my vg "vglumi" on pv "/dev/hda10" with the pv
"/dev/hda12".  See below for my configuration and outputs.  But it
failed. I forgot exactly what's I done. I remember that /etc was read
only. Now, I cannot access this gv.  Pvdata report 2 pv for
vglumi. It's wrong.  Can you help me to recover this? Thanks in
advance.



pvscan output
------------------------------------------------------------
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hda10"  is associated to an unknown VG (run vgscan)
pvscan -- inactive PV "/dev/hda11" of VG "vgh1"   [9.54 GB / 0 free]
pvscan -- inactive PV "/dev/hda12" is in no VG  [11.38 GB]
pvscan -- inactive PV "/dev/hda8"  of VG "vgsys"  [9.5 GB / 4.62 GB free]
pvscan -- inactive PV "/dev/hda9"  of VG "vgusr"  [9.5 GB / 512 MB free]
pvscan -- total: 5 [49.52 GB] / in use: 4 [38.15 GB] / in no VG: 1 [11.38 GB]
------------------------------------------------------------



pvdata output for /dev/hda10
------------------------------------------------------------
--- Physical volume ---
PV Name               /dev/hda10
VG Name               vglumi
PV Size               9.54 GB / NOT usable 6.05 MB [LVM: 137 KB]
PV#                   1
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              2440
Free PE               0
Allocated PE          2440
PV UUID               F1TGo0-cCuZ-OgVS-ntr9-lDnx-jrye-P5AT01

--- Volume group ---
VG Name               
VG Access             read/write
VG Status             NOT available/resizable
VG #                  2
MAX LV                256
Cur LV                1
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                2
Act PV                2
VG Size               20.91 GB
PE Size               4 MB
Total PE              5352
Alloc PE / Size       2440 / 9.53 GB
Free  PE / Size       2912 / 11.38 GB
VG UUID               VPnlC0-1h4r-13V1-pDlL-ygkG-ylUs-2imuT0

--- List of logical volumes ---

pvdata -- logical volume "/dev/vglumi/lv_lumi" at offset   0
pvdata -- logical volume struct at offset   1 is empty
...
pvdata -- logical volume struct at offset 255 is empty

--- List of physical extents ---

PE: 00000  LV: 001  LE: 00000
...
PE: 02439  LV: 001  LE: 02439

--- List of physical volume UUIDs ---

001: F1TGo0-cCuZ-OgVS-ntr9-lDnx-jrye-P5AT01
002: WcptIM-FAQZ-uBEG-1FP6-9ltF-wv8u-WMWtoK
------------------------------------------------------------



pvdata output for /dev/hda12
------------------------------------------------------------
--- NEW Physical volume ---
PV Name               /dev/hda12
VG Name               
PV Size               11.38 GB
PV#                   0
PV Status             NOT available
Allocatable           NO
Cur LV                0
PE Size (KByte)       0
Total PE              0
Free PE               0
Allocated PE          0
PV UUID               YCzU2U-Wbng-5rmA-j2sk-cGPn-jj5Y-OdyYZd

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
VG UUID               HM

--- List of logical volumes ---


--- List of physical extents ---


--- List of physical volume UUIDs ---
------------------------------------------------------------



vgdisplay output for vg "vglumi"
------------------------------------------------------------
vgdisplay -- ERROR: not all physical volumes of volume group "vglumi" online
------------------------------------------------------------

cheers,

-- 
Fabrice Salvaire

FH1/HAM2
Desy
Building: 1c/280
Notkestrasse 85
22607 Hamburg
Germany
Tel: +49-(0)40-8998-3681
Email: fabrice.salvaire@desy.de
