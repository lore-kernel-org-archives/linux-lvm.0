Received: from mx2.redhat.com (ext-mx01.rdu.redhat.com [10.11.45.6])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q03EK3kl019342
	for <linux-lvm@redhat.com>; Tue, 3 Jan 2012 09:20:03 -0500
Received: from mail-lpp01m010-f46.google.com (mail-lpp01m010-f46.google.com
	[209.85.215.46])
	by mx2.redhat.com (8.13.8/8.13.8) with ESMTP id q03EK1Th009737
	for <linux-lvm@redhat.com>; Tue, 3 Jan 2012 09:20:01 -0500
Received: by lahd3 with SMTP id d3so5023190lah.33
	for <linux-lvm@redhat.com>; Tue, 03 Jan 2012 06:19:57 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 3 Jan 2012 09:49:57 -0430
Message-ID: <CA+jZo2FDGn=aPRC7=rSVEapdB2xBXL0+9SiX0G3163KY_ZYz+w@mail.gmail.com>
From: =?ISO-8859-1?Q?Oliver_Carre=F1o?= <orcoliver@gmail.com>
Content-Type: multipart/alternative; boundary=bcaec54b48d0d3e81d04b5a06482
Subject: [linux-lvm] Restore data from a Invalid Snapshot or COW.
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

--bcaec54b48d0d3e81d04b5a06482
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Dear friends,
Performing a system upgrade, I lost important data from a logical volume. T=
he
only thing I have to retrieve that data is a snapshot inactive, because the
COW out of space in the update. When I try to mount the snapshot, I get I /=
 O
errors. And if I try to mount the partition COW, this show me unknown file
system  error.

=BFI can extract data from a snapshot invalid or Cow?
Thanks and regards.


# dmsetup status
eBox--Veneyarna-swap_1: 0 20209664 linear
eBox--Veneyarna-root-real: 0 550223872 linear
eBox--Veneyarna-rootsnap: 0 550223872 snapshot Invalid
eBox--Veneyarna-backups: 0 104857600 linear
eBox--Veneyarna-rootsnap-cow: 0 419430400 linear
eBox--Veneyarna-root: 0 550223872 snapshot-origin



# dmsetup table
eBox--Veneyarna-swap_1: 0 20209664 linear 8:5 550224256
eBox--Veneyarna-root-real: 0 550223872 linear 8:5 384
eBox--Veneyarna-rootsnap: 0 550223872 snapshot 252:0 252:2 P 16
eBox--Veneyarna-backups: 0 104857600 linear 8:17 384
eBox--Veneyarna-rootsnap-cow: 0 419430400 linear 8:17 104857984
eBox--Veneyarna-root: 0 550223872 snapshot-origin 252:0

# vgdisplay
  /dev/dm-3: read failed after 0 of 4096 at 0: Input/output error
  --- Volume group ---
  VG Name               eBox-Veneyarna
  System ID
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  23
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                4
  Open LV               1
  Max PV                0
  Cur PV                2
  Act PV                2
  VG Size               737.25 GiB
  PE Size               4.00 MiB
  Total PE              188735
  Alloc PE / Size       133633 / 522.00 GiB
  Free  PE / Size       55102 / 215.24 GiB
  VG UUID               IB3AdY-85sg-p5El-L1Er-qpB3-0BWI-LvYmYj

# lvdisplay
  /dev/dm-3: read failed after 0 of 4096 at 0: Input/output error
  --- Logical volume ---
  LV Name                /dev/eBox-Veneyarna/root
  VG Name                eBox-Veneyarna
  LV UUID                FhcR2z-aouw-X6wg-BKsz-wNdX-QwvS-KWZoiV
  LV Write Access        read/write
  LV snapshot status     source of
                         /dev/eBox-Veneyarna/rootsnap [INACTIVE]
  LV Status              available
  # open                 0
  LV Size                262.37 GiB
  Current LE             67166
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           252:1

  --- Logical volume ---
  LV Name                /dev/eBox-Veneyarna/swap_1
  VG Name                eBox-Veneyarna
  LV UUID                Czx0Yi-1NCA-Ejwv-i0S2-I1yW-amD8-eV6KY8
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                9.64 GiB
  Current LE             2467
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           252:4

  --- Logical volume ---
  LV Name                /dev/eBox-Veneyarna/backups
  VG Name                eBox-Veneyarna
  LV UUID                5uWOv8-mwp2-utqI-QtAC-rbH3-GejG-zcWY4n
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                50.00 GiB
  Current LE             12800
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           252:5

  --- Logical volume ---
  LV Name                /dev/eBox-Veneyarna/rootsnap
  VG Name                eBox-Veneyarna
  LV UUID                HQ0HGG-31Mq-IZR1-3LDy-WIMG-BrAa-IhVpIN
  LV Write Access        read/write
  LV snapshot status     INACTIVE destination for /dev/eBox-Veneyarna/root
  LV Status              available
  # open                 0
  LV Size                262.37 GiB
  Current LE             67166
  COW-table size         200.00 GiB
  COW-table LE           51200
  Snapshot chunk size    8.00 KiB
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           252:3


Oliver Carre=F1o

--bcaec54b48d0d3e81d04b5a06482
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<span class=3D"hps" style=3D"color:rgb(51,51,51);font-family:arial,sans-ser=
if;font-size:16px;background-color:rgb(245,245,245)">Dear friends,</span><b=
r style=3D"color:rgb(51,51,51);font-family:arial,sans-serif;font-size:16px;=
background-color:rgb(245,245,245)">
<span style=3D"color:rgb(51,51,51);font-family:arial,sans-serif;font-size:1=
6px;background-color:rgb(245,245,245)"></span><span class=3D"hps" style=3D"=
color:rgb(51,51,51);font-family:arial,sans-serif;font-size:16px;background-=
color:rgb(245,245,245)">Performing a</span><span style=3D"color:rgb(51,51,5=
1);font-family:arial,sans-serif;font-size:16px;background-color:rgb(245,245=
,245)">=A0</span><span class=3D"hps" style=3D"color:rgb(51,51,51);font-fami=
ly:arial,sans-serif;font-size:16px;background-color:rgb(245,245,245)">syste=
m upgrade,</span><span style=3D"color:rgb(51,51,51);font-family:arial,sans-=
serif;font-size:16px;background-color:rgb(245,245,245)">=A0</span><span cla=
ss=3D"hps" style=3D"color:rgb(51,51,51);font-family:arial,sans-serif;font-s=
ize:16px;background-color:rgb(245,245,245)">I lost</span><span style=3D"col=
or:rgb(51,51,51);font-family:arial,sans-serif;font-size:16px;background-col=
or:rgb(245,245,245)">=A0</span><span class=3D"hps" style=3D"color:rgb(51,51=
,51);font-family:arial,sans-serif;font-size:16px;background-color:rgb(245,2=
45,245)">important data from</span><span style=3D"color:rgb(51,51,51);font-=
family:arial,sans-serif;font-size:16px;background-color:rgb(245,245,245)">=
=A0</span><span class=3D"hps" style=3D"color:rgb(51,51,51);font-family:aria=
l,sans-serif;font-size:16px;background-color:rgb(245,245,245)">a logical vo=
lume.</span><span style=3D"color:rgb(51,51,51);font-family:arial,sans-serif=
;font-size:16px;background-color:rgb(245,245,245)">=A0</span><span class=3D=
"hps" style=3D"color:rgb(51,51,51);font-family:arial,sans-serif;font-size:1=
6px;background-color:rgb(245,245,245)">The only thing</span><span style=3D"=
color:rgb(51,51,51);font-family:arial,sans-serif;font-size:16px;background-=
color:rgb(245,245,245)">=A0</span><span class=3D"hps" style=3D"color:rgb(51=
,51,51);font-family:arial,sans-serif;font-size:16px;background-color:rgb(24=
5,245,245)">I have to</span><span style=3D"color:rgb(51,51,51);font-family:=
arial,sans-serif;font-size:16px;background-color:rgb(245,245,245)">=A0</spa=
n><span class=3D"hps" style=3D"color:rgb(51,51,51);font-family:arial,sans-s=
erif;font-size:16px;background-color:rgb(245,245,245)">retrieve that data</=
span><span style=3D"color:rgb(51,51,51);font-family:arial,sans-serif;font-s=
ize:16px;background-color:rgb(245,245,245)">=A0</span><span class=3D"hps" s=
tyle=3D"color:rgb(51,51,51);font-family:arial,sans-serif;font-size:16px;bac=
kground-color:rgb(245,245,245)">is</span><span style=3D"color:rgb(51,51,51)=
;font-family:arial,sans-serif;font-size:16px;background-color:rgb(245,245,2=
45)">=A0</span><span class=3D"hps" style=3D"color:rgb(51,51,51);font-family=
:arial,sans-serif;font-size:16px;background-color:rgb(245,245,245)">a snaps=
hot</span><span style=3D"color:rgb(51,51,51);font-family:arial,sans-serif;f=
ont-size:16px;background-color:rgb(245,245,245)">=A0</span><span class=3D"h=
ps" style=3D"color:rgb(51,51,51);font-family:arial,sans-serif;font-size:16p=
x;background-color:rgb(245,245,245)">inactive,</span><span style=3D"color:r=
gb(51,51,51);font-family:arial,sans-serif;font-size:16px;background-color:r=
gb(245,245,245)">=A0</span><span class=3D"hps" style=3D"color:rgb(51,51,51)=
;font-family:arial,sans-serif;font-size:16px;background-color:rgb(245,245,2=
45)">because the</span><span style=3D"color:rgb(51,51,51);font-family:arial=
,sans-serif;font-size:16px;background-color:rgb(245,245,245)">=A0</span><sp=
an class=3D"hps" style=3D"color:rgb(51,51,51);font-family:arial,sans-serif;=
font-size:16px;background-color:rgb(245,245,245)">COW</span><span style=3D"=
color:rgb(51,51,51);font-family:arial,sans-serif;font-size:16px;background-=
color:rgb(245,245,245)">=A0</span><span class=3D"hps" style=3D"color:rgb(51=
,51,51);font-family:arial,sans-serif;font-size:16px;background-color:rgb(24=
5,245,245)">out of space</span><span style=3D"color:rgb(51,51,51);font-fami=
ly:arial,sans-serif;font-size:16px;background-color:rgb(245,245,245)">=A0</=
span><span class=3D"hps" style=3D"color:rgb(51,51,51);font-family:arial,san=
s-serif;font-size:16px;background-color:rgb(245,245,245)">in the update.</s=
pan><span style=3D"color:rgb(51,51,51);font-family:arial,sans-serif;font-si=
ze:16px;background-color:rgb(245,245,245)">=A0</span><span class=3D"hps" st=
yle=3D"color:rgb(51,51,51);font-family:arial,sans-serif;font-size:16px;back=
ground-color:rgb(245,245,245)">When I try to</span><span style=3D"color:rgb=
(51,51,51);font-family:arial,sans-serif;font-size:16px;background-color:rgb=
(245,245,245)">=A0</span><span class=3D"hps" style=3D"color:rgb(51,51,51);f=
ont-family:arial,sans-serif;font-size:16px;background-color:rgb(245,245,245=
)">mount the</span><span style=3D"color:rgb(51,51,51);font-family:arial,san=
s-serif;font-size:16px;background-color:rgb(245,245,245)">=A0</span><span c=
lass=3D"hps" style=3D"color:rgb(51,51,51);font-family:arial,sans-serif;font=
-size:16px;background-color:rgb(245,245,245)">snapshot</span><span style=3D=
"color:rgb(51,51,51);font-family:arial,sans-serif;font-size:16px;background=
-color:rgb(245,245,245)">, I get</span><span style=3D"color:rgb(51,51,51);f=
ont-family:arial,sans-serif;font-size:16px;background-color:rgb(245,245,245=
)">=A0</span><span class=3D"hps" style=3D"color:rgb(51,51,51);font-family:a=
rial,sans-serif;font-size:16px;background-color:rgb(245,245,245)">I /</span=
><span style=3D"color:rgb(51,51,51);font-family:arial,sans-serif;font-size:=
16px;background-color:rgb(245,245,245)">=A0</span><span class=3D"hps" style=
=3D"color:rgb(51,51,51);font-family:arial,sans-serif;font-size:16px;backgro=
und-color:rgb(245,245,245)">O=A0
errors.</span><span style=3D"color:rgb(51,51,51);font-family:arial,sans-ser=
if;font-size:16px;background-color:rgb(245,245,245)">=A0</span><span class=
=3D"hps" style=3D"color:rgb(51,51,51);font-family:arial,sans-serif;font-siz=
e:16px;background-color:rgb(245,245,245)">And</span><span style=3D"color:rg=
b(51,51,51);font-family:arial,sans-serif;font-size:16px;background-color:rg=
b(245,245,245)">=A0</span><span class=3D"hps" style=3D"color:rgb(51,51,51);=
font-family:arial,sans-serif;font-size:16px;background-color:rgb(245,245,24=
5)">if I try to</span><span style=3D"color:rgb(51,51,51);font-family:arial,=
sans-serif;font-size:16px;background-color:rgb(245,245,245)">=A0</span><spa=
n class=3D"hps" style=3D"color:rgb(51,51,51);font-family:arial,sans-serif;f=
ont-size:16px;background-color:rgb(245,245,245)">mount the</span><span styl=
e=3D"color:rgb(51,51,51);font-family:arial,sans-serif;font-size:16px;backgr=
ound-color:rgb(245,245,245)">=A0</span><span class=3D"hps" style=3D"color:r=
gb(51,51,51);font-family:arial,sans-serif;font-size:16px;background-color:r=
gb(245,245,245)">partition=A0</span><span style=3D"color:rgb(51,51,51);font=
-family:arial,sans-serif;font-size:16px;background-color:rgb(245,245,245)">=
</span><span class=3D"hps" style=3D"color:rgb(51,51,51);font-family:arial,s=
ans-serif;font-size:16px;background-color:rgb(245,245,245)">COW, this</span=
><span style=3D"color:rgb(51,51,51);font-family:arial,sans-serif;font-size:=
16px;background-color:rgb(245,245,245)">=A0</span><span class=3D"hps" style=
=3D"color:rgb(51,51,51);font-family:arial,sans-serif;font-size:16px;backgro=
und-color:rgb(245,245,245)">show me</span><span style=3D"color:rgb(51,51,51=
);font-family:arial,sans-serif;font-size:16px;background-color:rgb(245,245,=
245)">=A0</span><span class=3D"hps" style=3D"color:rgb(51,51,51);font-famil=
y:arial,sans-serif;font-size:16px;background-color:rgb(245,245,245)">unknow=
n file</span><span style=3D"color:rgb(51,51,51);font-family:arial,sans-seri=
f;font-size:16px;background-color:rgb(245,245,245)">=A0</span><span class=
=3D"hps" style=3D"color:rgb(51,51,51);font-family:arial,sans-serif;font-siz=
e:16px;background-color:rgb(245,245,245)">system=A0</span>
<span style=3D"color:rgb(51,51,51);font-family:arial,sans-serif;font-size:1=
6px;background-color:rgb(245,245,245)">error</span><span style=3D"color:rgb=
(51,51,51);font-family:arial,sans-serif;font-size:16px;background-color:rgb=
(245,245,245)">.</span><br style=3D"color:rgb(51,51,51);font-family:arial,s=
ans-serif;font-size:16px;background-color:rgb(245,245,245)">
<br style=3D"color:rgb(51,51,51);font-family:arial,sans-serif;font-size:16p=
x;background-color:rgb(245,245,245)"><span style=3D"color:rgb(51,51,51);fon=
t-family:arial,sans-serif;font-size:16px;background-color:rgb(245,245,245)"=
></span><span class=3D"hps atn" style=3D"color:rgb(51,51,51);font-family:ar=
ial,sans-serif;font-size:16px;background-color:rgb(245,245,245)">=BF</span>=
<span style=3D"color:rgb(51,51,51);font-family:arial,sans-serif;font-size:1=
6px;background-color:rgb(245,245,245)">I can</span><span style=3D"color:rgb=
(51,51,51);font-family:arial,sans-serif;font-size:16px;background-color:rgb=
(245,245,245)">=A0</span><span class=3D"hps" style=3D"color:rgb(51,51,51);f=
ont-family:arial,sans-serif;font-size:16px;background-color:rgb(245,245,245=
)">extract data from a</span><span style=3D"color:rgb(51,51,51);font-family=
:arial,sans-serif;font-size:16px;background-color:rgb(245,245,245)">=A0</sp=
an><span class=3D"hps" style=3D"color:rgb(51,51,51);font-family:arial,sans-=
serif;font-size:16px;background-color:rgb(245,245,245)">snapshot</span><spa=
n style=3D"color:rgb(51,51,51);font-family:arial,sans-serif;font-size:16px;=
background-color:rgb(245,245,245)">=A0</span><span class=3D"hps" style=3D"c=
olor:rgb(51,51,51);font-family:arial,sans-serif;font-size:16px;background-c=
olor:rgb(245,245,245)">invalid</span><span style=3D"color:rgb(51,51,51);fon=
t-family:arial,sans-serif;font-size:16px;background-color:rgb(245,245,245)"=
>=A0</span><span class=3D"hps" style=3D"color:rgb(51,51,51);font-family:ari=
al,sans-serif;font-size:16px;background-color:rgb(245,245,245)">or</span><s=
pan style=3D"color:rgb(51,51,51);font-family:arial,sans-serif;font-size:16p=
x;background-color:rgb(245,245,245)">=A0</span><span class=3D"hps" style=3D=
"color:rgb(51,51,51);font-family:arial,sans-serif;font-size:16px;background=
-color:rgb(245,245,245)">Cow</span><span style=3D"color:rgb(51,51,51);font-=
family:arial,sans-serif;font-size:16px;background-color:rgb(245,245,245)">?=
</span><br style=3D"color:rgb(51,51,51);font-family:arial,sans-serif;font-s=
ize:16px;background-color:rgb(245,245,245)">
<span style=3D"color:rgb(51,51,51);font-family:arial,sans-serif;font-size:1=
6px;background-color:rgb(245,245,245)"></span><span class=3D"hps" style=3D"=
color:rgb(51,51,51);font-family:arial,sans-serif;font-size:16px;background-=
color:rgb(245,245,245)">Thanks and</span><span style=3D"color:rgb(51,51,51)=
;font-family:arial,sans-serif;font-size:16px;background-color:rgb(245,245,2=
45)">=A0</span><span class=3D"hps" style=3D"color:rgb(51,51,51);font-family=
:arial,sans-serif;font-size:16px;background-color:rgb(245,245,245)">regards=
.</span>=A0<div>
<br></div><div><br></div><div><div># dmsetup status</div><div>eBox--Veneyar=
na-swap_1: 0 20209664 linear</div><div>eBox--Veneyarna-root-real: 0 5502238=
72 linear</div><div>eBox--Veneyarna-rootsnap: 0 550223872 snapshot Invalid<=
/div>
<div>eBox--Veneyarna-backups: 0 104857600 linear</div><div>eBox--Veneyarna-=
rootsnap-cow: 0 419430400 linear</div><div>eBox--Veneyarna-root: 0 55022387=
2 snapshot-origin</div><div><br></div><div><br></div><div><br></div><div>
# dmsetup table</div><div>eBox--Veneyarna-swap_1: 0 20209664 linear 8:5 550=
224256</div><div>eBox--Veneyarna-root-real: 0 550223872 linear 8:5 384</div=
><div>eBox--Veneyarna-rootsnap: 0 550223872 snapshot 252:0 252:2 P 16</div>
<div>eBox--Veneyarna-backups: 0 104857600 linear 8:17 384</div><div>eBox--V=
eneyarna-rootsnap-cow: 0 419430400 linear 8:17 104857984</div><div>eBox--Ve=
neyarna-root: 0 550223872 snapshot-origin 252:0</div><div><br></div><div>
# vgdisplay</div><div>=A0 /dev/dm-3: read failed after 0 of 4096 at 0: Inpu=
t/output error</div><div>=A0 --- Volume group ---</div><div>=A0 VG Name =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 eBox-Veneyarna</div><div>=A0 System ID</div><div>=
=A0 Format =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0lvm2</div>
<div>=A0 Metadata Areas =A0 =A0 =A0 =A02</div><div>=A0 Metadata Sequence No=
 =A023</div><div>=A0 VG Access =A0 =A0 =A0 =A0 =A0 =A0 read/write</div><div=
>=A0 VG Status =A0 =A0 =A0 =A0 =A0 =A0 resizable</div><div>=A0 MAX LV =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A00</div><div>=A0 Cur LV =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A04</div>
<div>=A0 Open LV =A0 =A0 =A0 =A0 =A0 =A0 =A0 1</div><div>=A0 Max PV =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A00</div><div>=A0 Cur PV =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A02</div><div>=A0 Act PV =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A02</div><div>=A0 VG=
 Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 737.25 GiB</div><div>=A0 PE Size =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 4.00 MiB</div>
<div>=A0 Total PE =A0 =A0 =A0 =A0 =A0 =A0 =A0188735</div><div>=A0 Alloc PE =
/ Size =A0 =A0 =A0 133633 / 522.00 GiB</div><div>=A0 Free =A0PE / Size =A0 =
=A0 =A0 55102 / 215.24 GiB</div><div>=A0 VG UUID =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 IB3AdY-85sg-p5El-L1Er-qpB3-0BWI-LvYmYj</div>
<div><br></div><div># lvdisplay</div><div>=A0 /dev/dm-3: read failed after =
0 of 4096 at 0: Input/output error</div><div>=A0 --- Logical volume ---</di=
v><div>=A0 LV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/dev/eBox-Veneyarna/root<=
/div><div>=A0 VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0eBox-Veneyarna</div>
<div>=A0 LV UUID =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0FhcR2z-aouw-X6wg-BKsz-wNdX-=
QwvS-KWZoiV</div><div>=A0 LV Write Access =A0 =A0 =A0 =A0read/write</div><d=
iv>=A0 LV snapshot status =A0 =A0 source of</div><div>=A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/dev/eBox-Veneyarna/rootsnap [INACTIVE]</div=
>
<div>=A0 LV Status =A0 =A0 =A0 =A0 =A0 =A0 =A0available</div><div>=A0 # ope=
n =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0</div><div>=A0 LV Size =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0262.37 GiB</div><div>=A0 Current LE =A0 =A0 =A0 =A0 =A0 =A0 =
67166</div><div>=A0 Segments =A0 =A0 =A0 =A0 =A0 =A0 =A0 1</div><div>=A0 Al=
location =A0 =A0 =A0 =A0 =A0 =A0 inherit</div>
<div>=A0 Read ahead sectors =A0 =A0 auto</div><div>=A0 - currently set to =
=A0 =A0 256</div><div>=A0 Block device =A0 =A0 =A0 =A0 =A0 252:1</div><div>=
<br></div><div>=A0 --- Logical volume ---</div><div>=A0 LV Name =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0/dev/eBox-Veneyarna/swap_1</div>
<div>=A0 VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0eBox-Veneyarna</div><div>=
=A0 LV UUID =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Czx0Yi-1NCA-Ejwv-i0S2-I1yW-amD8-=
eV6KY8</div><div>=A0 LV Write Access =A0 =A0 =A0 =A0read/write</div><div>=
=A0 LV Status =A0 =A0 =A0 =A0 =A0 =A0 =A0available</div><div>=A0 # open =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0</div>
<div>=A0 LV Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A09.64 GiB</div><div>=A0 Curr=
ent LE =A0 =A0 =A0 =A0 =A0 =A0 2467</div><div>=A0 Segments =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 1</div><div>=A0 Allocation =A0 =A0 =A0 =A0 =A0 =A0 inherit</div=
><div>=A0 Read ahead sectors =A0 =A0 auto</div><div>=A0 - currently set to =
=A0 =A0 256</div>
<div>=A0 Block device =A0 =A0 =A0 =A0 =A0 252:4</div><div><br></div><div>=
=A0 --- Logical volume ---</div><div>=A0 LV Name =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0/dev/eBox-Veneyarna/backups</div><div>=A0 VG Name =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0eBox-Veneyarna</div><div>=A0 LV UUID =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A05uWOv8-mwp2-utqI-QtAC-rbH3-GejG-zcWY4n</div>
<div>=A0 LV Write Access =A0 =A0 =A0 =A0read/write</div><div>=A0 LV Status =
=A0 =A0 =A0 =A0 =A0 =A0 =A0available</div><div>=A0 # open =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 1</div><div>=A0 LV Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A050.0=
0 GiB</div><div>=A0 Current LE =A0 =A0 =A0 =A0 =A0 =A0 12800</div><div>=A0 =
Segments =A0 =A0 =A0 =A0 =A0 =A0 =A0 1</div>
<div>=A0 Allocation =A0 =A0 =A0 =A0 =A0 =A0 inherit</div><div>=A0 Read ahea=
d sectors =A0 =A0 auto</div><div>=A0 - currently set to =A0 =A0 256</div><d=
iv>=A0 Block device =A0 =A0 =A0 =A0 =A0 252:5</div><div><br></div><div>=A0 =
--- Logical volume ---</div><div>=A0 LV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0/dev/eBox-Veneyarna/rootsnap</div>
<div>=A0 VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0eBox-Veneyarna</div><div>=
=A0 LV UUID =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0HQ0HGG-31Mq-IZR1-3LDy-WIMG-BrAa-=
IhVpIN</div><div>=A0 LV Write Access =A0 =A0 =A0 =A0read/write</div><div>=
=A0 LV snapshot status =A0 =A0 INACTIVE destination for /dev/eBox-Veneyarna=
/root</div>
<div>=A0 LV Status =A0 =A0 =A0 =A0 =A0 =A0 =A0available</div><div>=A0 # ope=
n =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 0</div><div>=A0 LV Size =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0262.37 GiB</div><div>=A0 Current LE =A0 =A0 =A0 =A0 =A0 =A0 =
67166</div><div>=A0 COW-table size =A0 =A0 =A0 =A0 200.00 GiB</div><div>=A0=
 COW-table LE =A0 =A0 =A0 =A0 =A0 51200</div>
<div>=A0 Snapshot chunk size =A0 =A08.00 KiB</div><div>=A0 Segments =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 1</div><div>=A0 Allocation =A0 =A0 =A0 =A0 =A0 =A0 inh=
erit</div><div>=A0 Read ahead sectors =A0 =A0 auto</div><div>=A0 - currentl=
y set to =A0 =A0 256</div><div>=A0 Block device =A0 =A0 =A0 =A0 =A0 252:3</=
div>
<div><br></div></div><div><br clear=3D"all">Oliver Carre=F1o<br>
</div>

--bcaec54b48d0d3e81d04b5a06482--
