From: pfeffer2@gmx.de
MIME-Version: 1.0
Message-ID: <3EEBABA6.3099.AB911F@localhost>
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Subject: [linux-lvm] Lost one disk from VG
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
Date: Sat Jun 14 16:11:04 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello,

I've got a big problem. I lost one disk of my vg. The VG spans over 
hda4, hdb1 and hdd1. I use Logical Volume Manager 0.9.1_beta7.
I've replaced it with the same disk and tried to do a vgcfgrestore -vv -n 
vg00 -o /dev/hdd1 /dev/hdc1 but ist says:

vgcfgrestore -- locking logical volume manager
vgcfgrestore -- restoring volume group "vg00" from 
"/etc/lvmconf/vg00.conf"
vgcfgrestore -- checking existence of "/etc/lvmconf/vg00.conf"
vgcfgrestore -- reading volume group data for "vg00" from 
"/etc/lvmconf/vg00.conf"
vgcfgrestore -- reading physical volume data for "vg00" from 
"/etc/lvmconf/vg00.conf"
vgcfgrestore -- reading logical volume data for "vg00" from 
"/etc/lvmconf/vg00.conf"
vgcfgrestore -- checking volume group consistency of "vg00"
vgcfgrestore -- checking volume group consistency of "vg00"
vgcfgrestore -- reading physical volume "/dev/hdc1"
vgcfgrestore -- checking for new physical volume "/dev/hdc1"
vgcfgrestore -- size of physical volume /dev/hdc1 differs from backup

The next thing that makes me woder ist the output of pvdata -PP:

PV Name               /dev/hda4
VG Name               vg00
PV Size               34.89 GB / NOT usable 2.66 MB [LVM: 155 KB]
PV#                   1
PV Status             available
Allocatable           yes (but full)
Cur LV                3
PE Size (KByte)       4096
Total PE              8930
Free PE               0
Allocated PE          8930
PV UUID               QdcPBs-QIwO-LdVf-KU4Q-2VtZ-YIpy-TjMsUV
pv_dev                   0:3
system_id                (none)1007200862
pv_on_disk.base          0
pv_on_disk.size          1024
vg_on_disk.base          1024
vg_on_disk.size          4608
pv_uuidlist_on_disk.base 6144
pv_uuidlist_on_disk.size 32896
lv_on_disk.base          39424
lv_on_disk.size          84296
pe_on_disk.base          123904
pe_on_disk.size          2666496

PV Name               /dev/hdb1
VG Name               vg00
PV Size               37.31 GB / NOT usable 1.41 MB [LVM: 158 KB]
PV#                   2
PV Status             available
Allocatable           yes
Cur LV                3
PE Size (KByte)       4096
Total PE              9550
Free PE               3361
Allocated PE          6189
PV UUID               xLkHYY-DbeL-mdOr-do4F-QbOA-x710-RdLuYb
pv_dev                   0:3
system_id                k6ii5001007291048
pv_on_disk.base          0
pv_on_disk.size          1024
vg_on_disk.base          1024
vg_on_disk.size          4608
pv_uuidlist_on_disk.base 6144
pv_uuidlist_on_disk.size 32896
lv_on_disk.base          39424
lv_on_disk.size          84296
pe_on_disk.base          123904
pe_on_disk.size          1354240

Should the system_id not be the same? How could I change the 
system_id?

vgscan dosen't find any volume groups.

How can I get the data from hda4 and hdb1?

Best regards

Stephan Pfeffer

P.S.: please excuse that my English is bad - I'm not a nativ speaker 
