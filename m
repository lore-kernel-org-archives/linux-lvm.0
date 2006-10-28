Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9S9TZms022559
	for <linux-lvm@redhat.com>; Sat, 28 Oct 2006 05:29:35 -0400
Received: from nf-out-0910.google.com (nf-out-0910.google.com [64.233.182.186])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k9S9TUSA020843
	for <linux-lvm@redhat.com>; Sat, 28 Oct 2006 05:29:30 -0400
Received: by nf-out-0910.google.com with SMTP id l36so1588916nfa
	for <linux-lvm@redhat.com>; Sat, 28 Oct 2006 02:29:29 -0700 (PDT)
Message-ID: <2bf2e7940610280229y5605663frf1ff006adbdd091b@mail.gmail.com>
Date: Sat, 28 Oct 2006 11:29:28 +0200
From: "Sebastian Wormser" <sebastian.wormser@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_48706_18493024.1162027768729"
Subject: [linux-lvm] Unable to import exported VG
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

------=_Part_48706_18493024.1162027768729
Content-Type: multipart/alternative; 
	boundary="----=_Part_48707_31118196.1162027768729"

------=_Part_48707_31118196.1162027768729
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

I have a problem with importing an exported Volume Group. Hopefully you can
help me with this.

Here's the error message:

matrix:/tmp # vgimport -v -f vgData /dev/hdb1
vgimport -- locking logical volume manager
vgimport -- checking volume group name
vgimport -- checking volume group "vgData" existence
vgimport -- trying to read physical volume
vgimport -- checking for duplicate physical volumes
vgimport -- checking physical volume name "/dev/hdb1"
vgimport -- reading data of physical volume "/dev/hdb1" from disk
vgimport -- checking for exported physical volume "/dev/hdb1"
vgimport -- checking consistency of physical volume "/dev/hdb1"
vgimport -- reallocating memory
vgimport -- reading exported volume group data  of "vgData" from disk(s)
vgimport -- ERROR "lv_read_all_lv(): number of LV" reading data of volume
group "vgData"


Background Information:

The power supply of my PC broke. After replacing it, the system would not
boot, so I tried different
things to recover. One of these things was booting Knoppix. This worked only
after I removed an
apparently broken USB card. I was stupid enough to try and mount the VG
within Knoppix. It did
not work, but I issued the vgexport command for no real reason *sigh*
After that I bootet my normal system (see below) and was unable to mount or
import the VG.


Some more info on the system:

matrix:/tmp # uname -a
Linux matrix 2.4.21-273-athlon #1 Mon Jan 17 13:03:46 UTC 2005 i686 athlon
i386 GNU/Linux

matrix:/tmp # cat /etc/SuSE-release
SuSE Linux 9.0 (i586)
VERSION = 9.0

matrix:/tmp # vgdisplay --version
vgdisplay: Logical Volume Manager 1.0.7(mp-v6)
Heinz Mauelshagen, Sistina Software  28/03/2003 (IOP 10)

matrix:/tmp # vgscan -v
vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- scanning for all active volume group(s) first
vgscan -- reading data of volume group "vgDataPV_EXP" from physical
volume(s)
vgscan -- ERROR "lv_read_all_lv(): number of LV" can't get data of volume
group "vgDataPV_EXP" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
group

matrix:/tmp # pvscan -v
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- walking through all physical volumes found
pvscan -- inactive PV "/dev/hdb1"  is in EXPORTED VG "vgData" [186.30 GB /
42.81 GB free]
pvscan -- total: 1 [186.31 GB] / in use: 1 [186.31 GB] / in no VG: 0 [0]

matrix:/tmp # pvdata -PP /dev/hdb1
--- Physical volume ---
PV Name               /dev/hdb1
VG Name               vgDataPV_EXP
PV Size               186.31 GB [390716864 secs] / NOT usable 4.31 MB [LVM:
310 KB]
PV#                   1
PV Status             NOT available
Allocatable           yes
Cur LV                6
PE Size (KByte)       4096
Total PE              47693
Free PE               10960
Allocated PE          36733
PV UUID               6COP7v-pdrO-5NDv-K7ib-12DB-e1IF-oXL4Zf
pv_dev                   0:0
system_id                PV_EXPKnoppix1155900061
pv_on_disk.base          0
pv_on_disk.size          1024
vg_on_disk.base          4096
vg_on_disk.size          4096
pv_uuidlist_on_disk.base 8192
pv_uuidlist_on_disk.size 32768
lv_on_disk.base          40960
lv_on_disk.size          83968
pe_on_disk.base          126976
pe_on_disk.size          4395008

matrix:~ # ls -l /etc/lvmconf/
total 6428
drwxr-xr-x    2 root     root          360 Nov 27  2005 .
drwxr-xr-x   77 root     root         8000 Oct 23 00:28 ..
-rw-r-----    1 root     root       926764 Nov 27  2005 vgData.conf
-rw-r-----    1 root     root       906284 Oct 10  2005 vgData.conf.1.old
-rw-r-----    1 root     root       885804 Feb  4  2005 vgData.conf.2.old
-rw-r-----    1 root     root       803884 Sep 29  2004 vgData.conf.3.old
-rw-r-----    1 root     root       783404 Sep 25  2004 vgData.conf.4.old
-rw-r-----    1 root     root       762924 Sep 18  2004 vgData.conf.5.old
-rw-r-----    1 root     root       760920 Sep 10  2004 vgData.conf.6.old
-rw-r-----    1 root     root       719960 Aug 18  2004 vgData.conf.7.old

matrix:~ # vgcfgrestore -v -n vgData -ll
vgcfgrestore -- INFO: using backup file "/etc/lvmconf/vgData.conf"
vgcfgrestore -- locking logical volume manager
vgcfgrestore -- restoring volume group "vgData" from
"/etc/lvmconf/vgData.conf"
vgcfgrestore -- checking existence of "/etc/lvmconf/vgData.conf"
vgcfgrestore -- reading volume group data for "vgData" from
"/etc/lvmconf/vgData.conf"
vgcfgrestore -- reading physical volume data for "vgData" from
"/etc/lvmconf/vgData.conf"
vgcfgrestore -- reading logical volume data for "vgData" from
"/etc/lvmconf/vgData.conf"
vgcfgrestore -- checking volume group consistency of "vgData"
vgcfgrestore -- checking volume group consistency of "vgData"
--- Volume group ---
VG Name               vgData
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                256
Cur LV                6
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               186.30 GB
PE Size               4 MB
Total PE              47693
Alloc PE / Size       36733 / 143.49 GB
Free  PE / Size       10960 / 42.81 GB
VG UUID               sVZZnE-ctpQ-AlZ6-HTgo-4arL-M6Yj-BKKw62

--- Logical volume ---
LV Name                /dev/vgData/lvOldHome
VG Name                vgData
LV Write Access        read/write
LV Status              NOT available
LV #                   1
# open                 0
LV Size                5 GB
Current LE             1280
Allocated LE           1280
Allocation             next free
Read ahead sectors     1024
Block device           58:0

--- Logical volume ---
LV Name                /dev/vgData/lvHome
VG Name                vgData
LV Write Access        read/write
vgcfgrestore -- "/etc/lvmtab.d/vgData" doesn't exist

--- Logical volume ---
LV Name                /dev/vgData/lvMP3
VG Name                vgData
LV Write Access        read/write
LV Status              NOT available
LV #                   3
# open                 0
LV Size                50 GB
Current LE             12800
Allocated LE           12800
Allocation             next free
Read ahead sectors     1024
Block device           58:1

--- Logical volume ---
LV Name                /dev/vgData/lvVideo
VG Name                vgData
LV Write Access        read/write
LV Status              NOT available
LV #                   4
# open                 0
LV Size                45 GB
Current LE             11520
Allocated LE           11520
Allocation             next free
Read ahead sectors     1024
Block device           58:3

--- Logical volume ---
LV Name                /dev/vgData/lvMatrixHome
VG Name                vgData
LV Write Access        read/write
LV Status              NOT available
LV #                   5
# open                 0
LV Size                29 GB
Current LE             7424
Allocated LE           7424
Allocation             next free
Read ahead sectors     1024
Block device           58:4

--- Logical volume ---
LV Name                /dev/vgData/SnapHome
VG Name                vgData
LV Write Access        read only
vgcfgrestore -- "/etc/lvmtab.d/vgData" doesn't exist


--- Physical volume ---
PV Name               /dev/hdb1
VG Name               vgData
PV Size               186.31 GB [390716864 secs] / NOT usable 4.31 MB [LVM:
314 KB]
PV#                   2
PV Status             available
Allocatable           yes
Cur LV                6
PE Size (KByte)       4096
Total PE              47693
Free PE               10960
Allocated PE          36733
PV UUID               6COP7v-pdrO-5NDv-K7ib-12DB-e1IF-oXL4Zf

matrix:~ # vgdisplay -Dv
vgdisplay -- WARNING: volume group "vgDataPV_EXP" is exported
vgdisplay -- ERROR "lv_read_all_lv(): number of LV" getting data of
"vgDataPV_EXP" from disk(s)


I attached the output of vgscan -d as gzipped file.

Please let me know if you need any more information.
Thank you very much in advance for any help!


cu,

  Sebastian
-- 
Sebastian Wormser
If you gotta be dumb, you gotta be tough.

------=_Part_48707_31118196.1162027768729
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,<br>
<br>
I have a problem with importing an exported Volume Group. Hopefully you can help me with this.<br>
<br>
Here's the error message:<br>
<br>
matrix:/tmp # vgimport -v -f vgData /dev/hdb1<br>
vgimport -- locking logical volume manager<br>
vgimport -- checking volume group name<br>
vgimport -- checking volume group &quot;vgData&quot; existence<br>
vgimport -- trying to read physical volume<br>
vgimport -- checking for duplicate physical volumes<br>
vgimport -- checking physical volume name &quot;/dev/hdb1&quot;<br>
vgimport -- reading data of physical volume &quot;/dev/hdb1&quot; from disk<br>
vgimport -- checking for exported physical volume &quot;/dev/hdb1&quot;<br>
vgimport -- checking consistency of physical volume &quot;/dev/hdb1&quot;<br>
vgimport -- reallocating memory<br>
vgimport -- reading exported volume group data&nbsp; of &quot;vgData&quot; from disk(s)<br>
vgimport -- ERROR &quot;lv_read_all_lv(): number of LV&quot; reading data of volume group &quot;vgData&quot;<br>
<br>
<br>
Background Information:<br>
<br>
The power supply of my PC broke. After replacing it, the system would not boot, so I tried different<br>
things to recover. One of these things was booting Knoppix. This worked only after I removed an<br>
apparently broken USB card. I was stupid enough to try and mount the VG within Knoppix. It did<br>
not work, but I issued the vgexport command for no real reason *sigh*<br>
After that I bootet my normal system (see below) and was unable to mount or import the VG.<br>
<br>
<br>
Some more info on the system:<br>
<br>
matrix:/tmp # uname -a<br>
Linux matrix 2.4.21-273-athlon #1 Mon Jan 17 13:03:46 UTC 2005 i686 athlon i386 GNU/Linux<br>
<br>
matrix:/tmp # cat /etc/SuSE-release <br>
SuSE Linux 9.0 (i586)<br>
VERSION = 9.0<br>
<br>
matrix:/tmp # vgdisplay --version<br>
vgdisplay: Logical Volume Manager 1.0.7(mp-v6)<br>
Heinz Mauelshagen, Sistina Software&nbsp; 28/03/2003 (IOP 10)<br>
<br clear="all">matrix:/tmp # vgscan -v<br>
vgscan -- removing &quot;/etc/lvmtab&quot; and &quot;/etc/lvmtab.d&quot;<br>
vgscan -- creating empty &quot;/etc/lvmtab&quot; and &quot;/etc/lvmtab.d&quot;<br>
vgscan -- reading all physical volumes (this may take a while...)<br>
vgscan -- scanning for all active volume group(s) first<br>
vgscan -- reading data of volume group &quot;vgDataPV_EXP&quot; from physical volume(s)<br>
vgscan -- ERROR &quot;lv_read_all_lv(): number of LV&quot; can't get data of volume group &quot;vgDataPV_EXP&quot; from physical volume(s)<br>
vgscan -- &quot;/etc/lvmtab&quot; and &quot;/etc/lvmtab.d&quot; successfully created<br>
vgscan -- WARNING: This program does not do a VGDA backup of your volume group<br>
<br>
matrix:/tmp # pvscan -v<br>
pvscan -- reading all physical volumes (this may take a while...)<br>
pvscan -- walking through all physical volumes found<br>
pvscan -- inactive PV &quot;/dev/hdb1&quot;&nbsp; is in EXPORTED VG &quot;vgData&quot; [186.30 GB / 42.81 GB free]<br>
pvscan -- total: 1 [186.31 GB] / in use: 1 [186.31 GB] / in no VG: 0 [0]<br>
<br>
matrix:/tmp # pvdata -PP /dev/hdb1<br>
--- Physical volume ---<br>
PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/hdb1<br>
VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vgDataPV_EXP<br>
PV
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
186.31 GB [390716864 secs] / NOT usable 4.31 MB [LVM: 310 KB]<br>
PV#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<br>
PV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NOT available<br>
Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; yes<br>
Cur LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6<br>
PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096<br>
Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 47693<br>
Free PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10960<br>
Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 36733<br>
PV
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
6COP7v-pdrO-5NDv-K7ib-12DB<div id="mb_0">-e1IF-oXL4Zf<br>
pv_dev&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0:0<br>
system_id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PV_EXPKnoppix1155900061<br>
pv_on_disk.base&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
pv_on_disk.size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1024<br>
vg_on_disk.base&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096<br>
vg_on_disk.size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096<br>
pv_uuidlist_on_disk.base 8192<br>
pv_uuidlist_on_disk.size 32768<br>
lv_on_disk.base&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 40960<br>
lv_on_disk.size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 83968<br>
pe_on_disk.base&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 126976<br>
pe_on_disk.size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4395008<br>
<br>
matrix:~ # ls -l /etc/lvmconf/<br>
total 6428<br>
drwxr-xr-x&nbsp;&nbsp;&nbsp; 2 root&nbsp;&nbsp;&nbsp;&nbsp;
root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 360 Nov
27&nbsp; 2005 .<br>
drwxr-xr-x&nbsp;&nbsp; 77 root&nbsp;&nbsp;&nbsp;&nbsp; root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8000 Oct 23 00:28 ..<br>
-rw-r-----&nbsp;&nbsp;&nbsp; 1 root&nbsp;&nbsp;&nbsp;&nbsp;
root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 926764 Nov 27&nbsp; 2005
vgData.conf<br>
-rw-r-----&nbsp;&nbsp;&nbsp; 1 root&nbsp;&nbsp;&nbsp;&nbsp;
root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 906284 Oct 10&nbsp; 2005
vgData.conf.1.old<br>
-rw-r-----&nbsp;&nbsp;&nbsp; 1 root&nbsp;&nbsp;&nbsp;&nbsp;
root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 885804 Feb&nbsp; 4&nbsp; 2005
vgData.conf.2.old<br>
-rw-r-----&nbsp;&nbsp;&nbsp; 1 root&nbsp;&nbsp;&nbsp;&nbsp;
root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 803884 Sep 29&nbsp; 2004
vgData.conf.3.old<br>
-rw-r-----&nbsp;&nbsp;&nbsp; 1 root&nbsp;&nbsp;&nbsp;&nbsp;
root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 783404 Sep 25&nbsp; 2004
vgData.conf.4.old<br>
-rw-r-----&nbsp;&nbsp;&nbsp; 1 root&nbsp;&nbsp;&nbsp;&nbsp;
root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 762924 Sep 18&nbsp; 2004
vgData.conf.5.old<br>
-rw-r-----&nbsp;&nbsp;&nbsp; 1 root&nbsp;&nbsp;&nbsp;&nbsp;
root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 760920 Sep 10&nbsp; 2004
vgData.conf.6.old<br>
-rw-r-----&nbsp;&nbsp;&nbsp; 1 root&nbsp;&nbsp;&nbsp;&nbsp;
root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 719960 Aug 18&nbsp; 2004
vgData.conf.7.old<br>
<br>
matrix:~ # vgcfgrestore -v -n vgData -ll <br>
vgcfgrestore -- INFO: using backup file &quot;/etc/lvmconf/vgData.conf&quot;<br>
vgcfgrestore -- locking logical volume manager<br>
vgcfgrestore -- restoring volume group &quot;vgData&quot; from &quot;/etc/lvmconf/vgData.conf&quot;<br>
vgcfgrestore -- checking existence of &quot;/etc/lvmconf/vgData.conf&quot;<br>
vgcfgrestore -- reading volume group data for &quot;vgData&quot; from &quot;/etc/lvmconf/vgData.conf&quot;<br>
vgcfgrestore -- reading physical volume data for &quot;vgData&quot; from &quot;/etc/lvmconf/vgData.conf&quot;<br>
vgcfgrestore -- reading logical volume data for &quot;vgData&quot; from &quot;/etc/lvmconf/vgData.conf&quot;<br>
vgcfgrestore -- checking volume group consistency of &quot;vgData&quot;<br>
vgcfgrestore -- checking volume group consistency of &quot;vgData&quot;<br>
--- Volume group ---<br>
VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vgData<br>
VG Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<br>
VG Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NOT available/resizable<br>
VG #&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
MAX LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 256<br>
Cur LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6<br>
Open LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
MAX LV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 255.99 GB<br>
Max PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 256<br>
Cur PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<br>
Act PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<br>
VG Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 186.30 GB<br>
PE Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4 MB<br>
Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 47693<br>
Alloc PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 36733 / 143.49 GB<br>
Free&nbsp; PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10960 / 42.81 GB<br>
VG
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
sVZZnE-ctpQ-AlZ6-HTgo-4arL-M6Yj-BKKw62<br>
<br>
--- Logical volume ---<br>
LV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/vgData/lvOldHome<br>
VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vgData<br>
LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<br>
LV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NOT available<br>
LV #&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<br>
# open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
LV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5 GB<br>
Current LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1280<br>
Allocated LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1280<br>
Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; next free<br>
Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 1024<br>
Block device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 58:0<br>
<br>
--- Logical volume ---<br>
LV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/vgData/lvHome<br>
VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vgData<br>
LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<br>
vgcfgrestore -- &quot;/etc/lvmtab.d/vgData&quot; doesn't exist<br>
<br>
--- Logical volume ---<br>
LV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/vgData/lvMP3<br>
VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vgData<br>
LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<br>
LV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NOT available<br>
LV #&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3<br>
# open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
LV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 50 GB<br>
Current LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 12800<br>
Allocated LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 12800<br>
Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; next free<br>
Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 1024<br>
Block device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 58:1<br>
<br>
--- Logical volume ---<br>
LV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/vgData/lvVideo<br>
VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vgData<br>
LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<br>
LV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NOT available<br>
LV #&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4<br>
# open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
LV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 45 GB<br>
Current LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 11520<br>
Allocated LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 11520<br>
Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; next free<br>
Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 1024<br>
Block device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 58:3<br>
<br>
--- Logical volume ---<br>
LV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/vgData/lvMatrixHome<br>
VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vgData<br>
LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write<br>
LV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NOT available<br>
LV #&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5<br>
# open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
LV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 29 GB<br>
Current LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7424<br>
Allocated LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7424<br>
Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; next free<br>
Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 1024<br>
Block device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 58:4<br>
<br>
--- Logical volume ---<br>
LV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/vgData/SnapHome<br>
VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vgData<br>
LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read only<br>
vgcfgrestore -- &quot;/etc/lvmtab.d/vgData&quot; doesn't exist<br>
<br>
<br>
--- Physical volume ---<br>
PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/hdb1<br>
VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vgData<br>
PV
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
186.31 GB [390716864 secs] / NOT usable 4.31 MB [LVM: 314 KB]<br>
PV#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2<br>
PV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; available<br>
Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; yes<br>
Cur LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6<br>
PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096<br>
Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 47693<br>
Free PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10960<br>
Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 36733<br>
PV
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
6COP7v-pdrO-5NDv-K7ib-12DB-e1IF-oXL4Zf<br>
<br>
matrix:~ # vgdisplay -Dv<br>
vgdisplay -- WARNING: volume group &quot;vgDataPV_EXP&quot; is exported<br>
vgdisplay -- ERROR &quot;lv_read_all_lv(): number of LV&quot; getting data of &quot;vgDataPV_EXP&quot; from disk(s)<br>
<br>
<br>
I attached the output of vgscan -d as gzipped file.<br>
<br>
Please let me know if you need any more information. <br>
Thank you very much in advance for any help!<br>
</div><br clear="all"><br>cu,<br><br>&nbsp; Sebastian<br>-- <br>Sebastian Wormser<br>If you gotta be dumb, you gotta be tough.

------=_Part_48707_31118196.1162027768729--

------=_Part_48706_18493024.1162027768729
Content-Type: application/x-gzip; name=vgscan_d.txt.gz
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ettt83jo
Content-Disposition: attachment; filename="vgscan_d.txt.gz"

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
q7hi5aOj/wP79Wz208sAAA==
------=_Part_48706_18493024.1162027768729--
