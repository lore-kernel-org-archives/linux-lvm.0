From: Daniel Heemann <daniel.heemann@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200303310028.27139.daniel.heemann@gmx.de>
Subject: [linux-lvm] All LV have the same content after repair attempt
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
Date: Sun Mar 30 16:29:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

I had to remove a hdd due to a hardware failure and tried to gain access to 
those LVs which did not use PEs on the broken disk.

Therefore I perfomed the follfowing steps:
1) got LVM2.1.95.15
2) vgcfgbackup -P -f /tmp/backup.vg vg_ide
3) edited /tmp/backup as described here: 
http://lists.sistina.com/pipermail/linux-lvm/2003-January/013153.html
with exception of a) there wasn't any PV section which was on the broken hdd 
so I had not to remove any and b) the segment sections of the LV which used 
the broken hdd did not contain an entry like 'pvX' inside 'stripes' but 
'Missing' was entered.
4) vgcfgrestore -M1 -f /tmp/backup.vg vg_ide
5) vgscan ; vgchange -a y

So far everything worked fine, when mounting the remaining LVs (only one had 
to be removed, the biggest one) this also works fine but when looking what 
the LVs contain they all contain the same: the contents of the smallest LV. 
mount shows for all LVs the same size, only device and mountpoint differ:
/dev/vg_ide/lv_uml_rootfs	200M  137M   63M  69% /home/uml-rootfs
/dev/vg_ide/lv_uml_swap	200M  137M   63M  69% /home/uml-swap
/dev/vg_ide/lv_uml_log	200M  137M   63M  69% /home/uml-log

lvdisplay shows the correct size:
storage:~/lvm/sbin# lvdisplay /dev/vg_ide/lv_uml_rootfs
--- Logical volume ---
LV Name                /dev/vg_ide/lv_uml_rootfs
VG Name                vg_ide
LV Write Access        read/write
LV Status              available
LV #                   2
# open                 0
LV Size                3 GB
Current LE             768
Allocated LE           768
Allocation             next free
Read ahead sectors     1024
Block device           58:0
storage:~/lvm/sbin# lvdisplay /dev/vg_ide/lv_uml_swap
--- Logical volume ---
LV Name                /dev/vg_ide/lv_uml_swap
VG Name                vg_ide
LV Write Access        read/write
LV Status              available
LV #                   3
# open                 0
LV Size                1 GB
Current LE             256
Allocated LE           256
Allocation             next free
Read ahead sectors     1024
Block device           58:0
storage:~/lvm/sbin# lvdisplay /dev/vg_ide/lv_uml_log
--- Logical volume ---
LV Name                /dev/vg_ide/lv_uml_log
VG Name                vg_ide
LV Write Access        read/write
LV Status              available
LV #                   4
# open                 1
LV Size                200 MB
Current LE             50
Allocated LE           50
Allocation             next free
Read ahead sectors     1024
Block device           58:0

System is Debian woody, Kernel 2.4.20 XFS patched
LV's fs is reiserfs
lvm tools version is 1.0.4 (woody-package)
vgcfgbackup/vgcfgrestore is from LVM2.1.95.15

As I use LVM2.1.95.15 only for vgcfgbackup/vgcfgrestore, I use lvm1, I 
compiled the package with the configure --disable-devmapper option.

I also tried to use vgscan and vgchange from the LVM2.1.95.15 package but it 
fails to activate the vm, vgscan seems to work and shows that it's an lvm1 VG 
but after running vgchange -a y there isn't any entry in /proc for the VG and 
of course the volumes can't be mounted. But I think that's due to missing 
kernel/module support for lvm2.

Any hints how the get access to the content of all LVs?

Regards
Daniel

-- 
"Those who would give up essential liberty, to purchase a little temporary 
safety, deserve neither liberty nor safety."  - Benjamin Franklin
