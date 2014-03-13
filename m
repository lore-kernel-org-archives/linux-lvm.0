Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2DLw95S031037
	for <linux-lvm@redhat.com>; Thu, 13 Mar 2014 17:58:10 -0400
Received: from mail-yk0-f194.google.com (mail-yk0-f194.google.com
	[209.85.160.194])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2DLw7ur019875
	for <linux-lvm@redhat.com>; Thu, 13 Mar 2014 17:58:08 -0400
Received: by mail-yk0-f194.google.com with SMTP id 9so851791ykp.1
	for <linux-lvm@redhat.com>; Thu, 13 Mar 2014 14:58:07 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 13 Mar 2014 17:58:07 -0400
Message-ID: <CADPXwZP_wSC_C5ZFXR0igwbVqULKPJ2PYhpU_eH2vgNs5MqTWw@mail.gmail.com>
From: Ogal Finklestein-Birl <ogal.finklestein@gmail.com>
Content-Type: multipart/alternative; boundary=20cf3040e3b2643bb804f4840c24
Subject: [linux-lvm] Expanded virtual disk for LVM: missing space? or free
	space? or no space?
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

--20cf3040e3b2643bb804f4840c24
Content-Type: text/plain; charset=ISO-8859-1

Greetings gurus:

I do not deal with LVM on a daily basis, and I think my note-taking of
previous LVM commands needs to be polished.

== Background ==
Have a VM with 2 virtual disks, 30G (LVM only on 3rd partition) and 65G
(all LVM) respectively.

A single VG on the server: VolGroup00; four LV's: LogVol00 to 03


== Problem ==
The 71G /usr/local (VolGroup00-LogVol02) hit 100%

I shut the server down and increased the 65G virtual disk up to 295G
(+230G)  -- the thought process: take /usr/local from 71G to ~300G.

Booted into single and fdisk'ed a new /dev/sdb2

/dev/sda3            4298       30720    27057152   8e  Linux LVM
/dev/sdb1               1        8485    68155731   83  Linux
/dev/sdb2            8486       38509   241167780   83  Linux


Consulted my notes and did the following:

pvcreate /dev/sdb2
umount -vv /usr/local
vgextend VolGroup00 /dev/sdb2
lvextend -L 229.99G /dev/mapper/VolGroup00-LogVol02
e2fsck -f /dev/mapper/VolGroup00-LogVol02
resize2fs /dev/mapper/VolGroup00-LogVol02
mount -vv /usr/local
df -h

/dev/mapper/VolGroup00-LogVol02  227G   68G  148G  32% /usr/local

My confusion came in when I saw 227G total and not 300G.
My suspicion was confirmed with pvdisplay -s (and pvs)

  Device "/dev/sda3" has a capacity of 0
  Device "/dev/sdb1" has a capacity of 0
  Device "/dev/sdb2" has a capacity of 71.83 GiB

 But I am confused even further; I thought pvdisplay was referring to the
physical disks, but fdisk does not show a missing 71G for /dev/sdb2

pvs
  PV         VG         Fmt  Attr PSize   PFree
  /dev/sda3  VolGroup00 lvm2 a--   25.80g     0
  /dev/sdb1  VolGroup00 lvm2 a--   65.00g     0
  /dev/sdb2  VolGroup00 lvm2 a--  229.99g 71.83g

vgs
  VG         #PV #LV #SN Attr   VSize   VFree
  VolGroup00   3   4   0 wz--n- 320.79g 71.83g


== Questions ==
Where did I go wrong, or did I go wrong?

It obviously seems like I am missing 71G, but am I missing it and how do I
go about reclaiming it?


== Additional data ==
pvdisplay
  --- Physical volume ---
  PV Name               /dev/sda3
  VG Name               VolGroup00
  PV Size               25.80 GiB / not usable 3.00 MiB
  Allocatable           yes (but full)
  PE Size               4.00 MiB
  Total PE              6605
  Free PE               0
  Allocated PE          6605

  --- Physical volume ---
  PV Name               /dev/sdb1
  VG Name               VolGroup00
  PV Size               65.00 GiB / not usable 2.33 MiB
  Allocatable           yes (but full)
  PE Size               4.00 MiB
  Total PE              16639
  Free PE               0
  Allocated PE          16639

  --- Physical volume ---
  PV Name               /dev/sdb2
  VG Name               VolGroup00
  PV Size               230.00 GiB / not usable 3.41 MiB
  Allocatable           yes
  PE Size               4.00 MiB
  Total PE              58878
  Free PE               18389
  Allocated PE          40489



vgdisplay -v
    Finding all volume groups
    Finding volume group "VolGroup00"
  --- Volume group ---
  VG Name               VolGroup00
  System ID
  Format                lvm2
  Metadata Areas        3
  Metadata Sequence No  9
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                4
  Open LV               4
  Max PV                0
  Cur PV                3
  Act PV                3
  VG Size               320.79 GiB
  PE Size               4.00 MiB
  Total PE              82122
  Alloc PE / Size       63733 / 248.96 GiB
  Free  PE / Size       18389 / 71.83 GiB

  --- Logical volume ---
  LV Path                /dev/VolGroup00/LogVol01
  LV Name                LogVol01
  VG Name                VolGroup00
  LV Write Access        read/write
  LV Creation host, time ,
  LV Status              available
  # open                 1
  LV Size                5.86 GiB
  Current LE             1500
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:1

  --- Logical volume ---
  LV Path                /dev/VolGroup00/LogVol00
  LV Name                LogVol00
  VG Name                VolGroup00
  LV Write Access        read/write
  LV Creation host, time ,
  LV Status              available
  # open                 1
  LV Size                7.32 GiB
  Current LE             1875
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:0

  --- Logical volume ---
  LV Path                /dev/VolGroup00/LogVol03
  LV Name                LogVol03
  VG Name                VolGroup00
  LV Write Access        read/write
  LV Creation host, time ,
  LV Status              available
  # open                 1
  LV Size                5.78 GiB
  Current LE             1480
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:2

  --- Logical volume ---
  LV Path                /dev/VolGroup00/LogVol02
  LV Name                LogVol02
  VG Name                VolGroup00
  LV Write Access        read/write
  LV Creation host, time ,
  LV Status              available
  # open                 1
  LV Size                229.99 GiB
  Current LE             58878
  Segments               3
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:3

  --- Physical volumes ---
  PV Name               /dev/sda3
  PV Status             allocatable
  Total PE / Free PE    6605 / 0

  PV Name               /dev/sdb1
  PV Status             allocatable
  Total PE / Free PE    16639 / 0

  PV Name               /dev/sdb2
  PV Status             allocatable
  Total PE / Free PE    58878 / 18389



lvdisplay -m
  --- Logical volume ---
  LV Path                /dev/VolGroup00/LogVol01
  LV Name                LogVol01
  VG Name                VolGroup00
  LV Write Access        read/write
  LV Creation host, time ,
  LV Status              available
  # open                 1
  LV Size                5.86 GiB
  Current LE             1500
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:1

  --- Segments ---
  Logical extent 0 to 1499:
    Type                linear
    Physical volume     /dev/sda3
    Physical extents    0 to 1499


  --- Logical volume ---
  LV Path                /dev/VolGroup00/LogVol00
  LV Name                LogVol00
  VG Name                VolGroup00
  LV Write Access        read/write
  LV Creation host, time ,
  LV Status              available
  # open                 1
  LV Size                7.32 GiB
  Current LE             1875
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:0

  --- Segments ---
  Logical extent 0 to 1874:
    Type                linear
    Physical volume     /dev/sda3
    Physical extents    1500 to 3374


  --- Logical volume ---
  LV Path                /dev/VolGroup00/LogVol03
  LV Name                LogVol03
  VG Name                VolGroup00
  LV Write Access        read/write
  LV Creation host, time ,
  LV Status              available
  # open                 1
  LV Size                5.78 GiB
  Current LE             1480
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:2

  --- Segments ---
  Logical extent 0 to 1479:
    Type                linear
    Physical volume     /dev/sda3
    Physical extents    3375 to 4854


  --- Logical volume ---
  LV Path                /dev/VolGroup00/LogVol02
  LV Name                LogVol02
  VG Name                VolGroup00
  LV Write Access        read/write
  LV Creation host, time ,
  LV Status              available
  # open                 1
  LV Size                229.99 GiB
  Current LE             58878
  Segments               3
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:3

  --- Segments ---
  Logical extent 0 to 1749:
    Type                linear
    Physical volume     /dev/sda3
    Physical extents    4855 to 6604

  Logical extent 1750 to 18388:
    Type                linear
    Physical volume     /dev/sdb1
    Physical extents    0 to 16638

  Logical extent 18389 to 58877:
    Type                linear
    Physical volume     /dev/sdb2
    Physical extents    0 to 40488


Many thanks in advance!
Ogal

--20cf3040e3b2643bb804f4840c24
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><font face=3D"courier new, monospace">Greetings gurus:</fo=
nt><div><font face=3D"courier new, monospace"><br></font></div><div><font f=
ace=3D"courier new, monospace">I do not deal with LVM on a daily basis, and=
 I think my note-taking of previous LVM commands needs to be polished.</fon=
t></div>
<div><font face=3D"courier new, monospace"><br></font></div><div><font face=
=3D"courier new, monospace">=3D=3D Background =3D=3D</font></div><div><font=
 face=3D"courier new, monospace">Have a VM with 2 virtual disks, 30G (LVM o=
nly on 3rd partition) and 65G (all LVM) respectively.</font></div>
<div><font face=3D"courier new, monospace"><br></font></div><div><font face=
=3D"courier new, monospace">A single VG on the server: VolGroup00; four LV&=
#39;s: LogVol00 to 03</font></div><div><font face=3D"courier new, monospace=
"><br>
</font></div><div><font face=3D"courier new, monospace"><br></font></div><d=
iv><font face=3D"courier new, monospace">=3D=3D Problem =3D=3D</font></div>=
<div><font face=3D"courier new, monospace">The 71G /usr/local (VolGroup00-L=
ogVol02)</font><span style=3D"font-family:&#39;courier new&#39;,monospace">=
=A0hit 100%</span></div>
<div><font face=3D"courier new, monospace"><br></font></div><div><font face=
=3D"courier new, monospace">I shut the server down and increased the 65G vi=
rtual disk up to 295G (+230G) =A0-- the thought process: take /usr/local fr=
om 71G to ~300G.</font></div>
<div><font face=3D"courier new, monospace"><br></font></div><div><font face=
=3D"courier new, monospace">Booted into single and fdisk&#39;ed a new /dev/=
sdb2</font></div><div><br></div><div><font face=3D"courier new, monospace">=
/dev/sda3 =A0 =A0 =A0 =A0 =A0 =A04298 =A0 =A0 =A0 30720 =A0 =A027057152 =A0=
 8e =A0Linux LVM</font></div>
<div><div><font face=3D"courier new, monospace">/dev/sdb1 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 1 =A0 =A0 =A0 =A08485 =A0 =A068155731 =A0 83 =A0Linux</font></d=
iv><div><font face=3D"courier new, monospace">/dev/sdb2 =A0 =A0 =A0 =A0 =A0=
 =A08486 =A0 =A0 =A0 38509 =A0 241167780 =A0 83 =A0Linux</font></div>
</div><div><font face=3D"courier new, monospace"><br></font></div><div><fon=
t face=3D"courier new, monospace"><br></font></div><div><font face=3D"couri=
er new, monospace">Consulted my notes and did the following:</font></div><d=
iv>
<font face=3D"courier new, monospace"><br></font></div><div><font face=3D"c=
ourier new, monospace">pvcreate /dev/sdb2<br></font></div><div><font face=
=3D"courier new, monospace">umount -vv /usr/local</font></div><div><font fa=
ce=3D"courier new, monospace">vgextend VolGroup00 /dev/sdb2<br>
</font></div><div><font face=3D"courier new, monospace">lvextend -L 229.99G=
 /dev/mapper/VolGroup00-LogVol02<br></font></div><div><font face=3D"courier=
 new, monospace"><div>e2fsck -f /dev/mapper/VolGroup00-LogVol02</div><div>r=
esize2fs /dev/mapper/VolGroup00-LogVol02</div>
<div>mount -vv /usr/local<br></div></font></div><div><font face=3D"courier =
new, monospace">df -h</font></div><div><font face=3D"courier new, monospace=
"><br></font></div><div><font face=3D"courier new, monospace">/dev/mapper/V=
olGroup00-LogVol02 =A0227G =A0 68G =A0148G =A032% /usr/local<br>
</font></div><div><font face=3D"courier new, monospace"><br></font></div><d=
iv><font face=3D"courier new, monospace">My confusion came in when I saw 22=
7G total and not 300G.</font></div><div><font face=3D"courier new, monospac=
e">My=A0suspicion was confirmed with pvdisplay -s (and pvs)</font></div>
<div><font face=3D"courier new, monospace"><br></font></div><div><font face=
=3D"courier new, monospace"><div>=A0 Device &quot;/dev/sda3&quot; has a cap=
acity of 0</div><div>=A0 Device &quot;/dev/sdb1&quot; has a capacity of 0</=
div>
<div>=A0 Device &quot;/dev/sdb2&quot; has a capacity of 71.83 GiB</div></fo=
nt></div><div><font face=3D"courier new, monospace"><br></font></div><div><=
font face=3D"courier new, monospace">=A0But I am confused even further; I t=
hought pvdisplay was referring to the physical disks, but fdisk does not sh=
ow a missing 71G for /dev/sdb2</font></div>
<div><font face=3D"courier new, monospace"><br></font></div><div><font face=
=3D"courier new, monospace">pvs</font></div><div><font face=3D"courier new,=
 monospace"><div>=A0 PV =A0 =A0 =A0 =A0 VG =A0 =A0 =A0 =A0 Fmt =A0Attr PSiz=
e =A0 PFree</div><div>=A0 /dev/sda3 =A0VolGroup00 lvm2 a-- =A0 25.80g =A0 =
=A0 0</div>
<div>=A0 /dev/sdb1 =A0VolGroup00 lvm2 a-- =A0 65.00g =A0 =A0 0</div><div>=
=A0 /dev/sdb2 =A0VolGroup00 lvm2 a-- =A0229.99g 71.83g</div><div><br></div>=
<div>vgs</div><div><div>=A0 VG =A0 =A0 =A0 =A0 #PV #LV #SN Attr =A0 VSize =
=A0 VFree</div><div>=A0 VolGroup00 =A0 3 =A0 4 =A0 0 wz--n- 320.79g 71.83g<=
/div>
</div></font></div><div><font face=3D"courier new, monospace"><br></font></=
div><div><font face=3D"courier new, monospace"><br></font></div><div><font =
face=3D"courier new, monospace">=3D=3D Questions =3D=3D</font></div><div><f=
ont face=3D"courier new, monospace">Where did I go wrong, or did I go wrong=
?</font></div>
<div><font face=3D"courier new, monospace"><br></font></div><div><font face=
=3D"courier new, monospace">It obviously seems like I am missing 71G, but a=
m I missing it and how do I go about reclaiming it?</font></div><div><font =
face=3D"courier new, monospace"><br>
</font></div><div><font face=3D"courier new, monospace"><br></font></div><d=
iv><font face=3D"courier new, monospace">=3D=3D Additional data =3D=3D</fon=
t></div><div><font face=3D"courier new, monospace">pvdisplay</font></div><d=
iv><div><font face=3D"courier new, monospace">=A0 --- Physical volume ---</=
font></div>
<div><font face=3D"courier new, monospace">=A0 PV Name =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 /dev/sda3</font></div><div><font face=3D"courier new, monospace">=
=A0 VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 VolGroup00</font></div><div><font f=
ace=3D"courier new, monospace">=A0 PV Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 25.8=
0 GiB / not usable 3.00 MiB</font></div>
<div><font face=3D"courier new, monospace">=A0 Allocatable =A0 =A0 =A0 =A0 =
=A0 yes (but full)</font></div><div><font face=3D"courier new, monospace">=
=A0 PE Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 4.00 MiB</font></div><div><font fac=
e=3D"courier new, monospace">=A0 Total PE =A0 =A0 =A0 =A0 =A0 =A0 =A06605</=
font></div>
<div><font face=3D"courier new, monospace">=A0 Free PE =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 0</font></div><div><font face=3D"courier new, monospace">=A0 Alloca=
ted PE =A0 =A0 =A0 =A0 =A06605</font></div><div><font face=3D"courier new, =
monospace"><br></font></div><div>
<font face=3D"courier new, monospace">=A0 --- Physical volume ---</font></d=
iv><div><font face=3D"courier new, monospace">=A0 PV Name =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 /dev/sdb1</font></div><div><font face=3D"courier new, monospace=
">=A0 VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 VolGroup00</font></div>
<div><font face=3D"courier new, monospace">=A0 PV Size =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 65.00 GiB / not usable 2.33 MiB</font></div><div><font face=3D"cour=
ier new, monospace">=A0 Allocatable =A0 =A0 =A0 =A0 =A0 yes (but full)</fon=
t></div><div><font face=3D"courier new, monospace">=A0 PE Size =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 4.00 MiB</font></div>
<div><font face=3D"courier new, monospace">=A0 Total PE =A0 =A0 =A0 =A0 =A0=
 =A0 =A016639</font></div><div><font face=3D"courier new, monospace">=A0 Fr=
ee PE =A0 =A0 =A0 =A0 =A0 =A0 =A0 0</font></div><div><font face=3D"courier =
new, monospace">=A0 Allocated PE =A0 =A0 =A0 =A0 =A016639</font></div>
<div><font face=3D"courier new, monospace"><br></font></div><div><font face=
=3D"courier new, monospace">=A0 --- Physical volume ---</font></div><div><f=
ont face=3D"courier new, monospace">=A0 PV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 /dev/sdb2</font></div>
<div><font face=3D"courier new, monospace">=A0 VG Name =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 VolGroup00</font></div><div><font face=3D"courier new, monospace">=
=A0 PV Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 230.00 GiB / not usable 3.41 MiB</f=
ont></div><div><font face=3D"courier new, monospace">=A0 Allocatable =A0 =
=A0 =A0 =A0 =A0 yes</font></div>
<div><font face=3D"courier new, monospace">=A0 PE Size =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 4.00 MiB</font></div><div><font face=3D"courier new, monospace">=A0=
 Total PE =A0 =A0 =A0 =A0 =A0 =A0 =A058878</font></div><div><font face=3D"c=
ourier new, monospace">=A0 Free PE =A0 =A0 =A0 =A0 =A0 =A0 =A0 18389</font>=
</div>
<div><font face=3D"courier new, monospace">=A0 Allocated PE =A0 =A0 =A0 =A0=
 =A040489</font></div><div><font face=3D"courier new, monospace"><br></font=
></div><div><font face=3D"courier new, monospace"><br></font></div><div><fo=
nt face=3D"courier new, monospace"><br>
</font></div><div><font face=3D"courier new, monospace">vgdisplay -v</font>=
</div><div><font face=3D"courier new, monospace"><div>=A0 =A0 Finding all v=
olume groups</div><div>=A0 =A0 Finding volume group &quot;VolGroup00&quot;<=
/div><div>
=A0 --- Volume group ---</div><div>=A0 VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
VolGroup00</div><div>=A0 System ID</div><div>=A0 Format =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0lvm2</div><div>=A0 Metadata Areas =A0 =A0 =A0 =A03</div><div>=
=A0 Metadata Sequence No =A09</div><div>=A0 VG Access =A0 =A0 =A0 =A0 =A0 =
=A0 read/write</div>
<div>=A0 VG Status =A0 =A0 =A0 =A0 =A0 =A0 resizable</div><div>=A0 MAX LV =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00</div><div>=A0 Cur LV =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A04</div><div>=A0 Open LV =A0 =A0 =A0 =A0 =A0 =A0 =A0 4</div><div>=
=A0 Max PV =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00</div><div>=A0 Cur PV =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A03</div>
<div>=A0 Act PV =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A03</div><div>=A0 VG Size =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 320.79 GiB</div><div>=A0 PE Size =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 4.00 MiB</div><div>=A0 Total PE =A0 =A0 =A0 =A0 =A0 =A0 =A08212=
2</div><div>=A0 Alloc PE / Size =A0 =A0 =A0 63733 / 248.96 GiB</div><div>
=A0 Free =A0PE / Size =A0 =A0 =A0 18389 / 71.83 GiB</div><div><br></div><di=
v>=A0 --- Logical volume ---</div><div>=A0 LV Path =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0/dev/VolGroup00/LogVol01</div><div>=A0 LV Name =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0LogVol01</div><div>=A0 VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Vo=
lGroup00</div>
<div>=A0 LV Write Access =A0 =A0 =A0 =A0read/write<br></div><div>=A0 LV Cre=
ation host, time ,</div><div>=A0 LV Status =A0 =A0 =A0 =A0 =A0 =A0 =A0avail=
able</div><div>=A0 # open =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1</div><div>=A0 L=
V Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A05.86 GiB</div><div>=A0 Current LE =A0=
 =A0 =A0 =A0 =A0 =A0 1500</div>
<div>=A0 Segments =A0 =A0 =A0 =A0 =A0 =A0 =A0 1</div><div>=A0 Allocation =
=A0 =A0 =A0 =A0 =A0 =A0 inherit</div><div>=A0 Read ahead sectors =A0 =A0 au=
to</div><div>=A0 - currently set to =A0 =A0 256</div><div>=A0 Block device =
=A0 =A0 =A0 =A0 =A0 253:1</div><div><br></div><div>=A0 --- Logical volume -=
--</div>
<div>=A0 LV Path =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/dev/VolGroup00/LogVol00</d=
iv><div>=A0 LV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0LogVol00</div><div>=A0 V=
G Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0VolGroup00</div><div>=A0 LV Write Acc=
ess =A0 =A0 =A0 =A0read/write<br></div><div>=A0 LV Creation host, time ,</d=
iv>
<div>=A0 LV Status =A0 =A0 =A0 =A0 =A0 =A0 =A0available</div><div>=A0 # ope=
n =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1</div><div>=A0 LV Size =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A07.32 GiB</div><div>=A0 Current LE =A0 =A0 =A0 =A0 =A0 =A0 18=
75</div><div>=A0 Segments =A0 =A0 =A0 =A0 =A0 =A0 =A0 1</div><div>=A0 Alloc=
ation =A0 =A0 =A0 =A0 =A0 =A0 inherit</div>
<div>=A0 Read ahead sectors =A0 =A0 auto</div><div>=A0 - currently set to =
=A0 =A0 256</div><div>=A0 Block device =A0 =A0 =A0 =A0 =A0 253:0</div><div>=
<br></div><div>=A0 --- Logical volume ---</div><div>=A0 LV Path =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0/dev/VolGroup00/LogVol03</div>
<div>=A0 LV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0LogVol03</div><div>=A0 VG N=
ame =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0VolGroup00</div><div>=A0 LV Write Access=
 =A0 =A0 =A0 =A0read/write<br></div><div>=A0 LV Creation host, time ,</div>=
<div>=A0 LV Status =A0 =A0 =A0 =A0 =A0 =A0 =A0available</div>
<div>=A0 # open =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1</div><div>=A0 LV Size =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A05.78 GiB</div><div>=A0 Current LE =A0 =A0 =A0 =
=A0 =A0 =A0 1480</div><div>=A0 Segments =A0 =A0 =A0 =A0 =A0 =A0 =A0 1</div>=
<div>=A0 Allocation =A0 =A0 =A0 =A0 =A0 =A0 inherit</div><div>=A0 Read ahea=
d sectors =A0 =A0 auto</div>
<div>=A0 - currently set to =A0 =A0 256</div><div>=A0 Block device =A0 =A0 =
=A0 =A0 =A0 253:2</div><div><br></div><div>=A0 --- Logical volume ---</div>=
<div>=A0 LV Path =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/dev/VolGroup00/LogVol02</d=
iv><div>=A0 LV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0LogVol02</div>
<div>=A0 VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0VolGroup00</div><div>=A0 LV=
 Write Access =A0 =A0 =A0 =A0read/write<br></div><div>=A0 LV Creation host,=
 time ,</div><div>=A0 LV Status =A0 =A0 =A0 =A0 =A0 =A0 =A0available</div><=
div>=A0 # open =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1</div><div>=A0 LV Size =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0229.99 GiB</div>
<div>=A0 Current LE =A0 =A0 =A0 =A0 =A0 =A0 58878</div><div>=A0 Segments =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 3</div><div>=A0 Allocation =A0 =A0 =A0 =A0 =A0 =
=A0 inherit</div><div>=A0 Read ahead sectors =A0 =A0 auto</div><div>=A0 - c=
urrently set to =A0 =A0 256</div><div>=A0 Block device =A0 =A0 =A0 =A0 =A0 =
253:3</div>
<div><br></div><div>=A0 --- Physical volumes ---</div><div>=A0 PV Name =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 /dev/sda3</div><div>=A0 PV Status =A0 =A0 =A0 =A0 =
=A0 =A0 allocatable<br></div><div>=A0 Total PE / Free PE =A0 =A06605 / 0</d=
iv><div><br></div><div>=A0 PV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 /dev/sdb1</d=
iv>
<div>=A0 PV Status =A0 =A0 =A0 =A0 =A0 =A0 allocatable<br></div><div>=A0 To=
tal PE / Free PE =A0 =A016639 / 0</div><div><br></div><div>=A0 PV Name =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 /dev/sdb2</div><div>=A0 PV Status =A0 =A0 =A0 =A0 =
=A0 =A0 allocatable<br></div><div>=A0 Total PE / Free PE =A0 =A058878 / 183=
89</div>
</font></div><div><font face=3D"courier new, monospace"><br></font></div></=
div><div><font face=3D"courier new, monospace"><br></font></div><div><font =
face=3D"courier new, monospace"><br></font></div><div><font face=3D"courier=
 new, monospace">lvdisplay -m<br>
</font></div><div><font face=3D"courier new, monospace"><div>=A0 --- Logica=
l volume ---</div><div>=A0 LV Path =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/dev/VolG=
roup00/LogVol01</div><div>=A0 LV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0LogVol=
01</div><div>=A0 VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0VolGroup00</div>
<div>=A0 LV Write Access =A0 =A0 =A0 =A0read/write<br></div><div>=A0 LV Cre=
ation host, time ,</div><div>=A0 LV Status =A0 =A0 =A0 =A0 =A0 =A0 =A0avail=
able</div><div>=A0 # open =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1</div><div>=A0 L=
V Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A05.86 GiB</div><div>=A0 Current LE =A0=
 =A0 =A0 =A0 =A0 =A0 1500</div>
<div>=A0 Segments =A0 =A0 =A0 =A0 =A0 =A0 =A0 1</div><div>=A0 Allocation =
=A0 =A0 =A0 =A0 =A0 =A0 inherit</div><div>=A0 Read ahead sectors =A0 =A0 au=
to</div><div>=A0 - currently set to =A0 =A0 256</div><div>=A0 Block device =
=A0 =A0 =A0 =A0 =A0 253:1</div><div><br></div><div>=A0 --- Segments ---</di=
v>
<div>=A0 Logical extent 0 to 1499:</div><div>=A0 =A0 Type =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0linear</div><div>=A0 =A0 Physical volume =A0 =A0 /dev/sda3</=
div><div>=A0 =A0 Physical extents =A0 =A00 to 1499</div><div><br></div><div=
><br></div><div>=A0 --- Logical volume ---</div>
<div>=A0 LV Path =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/dev/VolGroup00/LogVol00</d=
iv><div>=A0 LV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0LogVol00</div><div>=A0 V=
G Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0VolGroup00</div><div>=A0 LV Write Acc=
ess =A0 =A0 =A0 =A0read/write<br></div><div>=A0 LV Creation host, time ,</d=
iv>
<div>=A0 LV Status =A0 =A0 =A0 =A0 =A0 =A0 =A0available</div><div>=A0 # ope=
n =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1</div><div>=A0 LV Size =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A07.32 GiB</div><div>=A0 Current LE =A0 =A0 =A0 =A0 =A0 =A0 18=
75</div><div>=A0 Segments =A0 =A0 =A0 =A0 =A0 =A0 =A0 1</div><div>=A0 Alloc=
ation =A0 =A0 =A0 =A0 =A0 =A0 inherit</div>
<div>=A0 Read ahead sectors =A0 =A0 auto</div><div>=A0 - currently set to =
=A0 =A0 256</div><div>=A0 Block device =A0 =A0 =A0 =A0 =A0 253:0</div><div>=
<br></div><div>=A0 --- Segments ---</div><div>=A0 Logical extent 0 to 1874:=
</div><div>=A0 =A0 Type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0linear</div>
<div>=A0 =A0 Physical volume =A0 =A0 /dev/sda3</div><div>=A0 =A0 Physical e=
xtents =A0 =A01500 to 3374</div><div><br></div><div><br></div><div>=A0 --- =
Logical volume ---</div><div>=A0 LV Path =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/de=
v/VolGroup00/LogVol03</div><div>
=A0 LV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0LogVol03</div><div>=A0 VG Name =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0VolGroup00</div><div>=A0 LV Write Access =A0=
 =A0 =A0 =A0read/write<br></div><div>=A0 LV Creation host, time ,</div><div=
>=A0 LV Status =A0 =A0 =A0 =A0 =A0 =A0 =A0available</div><div>
=A0 # open =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1</div><div>=A0 LV Size =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A05.78 GiB</div><div>=A0 Current LE =A0 =A0 =A0 =A0 =
=A0 =A0 1480</div><div>=A0 Segments =A0 =A0 =A0 =A0 =A0 =A0 =A0 1</div><div=
>=A0 Allocation =A0 =A0 =A0 =A0 =A0 =A0 inherit</div><div>=A0 Read ahead se=
ctors =A0 =A0 auto</div>
<div>=A0 - currently set to =A0 =A0 256</div><div>=A0 Block device =A0 =A0 =
=A0 =A0 =A0 253:2</div><div><br></div><div>=A0 --- Segments ---</div><div>=
=A0 Logical extent 0 to 1479:</div><div>=A0 =A0 Type =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0linear</div><div>=A0 =A0 Physical volume =A0 =A0 /dev/sda3</div>
<div>=A0 =A0 Physical extents =A0 =A03375 to 4854</div><div><br></div><div>=
<br></div><div>=A0 --- Logical volume ---</div><div>=A0 LV Path =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0/dev/VolGroup00/LogVol02</div><div>=A0 LV Name =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0LogVol02</div><div>
=A0 VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0VolGroup00</div><div>=A0 LV Writ=
e Access =A0 =A0 =A0 =A0read/write<br></div><div>=A0 LV Creation host, time=
 ,</div><div>=A0 LV Status =A0 =A0 =A0 =A0 =A0 =A0 =A0available</div><div>=
=A0 # open =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 1</div><div>=A0 LV Size =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0229.99 GiB</div>
<div>=A0 Current LE =A0 =A0 =A0 =A0 =A0 =A0 58878</div><div>=A0 Segments =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 3</div><div>=A0 Allocation =A0 =A0 =A0 =A0 =A0 =
=A0 inherit</div><div>=A0 Read ahead sectors =A0 =A0 auto</div><div>=A0 - c=
urrently set to =A0 =A0 256</div><div>=A0 Block device =A0 =A0 =A0 =A0 =A0 =
253:3</div>
<div><br></div><div>=A0 --- Segments ---</div><div>=A0 Logical extent 0 to =
1749:</div><div>=A0 =A0 Type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0linear</div><di=
v>=A0 =A0 Physical volume =A0 =A0 /dev/sda3</div><div>=A0 =A0 Physical exte=
nts =A0 =A04855 to 6604</div><div><br>
</div><div>=A0 Logical extent 1750 to 18388:</div><div>=A0 =A0 Type =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0linear</div><div>=A0 =A0 Physical volume =A0 =A0 /d=
ev/sdb1</div><div>=A0 =A0 Physical extents =A0 =A00 to 16638</div><div><br>=
</div><div>=A0 Logical extent 18389 to 58877:</div>
<div>=A0 =A0 Type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0linear</div><div>=A0 =A0 P=
hysical volume =A0 =A0 /dev/sdb2</div><div>=A0 =A0 Physical extents =A0 =A0=
0 to 40488</div></font></div><div><font face=3D"courier new, monospace"><br=
></font></div><div><font face=3D"courier new, monospace"><br>
</font></div><div><font face=3D"courier new, monospace">Many thanks in adva=
nce!</font></div><div><font face=3D"courier new, monospace">Ogal</font></di=
v><div><br></div><div><br></div><div><br></div><div><br></div></div>

--20cf3040e3b2643bb804f4840c24--
