Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i7SJon309169
	for <linux-lvm@redhat.com>; Sat, 28 Aug 2004 15:50:49 -0400
Received: from brummi.netpr.local (h195202171055.nlb.cm.kabsi.at
	[195.202.171.55])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i7SJog7G013303
	for <linux-lvm@redhat.com>; Sat, 28 Aug 2004 15:50:43 -0400
Received: from [127.0.0.1] (unknown [192.168.1.16])
	by brummi.netpr.local (Postfix) with ESMTP id 811FD10D69
	for <linux-lvm@redhat.com>; Sat, 28 Aug 2004 21:55:24 +0200 (CEST)
Message-ID: <4130E286.80606@netpromote.co.at>
Date: Sat, 28 Aug 2004 21:52:38 +0200
From: Rainer Hoerbe <rhoerbe@netpromote.co.at>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] PV not reconized after vgcfgrestore?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

After my a system (lvm 1.0.6) hung, volume group data (out of 2) 
disappeard. There were no IO-errors in the system log.

A pvscan will not show the lost PV, and vgimport tells:
vgimport -- ERROR "pv_read(): PV identifier invalid" reading physical 
volume "/dev/hde1"

Now, when I try to restore, it should fix the PV in my understanding. 
But pvscan still does not bring it back. What could I do?

Your help is appreciated, as it would save me a day of work since the 
last backup :-)
Rainer Hoerbe


# vgcfgrestore -l -l -n data /dev/hde1
vgcfgrestore -- INFO: using backup file "/etc/lvmconf/data.conf"
--- Volume group ---
VG Name               data
VG Access             read/write
VG Status             NOT available/resizable
VG #                  1
MAX LV                256
Cur LV                3
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               149.04 GB
PE Size               4 MB
Total PE              38153
Alloc PE / Size       38145 / 149 GB
Free  PE / Size       8 / 32 MB
VG UUID               RGvrGj-qVpF-e3ke-n17z-oQAx-g3c6-WHvNYu

--- Logical volume ---
LV Name                /dev/data/m-data
VG Name                data
LV Write Access        read/write
LV Status              NOT available
LV #                   1
# open                 0
LV Size                80 GB
Current LE             20480
Allocated LE           20480
Allocation             next free
Read ahead sectors     1024
Block device           58:1

--- Logical volume ---
LV Name                /dev/data/e-data
VG Name                data
LV Write Access        read/write
LV Status              NOT available
LV #                   2
# open                 0
LV Size                5.20 GB
Current LE             1332
Allocated LE           1332
Allocation             next free
Read ahead sectors     1024
Block device           58:2

--- Logical volume ---
LV Name                /dev/data/video
VG Name                data
LV Write Access        read/write
LV Status              NOT available
LV #                   3
# open                 0
LV Size                63.80 GB
Current LE             16333
Allocated LE           16333
Allocation             next free
Read ahead sectors     1024
Block device           58:3


--- Physical volume ---
PV Name               /dev/hde1
VG Name               data
PV Size               149.04 GB [312560577 secs] / NOT usable 4.31 MB 
[LVM: 277 KB]
PV#                   1
PV Status             available
Allocatable           yes
Cur LV                3
PE Size (KByte)       4096
Total PE              38153
Free PE               8
Allocated PE          38145
PV UUID               y5rlkX-JZy2-yukW-8hkA-xeoh-U8qe-ulpuMs
