Message-ID: <20010909221342.48255.qmail@web13905.mail.yahoo.com>
Date: Sun, 9 Sep 2001 15:13:42 -0700 (PDT)
From: Michael <m_holschbach@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] missing vg after reboot
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-lvm@sistina.com

Hi!

I'm using LVM 0.9.1_beta7 on SuSE Linux 7.2.

I created a second VG (the other VG is detected by
vgscan on bootup) with only one PV and added some LV
to it. Later I added a second PV to the second VG and
i copied the old LV to new LV with stripes=2. All this
configuration was made with the lvm tool included in
yast from SuSE.
During reboot the system finds the first VG, but not
the second one, which was detected before, when only
one PV was assigned to it. I was using the second VG
before reboot with two assigned PV. 


*** output, which might be of interest:

server1:/etc/lvmconf # pvdata /dev/hda2
--- Physical volume ---
PV Name               /dev/hda2
VG Name              
��������������������������������������������������������������������
�����������������������npuspupupupupupupupupspupspspspspssp��������㝨����������ppppupupupu
pupupuspupupupupspspupupupspupspupupunP2?PPPPPnrpppp�}��������������������������������������
PV Size               923.51 GB / NOT usable 720.86 GB
[LVM: 586.02 MB]
PV#                   4057395697
PV Status             available
Allocatable           NO
Cur LV                1886614896
PE Size (KByte)       985249850
Total PE              1936748912
Free PE               50003456
Allocated PE          1886745456
PV UUID              
,1HVA7-GV��-H�G>-H,HA-GH71-�H��-OIKOKO

pvdata -- can't seek to volume group struct physical
volume "/dev/hda2"

*** hda2 is the partition, i added later to the second
vg

server1:~ # pvscan /dev/hda2
pvscan -- reading all physical volumes (this may take
a while...)
pvscan -- ACTIVE   PV "/dev/sda2" of VG "system" [3.84
GB / 0 free]
pvscan -- ACTIVE   PV "/dev/sdb2" of VG "system" [3.91
GB / 2.49 GB free]
pvscan -- inactive PV "/dev/hdc2"  is associated to an
unknown VG (run vgscan)
pvscan -- total: 3 [36.25 GB] / in use: 3 [36.25 GB] /
in no VG: 0 [0]

server1:/etc/lvmconf # vgscan
vgscan -- reading all physical volumes (this may take
a while...)
vgscan -- found active volume group "system"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d"
successfully created
vgscan -- WARNING: This program does not do a VGDA
backup of your volume group

*** "system" is the first VG, the missing VG was
called "data"

server1:~ # pvdisplay /dev/hda2
pvdisplay -- no physical volume identifier on
"/dev/hda2"

server1:~ # vgcfgrestore -v -n data /dev/hda2
vgcfgrestore -- locking logical volume manager
vgcfgrestore -- restoring volume group "data" from
"/etc/lvmconf/data.conf"
vgcfgrestore -- checking existence of
"/etc/lvmconf/data.conf"
vgcfgrestore -- reading volume group data for "data"
from "/etc/lvmconf/data.con
f"
vgcfgrestore -- reading physical volume data for
"data" from "/etc/lvmconf/data.
conf"
vgcfgrestore -- reading logical volume data for "data"
from "/etc/lvmconf/data.c
onf"
vgcfgrestore -- checking volume group consistency of
"data"
vgcfgrestore -- checking volume group consistency of
"data"
vgcfgrestore -- reading physical volume "/dev/hda2"
vgcfgrestore -- ERROR "pv_read(): PV identifier
invalid" reading physical volume
 "/dev/hda2"


server1:~ # vgcfgrestore -v -ll -n data /dev/hda2
|more
vgcfgrestore -- locking logical volume manager
vgcfgrestore -- restoring volume group "data" from
"/etc/lvmconf/data.conf"
vgcfgrestore -- checking existence of
"/etc/lvmconf/data.conf"
vgcfgrestore -- reading volume group data for "data"
from "/etc/lvmconf/data.con
f"
vgcfgrestore -- reading physical volume data for
"data" from "/etc/lvmconf/data.
conf"
vgcfgrestore -- reading logical volume data for "data"
from "/etc/lvmconf/data.c
onf"
vgcfgrestore -- checking volume group consistency of
"data"
vgcfgrestore -- checking volume group consistency of
"data"
--- Volume group ---
VG Name               data
VG Access             read/write
VG Status             NOT available/resizable
VG #                  1
MAX LV                256
Cur LV                6
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                2
Act PV                2
VG Size               56.11 GB
PE Size               4 MB
Total PE              14364
Alloc PE / Size       12800 / 50 GB
Free  PE / Size       1564 / 6.11 GB
VG UUID              
k6Out8-Mlm6-2vwt-KgX5-uwKl-3M3V-v732Os

--- Logical volume ---

*** [...]

--- Physical volume ---
PV Name               /dev/hdc2
VG Name               data
PV Size               28.5 GB / NOT usable 580 KB
[LVM: 149 KB]
PV#                   1
PV Status             available
Allocatable           yes
Cur LV                6
PE Size (KByte)       4096
Total PE              7295
Free PE               895
Allocated PE          6400
PV UUID              
QC9SlR-9er7-zW6p-MryA-9T2F-MAJN-2g6ClJ

--- Physical volume ---
PV Name               /dev/hda2
VG Name               data
PV Size               27.62 GB / NOT usable 2.48 MB
[LVM: 148 KB]
PV#                   2
PV Status             available
Allocatable           yes
Cur LV                6
PE Size (KByte)       4096
Total PE              7069
Free PE               669
Allocated PE          6400
PV UUID              
e7sX5R-XnTm-keX6-jShf-tTlw-DUP3-mzp4zW



vgcfgrestore -- unlocking logical volume manager


***

Is there any way to fix the PV on hda2? I tried a tool
called uuid_fixer, but i only got the output "Illegal
instruction" back. 

MfG Michael

__________________________________________________
Do You Yahoo!?
Get email alerts & NEW webcam video instant messaging with Yahoo! Messenger
http://im.yahoo.com
