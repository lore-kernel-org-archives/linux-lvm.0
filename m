Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l9L9wbYJ008269
	for <linux-lvm@redhat.com>; Sun, 21 Oct 2007 05:58:37 -0400
Received: from mail.starcomms.net (mail.starcomms.net [196.3.62.2])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l9L9wZP5015993
	for <linux-lvm@redhat.com>; Sun, 21 Oct 2007 05:58:35 -0400
Received: from localhost (localhost.starcomms.net [127.0.0.1])
	by mail.starcomms.net (Postfix) with ESMTP id 4290F17036
	for <linux-lvm@redhat.com>; Sun, 21 Oct 2007 10:58:34 +0100 (WAT)
Received: from mail.starcomms.net ([127.0.0.1])
	by localhost (mail.starcomms.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3dEl1RPSjRIa for <linux-lvm@redhat.com>;
	Sun, 21 Oct 2007 10:58:33 +0100 (WAT)
Received: from devnote (unknown [10.149.120.224])
	by mail.starcomms.net (Postfix) with ESMTP id 33A1517035
	for <linux-lvm@redhat.com>; Sun, 21 Oct 2007 10:58:29 +0100 (WAT)
Message-ID: <011301c813c8$ef1029e0$bdb4f33f@devnote>
From: <ismail@21ctl.com>
Date: Sun, 21 Oct 2007 10:58:28 +0100
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_010F_01C813D1.4FB56640"
Subject: [linux-lvm] mount volume problem
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

This is a multi-part message in MIME format.

------=_NextPart_000_010F_01C813D1.4FB56640
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_0110_01C813D1.4FB56640"


------=_NextPart_001_0110_01C813D1.4FB56640
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all

I need your kind assistance.

I have a machine with Linux LVM file system. I mistakenly moved my /* to =
/var/www/test and everything stopped working.

We tried to use rescue disk, but rescue did not see the volume on the =
hard disk. We tried to mount the hard disk but got superblock error.=20

We reinstall the OS in a new hard disk /dev/sda and make the hard disk =
with /* problem as secondary /dev/sdb.

Primary /dev/sda
Secondary dev/sdb    /dev/sdb1, /dev/sdb2

I want to mount the /dev/sdb2 on /newmnt I created in the new OS. But =
/dev/sdb2 has the same VG name as /dev/sda2 - VolGroup00.

Please, how do I mount the /dev/sdb2 VG VolGroup00 on /newmnt?=20

Will I be able to mv back the root on the sdb2 i.e mv =
/newmnt/var/www/test/* /newmnt/?

Kindly assist with procedure and command. I have no experience using =
lvm.

I attach the fiel strucutre.

Thanks.

Ismail

------=_NextPart_001_0110_01C813D1.4FB56640
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2600.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>Hi all</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I need your kind =
assistance.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have a&nbsp;machine with Linux LVM =
file system. I=20
mistakenly moved my /* to /var/www/test and everything stopped=20
working.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>We tried to use rescue disk, but rescue =
did not see=20
the volume on the hard disk. We tried to mount the hard disk but got =
superblock=20
error. </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>We reinstall the OS in a new hard disk =
/dev/sda and=20
make the hard disk with /* problem as&nbsp;secondary =
/dev/sdb.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Primary /dev/sda</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Secondary dev/sdb&nbsp;&nbsp;&nbsp; =
/dev/sdb1,=20
/dev/sdb2</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I want to mount the /dev/sdb2 on =
/newmnt I created=20
in the new OS. But </FONT><FONT face=3DArial size=3D2>/dev/sdb2 has the =
same VG name=20
as /dev/sda2 - VolGroup00.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Please, how do I mount the /dev/sdb2 VG =
VolGroup00=20
on /newmnt? </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Will I be able to mv back the root on =
the sdb2 i.e=20
mv /newmnt/var/www/test/* /newmnt/?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Kindly assist with procedure and =
command. I have no=20
experience using lvm.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I attach the fiel =
strucutre.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial =
size=3D2>Ismail</FONT></DIV></FONT></DIV></BODY></HTML>

------=_NextPart_001_0110_01C813D1.4FB56640--

------=_NextPart_000_010F_01C813D1.4FB56640
Content-Type: text/plain;
	name="gserver-new-volume-struct.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="gserver-new-volume-struct.txt"


[root@localhost /]# fdisk -l

Disk /dev/sda: 250.0 GB, 250059350016 bytes
255 heads, 63 sectors/track, 30401 cylinders
Units =3D cylinders of 16065 * 512 =3D 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *           1          65      522081   83  Linux
/dev/sda2              66       30401   243673920   8e  Linux LVM

Disk /dev/sdb: 164.6 GB, 164696555520 bytes
255 heads, 63 sectors/track, 20023 cylinders
Units =3D cylinders of 16065 * 512 =3D 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/sdb1   *           1          65      522081   83  Linux
/dev/sdb2              66       20023   160312635   8e  Linux LVM
[root@localhost /]#

[root@localhost /]# mount -l
/dev/mapper/VolGroup00-LogVol00 on / type ext3 (rw)
proc on /proc type proc (rw)
sysfs on /sys type sysfs (rw)
devpts on /dev/pts type devpts (rw,gid=3D5,mode=3D620)
/dev/sda1 on /boot type ext3 (rw) [/boot]
tmpfs on /dev/shm type tmpfs (rw)
none on /proc/sys/fs/binfmt_misc type binfmt_misc (rw)
sunrpc on /var/lib/nfs/rpc_pipefs type rpc_pipefs (rw)

[root@localhost /]# lvm lvs
  LV       VG         Attr   LSize   Origin Snap%  Move Log Copy%
  LogVol00 VolGroup00 -wi-ao 230.44G
  LogVol01 VolGroup00 -wi-ao   1.94G

[root@localhost /]# lvm pvs -a
  WARNING: Duplicate VG name VolGroup00: Existing =
Vgs0w2-0j2x-cft2-oI1j-bV00-BdEC-xIIYfc (created here) takes precedence =
over 2414FK-8hzo-botP-F5hw-8M1U-wWfx-9giXeV
  PV                       VG         Fmt  Attr PSize   PFree
  /dev/VolGroup00/LogVol01                 --        0      0
  /dev/ram                                 --        0      0
  /dev/ram10                               --        0      0
  /dev/ram11                               --        0      0
  /dev/ram12                               --        0      0
  /dev/ram13                               --        0      0
  /dev/ram14                               --        0      0
  /dev/ram15                               --        0      0
  /dev/ram2                                --        0      0
  /dev/ram3                                --        0      0
  /dev/ram4                                --        0      0
  /dev/ram5                                --        0      0
  /dev/ram6                                --        0      0
  /dev/ram7                                --        0      0
  /dev/ram8                                --        0      0
  /dev/ram9                                --        0      0
  /dev/ramdisk                             --        0      0
  /dev/root                                --        0      0
  /dev/sda                                 --        0      0
  /dev/sda1                                --        0      0
  /dev/sda2                VolGroup00 lvm2 a-   232.38G     0
  /dev/sdb                                 --        0      0
  /dev/sdb1                                --        0      0
  /dev/sdb2                VolGroup00 lvm2 a-   152.88G 32.00M

[root@localhost /]# lvm vgs -a
  WARNING: Duplicate VG name VolGroup00: Existing =
Vgs0w2-0j2x-cft2-oI1j-bV00-BdEC-xIIYfc (created here) takes precedence =
over 2414FK-8hzo-botP-F5hw-8M1U-wWfx-9giXeV
  VG         #PV #LV #SN Attr   VSize   VFree
  VolGroup00   1   3   0 wz--n- 152.88G 32.00M
  VolGroup00   1   2   0 wz--n- 232.38G     0

[root@localhost /]# lvm lvmdiskscan help
  /dev/ramdisk             [       16.00 MB]
  /dev/root                [      230.44 GB]
  /dev/ram                 [       16.00 MB]
  /dev/sda1                [      509.84 MB]
  /dev/VolGroup00/LogVol01 [        1.94 GB]
  /dev/ram2                [       16.00 MB]
  /dev/sda2                [      232.39 GB] LVM physical volume
  /dev/ram3                [       16.00 MB]
  /dev/ram4                [       16.00 MB]
  /dev/ram5                [       16.00 MB]
  /dev/ram6                [       16.00 MB]
  /dev/ram7                [       16.00 MB]
  /dev/ram8                [       16.00 MB]
  /dev/ram9                [       16.00 MB]
  /dev/ram10               [       16.00 MB]
  /dev/ram11               [       16.00 MB]
  /dev/ram12               [       16.00 MB]
  /dev/ram13               [       16.00 MB]
  /dev/ram14               [       16.00 MB]
  /dev/ram15               [       16.00 MB]
  /dev/sdb1                [      509.84 MB]
  WARNING: Duplicate VG name VolGroup00: Existing =
Vgs0w2-0j2x-cft2-oI1j-bV00-BdEC-xIIYfc (created here) takes precedence =
over 2414FK-8hzo-botP-F5hw-8M1U-wWfx-9giXeV
  /dev/sdb2                [      152.89 GB] LVM physical volume
  3 disks
  17 partitions
  0 LVM physical volume whole disks
  2 LVM physical volumes




------=_NextPart_000_010F_01C813D1.4FB56640--
