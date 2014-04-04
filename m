Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s34LWr0w031136
	for <linux-lvm@redhat.com>; Fri, 4 Apr 2014 17:32:53 -0400
Received: from msa3.ucdavis.edu (msa3.ucdavis.edu [128.120.32.183])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s34LWo2w009100
	for <linux-lvm@redhat.com>; Fri, 4 Apr 2014 17:32:50 -0400
Received: from boombastic ([152.79.91.166]) (authenticated bits=0)
	by msa3.ucdavis.edu (8.14.4/8.14.5/it-rhel5-mimedefang-smtp-1.6) with
	ESMTP id s34LWe92039371
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 4 Apr 2014 14:32:41 -0700
From: "Ryan Davis" <rrdavis@ucdavis.edu>
Date: Fri, 4 Apr 2014 14:32:40 -0700
Message-ID: <016e01cf504d$68e3b0d0$3aab1270$@edu>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_016F_01CF5012.BC84D8D0"
Content-Language: en-us
Subject: [linux-lvm] Can't mount LVM RAID5 drives
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.

------=_NextPart_000_016F_01CF5012.BC84D8D0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

 

I have 3 drives in a RAID 5 configuration as a LVM volume.  These disks
contain /home

After performing a shutdown and moving the computer I can't get the drives
to mount automatically.

 

This is all new to me so I am not sure if this is a LVM issue but any help
is appreciated.  LVS shows I have a mapped device present without tables.

When I try to mount the volume to home this happens:

 

[root@hobbes ~]# mount  -t ext4 /dev/vg_data/lv_home /home

mount: wrong fs type, bad option, bad superblock on /dev/vg_data/lv_home,

       missing codepage or other error

       (could this be the IDE device where you in fact use

       ide-scsi so that sr0 or sda or so is needed?)

       In some cases useful info is found in syslog - try

       dmesg | tail  or so

 

[root@hobbes ~]# dmesg | tail

 

EXT4-fs (dm-0): unable to read superblock

 

[root@hobbes ~]# fsck.ext4 -v /dev/sdc1 

e4fsck 1.41.12 (17-May-2010)

fsck.ext4: Superblock invalid, trying backup blocks...

fsck.ext4: Bad magic number in super-block while trying to open /dev/sdc1

 

The superblock could not be read or does not describe a correct ext2

filesystem.  If the device is valid and it really contains an ext2

filesystem (and not swap or ufs or something else), then the superblock

is corrupt, and you might try running e4fsck with an alternate superblock:

    e4fsck -b 8193 <device>

 

[root@hobbes ~]# mke2fs -n /dev/sdc1 

mke2fs 1.39 (29-May-2006)

Filesystem label=

OS type: Linux

Block size=4096 (log=2)

Fragment size=4096 (log=2)

488292352 inodes, 976555199 blocks

48827759 blocks (5.00%) reserved for the super user

First data block=0

Maximum filesystem blocks=4294967296

29803 block groups

32768 blocks per group, 32768 fragments per group

16384 inodes per group

Superblock backups stored on blocks: 

        32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632,
2654208, 

        4096000, 7962624, 11239424, 20480000, 23887872, 71663616, 78675968, 

        102400000, 214990848, 512000000, 550731776, 644972544

 

Is the superblock issue causing the lvm issues?

Thanks for any input you might have.

 

Here are useful outputs about the system.

 

 

Here are some of the packages installed

#rpm -qa | egrep -i '(kernel|lvm2|device-mapper)'

 

device-mapper-1.02.67-2.el5

kernel-devel-2.6.18-348.18.1.el5

device-mapper-event-1.02.67-2.el5

kernel-headers-2.6.18-371.6.1.el5

lvm2-2.02.88-12.el5

device-mapper-1.02.67-2.el5

kernel-devel-2.6.18-371.3.1.el5

device-mapper-multipath-0.4.7-59.el5

kernel-2.6.18-371.6.1.el5

kernel-devel-2.6.18-371.6.1.el5

kernel-2.6.18-371.3.1.el5

kernel-2.6.18-348.18.1.el5

lvm2-cluster-2.02.88-9.el5_10.2

 

#uname -a

Linux hobbes 2.6.18-371.6.1.el5 #1 SMP Wed Mar 12 20:03:51 EDT 2014 x86_64
x86_64 x86_64 GNU/Linux

 

 

LVM info:

#vgs

  VG      #PV #LV #SN Attr   VSize VFree

  vg_data   1   1   0 wz--n- 3.64T    0 

#lvs

  LV      VG      Attr   LSize Origin Snap%  Move Log Copy%  Convert

  lv_home vg_data -wi-d- 3.64T                                      

 

Looks like I have a mapped device present without tables (d) attribute.

 

#pvs

  PV         VG      Fmt  Attr PSize PFree

  /dev/sdc1  vg_data lvm2 a--  3.64T    0 

 

#ls /dev/vg_data

lv_home

 

#vgscan --mknodes

 

  Reading all physical volumes.  This may take a while...

  Found volume group "vg_data" using metadata type lvm2

  

#pvscan

  PV /dev/sdc1   VG vg_data   lvm2 [3.64 TB / 0    free]

  Total: 1 [3.64 TB] / in use: 1 [3.64 TB] / in no VG: 0 [0   ]

  

#vgchange -ay

  1 logical volume(s) in volume group "vg_data" now active

  device-mapper: ioctl: error adding target to table

  

#dmesg |tail

device-mapper: table: device 8:33 too small for target

device-mapper: table: 253:0: linear: dm-linear: Device lookup failed

device-mapper: ioctl: error adding target to table

 

 

#vgdisplay -v

  --- Volume group ---

  VG Name               vg_data

  System ID             

  Format                lvm2

  Metadata Areas        1

  Metadata Sequence No  2

  VG Access             read/write

  VG Status             resizable

  MAX LV                0

  Cur LV                1

  Open LV               0

  Max PV                0

  Cur PV                1

  Act PV                1

  VG Size               3.64 TB

  PE Size               4.00 MB

  Total PE              953668

  Alloc PE / Size       953668 / 3.64 TB

  Free  PE / Size       0 / 0   

  VG UUID               b2w9mR-hvSc-Rm0k-3yHL-iEgc-6nMq-uq69E1

   

  --- Logical volume ---

  LV Name                /dev/vg_data/lv_home

  VG Name                vg_data

  LV UUID                13TmTm-YqIo-6xIp-1NHf-AJTu-9ImE-SHwLz6

  LV Write Access        read/write

  LV Status              available

  # open                 0

  LV Size                3.64 TB

  Current LE             953668

  Segments               1

  Allocation             inherit

  Read ahead sectors     16384

  - currently set to     256

  Block device           253:0

   

  --- Physical volumes ---

  PV Name               /dev/sdc1     

  PV UUID               8D67bX-xg4s-QRy1-4E8n-XfiR-0C2r-Oi1Blf

  PV Status             allocatable

  Total PE / Free PE    953668 / 0

   

#lvscan

  ACTIVE            '/dev/vg_data/lv_home' [3.64 TB] inherit

 

  

#partprobe -s

/dev/sda: msdos partitions 1 2 3 4 <5 6 7 8 9 10>

/dev/sdb: msdos partitions 1 2 3 4 <5 6 7 8 9 10>

/dev/sdc: gpt partitions 1

 

 

#dmsetup table

vg_data-lv_home: 

 

 

#dmsetup ls

vg_data-lv_home            (253, 0)

 

#lvdisplay -m

  --- Logical volume ---

  LV Name                /dev/vg_data/lv_home

  VG Name                vg_data

  LV UUID                13TmTm-YqIo-6xIp-1NHf-AJTu-9ImE-SHwLz6

  LV Write Access        read/write

  LV Status              available

  # open                 0

  LV Size                3.64 TB

  Current LE             953668

  Segments               1

  Allocation             inherit

  Read ahead sectors     16384

  - currently set to     256

  Block device           253:0

   

  --- Segments ---

  Logical extent 0 to 953667:

    Type                  linear

    Physical volume            /dev/sdc1

    Physical extents           0 to 953667

 

Here is a link to files outputted by lvmdump:
https://www.dropbox.com/sh/isg4fdmthiyoszh/tyYOfqllya

 

 


------=_NextPart_000_016F_01CF5012.BC84D8D0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 12 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US link=3Dblue =
vlink=3Dpurple><div class=3DWordSection1><p =
class=3DMsoNormal>Hi,<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>I have 3 =
drives in a RAID 5 configuration as a LVM volume.&nbsp; These disks =
contain /home<o:p></o:p></p><p class=3DMsoNormal>After performing a =
shutdown and moving the computer I can&#8217;t get the drives to mount =
automatically.<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>This is all =
new to me so I am not sure if this is a LVM issue but any help is =
appreciated.&nbsp; LVS shows I have a mapped device present without =
tables.<o:p></o:p></p><p class=3DMsoNormal>When I try to mount the =
volume to home this happens:<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>[root@hobbes =
~]# mount&nbsp; -t ext4 /dev/vg_data/lv_home /home<o:p></o:p></p><p =
class=3DMsoNormal>mount: wrong fs type, bad option, bad superblock on =
/dev/vg_data/lv_home,<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; missing codepage =
or other error<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (could this be =
the IDE device where you in fact use<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ide-scsi so that =
sr0 or sda or so is needed?)<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; In some cases =
useful info is found in syslog - try<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dmesg | =
tail&nbsp; or so<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>[root@hobbes =
~]# dmesg | tail<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>EXT4-fs =
(dm-0): unable to read superblock<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>[root@hobbes =
~]# fsck.ext4 -v /dev/sdc1 <o:p></o:p></p><p class=3DMsoNormal>e4fsck =
1.41.12 (17-May-2010)<o:p></o:p></p><p class=3DMsoNormal>fsck.ext4: =
Superblock invalid, trying backup blocks...<o:p></o:p></p><p =
class=3DMsoNormal>fsck.ext4: Bad magic number in super-block while =
trying to open /dev/sdc1<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>The =
superblock could not be read or does not describe a correct =
ext2<o:p></o:p></p><p class=3DMsoNormal>filesystem.&nbsp; If the device =
is valid and it really contains an ext2<o:p></o:p></p><p =
class=3DMsoNormal>filesystem (and not swap or ufs or something else), =
then the superblock<o:p></o:p></p><p class=3DMsoNormal>is corrupt, and =
you might try running e4fsck with an alternate =
superblock:<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nbsp;&nbsp; e4fsck =
-b 8193 &lt;device&gt;<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>[root@hobbes =
~]# mke2fs -n /dev/sdc1 <o:p></o:p></p><p class=3DMsoNormal>mke2fs 1.39 =
(29-May-2006)<o:p></o:p></p><p class=3DMsoNormal>Filesystem =
label=3D<o:p></o:p></p><p class=3DMsoNormal>OS type: =
Linux<o:p></o:p></p><p class=3DMsoNormal>Block size=3D4096 =
(log=3D2)<o:p></o:p></p><p class=3DMsoNormal>Fragment size=3D4096 =
(log=3D2)<o:p></o:p></p><p class=3DMsoNormal>488292352 inodes, 976555199 =
blocks<o:p></o:p></p><p class=3DMsoNormal>48827759 blocks (5.00%) =
reserved for the super user<o:p></o:p></p><p class=3DMsoNormal>First =
data block=3D0<o:p></o:p></p><p class=3DMsoNormal>Maximum filesystem =
blocks=3D4294967296<o:p></o:p></p><p class=3DMsoNormal>29803 block =
groups<o:p></o:p></p><p class=3DMsoNormal>32768 blocks per group, 32768 =
fragments per group<o:p></o:p></p><p class=3DMsoNormal>16384 inodes per =
group<o:p></o:p></p><p class=3DMsoNormal>Superblock backups stored on =
blocks: <o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;32768, =
98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208, =
<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4096000=
, 7962624, 11239424, 20480000, 23887872, 71663616, 78675968, =
<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1024000=
00, 214990848, 512000000, 550731776, 644972544<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Is the =
superblock issue causing the lvm issues?<o:p></o:p></p><p =
class=3DMsoNormal>Thanks for any input you might have.<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Here are =
useful outputs about the system.<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Here are =
some of the packages installed<o:p></o:p></p><p class=3DMsoNormal>#rpm =
-qa | egrep -i =
&#8216;(kernel|lvm2|device-mapper)&#8217;<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal><span =
lang=3DFR>device-mapper-1.02.67-2.el5<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DFR>kernel-devel-2.6.18-348.18.1.el5<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DFR>device-mapper-event-1.02.67-2.el5<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DFR>kernel-headers-2.6.18-371.6.1.el5<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DFR>lvm2-2.02.88-12.el5<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DFR>device-mapper-1.02.67-2.el5<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DFR>kernel-devel-2.6.18-371.3.1.el5<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DFR>device-mapper-multipath-0.4.7-59.el5<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DFR>kernel-2.6.18-371.6.1.el5<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DFR>kernel-devel-2.6.18-371.6.1.el5<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DFR>kernel-2.6.18-371.3.1.el5<o:p></o:p></span></p><p =
class=3DMsoNormal>kernel-2.6.18-348.18.1.el5<o:p></o:p></p><p =
class=3DMsoNormal>lvm2-cluster-2.02.88-9.el5_10.2<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>#uname =
-a<o:p></o:p></p><p class=3DMsoNormal>Linux hobbes 2.6.18-371.6.1.el5 #1 =
SMP Wed Mar 12 20:03:51 EDT 2014 x86_64 x86_64 x86_64 =
GNU/Linux<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>LVM =
info:<o:p></o:p></p><p class=3DMsoNormal>#vgs<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp; VG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #PV #LV #SN =
Attr&nbsp;&nbsp; VSize VFree<o:p></o:p></p><p class=3DMsoNormal>&nbsp; =
vg_data&nbsp;&nbsp; 1&nbsp;&nbsp; 1&nbsp;&nbsp; 0 wz--n- =
3.64T&nbsp;&nbsp;&nbsp; 0 <o:p></o:p></p><p =
class=3DMsoNormal>#lvs<o:p></o:p></p><p class=3DMsoNormal>&nbsp; =
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
Attr&nbsp;&nbsp; LSize Origin Snap%&nbsp; Move Log Copy%&nbsp; =
Convert<o:p></o:p></p><p class=3DMsoNormal>&nbsp; lv_home vg_data -wi-d- =
3.64T&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; <o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Looks like I have a mapped device present without =
tables (d) attribute.<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>#pvs<o:p></o:p></p><p class=3DMsoNormal>&nbsp; =
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
VG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fmt&nbsp; Attr PSize =
PFree<o:p></o:p></p><p class=3DMsoNormal>&nbsp; /dev/sdc1&nbsp; vg_data =
lvm2 a--&nbsp; 3.64T&nbsp;&nbsp;&nbsp; 0 <o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>#ls =
/dev/vg_data<o:p></o:p></p><p class=3DMsoNormal>lv_home<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>#vgscan =
--mknodes<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>&nbsp; Reading all physical volumes.&nbsp; This may =
take a while...<o:p></o:p></p><p class=3DMsoNormal>&nbsp; Found volume =
group &quot;vg_data&quot; using metadata type lvm2<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp; <o:p></o:p></p><p =
class=3DMsoNormal>#pvscan<o:p></o:p></p><p class=3DMsoNormal>&nbsp; PV =
/dev/sdc1&nbsp;&nbsp; VG vg_data&nbsp;&nbsp; lvm2 [3.64 TB / =
0&nbsp;&nbsp;&nbsp; free]<o:p></o:p></p><p class=3DMsoNormal>&nbsp; =
Total: 1 [3.64 TB] / in use: 1 [3.64 TB] / in no VG: 0 [0&nbsp;&nbsp; =
]<o:p></o:p></p><p class=3DMsoNormal>&nbsp; <o:p></o:p></p><p =
class=3DMsoNormal>#vgchange -ay<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp; 1 logical volume(s) in volume group =
&quot;vg_data&quot; now active<o:p></o:p></p><p class=3DMsoNormal>&nbsp; =
device-mapper: ioctl: error adding target to table<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp; <o:p></o:p></p><p class=3DMsoNormal>#dmesg =
|tail<o:p></o:p></p><p class=3DMsoNormal>device-mapper: table: device =
8:33 too small for target<o:p></o:p></p><p =
class=3DMsoNormal>device-mapper: table: 253:0: linear: dm-linear: Device =
lookup failed<o:p></o:p></p><p class=3DMsoNormal>device-mapper: ioctl: =
error adding target to table<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>#vgdisplay =
-v<o:p></o:p></p><p class=3DMsoNormal>&nbsp; --- Volume group =
---<o:p></o:p></p><p class=3DMsoNormal>&nbsp; VG =
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; vg_data<o:p></o:p></p><p class=3DMsoNormal>&nbsp; System =
ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;Format&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
lvm2<o:p></o:p></p><p class=3DMsoNormal>&nbsp; Metadata =
Areas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp; Metadata Sequence No&nbsp; 2<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp; VG =
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; read/write<o:p></o:p></p><p class=3DMsoNormal>&nbsp; VG =
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; resizable<o:p></o:p></p><p class=3DMsoNormal>&nbsp; MAX =
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 0<o:p></o:p></p><p class=3DMsoNormal>&nbsp; Cur =
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 1<o:p></o:p></p><p class=3DMsoNormal>&nbsp; Open =
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; 0<o:p></o:p></p><p class=3DMsoNormal>&nbsp; Max =
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 0<o:p></o:p></p><p class=3DMsoNormal>&nbsp; Cur =
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 1<o:p></o:p></p><p class=3DMsoNormal>&nbsp; Act =
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 1<o:p></o:p></p><p class=3DMsoNormal>&nbsp; VG =
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; 3.64 TB<o:p></o:p></p><p class=3DMsoNormal>&nbsp; PE =
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; 4.00 MB<o:p></o:p></p><p class=3DMsoNormal>&nbsp; Total =
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; 953668<o:p></o:p></p><p class=3DMsoNormal>&nbsp; Alloc PE / =
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 953668 / 3.64 =
TB<o:p></o:p></p><p class=3DMsoNormal>&nbsp; Free&nbsp; PE / =
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 / 0&nbsp;&nbsp; =
<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nbsp;VG =
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; b2w9mR-hvSc-Rm0k-3yHL-iEgc-6nMq-uq69E1<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp; <o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;--- Logical volume ---<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp; LV =
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; /dev/vg_data/lv_home<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp; VG =
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; vg_data<o:p></o:p></p><p class=3DMsoNormal>&nbsp; =
LV =
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; =
13TmTm-YqIo-6xIp-1NHf-AJTu-9ImE-SHwLz6<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp; LV Write =
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
read/write<o:p></o:p></p><p class=3DMsoNormal>&nbsp; LV =
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; available<o:p></o:p></p><p class=3DMsoNormal>&nbsp; # =
open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; 0<o:p></o:p></p><p class=3DMsoNormal>&nbsp; =
LV =
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; 3.64 TB<o:p></o:p></p><p class=3DMsoNormal>&nbsp; =
Current =
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; 953668<o:p></o:p></p><p class=3DMsoNormal>&nbsp; =
Segments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 1<o:p></o:p></p><p class=3DMsoNormal>&nbsp; =
Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; inherit<o:p></o:p></p><p class=3DMsoNormal>&nbsp; Read ahead =
sectors&nbsp;&nbsp;&nbsp;&nbsp; 16384<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp; - currently set to&nbsp;&nbsp;&nbsp;&nbsp; =
256<o:p></o:p></p><p class=3DMsoNormal>&nbsp; Block =
device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
253:0<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nbsp; <o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;--- Physical volumes ---<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp; PV =
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; /dev/sdc1&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;PV =
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; 8D67bX-xg4s-QRy1-4E8n-XfiR-0C2r-Oi1Blf<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp; PV =
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; allocatable<o:p></o:p></p><p class=3DMsoNormal>&nbsp; Total PE / =
Free PE&nbsp;&nbsp;&nbsp; 953668 / 0<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp; <o:p></o:p></p><p =
class=3DMsoNormal>#lvscan<o:p></o:p></p><p class=3DMsoNormal>&nbsp; =
ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;'/dev/vg_data/lv_home' [3.64 TB] inherit<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>&nbsp; =
<o:p></o:p></p><p class=3DMsoNormal><span lang=3DFR>#partprobe =
-s<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DFR>/dev/sda: =
msdos partitions 1 2 3 4 &lt;5 6 7 8 9 10&gt;<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DFR>/dev/sdb: msdos partitions 1 2 3 4 =
&lt;5 6 7 8 9 10&gt;<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DFR>/dev/sdc: gpt partitions 1<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DFR><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DFR><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal>#dmsetup table<o:p></o:p></p><p =
class=3DMsoNormal>vg_data-lv_home: <o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>#dmsetup =
ls<o:p></o:p></p><p =
class=3DMsoNormal>vg_data-lv_home&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; (253, 0)<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>#lvdisplay =
-m<o:p></o:p></p><p class=3DMsoNormal>&nbsp; --- Logical volume =
---<o:p></o:p></p><p class=3DMsoNormal>&nbsp; LV =
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; /dev/vg_data/lv_home<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp; VG =
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; vg_data<o:p></o:p></p><p class=3DMsoNormal>&nbsp; =
LV =
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; =
13TmTm-YqIo-6xIp-1NHf-AJTu-9ImE-SHwLz6<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp; LV Write =
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
read/write<o:p></o:p></p><p class=3DMsoNormal>&nbsp; LV Status =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;available<o:p></o:p></p><p class=3DMsoNormal>&nbsp; # =
open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; 0<o:p></o:p></p><p class=3DMsoNormal>&nbsp; =
LV =
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; 3.64 TB<o:p></o:p></p><p class=3DMsoNormal>&nbsp; =
Current =
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; 953668<o:p></o:p></p><p class=3DMsoNormal>&nbsp; =
Segments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 1<o:p></o:p></p><p class=3DMsoNormal>&nbsp; =
Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; inherit<o:p></o:p></p><p class=3DMsoNormal>&nbsp; Read ahead =
sectors&nbsp;&nbsp;&nbsp;&nbsp; 16384<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp; - currently set to&nbsp;&nbsp;&nbsp;&nbsp; =
256<o:p></o:p></p><p class=3DMsoNormal>&nbsp; Block =
device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;253:0<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp; <o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;--- Segments ---<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp; Logical extent 0 to 953667:<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp; =
Type&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; linear<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp; Physical =
volume&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
/dev/sdc1<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nbsp;&nbsp; Physical =
extents&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 to =
953667<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Here is a link to files outputted by lvmdump: <a =
href=3D"https://www.dropbox.com/sh/isg4fdmthiyoszh/tyYOfqllya">https://ww=
w.dropbox.com/sh/isg4fdmthiyoszh/tyYOfqllya</a><o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>
------=_NextPart_000_016F_01CF5012.BC84D8D0--
