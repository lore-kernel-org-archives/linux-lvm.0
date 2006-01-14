Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0E3jH111665
	for <linux-lvm@redhat.com>; Fri, 13 Jan 2006 22:45:17 -0500
Received: from uproxy.gmail.com (uproxy.gmail.com [66.249.92.204])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k0E3j95W028552
	for <linux-lvm@redhat.com>; Fri, 13 Jan 2006 22:45:10 -0500
Received: by uproxy.gmail.com with SMTP id q2so253783uge
	for <linux-lvm@redhat.com>; Fri, 13 Jan 2006 19:45:09 -0800 (PST)
Message-ID: <347397800601131945n75465246yb07b9ee471cf3764@mail.gmail.com>
Date: Fri, 13 Jan 2006 22:45:09 -0500
From: Chris <coderight@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_6537_8516716.1137210309235"
Subject: [linux-lvm] Problems after OS switch
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

------=_Part_6537_8516716.1137210309235
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

I'm not exactly sure what happened but it went something like this:

I was running unstable Debian and switched to Ubuntu.  I had a volume group
made up of 4 drives in linear append mode.  I believe the Ubuntu installer
wrote a partion table to one of the drives in the array, or possibly wrote
grub on the drive.  Anyway, after install one of the physical volumes shows
as "unknown device" and none of the other commands could find some
uuid-XXX.  I attemped to correct this by using "pvcreate -u [the_old_uuid]
-Z n" which seemed to bring the drive back into the volume group.

The problem now is that none of the volume group devices actually work.  I
have devices at /dev/mapper/vg-xxxx that I can't read from (obviously mount
doesn't work either).

Any ideas on what is going on?  Thanks for any help.  Is the volume group
lost forever?

One thing I don't understand is the "Error" when I do dmsetup:

# dmsetup status
lvm2|vg|data: 0 490209280 linear
lvm2|vg|data: 490209280 220004352 linear
lvm2|vg|data: 710213632 234422272 linear
lvm2|vg|data: 944635904 490209280 linear
hdh2: 0 230516685 linear
vg-data:
hdh1: 0 3919797 linear
Error|lvm2|vg|pv3: 0 490209664 error
vg-var:
lvm2|vg|var: 0 10485760 linear

# pvdisplay
  --- Physical volume ---
  PV Name               /dev/hdh2
  VG Name               vg
  PV Size               109.91 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              3517
  Free PE               0
  Allocated PE          3517
  PV UUID               ZytKG3-bMMZ-x69a-sPZW-sREN-YsZI-200XM0

  --- Physical volume ---
  PV Name               /dev/hdg
  VG Name               vg
  PV Size               111.78 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              3577
  Free PE               0
  Allocated PE          3577
  PV UUID               m0JKRA-7qZ5-6pya-gJVE-CBS2-MlMU-7O6ICX

  --- Physical volume ---
  PV Name               /dev/hde
  VG Name               vg
  PV Size               233.75 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              7480
  Free PE               0
  Allocated PE          7480
  PV UUID               MIVulr-lAOu-pERm-kMTi-DYl1-LxOt-gF7wUT

  --- Physical volume ---
  PV Name               /dev/hdf
  VG Name               vg
  PV Size               233.75 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              7480
  Free PE               0
  Allocated PE          7480
  PV UUID               9vOuxO-FoXv-2qFQ-KAef-eWOo-tg0q-zUdB66

# pvscan
  PV /dev/hdh2   VG vg   lvm2 [109.91 GB / 0    free]
  PV /dev/hdg    VG vg   lvm2 [111.78 GB / 0    free]
  PV /dev/hde    VG vg   lvm2 [233.75 GB / 0    free]
  PV /dev/hdf    VG vg   lvm2 [233.75 GB / 0    free]
  Total: 4 [689.19 GB] / in use: 4 [689.19 GB] / in no VG: 0 [0   ]

# lvdisplay
  --- Logical volume ---
  LV Name                /dev/vg/var
  VG Name                vg
  LV UUID                Q7gaTE-ZROt-aTML-UlxU-J0uh-Ecnu-5RmVVO
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                5.00 GB
  Current LE             160
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:0

  --- Logical volume ---
  LV Name                /dev/vg/data
  VG Name                vg
  LV UUID                soHvwL-1e9K-9CMC-RtyP-qEwo-tbfu-5UwYFo
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                684.19 GB
  Current LE             21894
  Segments               4
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:1

# lvscan
  ACTIVE            '/dev/vg/var' [5.00 GB] inherit
  ACTIVE            '/dev/vg/data' [684.19 GB] inherit

# vgdisplay
  --- Volume group ---
  VG Name               vg
  System ID
  Format                lvm2
  Metadata Areas        3
  Metadata Sequence No  19
  VG Access             read/write
  VG Status             resizable
  MAX LV                255
  Cur LV                2
  Open LV               0
  Max PV                255
  Cur PV                4
  Act PV                4
  VG Size               689.19 GB
  PE Size               32.00 MB
  Total PE              22054
  Alloc PE / Size       22054 / 689.19 GB
  Free  PE / Size       0 / 0
  VG UUID               1aPbjm-Prhr-UBQb-SMpd-4zlO-7gSy-fLg5FA

# vgscan
  Reading all physical volumes.  This may take a while...
  Found volume group "vg" using metadata type lvm2

------=_Part_6537_8516716.1137210309235
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

I'm not exactly sure what happened but it went something like this:<br>
<br>
I was running unstable Debian and switched to Ubuntu.&nbsp; I had a
volume group made up of 4 drives in linear append mode.&nbsp; I believe
the Ubuntu installer wrote a partion table to one of the drives in the
array, or possibly wrote grub on the drive.&nbsp; Anyway, after install
one of the physical volumes shows as &quot;unknown device&quot; and none of=
 the
other commands could find some uuid-XXX.&nbsp; I attemped to correct
this by using &quot;pvcreate -u [the_old_uuid] -Z n&quot; which seemed to b=
ring
the drive back into the volume group.<br>
<br>
The problem now is that none of the volume group devices actually
work.&nbsp; I have devices at /dev/mapper/vg-xxxx that I can't read
from (obviously mount doesn't work either).<br>
<br>
Any ideas on what is going on?&nbsp; Thanks for any help.&nbsp; Is the volu=
me group lost forever?<br>

<br>
One thing I don't understand is the &quot;Error&quot; when I do dmsetup:<br=
>
<br>
# dmsetup status<br>
lvm2|vg|data: 0 490209280 linear<br>
lvm2|vg|data: 490209280 220004352 linear<br>
lvm2|vg|data: 710213632 234422272 linear<br>
lvm2|vg|data: 944635904 490209280 linear<br>
hdh2: 0 230516685 linear<br>
vg-data:<br>
hdh1: 0 3919797 linear<br>
Error|lvm2|vg|pv3: 0 490209664 error<br>
vg-var:<br>
lvm2|vg|var: 0 10485760 linear<br>
<br>
# pvdisplay<br>
&nbsp; --- Physical volume ---<br>
&nbsp; PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; /dev/hdh2<br>
&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; vg<br>
&nbsp; PV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 109.91 GB / not usable 0<br>
&nbsp; Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; yes (but full)<br>
&nbsp; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 32768<br>
&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; 3517<br>
&nbsp; Free PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 0<br>
&nbsp; Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3=
517<br>
&nbsp; PV
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
ZytKG3-bMMZ-x69a-sPZW-sREN-YsZI-200XM0<br>
<br>
&nbsp; --- Physical volume ---<br>
&nbsp; PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; /dev/hdg<br>
&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; vg<br>
&nbsp; PV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 111.78 GB / not usable 0<br>
&nbsp; Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; yes (but full)<br>
&nbsp; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 32768<br>
&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; 3577<br>
&nbsp; Free PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 0<br>
&nbsp; Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3=
577<br>
&nbsp; PV
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
m0JKRA-7qZ5-6pya-gJVE-CBS2-MlMU-7O6ICX<br>
<br>
&nbsp; --- Physical volume ---<br>
&nbsp; PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; /dev/hde<br>
&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; vg<br>
&nbsp; PV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 233.75 GB / not usable 0<br>
&nbsp; Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; yes (but full)<br>
&nbsp; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 32768<br>
&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; 7480<br>
&nbsp; Free PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 0<br>
&nbsp; Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7=
480<br>
&nbsp; PV
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
MIVulr-lAOu-pERm-kMTi-DYl1-LxOt-gF7wUT<br>
<br>
&nbsp; --- Physical volume ---<br>
&nbsp; PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; /dev/hdf<br>
&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; vg<br>
&nbsp; PV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 233.75 GB / not usable 0<br>
&nbsp; Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; yes (but full)<br>
&nbsp; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 32768<br>
&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; 7480<br>
&nbsp; Free PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 0<br>
&nbsp; Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7=
480<br>
&nbsp; PV
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
9vOuxO-FoXv-2qFQ-KAef-eWOo-tg0q-zUdB66<br>
<br>
# pvscan<br>
&nbsp; PV /dev/hdh2&nbsp;&nbsp; VG vg&nbsp;&nbsp; lvm2 [109.91 GB / 0&nbsp;=
&nbsp;&nbsp; free]<br>
&nbsp; PV /dev/hdg&nbsp;&nbsp;&nbsp; VG vg&nbsp;&nbsp; lvm2 [111.78 GB / 0&=
nbsp;&nbsp;&nbsp; free]<br>
&nbsp; PV /dev/hde&nbsp;&nbsp;&nbsp; VG vg&nbsp;&nbsp; lvm2 [233.75 GB / 0&=
nbsp;&nbsp;&nbsp; free]<br>
&nbsp; PV /dev/hdf&nbsp;&nbsp;&nbsp; VG vg&nbsp;&nbsp; lvm2 [233.75 GB / 0&=
nbsp;&nbsp;&nbsp; free]<br>
&nbsp; Total: 4 [689.19 GB] / in use: 4 [689.19 GB] / in no VG: 0 [0&nbsp;&=
nbsp; ]<br>
<br>
# lvdisplay<br>
&nbsp; --- Logical volume ---<br>
&nbsp; LV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/vg/var<br>
&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vg<br>
&nbsp; LV
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
Q7gaTE-ZROt-aTML-UlxU-J0uh-Ecnu-5RmVVO<br>
&nbsp; LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write=
<br>
&nbsp; LV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; available<br>
&nbsp; # open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
&nbsp; LV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5.00 GB<br>
&nbsp; Current LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; 160<br>
&nbsp; Segments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; 1<br>
&nbsp; Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; inherit<br>
&nbsp; Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
&nbsp; Block device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 253:0<br>
<br>
&nbsp; --- Logical volume ---<br>
&nbsp; LV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/vg/data<br>
&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vg<br>
&nbsp; LV
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
soHvwL-1e9K-9CMC-RtyP-qEwo-tbfu-5UwYFo<br>
&nbsp; LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write=
<br>
&nbsp; LV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; available<br>
&nbsp; # open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
&nbsp; LV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 684.19 GB<br>
&nbsp; Current LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; 21894<br>
&nbsp; Segments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; 4<br>
&nbsp; Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; inherit<br>
&nbsp; Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
&nbsp; Block device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 253:1<br>
<br>
# lvscan<br>
&nbsp; ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; '/dev/vg/var' [5.00 GB] inherit<br>
&nbsp; ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; '/dev/vg/data' [684.19 GB] inherit<br>
<br>
# vgdisplay<br>
&nbsp; --- Volume group ---<br>
&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; vg<br>
&nbsp; System ID<br>
&nbsp; Format&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; lvm2<br>
&nbsp; Metadata Areas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3<br>
&nbsp; Metadata Sequence No&nbsp; 19<br>
&nbsp; VG Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; read/write<br>
&nbsp; VG Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; resizable<br>
&nbsp; MAX LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; 255<br>
&nbsp; Cur LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; 2<br>
&nbsp; Open LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 0<br>
&nbsp; Max PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; 255<br>
&nbsp; Cur PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; 4<br>
&nbsp; Act PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; 4<br>
&nbsp; VG Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 689.19 GB<br>
&nbsp; PE Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 32.00 MB<br>
&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; 22054<br>
&nbsp; Alloc PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 22054 / 689.19 G=
B<br>
&nbsp; Free&nbsp; PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 / 0<br>
&nbsp; VG
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
1aPbjm-Prhr-UBQb-SMpd-4zlO-7gSy-fLg5FA<br>
<br>
# vgscan<br>
&nbsp; Reading all physical volumes.&nbsp; This may take a while...<br>
&nbsp; Found volume group &quot;vg&quot; using metadata type lvm2<br>
<br>
<br>

------=_Part_6537_8516716.1137210309235--
