From: Todd Underwood <todd@osogrande.com>
Message-ID: <Pine.LNX.4.10.10112101013300.12116-100000@staff>
MIME-Version: 1.0
Subject: [linux-lvm] problems importing non-exported VG
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
Date: Mon Dec 10 11:19:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

folx,

after an upgrade during which i moved from a root LVM system to a non-root
LVM system and my /etc/lvm* files/directories were lost, i find i'm unable
to re-import data from a previously existing volume group and i'm not even
sure what the right steps are.

the previous vg name was rootvg.

appended is some info about the pvs.  i had thought that i could re-create
rootvg from /dev/hdc1 /dev/hdc2 and /dev/hdc3 that previously held it, but
that seems not to work.  the vg was created with 0.9.1-beta7.  any
suggestions would be greatfully appreciated.

[root@villa root]# fdisk -l /dev/hda /dev/hdc

Disk /dev/hda: 255 heads, 63 sectors, 3722 cylinders
Units = cylinders of 16065 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/hda1   *         1      1020   8193118+  83  Linux
/dev/hda2          1021      1053    265072+  82  Linux swap
/dev/hda3          1054      3722  21438742+  8e  Linux LVM

Disk /dev/hdc: 16 heads, 63 sectors, 59323 cylinders
Units = cylinders of 1008 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/hdc1   *         1       102     51376+  8e  Linux LVM
/dev/hdc2           103      1143    524664   8e  Linux LVM
/dev/hdc3          1144     59323  29322720   8e  Linux LVM


[root@villa root]# pvdisplay /dev/hdc1 /dev/hdc2 /dev/hdc3
--- Physical volume ---
PV Name               /dev/hdc1
VG Name               rootvg
PV Size               50.17 MB / NOT usable 2.17 MB [LVM: 121.00 KB]
PV#                   2
PV Status             available
Allocatable           yes
Cur LV                0
PE Size (KByte)       4096
Total PE              12
Free PE               12
Allocated PE          0
PV UUID               xCyjO4-pnM0-MqSa-0jWv-6fhr-LLla-fH6glB

--- Physical volume ---
PV Name               /dev/hdc2
VG Name               rootvg
PV Size               512.37 MB / NOT usable 376.00 KB [LVM: 121.00 KB]
PV#                   3
PV Status             available
Allocatable           yes
Cur LV                0
PE Size (KByte)       4096
Total PE              128
Free PE               128
Allocated PE          0
PV UUID               gteK14-bigq-FlPg-zItU-Qp6c-Bcta-yj1iuM

--- Physical volume ---
PV Name               /dev/hdc3
VG Name               rootvg
PV Size               27.96 GB / NOT usable 3.47 MB [LVM: 148.00 KB]
PV#                   1
PV Status             available
Allocatable           yes
Cur LV                3
PE Size (KByte)       4096
Total PE              7158
Free PE               6114
Allocated PE          1044
PV UUID               1Fqav7-Dxjr-6ZPZ-09Zo-GnUE-jyux-mjjoEE





todd underwood, vp & cto
oso grande technologies, inc.
todd@osogrande.com

"Those who give up essential liberties for temporary safety deserve
neither liberty nor safety." - Benjamin Franklin
