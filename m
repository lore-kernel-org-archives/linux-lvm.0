Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j92EjeV22371
	for <linux-lvm@redhat.com>; Sun, 2 Oct 2005 10:45:40 -0400
Received: from sccimhc91.asp.att.net (sccimhc91.asp.att.net [63.240.76.165])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j92EjXWA024561
	for <linux-lvm@redhat.com>; Sun, 2 Oct 2005 10:45:33 -0400
Received: from randy.randyperkins.com (randy.randyperkins.com [192.168.0.200])
	by fileserver.randyperkins.com (8.12.10/8.12.10) with ESMTP id
	j92EjRQs019818
	for <linux-lvm@redhat.com>; Sun, 2 Oct 2005 09:45:27 -0500
From: Randy Perkins <randyperkins@randyperkins.com>
Date: Sun, 02 Oct 2005 09:45:26 -0500
Message-Id: <1128264326.13721.39.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] what is the proper procedure to remove a disk from a LV
	using lvm1?
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hello,
I wish to remove a disk from my logical volume.  I have moved data from
the LV in order to have enough free space to remove a PV.  I have
checked around and think i know the tools i need to use, but am not sure
of the order.

i have read this:
http://www.tldp.org/HOWTO/LVM-HOWTO/removeadisk.html
but it does not cover reducing the LV.
my LV is formatted as ext3
I'm pretty sure i need to use e2fsadm to reduce the LV.

So my questions are:

1 Do I need to use e2fsadm to resize the LV if I am removing a PV ?
2. If yes, which do i do first, e2fsadm or pvmove/vgreduce ?
3. should i umount the LV before using e2fsadm ?

thanks in advance and if you need more information, let me know

Randy Perkins


info about my config:
OS fedora core 1  2.4.22-1.2199.5.legacy.nptl
lvm lvm-1.0.3-13.1.legacy
PV 4 disks, PV fills entire disk( see pvdisplay below)
VG 1 VG /dev/my_vg ,uses 4 PV ( see vgdisplay below )
LV 1 LV  /dev/my_vg/my_lv fills entire VG (see lvdisplay below)
430G of 587G is available ( see df -h  below)
LV is formatted as ext3 ( see mount below )


what i think i need to do is:
e2fsadm -L 200G	/dev/my_vg/my_lv   (to reduce the LV)
pvmove /dev/hde	(reallocate all PE on this disk to other PV's)
pvreduce /dev/hde     (to remove PV from the VG)


------------output of pvdisplay ---------------------------

[root@fileserver root]# pvdisplay /dev/hd[e,g,i,k]
--- Physical volume ---
PV Name               /dev/hde
VG Name               my_vg
PV Size               149.05 GB [312581808 secs] / NOT usable 16.19 MB
[LVM: 165 KB]
PV#                   1
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       16384
Total PE              9538
Free PE               0
Allocated PE          9538
PV UUID               KeWFeh-VH6C-psRt-FLi9-xoEe-PVrG-bT86Ow

--- Physical volume ---
PV Name               /dev/hdg
VG Name               my_vg
PV Size               149.05 GB [312581808 secs] / NOT usable 16.19 MB
[LVM: 165 KB]
PV#                   2
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       16384
Total PE              9538
Free PE               0
Allocated PE          9538
PV UUID               NrI9L9-bPLr-hJhs-e54y-SWsd-aYgR-EHQgDe

--- Physical volume ---
PV Name               /dev/hdi
VG Name               my_vg
PV Size               149.05 GB [312581808 secs] / NOT usable 16.19 MB
[LVM: 165 KB]
PV#                   3
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       16384
Total PE              9538
Free PE               0
Allocated PE          9538
PV UUID               tf70Hd-13P3-1i1b-GSwd-JEs2-E8Bm-N9Dhwk

--- Physical volume ---
PV Name               /dev/hdk
VG Name               my_vg
PV Size               149.05 GB [312581808 secs] / NOT usable 16.19 MB
[LVM: 165 KB]
PV#                   4
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       16384
Total PE              9538
Free PE               0
Allocated PE          9538
PV UUID               UaPjnP-NIM7-TMzA-46Yf-Onyh-wKju-I2Ad7H



--------------output of vgdisplay -------------------------------

[root@fileserver root]# vgdisplay /dev/my_vg
--- Volume group ---
VG Name               my_vg
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               1
MAX LV Size           1023.97 GB
Max PV                256
Cur PV                4
Act PV                4
VG Size               596.12 GB
PE Size               16 MB
Total PE              38152
Alloc PE / Size       38152 / 596.12 GB
Free  PE / Size       0 / 0
VG UUID               2IBFij-7ujy-3d2V-wDD3-nWE9-EhKk-8P0Zkm


----------- output of lvdisplay -------------------

[root@fileserver root]# lvdisplay /dev/my_vg/my_lv
--- Logical volume ---
LV Name                /dev/my_vg/my_lv
VG Name                my_vg
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                596.12 GB
Current LE             38152
Allocated LE           38152
Allocation             next free
Read ahead sectors     1024
Block device           58:0

----------- output of df -h -----------------------

[root@fileserver root]# df -h /dev/my_vg/my_lv
Filesystem            Size  Used Avail Use% Mounted on
/dev/my_vg/my_lv      587G  158G  430G  27% /pub


------------ output of mount command ----------------
[root@fileserver root]# mount
... snip ...
/dev/my_vg/my_lv on /pub type ext3 (rw)
