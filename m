Return-Path: <Ron.Vissers@qtiworld.com>
Message-ID: <139803A793E0D311AFF60050DA2BC540030214C3@qtiexch1.qgraph.com>
From: "Vissers, Ron" <Ron.Vissers@qtiworld.com>
Date: Mon, 2 Jul 2001 11:15:52 -0500 
MIME-Version: 1.0
Subject: [linux-lvm] Lost my physical volume on reboot?
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

Bear with me, I'm new to LVM in Linux.  More accustomed to HPUX.

Anyway, I seem to have lost my /dev/hdc1 physical volume and my /dev/vg02
volume group, etc.  

Suggestions on where to begin?

Thanks,
---------------------------------------------------------------------

(rvissers:root) /root # uname -a
Linux rvissers 2.4.2 #2 Thu Apr 5 13:56:11 CDT 2001 i686 unknown

(rvissers:root) /usr/local/bin # cat /proc/lvm/global
LVM driver version 0.9.1_CVS (Date_CVS)
 
Total:  0 VGs  0 PVs  0 LVs (0 LVs open)
Global: 149 bytes malloced   IOP version: 10   7 days 8:34:47 active


(rvissers:root) /root # pvscan /dev/hdc1
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ERROR "pv_read(): read" reading physical volumes


(rvissers:root) /root # pvdisplay /dev/hdc1
pvdisplay -- ERROR "pv_get_size(): lvm_dir_cache" getting size of physical
volume "/dev/hdc1"


(rvissers:root) /root # fdisk -l /dev/hdc1
 
Disk /dev/hdc1: 255 heads, 63 sectors, 1826 cylinders
Units = cylinders of 16065 * 512 bytes
 
     Device Boot    Start       End    Blocks   Id  System


(rvissers:root) /root # ls /etc/lvmconf
vg02.conf  vg02.conf.1.old  vg02.conf.2.old
(rvissers:root) /root # vgcfgrestore -n vg02 -ll
--- Volume group ---
VG Name               vg02
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               13.98 GB
PE Size               4 MB
Total PE              3580
Alloc PE / Size       2048 / 8 GB
Free  PE / Size       1532 / 5.98 GB
VG UUID               w91qX3-pAKn-GAOU-NRVi-Gnvf-xmTL-nWgG3E

--- Logical volume ---
LV Name                /dev/vg02/lvol1
VG Name                vg02
LV Write Access        read/write
LV Status              NOT available
LV #                   1
# open                 0
LV Size                8 GB
Current LE             2048
Allocated LE           2048
Allocation             next free
Read ahead sectors     120
Block device           58:0


--- Physical volume ---
PV Name               /dev/hdc1
VG Name               vg02
PV Size               13.99 GB / NOT usable 3.55 MB [LVM: 134 KB]
PV#                   1
PV Status             available
Allocatable           yes
Cur LV                1
PE Size (KByte)       4096
Total PE              3580
Free PE               1532
Allocated PE          2048
PV UUID               VFfrsv-or0w-vP6L-EJ9B-c23n-sVF5-dX37jF
 
 
 
(rvissers:root) /root # vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
group




     _/_/   _/_/_/_/_/ _/_/_/   Ron Vissers
  _/    _/     _/       _/      IT Systems & Operations Team Lead
 _/  _/_/     _/       _/       Quad/Tech International 
_/    _/     _/       _/        ph:414-566-7643  fx:262-246-1545
 _/_/  _/   _/     _/_/_/       Ron.Vissers@qtiworld.com
