From: Marco Krohn <marco.krohn@gmx.de>
MIME-Version: 1.0
Message-Id: <19742.1017261647@www26.gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] VG lost, VG restorable without lvmconf? Need help!
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
Date: Wed Mar 27 14:40:06 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

 Hi, 
 
for my previous system I used LVM and was very satisfied with it. 
Therefore I wanted to use LVM again for my new system (after a 
reiserfs crash on the root partition). 
 
There was one volume group "system2" consisting of 6 PVs and one 
LV (dev/system2/common) (dev/system2/common survived the 
crash unharmed). I was on the way to install a new system (SuSE 7.3) 
and gave with Yast2 commands to add and format another PV 
(/dev/hdb4) and add two more LV. I do not know exactly what 
happened, but YaST  showed me an error that one of the LVM 
commands did not succeed (IIRC the problem was that creating 
another LV was not possible beause of missing disk space which 
sounded absurd to me since there were >30GB free) but anyway... I 
canceled the action and when I was back in the LVM screen my VG 
"system2" did not exist anymore :-( 
 
I have no lvmconf etc. :-( 
Is it possible to recover the VG from the data of the PVs? 
 
My system: 
Linux kernel 2.4.10-4 
Logical Volume Manager 1.0.1-rc2 
two EIDE harddisks: hda 30 GB / hdb 60 GB 
 
Some more information: 
 
 
//------------------  pvscan 
# pvscan 
pvscan -- reading all physical volumes (this may take a while...) 
pvscan -- inactive PV "/dev/hda6"  is associated to an unknown VG 
(run vgscan) 
pvscan -- inactive PV "/dev/hda7"  is associated to an unknown VG 
(run vgscan) 
pvscan -- inactive PV "/dev/hdb2"  is associated to an unknown VG 
(run vgscan) 
pvscan -- inactive PV "/dev/hdb5"  is associated to an unknown VG 
(run vgscan) 
pvscan -- inactive PV "/dev/hdb6"  is associated to an unknown VG 
(run vgscan) 
pvscan -- inactive PV "/dev/hdb7"  is associated to an unknown VG 
(run vgscan) 
pvscan -- total: 6 [64.69 GB] / in use: 6 [64.69 GB] / in no VG: 0 [0] 
 
 
//------------------ lvmdiskscan 
# lvmdiskscan 
lvmdiskscan -- reading all disks / partitions (this may take a while...) 
lvmdiskscan -- /dev/hda1 [       5.86 GB] Primary   [0x0B] 
lvmdiskscan -- /dev/hda4 [      22.77 GB] DOS extended partition 
[0x05] 
lvmdiskscan -- /dev/hda5 [     305.89 MB] Extended LINUX swap 
partition [0x82] 
lvmdiskscan -- /dev/hda6 [       9.77 GB] Extended LVM partition 
[0x8E] 
lvmdiskscan -- /dev/hda7 [      12.70 GB] Extended LVM partition 
[0x8E] 
lvmdiskscan -- /dev/hdb1 [       2.01 GB] Primary  LINUX native 
partition [0x83] 
lvmdiskscan -- /dev/hdb2 [      15.01 GB] Primary  LVM partition 
[0x8E] 
lvmdiskscan -- /dev/hdb3 [      27.22 GB] Primary  Windows98 
extended partition [0x0F] 
lvmdiskscan -- /dev/hdb4 [      13.00 GB] Primary  LVM partition 
[0x8E] 
lvmdiskscan -- /dev/hdb5 [      10.00 GB] Extended LVM partition 
[0x8E] 
lvmdiskscan -- /dev/hdb6 [      10.00 GB] Extended LVM partition 
[0x8E] 
lvmdiskscan -- /dev/hdb7 [       7.21 GB] Extended LVM partition 
[0x8E] 
lvmdiskscan -- 2 disks 
lvmdiskscan -- 0 whole disks 
lvmdiskscan -- 0 loop devices 
lvmdiskscan -- 0 multiple devices 
lvmdiskscan -- 0 network block devices 
lvmdiskscan -- 12 partitions 
lvmdiskscan -- 7 LVM physical volume partitions 
 
 
//------------------  vgscan 
# vgscan 
vgscan -- reading all physical volumes (this may take a while...) 
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created 
vgscan -- WARNING: This program does not do a VGDA backup of 
your volume group 
 
 
//------------------  vgdisplay 
linux:/home/krohn # vgdisplay 
vgdisplay -- no volume groups found 
 
 
//------------------  pvdata 
# pvdata -v -V -L /dev/hdb2 | grep -v empty 
--- Volume group --- 
VG Name 
VG Access             read/write 
VG Status             NOT available/resizable 
VG #                  0 
MAX LV                255 
Cur LV                1 
Open LV               0 
MAX LV Size           255.99 GB 
Max PV                255 
Cur PV                7 
Act PV                7 
VG Size               78.66 GB 
PE Size               4.00 MB 
Total PE              20136 
Alloc PE / Size       7680 / 30.00 GB 
Free  PE / Size       12456 / 48.66 GB 
VG UUID               avIX6o-E3LV-VSOO-30XL-tjxx-6aDb-Kr2BzB 
 
--- List of logical volumes --- 
 
--- Logical volume --- 
LV Name                /dev/system2/common 
VG Name                system2 
LV Write Access        read/write 
LV Status              NOT available 
LV #                   6 
# open                 0 
LV Size                30.00 GB 
Current LE             7680 
Allocated LE           7680 
Allocation             next free 
Read ahead sectors     120 
Block device           58:5 
read_ahead: 120 
 
for hda6, hda7, hdb5, hdb6, hdb7 the information are exactly the same 
 
hdb4 of course is not accessible 
 
# pvdata -v -V -L /dev/hdb4 
--- Volume group --- 
VG Name 
VG Access             error 
VG Status             NOT available/NOT resizable 
... 
 
 
I read parts of the German and English HowTo's and also searched 
google and the archive of this mailing list for help. I found the thread 
"VG lost, no lvmconf => Help !" but I am not sure if this helps me 
since I checked all PV UUID seem to be o.k. Probably I need UUID 
fixer to get my system back, but I am not sure if  20.1 of the HowTo 
is what I am looking for. 
 
Thanks, 
 
  Marco 
 
 

-- 
GMX - Die Kommunikationsplattform im Internet.
http://www.gmx.net
