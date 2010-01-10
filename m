Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o0AEOtZp020611
	for <linux-lvm@redhat.com>; Sun, 10 Jan 2010 09:24:55 -0500
Received: from mail-yw0-f200.google.com (mail-yw0-f200.google.com
	[209.85.211.200])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o0AEOdNi032302
	for <linux-lvm@redhat.com>; Sun, 10 Jan 2010 09:24:40 -0500
Received: by ywh38 with SMTP id 38so20172502ywh.6
	for <linux-lvm@redhat.com>; Sun, 10 Jan 2010 06:24:39 -0800 (PST)
MIME-Version: 1.0
Date: Sun, 10 Jan 2010 09:24:39 -0500
Message-ID: <b74494e61001100624y5a7b79e2rcfa1993698f6a88e@mail.gmail.com>
From: Misc Things <formisc@gmail.com>
Content-Type: multipart/alternative; boundary=000e0cd70ddc58a291047cd02e0c
Subject: [linux-lvm] moving data to a new VG
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

--000e0cd70ddc58a291047cd02e0c
Content-Type: text/plain; charset=ISO-8859-1

>
> Hello,
>  I 've been unsuccessfully trying to  move data from the existing VG to a
> new VG.
> Here are the steps i did:
> [code]
>
> fdisk -l
>
> Disk /dev/hdc: 160.0 GB, 160041885696 bytes
> 255 heads, 63 sectors/track, 19457 cylinders
> Units = cylinders of 16065 * 512 = 8225280 bytes
>
>    Device Boot      Start         End      Blocks   Id  System
>
> /dev/hdc1   *           1        9729    78148161   83  Linux
> /dev/hdc2            9730       19457    78140160   83  Linux
>
> Disk /dev/hdd: 250.0 GB, 250059350016 bytes
> 255 heads, 63 sectors/track, 30401 cylinders
>
> Units = cylinders of 16065 * 512 = 8225280 bytes
>
>    Device Boot      Start         End      Blocks   Id  System
> /dev/hdd1   *           1        9729    78148161   83  Linux
> /dev/hdd2            9730       19457    78140160   83  Linux
>
> /dev/hdd3           19458       30401    87907680   83  Linux
>
> Disk /dev/sda: 160.0 GB, 160041885696 bytes
> 255 heads, 63 sectors/track, 19457 cylinders
> Units = cylinders of 16065 * 512 = 8225280 bytes
>
>    Device Boot      Start         End      Blocks   Id  System
>
> /dev/sda1   *           1          13      104391   83  Linux
> /dev/sda2              14       19457   156183930   8e  Linux LVM
>
> Disk /dev/sdb: 1500.3 GB, 1500301910016 bytes
> 255 heads, 63 sectors/track, 182401 cylinders
>
> Units = cylinders of 16065 * 512 = 8225280 bytes
>
>    Device Boot      Start         End      Blocks   Id  System
> /dev/sdb1               1       60788   488279578+  83  Linux
> /dev/sdb2           60789      121576   488279610   83  Linux
>
> /dev/sdb3          121577      182401   488576812+  83  Linux
>
> pvscan
>   PV /dev/hdd3   VG VG_Storage02    lvm2 [83.83 GB / 0    free]
>   PV /dev/sdb2   VG VG_Storage000   lvm2 [465.66 GB / 0    free]
>   PV /dev/sdb1   VG VG_Storage01    lvm2 [465.66 GB / 316.62 GB free]
>
>   PV /dev/hdc2   VG VG_Storage      lvm2 [74.52 GB / 74.52 GB free]
>   PV /dev/hdd2   VG VG_Storage      lvm2 [74.52 GB / 74.52 GB free]
>   PV /dev/sda2   VG VG_SYS          lvm2 [148.95 GB / 0    free]
>   PV /dev/hdd1   VG VG_Storage00    lvm2 [74.53 GB / 0    free]
>
>   PV /dev/hdc1   VG VG_Storage00    lvm2 [74.53 GB / 0    free]
>   Total: 8 [1.43 TB] / in use: 8 [1.43 TB] / in no VG: 0 [0   ]
>
> vgscan
>   Reading all physical volumes.  This may take a while...
>   Found volume group "VG_Storage02" using metadata type lvm2
>
>   Found volume group "VG_Storage000" using metadata type lvm2
>   Found volume group "VG_Storage01" using metadata type lvm2
>   Found volume group "VG_Storage" using metadata type lvm2
>
>   Found volume group "VG_SYS" using metadata type lvm2
>   Found volume group "VG_Storage00" using metadata type lvm2
>
> lvscan
>   ACTIVE            '/dev/VG_Storage02/LG_VG_Storage02_00' [83.83 GB] inherit
>
>   ACTIVE            '/dev/VG_Storage000/LV_VGSTORAGE000' [465.66 GB] anywhere
>   ACTIVE            '/dev/VG_Storage01/LV_VG_STORAGE01' [149.04 GB] anywhere
>   ACTIVE            '/dev/VG_SYS/LogVol00' [148.07 GB] inherit
>
>   ACTIVE            '/dev/VG_SYS/LogVol01' [896.00 MB] inherit
>   ACTIVE            '/dev/VG_Storage00/LG_VG_Storage00_00' [149.05 GB] inherit
>
> lvdisplay /dev/VG_Storage01/LV_VG_STORAGE01
>   --- Logical volume ---
>
>   LV Name                /dev/VG_Storage01/LV_VG_STORAGE01
>   VG Name                VG_Storage01
>   LV UUID                48dcTk-XKJ1-3umG-ykVu-EjYS-gGP7-i1RN1y
>   LV Write Access        read/write
>   LV Status              available
>
>   # open                 1
>   LV Size                149.04 GB
>   Current LE             76308
>   Segments               1
>   Allocation             anywhere
>   Read ahead sectors     auto
>   - currently set to     512
>
> [/code]
>
> the drive i'm trying to move the data to is /dev/sdb. Dived into 2 partitions. Each 500Gb.
>
> The "/dev/VG_Storage01/LV_VG_STORAGE01" is the original LG that had 2 drives (partitions) -
>
>
> step by step:
>
> 0. /dev/VG_Storage01/LV_VG_STORAGE01 of is not mounted;
>
> 1. /dev/VG_Storage01 originally had /dev/hdc2 and /dev/hdd2.
>
> 2. I added  /dev/sdb1 into /dev/VG_Storage01
>
> 3. did pvmove /dev/hdc2 /dev/sdb1 and pvmove /dev/hdd2 /dev/sdb1
>
>
> 4. removed /dev/hdc2 and /dev/hdd2 from /dev/VG_Storage01
>
> 5. created VG_Storage with /dev/hdc2 and /dev/hdd2
>
> 6. tried to extend /dev/VG_Storage01/LV_VG_STORAGE01:
> [code]
> vextend -l +100%PVS -r -t /dev/VG_Storage01/LV_VG_STORAGE01
>
>   Test mode: Metadata will NOT be updated.
> Segmentation fault
>
> lvextend -v -l +100%FREE -r -t /dev/VG_Storage01/LV_VG_STORAGE01
>   Test mode: Metadata will NOT be updated.
>     Finding volume group VG_Storage01
>
>   Using stripesize of last segment 64.00 KB
>   Rounding size (238417 extents) down to stripe boundary size for segment (238416 extents)
>     Executing: fsadm --dry-run --verbose check /dev/VG_Storage01/LV_VG_STORAGE01
>
> fsadm: "ext3" filesystem found on "/dev/mapper/VG_Storage01-LV_VG_STORAGE01"
> fsadm: Dry execution fsck /dev/mapper/VG_Storage01-LV_VG_STORAGE01
>     Test mode: Skipping archiving of volume group.
>
>   Extending logical volume LV_VG_STORAGE01 to 465.66 GB
>   Insufficient suitable allocatable extents for logical volume LV_VG_STORAGE01: 162108 more required
>     Test mode: Wiping internal cache
>     Wiping internal VG cache
>
> [/code]
>   Block device           253:4
>
> Thank you for your help.
>

--000e0cd70ddc58a291047cd02e0c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<blockquote class=3D"gmail_quote" style=3D"border-left: 1px solid rgb(204, =
204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">Hello,<br>=A0I &#=
39;ve been unsuccessfully trying to=A0 move data from the existing VG to a =
new VG.<br>
Here are the steps i did:<br>[code]<br><pre dir=3D"ltr" style=3D"border: 1p=
x inset ; padding: 3px; overflow: auto; width: 98%; min-height: 498px; text=
-align: left;">fdisk -l<br><br>Disk /dev/hdc: 160.0 GB, 160041885696 bytes<=
br>
255 heads, 63 sectors/track, 19457 cylinders<br>Units =3D cylinders of 1606=
5 * 512 =3D 8225280 bytes<br><br>   Device Boot      Start         End     =
 Blocks   Id  System<br><br>/dev/hdc1   *           1        9729    781481=
61   83  Linux<br>
/dev/hdc2            9730       19457    78140160   83  Linux<br><br>Disk /=
dev/hdd: 250.0 GB, 250059350016 bytes<br>255 heads, 63 sectors/track, 30401=
 cylinders<br><br>Units =3D cylinders of 16065 * 512 =3D 8225280 bytes<br><=
br>
   Device Boot      Start         End      Blocks   Id  System<br>/dev/hdd1=
   *           1        9729    78148161   83  Linux<br>/dev/hdd2          =
  9730       19457    78140160   83  Linux<br><br>/dev/hdd3           19458=
       30401    87907680   83  Linux<br>
<br>Disk /dev/sda: 160.0 GB, 160041885696 bytes<br>255 heads, 63 sectors/tr=
ack, 19457 cylinders<br>Units =3D cylinders of 16065 * 512 =3D 8225280 byte=
s<br><br>   Device Boot      Start         End      Blocks   Id  System<br>
<br>/dev/sda1   *           1          13      104391   83  Linux<br>/dev/s=
da2              14       19457   156183930   8e  Linux LVM<br><br>Disk /de=
v/sdb: 1500.3 GB, 1500301910016 bytes<br>255 heads, 63 sectors/track, 18240=
1 cylinders<br>
<br>Units =3D cylinders of 16065 * 512 =3D 8225280 bytes<br><br>   Device B=
oot      Start         End      Blocks   Id  System<br>/dev/sdb1           =
    1       60788   488279578+  83  Linux<br>/dev/sdb2           60789     =
 121576   488279610   83  Linux<br>
<br>/dev/sdb3          121577      182401   488576812+  83  Linux<br><br>pv=
scan<br>  PV /dev/hdd3   VG VG_Storage02    lvm2 [83.83 GB / 0    free]<br>=
  PV /dev/sdb2   VG VG_Storage000   lvm2 [465.66 GB / 0    free]<br>  PV /d=
ev/sdb1   VG VG_Storage01    lvm2 [465.66 GB / 316.62 GB free]<br>
<br>  PV /dev/hdc2   VG VG_Storage      lvm2 [74.52 GB / 74.52 GB free]<br>=
  PV /dev/hdd2   VG VG_Storage      lvm2 [74.52 GB / 74.52 GB free]<br>  PV=
 /dev/sda2   VG VG_SYS          lvm2 [148.95 GB / 0    free]<br>  PV /dev/h=
dd1   VG VG_Storage00    lvm2 [74.53 GB / 0    free]<br>
<br>  PV /dev/hdc1   VG VG_Storage00    lvm2 [74.53 GB / 0    free]<br>  To=
tal: 8 [1.43 TB] / in use: 8 [1.43 TB] / in no VG: 0 [0   ]<br><br>vgscan<b=
r>  Reading all physical volumes.  This may take a while...<br>  Found volu=
me group &quot;VG_Storage02&quot; using metadata type lvm2<br>
<br>  Found volume group &quot;VG_Storage000&quot; using metadata type lvm2=
<br>  Found volume group &quot;VG_Storage01&quot; using metadata type lvm2<=
br>  Found volume group &quot;VG_Storage&quot; using metadata type lvm2<br>
<br>  Found volume group &quot;VG_SYS&quot; using metadata type lvm2<br>  F=
ound volume group &quot;VG_Storage00&quot; using metadata type lvm2<br><br>=
lvscan<br>  ACTIVE            &#39;/dev/VG_Storage02/LG_VG_Storage02_00&#39=
; [83.83 GB] inherit<br>
<br>  ACTIVE            &#39;/dev/VG_Storage000/LV_VGSTORAGE000&#39; [465.6=
6 GB] anywhere<br>  ACTIVE            &#39;/dev/VG_Storage01/LV_VG_STORAGE0=
1&#39; [149.04 GB] anywhere<br>  ACTIVE            &#39;/dev/VG_SYS/LogVol0=
0&#39; [148.07 GB] inherit<br>
<br>  ACTIVE            &#39;/dev/VG_SYS/LogVol01&#39; [896.00 MB] inherit<=
br>  ACTIVE            &#39;/dev/VG_Storage00/LG_VG_Storage00_00&#39; [149.=
05 GB] inherit<br><br>lvdisplay /dev/VG_Storage01/LV_VG_STORAGE01<br>  --- =
Logical volume ---<br>
<br>  LV Name                /dev/VG_Storage01/LV_VG_STORAGE01<br>  VG Name=
                VG_Storage01<br>  LV UUID                48dcTk-XKJ1-3umG-y=
kVu-EjYS-gGP7-i1RN1y<br>  LV Write Access        read/write<br>  LV Status =
             available<br>
<br>  # open                 1<br>  LV Size                149.04 GB<br>  C=
urrent LE             76308<br>  Segments               1<br>  Allocation  =
           anywhere<br>  Read ahead sectors     auto<br>  - currently set t=
o     512<br>
<br>[/code]<br><br>the drive i&#39;m trying to move the data to is /dev/sdb=
. Dived into 2 partitions. Each 500Gb.<br><br>The &quot;/dev/VG_Storage01/L=
V_VG_STORAGE01&quot; is the original LG that had 2 drives (partitions) - <b=
r>
<br><br>step by step:<br><br>0. /dev/VG_Storage01/LV_VG_STORAGE01 of is not=
 mounted;<br><br>1. /dev/VG_Storage01 originally had /dev/hdc2 and /dev/hdd=
2.<br><br>2. I added  /dev/sdb1 into /dev/VG_Storage01<br><br>3. did pvmove=
 /dev/hdc2 /dev/sdb1 and pvmove /dev/hdd2 /dev/sdb1<br>
<br><br>4. removed /dev/hdc2 and /dev/hdd2 from /dev/VG_Storage01<br><br>5.=
 created VG_Storage with /dev/hdc2 and /dev/hdd2<br><br>6. tried to extend =
/dev/VG_Storage01/LV_VG_STORAGE01:<br>[code]<br>vextend -l +100%PVS -r -t /=
dev/VG_Storage01/LV_VG_STORAGE01<br>
<br>  Test mode: Metadata will NOT be updated.<br>Segmentation fault<br><br=
>lvextend -v -l +100%FREE -r -t /dev/VG_Storage01/LV_VG_STORAGE01<br>  Test=
 mode: Metadata will NOT be updated.<br>    Finding volume group VG_Storage=
01<br>
<br>  Using stripesize of last segment 64.00 KB<br>  Rounding size (238417 =
extents) down to stripe boundary size for segment (238416 extents)<br>    E=
xecuting: fsadm --dry-run --verbose check /dev/VG_Storage01/LV_VG_STORAGE01=
<br>
<br>fsadm: &quot;ext3&quot; filesystem found on &quot;/dev/mapper/VG_Storag=
e01-LV_VG_STORAGE01&quot;<br>fsadm: Dry execution fsck /dev/mapper/VG_Stora=
ge01-LV_VG_STORAGE01<br>    Test mode: Skipping archiving of volume group.<=
br>
<br>  Extending logical volume LV_VG_STORAGE01 to 465.66 GB<br>  Insufficie=
nt suitable allocatable extents for logical volume LV_VG_STORAGE01: 162108 =
more required<br>    Test mode: Wiping internal cache<br>    Wiping interna=
l VG cache<br>
<br>[/code]<br>  Block device           253:4</pre>Thank you for your help.=
<br>
</blockquote>

--000e0cd70ddc58a291047cd02e0c--
