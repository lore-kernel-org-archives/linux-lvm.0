Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lBIKZAdb018990
	for <linux-lvm@redhat.com>; Tue, 18 Dec 2007 15:35:10 -0500
Received: from mx.lectra.com (mx.lectra.com [195.115.79.115])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lBIKYmHj022977
	for <linux-lvm@redhat.com>; Tue, 18 Dec 2007 15:34:48 -0500
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C841B5.6B05C0A9"
Date: Tue, 18 Dec 2007 21:34:42 +0100
Message-ID: <73BD1CEC958A564DB6771C5E97339F280167D03B@SMAIL.eu.lectra.com>
From: Naslain Christophe <c.naslain@lectra.com>
Subject: [linux-lvm] Resize LVM2 partition under VMware
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

------_=_NextPart_001_01C841B5.6B05C0A9
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I have installed a CentOS5 with default partitioning using LVM2 into a =
VMware (Using VMware Free Server under Linux Fedora Core 7 as host). I =
now need to extend my VMware disk and partition from 20G to 30G.

What I did previously:
- I successfully extend the VMware disk (.vmdk using the VMware =
dedicated command: vmware-vdiskmanager).
- Then I have booted my VMware with a Knoppix to run fdisk and extend =
the partition /dev/sda2 from 20G to 30G.
- I have rebooted on my VMware disk and now try to extend the partition =
inside CentOS 5...

I first check the size of the disk:

[root@devcentos5 ~]# fdisk /dev/sda

The number of cylinders for this disk is set to 3916.
There is nothing wrong with that, but this is larger than 1024,
and could in certain setups cause problems with:
1) software that runs at boot time (e.g., old versions of LILO)
2) booting and partitioning software from other OSs
   (e.g., DOS FDISK, OS/2 FDISK)

Command (m for help): p

Disk /dev/sda: 32.2 GB, 32212254720 bytes
255 heads, 63 sectors/track, 3916 cylinders
Units =3D cylinders of 16065 * 512 =3D 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *           1          13      104391   83  Linux
/dev/sda2              14        3916    31350847+  83  Linux

OK. /dev/sda2 is extended to 3916 which corresponds to 30G (the size I =
set using fdisk on Knoppix).

The LVM2 config:

[root@devcentos5 ~]# lvscan
  ACTIVE            '/dev/VolGroup00/LogVol00' [17.94 GB] inherit
  ACTIVE            '/dev/VolGroup00/LogVol01' [1.94 GB] inherit

My main partition is /dev/VolGroup00/LogVol00, the original size =
corresponds to 20G (17.94 GB once formatted). It uses /dev/sda2 as =
physical volume.

[root@devcentos5 ~]# lvdisplay=20
  --- Logical volume ---
  LV Name                /dev/VolGroup00/LogVol00
  VG Name                VolGroup00
  LV UUID                m2HK0N-BIYP-F1QR-dLtO-BQ76-421H-2p5aXN
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                17.94 GB
  Current LE             574
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:0
  =20
  --- Logical volume ---
  LV Name                /dev/VolGroup00/LogVol01
  VG Name                VolGroup00
  LV UUID                vWw6Dm-7b4V-3SLL-6Uaq-WCc0-R91u-Eu1ABP
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                1.94 GB
  Current LE             62
  Segments               1
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:1

Now I try to extend my volume using lvextend command:

[root@devcentos5 ~]# lvextend -L+10G /dev/VolGroup00/LogVol00=20
  Extending logical volume LogVol00 to 27.94 GB
  Insufficient free space: 320 extents needed, but only 0 available

I tried system-config-lvm utility, but there is no unallocated space to =
use.

How can I get the additional 10G that I added to the /dev/sda2 =
partition?

Any idea?

Best,

Chris


------_=_NextPart_001_01C841B5.6B05C0A9
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.5.7652.24">
<TITLE>Resize LVM2 partition under VMware</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/plain format -->

<P><FONT SIZE=3D2>Hi,<BR>
<BR>
I have installed a CentOS5 with default partitioning using LVM2 into a =
VMware (Using VMware Free Server under Linux Fedora Core 7 as host). I =
now need to extend my VMware disk and partition from 20G to 30G.<BR>
<BR>
What I did previously:<BR>
- I successfully extend the VMware disk (.vmdk using the VMware =
dedicated command: vmware-vdiskmanager).<BR>
- Then I have booted my VMware with a Knoppix to run fdisk and extend =
the partition /dev/sda2 from 20G to 30G.<BR>
- I have rebooted on my VMware disk and now try to extend the partition =
inside CentOS 5...<BR>
<BR>
I first check the size of the disk:<BR>
<BR>
[root@devcentos5 ~]# fdisk /dev/sda<BR>
<BR>
The number of cylinders for this disk is set to 3916.<BR>
There is nothing wrong with that, but this is larger than 1024,<BR>
and could in certain setups cause problems with:<BR>
1) software that runs at boot time (e.g., old versions of LILO)<BR>
2) booting and partitioning software from other OSs<BR>
&nbsp;&nbsp; (e.g., DOS FDISK, OS/2 FDISK)<BR>
<BR>
Command (m for help): p<BR>
<BR>
Disk /dev/sda: 32.2 GB, 32212254720 bytes<BR>
255 heads, 63 sectors/track, 3916 cylinders<BR>
Units =3D cylinders of 16065 * 512 =3D 8225280 bytes<BR>
<BR>
&nbsp;&nbsp; Device Boot&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
Start&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
End&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Blocks&nbsp;&nbsp; Id&nbsp; System<BR>
/dev/sda1&nbsp;&nbsp; =
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
13&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 104391&nbsp;&nbsp; 83&nbsp; Linux<BR>
/dev/sda2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; 14&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
3916&nbsp;&nbsp;&nbsp; 31350847+&nbsp; 83&nbsp; Linux<BR>
<BR>
OK. /dev/sda2 is extended to 3916 which corresponds to 30G (the size I =
set using fdisk on Knoppix).<BR>
<BR>
The LVM2 config:<BR>
<BR>
[root@devcentos5 ~]# lvscan<BR>
&nbsp; =
ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
'/dev/VolGroup00/LogVol00' [17.94 GB] inherit<BR>
&nbsp; =
ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
'/dev/VolGroup00/LogVol01' [1.94 GB] inherit<BR>
<BR>
My main partition is /dev/VolGroup00/LogVol00, the original size =
corresponds to 20G (17.94 GB once formatted). It uses /dev/sda2 as =
physical volume.<BR>
<BR>
[root@devcentos5 ~]# lvdisplay<BR>
&nbsp; --- Logical volume ---<BR>
&nbsp; LV =
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; /dev/VolGroup00/LogVol00<BR>
&nbsp; VG =
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; VolGroup00<BR>
&nbsp; LV =
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; m2HK0N-BIYP-F1QR-dLtO-BQ76-421H-2p5aXN<BR>
&nbsp; LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
read/write<BR>
&nbsp; LV =
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; available<BR>
&nbsp; # =
open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; 1<BR>
&nbsp; LV =
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; 17.94 GB<BR>
&nbsp; Current =
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; 574<BR>
&nbsp; =
Segments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 1<BR>
&nbsp; =
Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; inherit<BR>
&nbsp; Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>
&nbsp; Block =
device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
253:0<BR>
&nbsp;&nbsp;<BR>
&nbsp; --- Logical volume ---<BR>
&nbsp; LV =
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; /dev/VolGroup00/LogVol01<BR>
&nbsp; VG =
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; VolGroup00<BR>
&nbsp; LV =
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; vWw6Dm-7b4V-3SLL-6Uaq-WCc0-R91u-Eu1ABP<BR>
&nbsp; LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
read/write<BR>
&nbsp; LV =
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; available<BR>
&nbsp; # =
open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; 1<BR>
&nbsp; LV =
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; 1.94 GB<BR>
&nbsp; Current =
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; 62<BR>
&nbsp; =
Segments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; 1<BR>
&nbsp; =
Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; inherit<BR>
&nbsp; Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>
&nbsp; Block =
device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
253:1<BR>
<BR>
Now I try to extend my volume using lvextend command:<BR>
<BR>
[root@devcentos5 ~]# lvextend -L+10G /dev/VolGroup00/LogVol00<BR>
&nbsp; Extending logical volume LogVol00 to 27.94 GB<BR>
&nbsp; Insufficient free space: 320 extents needed, but only 0 =
available<BR>
<BR>
I tried system-config-lvm utility, but there is no unallocated space to =
use.<BR>
<BR>
How can I get the additional 10G that I added to the /dev/sda2 =
partition?<BR>
<BR>
Any idea?<BR>
<BR>
Best,<BR>
<BR>
Chris<BR>
<BR>
</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C841B5.6B05C0A9--
