Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0ULQx115255
	for <linux-lvm@redhat.com>; Mon, 30 Jan 2006 16:26:59 -0500
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.197])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k0ULQn3Z013059
	for <linux-lvm@redhat.com>; Mon, 30 Jan 2006 16:26:49 -0500
Received: by wproxy.gmail.com with SMTP id i7so1238775wra
	for <linux-lvm@redhat.com>; Mon, 30 Jan 2006 13:26:45 -0800 (PST)
Message-ID: <6a83e6620601301326l4c4db027oa748dcff72e368c6@mail.gmail.com>
Date: Mon, 30 Jan 2006 15:26:45 -0600
From: tufkal <tufkal@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_14251_23249113.1138656405483"
Subject: [linux-lvm] LVM Confusion
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

------=_Part_14251_23249113.1138656405483
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

This is kind of a long story but I will try to keep it simple.  I have a
linux file/web/mythtv/blah server that I run at my business.  I recently
added a 120GB and a 80GB drive to the machine.  Here was the setup prior to
that.

120GB Seagate
-9GB / ext3
-1GB Swap
-110GB lvmhome xfs

120GB Seagate
-120GB lvmhome xfs


The 2 lvm partitions were used together as a ~220GB /home partition, and
everything worked well.  Then I decided to add the 2 new drives.  The
geometry now looks like this

120GB Seagate
-9GB / ext3
-1GB Swap
-110GB lvmhome xfs

120GB Seagate
-120GB lvmhome xfs

120GB Seagate
-80GB lvmhome xfs
-40GB /home/me linuxraid

80GB Seagate
-40GB lvmhome xfs
-40GB /home/me linuxraid

I setup 40GB on each new drive apart in a raid1 mirror using mdadm.  Then
with the 120GB of new LVM space due to me, I tried to add it to my LVM
home.  I am unable to get the space.  Here are the outputs of a few command=
s
for some help.

tufkal@tux:/home$ sudo lvm lvscan
Password:
  ACTIVE            '/dev/lvmhome/home' [325.82 GB] inherit
tufkal@tux:/home$ sudo lvm pvscan
  PV /dev/hdb5   VG lvmhome   lvm2 [107.39 GB / 0    free]
  PV /dev/hdc5   VG lvmhome   lvm2 [110.23 GB / 0    free]
  PV /dev/sdb5   VG lvmhome   lvm2 [35.46 GB / 0    free]
  PV /dev/sda5   VG lvmhome   lvm2 [72.73 GB / 0    free]
  Total: 4 [325.82 GB] / in use: 4 [325.82 GB] / in no VG: 0 [0   ]
tufkal@tux:/home$ sudo lvm vgscan
  Reading all physical volumes.  This may take a while...
  Found volume group "lvmhome" using metadata type lvm2
tufkal@tux:/home$

According to those, everything looks great!  I should have 325GB of space!

tufkal@tux:/home$ cat /etc/fstab | grep lvm
/dev/mapper/lvmhome-home         /home                 xfs
defaults       0           2

And my /home is mounted on my lvm.....

tufkal@tux:~$ df -h
Filesystem                              Size  Used Avail Use% Mounted on
/dev/hdb1                                4.4G  3.0G  1.2G  72% /
tmpfs                                     253M     0  253M   0% /dev/shm
tmpfs                                     253M   13M  240M   5%
/lib/modules/2.6.12-10-386/volatile
/dev/mapper/lvmhome-home     218G  197G   22G  91% /home
/dev/md0                                 39G   29G  7.7G  80% /home/tufkal

BWAH?  Why do I only have 220GB of space?  I run out of space almost nightl=
y
when MythTV starts transcoding the day's recordings.  I gave up trying to
figure out what I did wrong and I ask of you.

More random command line pastes in case they help.


tufkal@tux:~$ sudo lvm vgs
Password:
  VG      #PV #LV #SN Attr  VSize   VFree
  lvmhome   4   1   0 wz--n 325.82G    0
tufkal@tux:~$ sudo lvm pvs
  PV         VG      Fmt  Attr PSize   PFree
  /dev/hdb5  lvmhome lvm2 a-   107.39G    0
  /dev/hdc5  lvmhome lvm2 a-   110.23G    0
  /dev/sda5  lvmhome lvm2 a-    72.73G    0
  /dev/sdb5  lvmhome lvm2 a-    35.46G    0
tufkal@tux:~$ sudo lvm lvs
  LV   VG      Attr   LSize   Origin Snap%  Move Copy%
  home lvmhome -wi-ao 325.82G


tufkal@tux:~$ sudo lvm vgdisplay
  --- Volume group ---
  VG Name               lvmhome
  System ID
  Format                lvm2
  Metadata Areas        4
  Metadata Sequence No  96
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               1
  Max PV                0
  Cur PV                4
  Act PV                4
  VG Size               325.82 GB
  PE Size               4.00 MB
  Total PE              83409
  Alloc PE / Size       83409 / 325.82 GB
  Free  PE / Size       0 / 0
  VG UUID               8BCR28-5oEl-heGV-97YY-k6Dy-gzaO-QdZcML

tufkal@tux:~$ sudo lvm pvdisplay
  --- Physical volume ---
  PV Name               /dev/hdb5
  VG Name               lvmhome
  PV Size               107.39 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              27493
  Free PE               0
  Allocated PE          27493
  PV UUID               DIuF4I-JfQH-w1nB-dJlM-0zef-R9An-MWxkLe

  --- Physical volume ---
  PV Name               /dev/hdc5
  VG Name               lvmhome
  PV Size               110.23 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              28219
  Free PE               0
  Allocated PE          28219
  PV UUID               A3uL70-LwK6-61Vx-DoGj-8C7v-Ml7E-9JnWtM

  --- Physical volume ---
  PV Name               /dev/sdb5
  VG Name               lvmhome
  PV Size               35.46 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              9079
  Free PE               0
  Allocated PE          9079
  PV UUID               yo14mv-oyRd-Up5z-DBj2-lEPO-jACe-su53bV

  --- Physical volume ---
  PV Name               /dev/sda5
  VG Name               lvmhome
  PV Size               72.73 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              18618
  Free PE               0
  Allocated PE          18618
  PV UUID               sT4CZO-gIZu-c05A-rrQf-uNw9-zC3B-p5h2vV

tufkal@tux:~$ sudo lvm lvdisplay
  --- Logical volume ---
  LV Name                /dev/lvmhome/home
  VG Name                lvmhome
  LV UUID                WrEbxl-7pck-lwbJ-w3V7-BNiZ-ttge-QvIL9r
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                325.82 GB
  Current LE             83409
  Segments               4
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:0

tufkal@tux:~$

AND WHILE IM AT IT, FOR FUTURE REFERENCE

What is the correct way to add a partition to a LVM (like if I slap another
drive in there).

Thanks in advance.

------=_Part_14251_23249113.1138656405483
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

This is kind of a long story but I will try to keep it simple.&nbsp; I have=
 a linux file/web/mythtv/blah server that I run at my business.&nbsp; I rec=
ently added a 120GB and a 80GB drive to the machine.&nbsp; Here was the set=
up prior to that.
<br><br>120GB Seagate<br>-9GB / ext3<br>-1GB Swap <br>-110GB lvmhome xfs<br=
><br>120GB Seagate<br>-120GB lvmhome xfs<br><br><br>The 2 lvm partitions we=
re used together as a ~220GB /home partition, and everything worked well.&n=
bsp; Then I decided to add the 2 new drives.&nbsp; The geometry now looks l=
ike this
<br><br>120GB Seagate<br>
-9GB / ext3<br>
-1GB Swap <br>
-110GB lvmhome xfs<br><br>120GB Seagate<br>
-120GB lvmhome xfs<br><br>120GB Seagate<br>-80GB lvmhome xfs<br>-40GB /home=
/me linuxraid<br><br>80GB Seagate<br>-40GB lvmhome xfs<br>-40GB /home/me li=
nuxraid<br><br>I setup 40GB on each new drive apart in a raid1 mirror using=
 mdadm.&nbsp; Then with the 120GB of new LVM space due to me, I tried to ad=
d it to my LVM home.&nbsp; I am unable to get the space.&nbsp; Here are the=
 outputs of a few commands for some help.
<br><br>tufkal@tux:/home$ sudo lvm lvscan<br>Password:<br>&nbsp; ACTIVE&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '/dev/lvmhom=
e/home' [325.82 GB] inherit<br>tufkal@tux:/home$ sudo lvm pvscan<br>&nbsp; =
PV /dev/hdb5&nbsp;&nbsp; VG lvmhome&nbsp;&nbsp; lvm2 [107.39 GB / 0&nbsp;&n=
bsp;&nbsp; free]<br>&nbsp; PV /dev/hdc5&nbsp;&nbsp; VG lvmhome&nbsp;&nbsp; =
lvm2 [
110.23 GB / 0&nbsp;&nbsp;&nbsp; free]<br>&nbsp; PV /dev/sdb5&nbsp;&nbsp; VG=
 lvmhome&nbsp;&nbsp; lvm2 [35.46 GB / 0&nbsp;&nbsp;&nbsp; free]<br>&nbsp; P=
V /dev/sda5&nbsp;&nbsp; VG lvmhome&nbsp;&nbsp; lvm2 [72.73 GB / 0&nbsp;&nbs=
p;&nbsp; free]<br>&nbsp; Total: 4 [325.82 GB] / in use: 4 [325.82 GB] / in =
no VG: 0 [0&nbsp;&nbsp; ]<br>tufkal@tux
:/home$ sudo lvm vgscan<br>&nbsp; Reading all physical volumes.&nbsp; This =
may take a while...<br>&nbsp; Found volume group &quot;lvmhome&quot; using =
metadata type lvm2<br>tufkal@tux:/home$<br><br>According to those, everythi=
ng looks great!&nbsp; I should have 325GB of space!
<br><br>tufkal@tux:/home$ cat /etc/fstab | grep lvm<br>/dev/mapper/lvmhome-=
home&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /home&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; xfs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; defaults&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; 2<br><br>And my /home is mounted on my lvm.....<br><br>tufkal=
@tux:~$ df -h
<br>Filesystem&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Size&nbsp; Used Avail Use% Mounted o=
n<br>/dev/hdb1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 4.4G&nbsp; 3.0G&nbsp; 1.2G&nbsp; 72% /<br>tmpfs&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; 253M&nbsp;&nbsp=
;&nbsp;&nbsp; 0&nbsp; 253M&nbsp;&nbsp; 0% /dev/shm<br>
tmpfs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 253=
M&nbsp;&nbsp; 13M&nbsp; 240M&nbsp;&nbsp; 5% /lib/modules/2.6.12-10-386/vola=
tile<br>/dev/mapper/lvmhome-home&nbsp;&nbsp;&nbsp;&nbsp; 218G&nbsp; 197G&nb=
sp;&nbsp; 22G&nbsp; 91% /home<br>/dev/md0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 39G&nbsp;&nbsp; 29G&nbsp; 7.7G&nbsp; 80% /home/tufkal
<br><br>BWAH?&nbsp; Why do I only have 220GB of space?&nbsp; I run out of s=
pace almost nightly when MythTV starts transcoding the day's recordings.&nb=
sp; I gave up trying to figure out what I did wrong and I ask of you.<br><b=
r>More random command line pastes in case they help.
<br><br><br>tufkal@tux:~$ sudo lvm vgs<br>Password:<br>&nbsp; VG&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; #PV #LV #SN Attr&nbsp; VSize&nbsp;&nbsp; VFree<br>&nbsp=
; lvmhome&nbsp;&nbsp; 4&nbsp;&nbsp; 1&nbsp;&nbsp; 0 wz--n 325.82G&nbsp;&nbs=
p;&nbsp; 0<br>tufkal@tux:~$ sudo lvm pvs<br>&nbsp; PV&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; VG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fmt&nbsp; Attr =
PSize&nbsp;&nbsp; PFree<br>
&nbsp; /dev/hdb5&nbsp; lvmhome lvm2 a-&nbsp;&nbsp; 107.39G&nbsp;&nbsp;&nbsp=
; 0<br>&nbsp; /dev/hdc5&nbsp; lvmhome lvm2 a-&nbsp;&nbsp; 110.23G&nbsp;&nbs=
p;&nbsp; 0<br>&nbsp; /dev/sda5&nbsp; lvmhome lvm2 a-&nbsp;&nbsp;&nbsp; 72.7=
3G&nbsp;&nbsp;&nbsp; 0<br>&nbsp; /dev/sdb5&nbsp; lvmhome lvm2 a-&nbsp;&nbsp=
;&nbsp; 35.46G&nbsp;&nbsp;&nbsp; 0<br>tufkal@tux:~$ sudo lvm lvs<br>&nbsp; =
LV&nbsp;&nbsp; VG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Attr&nbsp;&nbsp; LSize&nbsp=
;&nbsp; Origin Snap%&nbsp; Move Copy%
<br>&nbsp; home lvmhome -wi-ao 325.82G<br><br><br>tufkal@tux:~$ sudo lvm vg=
display<br>&nbsp; --- Volume group ---<br>&nbsp; VG Name&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvmhome<b=
r>&nbsp; System ID<br>&nbsp; Format&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvm2<br>&nbsp; Metadata =
Areas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4<br>&nbsp; Metadata Sequen=
ce No&nbsp; 96
<br>&nbsp; VG Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; read/write<br>&nbsp; VG Status&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; resizable<br>&nbsp; MAX LV&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; 0<br>&nbsp; Cur LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<br>&nbsp; Open LV&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 1<br>&nbsp; Max PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>&nbsp; Cur PV&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4<br>
&nbsp; Act PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; 4<br>&nbsp; VG Size&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 325.82 GB<br>&nbs=
p; PE Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 4.00 MB<br>&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 83409<br>&nbsp; Alloc PE =
/ Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 83409 / 325.82 GB<br>&nbsp; Free=
&nbsp; PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 / 0<br>&nbsp; VG UUI=
D&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; 8BCR28-5oEl-heGV-97YY-k6Dy-gzaO-QdZcML
<br><br>tufkal@tux:~$ sudo lvm pvdisplay<br>&nbsp; --- Physical volume ---<=
br>&nbsp; PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; /dev/hdb5<br>&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvmhome<br>=
&nbsp; PV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 107.39 GB / not usable 0<br>&nbsp; Allocatable&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; yes (but full)
<br>&nbsp; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096<br>&nbs=
p; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; 27493<br>&nbsp; Free PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>&nbsp; Allocated PE&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 27493<br>&nbsp; PV UUID=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; DIuF4I-JfQH-w1nB-dJlM-0zef-R9An-MWxkLe<br><br>&nbsp; --- Physical=
 volume ---
<br>&nbsp; PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/hdc5<br>&nbsp; VG Name&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvmhome<br=
>&nbsp; PV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; 110.23 GB / not usable 0<br>&nbsp; Allocatable&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; yes (but full)<br>=
&nbsp; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096<br>&nbsp; T=
otal PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; 28219
<br>&nbsp; Free PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>&nbsp; Allocated PE&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 28219<br>&nbsp; PV UUID&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A3uL70-LwK=
6-61Vx-DoGj-8C7v-Ml7E-9JnWtM<br><br>&nbsp; --- Physical volume ---<br>&nbsp=
; PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; /dev/sdb5<br>&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvmhome
<br>&nbsp; PV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; 35.46 GB / not usable 0<br>&nbsp; Allocatable&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; yes (but full)<b=
r>&nbsp; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096<br>&nbsp;=
 Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; 9079<br>&nbsp; Free PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>&nbsp; Allocated PE&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 9079<br>
&nbsp; PV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; yo14mv-oyRd-Up5z-DBj2-lEPO-jACe-su53bV<br><br>&nbsp=
; --- Physical volume ---<br>&nbsp; PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sda5<br>&nbsp; VG=
 Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; lvmhome<br>&nbsp; PV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 72.73 GB / not usable 0<b=
r>
&nbsp; Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; yes (but full)<br>&nbsp; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; 4096<br>&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 18618<br>&nbsp; Free PE&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>&nbs=
p; Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 18618=
<br>&nbsp; PV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; sT4CZO-gIZu-c05A-rrQf-uNw9-zC3B-p5h2vV
<br><br>tufkal@tux:~$ sudo lvm lvdisplay<br>&nbsp; --- Logical volume ---<b=
r>&nbsp; LV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/lvmhome/home<br>&nbsp; VG Name&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; lvmhome<br>&nbsp; LV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WrEbxl-7pck-lwbJ-w3V7-BNiZ=
-ttge-QvIL9r<br>
&nbsp; LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write=
<br>&nbsp; LV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; available<br>&nbsp; # open&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<b=
r>&nbsp; LV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 325.82 GB<br>&nbsp; Current LE&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 83409<br>&nbsp;=
 Segments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; 4<br>&nbsp; Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inherit
<br>&nbsp; Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 0<br>&nbsp; Block dev=
ice&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 253:0<br><b=
r>tufkal@tux:~$<br><br>AND WHILE IM AT IT, FOR FUTURE REFERENCE<br><br>What=
 is the correct way to add a partition to a LVM (like if I slap another dri=
ve in there).&nbsp;=20
<br><br>Thanks in advance.<br>

------=_Part_14251_23249113.1138656405483--
