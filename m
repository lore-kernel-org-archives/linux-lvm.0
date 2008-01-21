Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0L35Sat030325
	for <linux-lvm@redhat.com>; Sun, 20 Jan 2008 22:05:28 -0500
Received: from py-out-1112.google.com (py-out-1112.google.com [64.233.166.176])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0L358cb028445
	for <linux-lvm@redhat.com>; Sun, 20 Jan 2008 22:05:08 -0500
Received: by py-out-1112.google.com with SMTP id a29so2249706pyi.0
	for <linux-lvm@redhat.com>; Sun, 20 Jan 2008 19:05:07 -0800 (PST)
Message-ID: <ddaf98bd0801201905r320e4bdx4c6a354edf8ecf53@mail.gmail.com>
Date: Sun, 20 Jan 2008 21:05:07 -0600
From: "Cory Zerwas" <gannas@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_16932_6782295.1200884707441"
Subject: [linux-lvm] Moved unexported VGs to replacement system after MB
	failure
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

------=_Part_16932_6782295.1200884707441
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I have a 3ware 9500S-8 which is hosting a 1.14Tb and a 465Gb LVM volgrp.
This storage was in a system that smoked it's onboard video and subsequently
the entire bus; or enough of it to bring the machine down hard (was a Fedora
Core 6 box).  I moved the RAID card along with disks to a new system and I
find that lvscan, pvscan, and vgscan all come up with the
previously-existing LVM partitions/volgrps but I do not see the moved
volgrps.  I suspect that the partitions were created improperly as a type 83
linux partition or whole-disk LVM but perhaps it's possible that the move to
the new system somehow changed the partition type?  The latter doesn't seem
very likely to me but I am running logical disk verification on my RAID
controller to be sure that the disk set is intact.  Since this was an abrupt
event I did not have the opportunity to export the volume groups first.

I do see the following on an lvmdiskscan:
  /dev/ramdisk [       16.00 MB]
  /dev/dm-0    [       19.53 GB]
  /dev/ram     [       16.00 MB]
  /dev/sda1    [      196.08 MB]
  /dev/dm-1    [      323.41 GB]
  /dev/ram2    [       16.00 MB]
  /dev/sda2    [      344.92 GB] LVM physical volume
  /dev/dm-2    [        1.94 GB]
  /dev/ram3    [       16.00 MB]
  /dev/ram4    [       16.00 MB]
  /dev/ram5    [       16.00 MB]
  /dev/ram6    [       16.00 MB]
  /dev/ram7    [       16.00 MB]
  /dev/ram8    [       16.00 MB]
  /dev/ram9    [       16.00 MB]
  /dev/ram10   [       16.00 MB]
  /dev/ram11   [       16.00 MB]
  /dev/ram12   [       16.00 MB]
  /dev/ram13   [       16.00 MB]
  /dev/ram14   [       16.00 MB]
  /dev/ram15   [       16.00 MB]
  /dev/sdb1    [        1.14 TB]
  /dev/sdc1    [      465.64 GB]
  2 disks
  20 partitions
  0 LVM physical volume whole disks
  1 LVM physical volume

There are the RAID logical drives/LUNs that should contain the volgrps I
want, /dev/sdb1 and sdc1.  The volgrp on /dev/sda2 is the host system's
existing volgrp.  Could this really be as simple as changing the partition
type to 8e, Linux LVM?  I am hesitant since while I do have a backup of the
important data I would like to keep all of it if possible.  It is possible
that one of the volgrps from the old system has the same default name of
VolGroup00 if that makes a difference during recovery steps.  I have
definitely learned to backup the /etc directory, can't keep it all in my
brain any more.  Plus it'd be handy to have the original LVM files from the
old system.  I will see if I can get the old root partition drive fired up
in a USB enclosure to perhaps recover some useful LVM data.  Since that is
also an LVM vol group, argh... Doubt that will go well.

LVM ver info:
# lvm> version
  LVM version:     2.02.28 (2007-08-24)
  Library version: 1.02.22 (2007-08-21)
  Driver version:  4.11.0

Kernel ver:
# uname -r -v -i
2.6.23.9-85.fc8 #1 SMP Fri Dec 7 15:49:36 EST 2007 x86_64

This is a fedora 8 system.  Output from scans:

# pvscan -v
    Wiping cache of LVM-capable devices
    Wiping internal VG cache
    Walking through all physical volumes
  PV /dev/sda2   VG VolGroup00   lvm2 [344.91 GB / 32.00 MB free]
  Total: 1 [344.91 GB] / in use: 1 [344.91 GB] / in no VG: 0 [0   ]

# lvscan -v
    Finding all logical volumes
  ACTIVE            '/dev/VolGroup00/LogVolRootFS' [19.53 GB] inherit
  ACTIVE            '/dev/VolGroup00/LogVolMythstor' [323.41 GB] inherit
  ACTIVE            '/dev/VolGroup00/LogVol01' [1.94 GB] inherit

# vgscan -v
    Wiping cache of LVM-capable devices
    Wiping internal VG cache
  Reading all physical volumes.  This may take a while...
    Finding all volume groups
    Finding volume group "VolGroup00"
  Found volume group "VolGroup00" using metadata type lvm2

Any advice would be appreciated, please let me know if there's more info I
can provide to provide a more clear picture.
Cory

------=_Part_16932_6782295.1200884707441
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

I have a 3ware 9500S-8 which is hosting a 1.14Tb and a 465Gb LVM volgrp.&nb=
sp; This storage was in a system that smoked it&#39;s onboard video and sub=
sequently the entire bus; or enough of it to bring the machine down hard (w=
as a Fedora Core 6 box).&nbsp; I moved the RAID card along with disks to a =
new system and I find that lvscan, pvscan, and vgscan all come up with the =
previously-existing LVM partitions/volgrps but I do not see the moved volgr=
ps.&nbsp; I suspect that the partitions were created improperly as a type 8=
3 linux partition or whole-disk LVM but perhaps it&#39;s possible that the =
move to the new system somehow changed the partition type?&nbsp; The latter=
 doesn&#39;t seem very likely to me but I am running logical disk verificat=
ion on my RAID controller to be sure that the disk set is intact.&nbsp; Sin=
ce this was an abrupt event I did not have the opportunity to export the vo=
lume groups first.
<br><br>I do see the following on an lvmdiskscan:<br>&nbsp; /dev/ramdisk [&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 16.00 MB] <br>&nbsp; /dev/dm-0&nbsp;&nb=
sp;&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 19.53 GB] <br>&nbsp; /dev/r=
am&nbsp;&nbsp;&nbsp;&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 16.00 MB] =
<br>&nbsp; /dev/sda1&nbsp;&nbsp;&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 196.=
08 MB] <br>&nbsp; /dev/dm-1&nbsp;&nbsp;&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
323.41 GB] <br>&nbsp; /dev/ram2&nbsp;&nbsp;&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; 16.00 MB] <br>&nbsp; /dev/sda2&nbsp;&nbsp;&nbsp; [&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; 344.92 GB] LVM physical volume<br>&nbsp; /dev/dm-2&nbsp;=
&nbsp;&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.94 GB] <br>&nbsp=
; /dev/ram3&nbsp;&nbsp;&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 16.00 M=
B] <br>&nbsp; /dev/ram4&nbsp;&nbsp;&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 16.00 MB] <br>&nbsp; /dev/ram5&nbsp;&nbsp;&nbsp; [&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
16.00 MB] <br>&nbsp; /dev/ram6&nbsp;&nbsp;&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; 16.00 MB] <br>&nbsp; /dev/ram7&nbsp;&nbsp;&nbsp; [&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 16.00 MB] <br>&nbsp; /dev/ram8&nbsp;&nbsp;&nbsp; [&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 16.00 MB] <br>&nbsp; /dev/ram9&nbsp;&nb=
sp;&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 16.00 MB] <br>&nbsp; /dev/r=
am10&nbsp;&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 16.00 MB] <br>&nbsp;=
 /dev/ram11&nbsp;&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
16.00 MB] <br>&nbsp; /dev/ram12&nbsp;&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; 16.00 MB] <br>&nbsp; /dev/ram13&nbsp;&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; 16.00 MB] <br>&nbsp; /dev/ram14&nbsp;&nbsp; [&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; 16.00 MB] <br>&nbsp; /dev/ram15&nbsp;&nbsp; [&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; 16.00 MB] <br>&nbsp; /dev/sdb1&nbsp;&nbsp;&nbsp=
; [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.14 TB] <br>&nbsp; /dev/sdc1=
&nbsp;&nbsp;&nbsp; [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
465.64 GB] <br>&nbsp; 2 disks<br>&nbsp; 20 partitions<br>&nbsp; 0 LVM physi=
cal volume whole disks<br>&nbsp; 1 LVM physical volume<br><br>There are the=
 RAID logical drives/LUNs that should contain the volgrps I want, /dev/sdb1=
 and sdc1.&nbsp; The volgrp on /dev/sda2 is the host system&#39;s existing =
volgrp.&nbsp; Could this really be as simple as changing the partition type=
 to 8e, Linux LVM?&nbsp; I am hesitant since while I do have a backup of th=
e important data I would like to keep all of it if possible.&nbsp; It is po=
ssible that one of the volgrps from the old system has the same default nam=
e of VolGroup00 if that makes a difference during recovery steps.&nbsp; I h=
ave definitely learned to backup the /etc directory, can&#39;t keep it all =
in my brain any more.&nbsp; Plus it&#39;d be handy to have the original LVM=
 files from the old system.&nbsp; I will see if I can get the old root part=
ition drive fired up in a USB enclosure to perhaps recover some useful LVM =
data.&nbsp; Since that is also an LVM vol group, argh... Doubt that will go=
 well.
<br><br>LVM ver info:<br># lvm&gt; version<br>&nbsp; LVM version:&nbsp;&nbs=
p;&nbsp;&nbsp; 2.02.28 (2007-08-24)<br>&nbsp; Library version: 1.02.22 (200=
7-08-21)<br>&nbsp; Driver version:&nbsp; 4.11.0<br><br>Kernel ver: <br># un=
ame -r -v -i<br>2.6.23.9-85.fc8 #1 SMP Fri Dec 7 15:49:36 EST 2007 x86_64
<br><br>This is a fedora 8 system.&nbsp; Output from scans:<br><br># pvscan=
 -v<br>&nbsp;&nbsp;&nbsp; Wiping cache of LVM-capable devices<br>&nbsp;&nbs=
p;&nbsp; Wiping internal VG cache<br>&nbsp;&nbsp;&nbsp; Walking through all=
 physical volumes<br>&nbsp; PV /dev/sda2&nbsp;&nbsp; VG VolGroup00&nbsp;&nb=
sp; lvm2 [
344.91 GB / 32.00 MB free]<br>&nbsp; Total: 1 [344.91 GB] / in use: 1 [344.=
91 GB] / in no VG: 0 [0&nbsp;&nbsp; ]<br><br># lvscan -v<br>&nbsp;&nbsp;&nb=
sp; Finding all logical volumes<br>&nbsp; ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#39;/dev/VolGroup00/LogVolRootFS&#=
39; [19.53 GB] inherit
<br>&nbsp; ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; &#39;/dev/VolGroup00/LogVolMythstor&#39; [323.41 GB] inherit<br>&n=
bsp; ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; &#39;/dev/VolGroup00/LogVol01&#39; [1.94 GB] inherit<br><br># vgscan -v =
<br>&nbsp;&nbsp;&nbsp; Wiping cache of LVM-capable devices
<br>&nbsp;&nbsp;&nbsp; Wiping internal VG cache<br>&nbsp; Reading all physi=
cal volumes.&nbsp; This may take a while...<br>&nbsp;&nbsp;&nbsp; Finding a=
ll volume groups<br>&nbsp;&nbsp;&nbsp; Finding volume group &quot;VolGroup0=
0&quot;<br>&nbsp; Found volume group &quot;VolGroup00&quot; using metadata =
type lvm2
<br><br>Any advice would be appreciated, please let me know if there&#39;s =
more info I can provide to provide a more clear picture.<br>Cory<br>

------=_Part_16932_6782295.1200884707441--
