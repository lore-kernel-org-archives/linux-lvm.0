Message-ID: <00f001c25f1b$3a24ef50$1c01a8c0@internal.tripnet.int>
From: "Robin Edgar - Tripany" <red@tripany.com>
References: <00cd01c25f0c$2990ffd0$1c01a8c0@internal.tripnet.int>
Subject: Re: [linux-lvm] Help! unable to mount lv's - can't see why!
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00ED_01C25F2B.F7B2AE30"
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Wed Sep 18 08:27:42 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_00ED_01C25F2B.F7B2AE30
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I've discovered that there is a problem with /all/ the superblocks =
except for those of the /docu lv (see below). It does lead me to another =
question though - only one of the HDs crashed: is it possible that LVM =
wrote all the superblocks on 1 HD?! If so this seems like a pretty =
serious bug in LVM...

Robin

./tune2fs -l /dev/tripserv_vol/docu
tune2fs 1.28 (31-Aug-2002)
Filesystem volume name:   <none>
Last mounted on:          <not available>
Filesystem UUID:          7746644b-c83d-447f-9562-18dff7634d94
Filesystem magic number:  0xEF53
Filesystem revision #:    1 (dynamic)
Filesystem features:      has_journal filetype needs_recovery =
sparse_super
Filesystem state:         clean
Errors behavior:          Continue
Filesystem OS type:       Linux
Inode count:              131072
Block count:              524288
Reserved block count:     26214
Free blocks:              318873
Free inodes:              129020
First block:              1
Block size:               1024
Fragment size:            1024
Blocks per group:         8192
Fragments per group:      8192
Inodes per group:         2048
Inode blocks per group:   256
Last mount time:          Wed Sep 18 17:13:48 2002
Last write time:          Wed Sep 18 17:13:48 2002
Mount count:              33
Maximum mount count:      25
Last checked:             Sun Mar  3 20:45:33 2002
Check interval:           15552000 (6 months)
Next check after:         Fri Aug 30 21:45:33 2002
Reserved blocks uid:      0 (user root)
Reserved blocks gid:      0 (group root)
First inode:              11
Inode size:               128
Journal UUID:             <none>
Journal inode:            8
Journal device:           0x0000
First orphan inode:       0

# ./tune2fs -l /dev/tripserv_vol/pages
tune2fs 1.28 (31-Aug-2002)
./tune2fs: Bad magic number in super-block while trying to open =
/dev/tripserv_vol/pages
Couldn't find valid filesystem superblock.
You have new mail in /var/spool/mail/root

# mke2fs -n /dev/tripserv_vol/pages
mke2fs 1.27 (8-Mar-2002)
Filesystem label=3D
OS type: Linux
Block size=3D4096 (log=3D2)
Fragment size=3D4096 (log=3D2)
2621440 inodes, 5242880 blocks
262144 blocks (5.00%) reserved for the super user
First data block=3D0
160 block groups
32768 blocks per group, 32768 fragments per group
16384 inodes per group
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, =
2654208,
        4096000

  ----- Original Message -----=20
  From: Robin Edgar - Tripany=20
  To: linux-lvm@sistina.com=20
  Sent: Wednesday, September 18, 2002 2:07 PM
  Subject: [linux-lvm] Help! unable to mount lv's - can't see why!


  Hi,

  I had 4 (ide) disks in an array (and 1 vg) of which one (hde) broke. =
As I was not too sure of the stability of the system, I decided to do a =
dd of the disk byte by byte to another identical disk. After this was =
done (with loads of sector unreadable errors) I replaced the old disk =
with the new disk, rebooted the system and by all standards all seems =
well (see below):
  Unfortunately, only the /dev/tripserv_vol/docu will mount well!
  /dev/tripserv_vol/pages gives the following error:

  # mount /dev/tripserv_vol/pages /c
  mount: you must specify the filesystem type

  # mount /dev/tripserv_vol/pages /c -t ext3
  mount: wrong fs type, bad option, bad superblock on =
/dev/tripserv_vol/pages,
         or too many mounted file systems

  Anyone have any ideas why it won't mount?!

  Cheers,
  Robin Edgar

  #pvscan:
  pvscan -- reading all physical volumes (this may take a while...)
  pvscan -- ACTIVE   PV "/dev/hdg1" of VG "tripserv_vol" [38.16 GB / =
7.93 GB free]
  pvscan -- ACTIVE   PV "/dev/hdh1" of VG "tripserv_vol" [38.16 GB / =
8.01 GB free]
  pvscan -- ACTIVE   PV "/dev/hde1" of VG "tripserv_vol" [55.91 GB / 0 =
free]
  pvscan -- ACTIVE   PV "/dev/hdf1" of VG "tripserv_vol" [55.91 GB / =
3.37 GB free]
  pvscan -- total: 4 [188.16 GB] / in use: 4 [188.16 GB] / in no VG: 0 =
[0]

  (identical output to before changing the disks around)

  #pvdisplay /dev/hde1
  --- Physical volume ---
  PV Name               /dev/hde1
  VG Name               tripserv_vol
  PV Size               55.92 GB [117266625 secs] / NOT usable 4.18 MB =
[LVM: 179 KB]
  PV#                   1
  PV Status             available
  Allocatable           yes (but full)
  Cur LV                20
  PE Size (KByte)       4096
  Total PE              14313
  Free PE               0
  Allocated PE          14313
  PV UUID               KCIKwa-3lvx-k7bj-27ks-hGlI-oZRo-5q7CjM

  (also identical)

  #vgck -v
  vgck -- locking logical volume manager
  vgck -- finding all volume group(s)
  vgck -- checking volume group name "tripserv_vol"
  vgck -- checking existence of volume group "tripserv_vol"
  vgck -- reading volume group data for "tripserv_vol" from lvmtab
  vgck -- checking volume group consistency  of "tripserv_vol" in lvmtab
  vgck -- VGDA of "tripserv_vol" in lvmtab is consistent
  vgck -- reading volume group data for "tripserv_vol" from physical =
volume(s)
  vgck -- checking volume group consistency  of "tripserv_vol" on =
physical volumes
  vgck -- VGDA of "tripserv_vol" on physical volumes is consistent
  vgck -- unlocking logical volume manager

  # vgdisplay
  --- Volume group ---
  VG Name               tripserv_vol
  VG Access             read/write
  VG Status             available/resizable
  VG #                  0
  MAX LV                255
  Cur LV                22
  Open LV               1
  MAX LV Size           255.99 GB
  Max PV                255
  Cur PV                4
  Act PV                4
  VG Size               188.13 GB
  PE Size               4 MB
  Total PE              48162
  Alloc PE / Size       43220 / 168.83 GB
  Free  PE / Size       4942 / 19.30 GB
  VG UUID               KDiCWx-ae2w-oDnx-Hl5O-Amhd-fIM3-y51bIX

  # vgscan -v
  vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
  vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d"
  vgscan -- reading all physical volumes (this may take a while...)
  vgscan -- scanning for all active volume group(s) first
  vgscan -- found active volume group "tripserv_vol"
  vgscan -- reading data of volume group "tripserv_vol" from physical =
volume(s)
  vgscan -- inserting "tripserv_vol" into lvmtab
  vgscan -- backing up volume group "tripserv_vol"
  vgscan -- checking volume group name "tripserv_vol"
  vgscan -- checking volume group consistency of "tripserv_vol"
  vgscan -- checking existence of "/etc/lvmtab.d"
  vgscan -- storing volume group data of "tripserv_vol" in =
"/etc/lvmtab.d/tripserv_vol.tmp"
  vgscan -- storing physical volume data of "tripserv_vol" in =
"/etc/lvmtab.d/tripserv_vol.tmp"
  vgscan -- storing logical volume data of volume group "tripserv_vol" =
in "/etc/lvmtab.d/tripserv_vol.tmp"
  vgscan -- renaming "/etc/lvmtab.d/tripserv_vol.tmp" to =
"/etc/lvmtab.d/tripserv_vol"
  vgscan -- removing special files and directory for volume group =
"tripserv_vol"
  vgscan -- creating directory and group character special file for =
"tripserv_vol"
  vgscan -- creating block device special files for tripserv_vol
  vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
  vgscan -- WARNING: This program does not do a VGDA backup of your =
volume group

  #lvscan
  lvscan -- ACTIVE   Original "/dev/tripserv_vol/docu" [512 MB] =
striped[4]
  lvscan -- ACTIVE   Original "/dev/tripserv_vol/install" [10 GB] =
striped[4]
  lvscan -- ACTIVE   Original "/dev/tripserv_vol/pages" [20 GB] =
striped[4]
  lvscan -- ACTIVE            "/dev/tripserv_vol/gfx" [10 GB] striped[4]
  lvscan -- ACTIVE            "/dev/tripserv_vol/sfx" [10 GB] striped[4]
  lvscan -- ACTIVE            "/dev/tripserv_vol/people" [20 GB] =
striped[4]
  lvscan -- ACTIVE   Original "/dev/tripserv_vol/dim" [2 GB] striped[4]
  lvscan -- ACTIVE            "/dev/tripserv_vol/mp3" [20 GB] striped[4]
  lvscan -- ACTIVE            "/dev/tripserv_vol/applications" [2 GB] =
striped[4]
  lvscan -- ACTIVE   Original "/dev/tripserv_vol/code" [512 MB] =
striped[4]
  lvscan -- ACTIVE            "/dev/tripserv_vol/dumpdir" [10 GB] =
striped[4]
  lvscan -- ACTIVE   Original "/dev/tripserv_vol/homes" [10 GB] =
striped[4]
  lvscan -- ACTIVE   Original "/dev/tripserv_vol/info" [5 GB] striped[4]
  lvscan -- ACTIVE            "/dev/tripserv_vol/log" [252 MB] =
striped[3]
  lvscan -- ACTIVE            "/dev/tripserv_vol/store" [608 MB] =
striped[4]
  lvscan -- ACTIVE   Snapshot "/dev/tripserv_vol/docusnap" [492.19 MB] =
of /dev/tripserv_vol/docu
  lvscan -- ACTIVE   Snapshot "/dev/tripserv_vol/installsnap" [9.84 GB] =
of /dev/tripserv_vol/install
  lvscan -- ACTIVE   Snapshot "/dev/tripserv_vol/dimsnap" [1.97 GB] of =
/dev/tripserv_vol/dim
  lvscan -- ACTIVE   Snapshot "/dev/tripserv_vol/codesnap" [504 MB] of =
/dev/tripserv_vol/code
  lvscan -- ACTIVE   Snapshot "/dev/tripserv_vol/pagessnap" [19.69 GB] =
of /dev/tripserv_vol/pages
  lvscan -- ACTIVE   Snapshot "/dev/tripserv_vol/infosnap" [4.92 GB] of =
/dev/tripserv_vol/info
  lvscan -- ACTIVE   Snapshot "/dev/tripserv_vol/homessnap" [9.84 GB] of =
/dev/tripserv_vol/homes
  lvscan -- 22 logical volumes with 168.08 GB total in 1 volume group
  lvscan -- 22 active logical volumes

  # lvdisplay /dev/tripserv_vol/docu
  --- Logical volume ---
  LV Name                /dev/tripserv_vol/docu
  VG Name                tripserv_vol
  LV Write Access        read/write
  LV snapshot status     source of
                         /dev/tripserv_vol/docusnap [active]
  LV Status              available
  LV #                   1
  # open                 1
  LV Size                512 MB
  Current LE             128
  Allocated LE           128
  Stripes                4
  Stripe size (KByte)    4
  Allocation             next free
  Read ahead sectors     120
  Block device           58:0

  # lvdisplay /dev/tripserv_vol/people
  --- Logical volume ---
  LV Name                /dev/tripserv_vol/people
  VG Name                tripserv_vol
  LV Write Access        read/write
  LV Status              available
  LV #                   6
  # open                 0
  LV Size                20 GB
  Current LE             5120
  Allocated LE           5120
  Stripes                4
  Stripe size (KByte)    4
  Allocation             next free
  Read ahead sectors     120
  Block device           58:5

  # lvdisplay /dev/tripserv_vol/pages
  --- Logical volume ---
  LV Name                /dev/tripserv_vol/pages
  VG Name                tripserv_vol
  LV Write Access        read/write
  LV snapshot status     source of
                         /dev/tripserv_vol/pagessnap [active]
  LV Status              available
  LV #                   3
  # open                 0
  LV Size                20 GB
  Current LE             5120
  Allocated LE           5120
  Stripes                4
  Stripe size (KByte)    4
  Allocation             next free
  Read ahead sectors     120
  Block device           58:2

  tripserv:/# lvdisplay /dev/tripserv_vol/pagessnap
  --- Logical volume ---
  LV Name                /dev/tripserv_vol/pagessnap
  VG Name                tripserv_vol
  LV Write Access        read only
  LV snapshot status     active destination for /dev/tripserv_vol/pages
  LV Status              available
  LV #                   20
  # open                 0
  LV Size                20 GB
  Current LE             5120
  Allocated LE           5120
  snapshot chunk size    64 KB
  Allocated to snapshot  0.00% [0/19.69 GB]
  Allocated to COW-table 320 MB
  Stripes                4
  Stripe size (KByte)    4
  Allocation             next free
  Read ahead sectors     120
  Block device           58:19

  # lvdisplay /dev/tripserv_vol/docusnap
  --- Logical volume ---
  LV Name                /dev/tripserv_vol/docusnap
  VG Name                tripserv_vol
  LV Write Access        read only
  LV snapshot status     active destination for /dev/tripserv_vol/docu
  LV Status              available
  LV #                   16
  # open                 0
  LV Size                512 MB
  Current LE             128
  Allocated LE           128
  snapshot chunk size    64 KB
  Allocated to snapshot  0.05% [256 KB/492.19 MB]
  Allocated to COW-table 7.81 MB
  Stripes                4
  Stripe size (KByte)    4
  Allocation             next free
  Read ahead sectors     120
  Block device           58:15

  So it all looks good!

------=_NextPart_000_00ED_01C25F2B.F7B2AE30
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 5.50.4919.2200" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>I've discovered that there is a problem =
with /all/=20
the superblocks except for those of the /docu lv (see below). It does =
lead me to=20
another question though - only one of the HDs crashed: is it possible =
that LVM=20
wrote all the superblocks on 1 HD?! If so this seems like a pretty =
serious bug=20
in LVM...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Robin</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>./tune2fs -l =
/dev/tripserv_vol/docu<BR>tune2fs 1.28=20
(31-Aug-2002)<BR>Filesystem volume name:&nbsp;&nbsp; =
&lt;none&gt;<BR>Last=20
mounted on:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&lt;not=20
available&gt;<BR>Filesystem=20
UUID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
7746644b-c83d-447f-9562-18dff7634d94<BR>Filesystem magic number:&nbsp;=20
0xEF53<BR>Filesystem revision #:&nbsp;&nbsp;&nbsp; 1 =
(dynamic)<BR>Filesystem=20
features:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; has_journal filetype =
needs_recovery=20
sparse_super<BR>Filesystem=20
state:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clean<BR>Errors=20
behavior:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
Continue<BR>Filesystem OS type:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
Linux<BR>Inode=20
count:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
131072<BR>Block=20
count:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
524288<BR>Reserved block count:&nbsp;&nbsp;&nbsp;&nbsp; 26214<BR>Free=20
blocks:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;=20
318873<BR>Free=20
inodes:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;=20
129020<BR>First=20
block:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
1<BR>Block=20
size:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
1024<BR>Fragment=20
size:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1024<BR>Blocks per =
group:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
8192<BR>Fragments per group:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
8192<BR>Inodes per=20
group:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2048<BR>Inode =
blocks per=20
group:&nbsp;&nbsp; 256<BR>Last mount=20
time:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Wed Sep 18 =
17:13:48=20
2002<BR>Last write =
time:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
Wed Sep 18 17:13:48 2002<BR>Mount=20
count:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
33<BR>Maximum mount count:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 25<BR>Last=20
checked:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
Sun Mar&nbsp; 3 20:45:33 2002<BR>Check=20
interval:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
15552000=20
(6 months)<BR>Next check =
after:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
Fri Aug 30 21:45:33 2002<BR>Reserved blocks =
uid:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=20
(user root)<BR>Reserved blocks gid:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 =
(group=20
root)<BR>First=20
inode:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
11<BR>Inode=20
size:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
128<BR>Journal=20
UUID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;=20
&lt;none&gt;<BR>Journal=20
inode:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =

8<BR>Journal =
device:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0x0000<BR>First orphan inode:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2># ./tune2fs -l =
/dev/tripserv_vol/pages<BR>tune2fs=20
1.28 (31-Aug-2002)<BR>./tune2fs: Bad magic number in super-block while =
trying to=20
open /dev/tripserv_vol/pages<BR>Couldn't find valid filesystem=20
superblock.<BR>You have new mail in =
/var/spool/mail/root<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2># mke2fs -n =
/dev/tripserv_vol/pages<BR>mke2fs 1.27=20
(8-Mar-2002)<BR>Filesystem label=3D<BR>OS type: Linux<BR>Block =
size=3D4096=20
(log=3D2)<BR>Fragment size=3D4096 (log=3D2)<BR>2621440 inodes, 5242880=20
blocks<BR>262144 blocks (5.00%) reserved for the super user<BR>First =
data=20
block=3D0<BR>160 block groups<BR>32768 blocks per group, 32768 fragments =
per=20
group<BR>16384 inodes per group<BR>Superblock backups stored on=20
blocks:<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 32768, 98304, =
163840,=20
229376, 294912, 819200, 884736, 1605632,=20
2654208,<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
4096000<BR></DIV></FONT>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Dred@tripany.com href=3D"mailto:red@tripany.com">Robin Edgar =
-=20
  Tripany</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A =
title=3Dlinux-lvm@sistina.com=20
  href=3D"mailto:linux-lvm@sistina.com">linux-lvm@sistina.com</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Wednesday, September 18, =
2002 2:07=20
  PM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> [linux-lvm] Help! =
unable to=20
  mount lv's - can't see why!</DIV>
  <DIV><BR></DIV>
  <DIV><FONT face=3DArial size=3D2>Hi,</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>I had 4 (ide) disks in an array (and =
1 vg) of=20
  which one (hde) broke. As I was not too sure of the stability of the =
system, I=20
  decided to do a dd of the disk byte by byte to another identical disk. =
After=20
  this was done (with loads of&nbsp;sector unreadable errors) I replaced =
the old=20
  disk with the new disk, rebooted the system and by all standards all =
seems=20
  well (see below):</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>Unfortunately, only&nbsp;the=20
  /dev/tripserv_vol/docu will mount well!</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>/dev/tripserv_vol/pages gives the =
following=20
  error:</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2># mount /dev/tripserv_vol/pages =
/c<BR>mount: you=20
  must specify the filesystem type<BR></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2># mount /dev/tripserv_vol/pages /c -t =

  ext3<BR>mount: wrong fs type, bad option, bad superblock on=20
  /dev/tripserv_vol/pages,<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; or =
too many=20
  mounted file systems<BR></DIV></FONT>
  <DIV><FONT face=3DArial size=3D2>Anyone have any ideas why it won't=20
  mount?!</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Cheers,</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>Robin Edgar</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>#pvscan:</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>pvscan -- reading all physical =
volumes (this may=20
  take a while...)<BR>pvscan -- ACTIVE&nbsp;&nbsp; PV "/dev/hdg1" of VG=20
  "tripserv_vol" [38.16 GB / 7.93 GB free]<BR>pvscan -- =
ACTIVE&nbsp;&nbsp; PV=20
  "/dev/hdh1" of VG "tripserv_vol" [38.16 GB / 8.01 GB free]<BR>pvscan =
--=20
  ACTIVE&nbsp;&nbsp; PV "/dev/hde1" of VG "tripserv_vol" [55.91 GB / 0=20
  free]<BR>pvscan -- ACTIVE&nbsp;&nbsp; PV "/dev/hdf1" of VG =
"tripserv_vol"=20
  [55.91 GB / 3.37 GB free]<BR>pvscan -- total: 4 [188.16 GB] / in use: =
4=20
  [188.16 GB] / in no VG: 0 [0]<BR></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>(identical output to before changing =
the disks=20
  around)</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>#pvdisplay /dev/hde1<BR>--- Physical =
volume=20
  ---<BR>PV=20
  =
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
  /dev/hde1<BR>VG=20
  =
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
  tripserv_vol<BR>PV=20
  =
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
  55.92 GB [117266625 secs] / NOT usable 4.18 MB [LVM: 179=20
  =
KB]<BR>PV#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  1<BR>PV=20
  =
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
  =
available<BR>Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
  yes (but full)<BR>Cur=20
  =
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
  20<BR>PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
4096<BR>Total=20
  =
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
  14313<BR>Free=20
  =
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
  0<BR>Allocated =
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  14313<BR>PV=20
  =
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
  KCIKwa-3lvx-k7bj-27ks-hGlI-oZRo-5q7CjM<BR></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>(also identical)</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>#vgck -v<BR>vgck -- locking logical =
volume=20
  manager<BR>vgck -- finding all volume group(s)<BR>vgck -- checking =
volume=20
  group name "tripserv_vol"<BR>vgck -- checking existence of volume =
group=20
  "tripserv_vol"<BR>vgck -- reading volume group data for "tripserv_vol" =
from=20
  lvmtab<BR>vgck -- checking volume group consistency&nbsp; of =
"tripserv_vol" in=20
  lvmtab<BR>vgck -- VGDA of "tripserv_vol" in lvmtab is =
consistent<BR>vgck --=20
  reading volume group data for "tripserv_vol" from physical =
volume(s)<BR>vgck=20
  -- checking volume group consistency&nbsp; of "tripserv_vol" on =
physical=20
  volumes<BR>vgck -- VGDA of "tripserv_vol" on physical volumes is=20
  consistent<BR>vgck -- unlocking logical volume =
manager<BR></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2># vgdisplay<BR>--- Volume group =
---<BR>VG=20
  =
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
  tripserv_vol<BR>VG=20
  =
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
  read/write<BR>VG=20
  =
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
  available/resizable<BR>VG=20
  =
#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  0<BR>MAX=20
  =
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
  255<BR>Cur=20
  =
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
  22<BR>Open=20
  =
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
  1<BR>MAX LV =
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  255.99 GB<BR>Max=20
  =
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
  255<BR>Cur=20
  =
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
  4<BR>Act=20
  =
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
  4<BR>VG=20
  =
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
  188.13 GB<BR>PE=20
  =
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
  4 MB<BR>Total=20
  =
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
  48162<BR>Alloc PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 43220 / =
168.83=20
  GB<BR>Free&nbsp; PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4942 / =
19.30=20
  GB<BR>VG=20
  =
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
  KDiCWx-ae2w-oDnx-Hl5O-Amhd-fIM3-y51bIX<BR></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2># vgscan -v<BR>vgscan -- removing =
"/etc/lvmtab"=20
  and "/etc/lvmtab.d"<BR>vgscan -- creating empty "/etc/lvmtab" and=20
  "/etc/lvmtab.d"<BR>vgscan -- reading all physical volumes (this may =
take a=20
  while...)<BR>vgscan -- scanning for all active volume group(s) =
first<BR>vgscan=20
  -- found active volume group "tripserv_vol"<BR>vgscan -- reading data =
of=20
  volume group "tripserv_vol" from physical volume(s)<BR>vgscan -- =
inserting=20
  "tripserv_vol" into lvmtab<BR>vgscan -- backing up volume group=20
  "tripserv_vol"<BR>vgscan -- checking volume group name=20
  "tripserv_vol"<BR>vgscan -- checking volume group consistency of=20
  "tripserv_vol"<BR>vgscan -- checking existence of =
"/etc/lvmtab.d"<BR>vgscan --=20
  storing volume group data of "tripserv_vol" in=20
  "/etc/lvmtab.d/tripserv_vol.tmp"<BR>vgscan -- storing physical volume =
data of=20
  "tripserv_vol" in "/etc/lvmtab.d/tripserv_vol.tmp"<BR>vgscan -- =
storing=20
  logical volume data of volume group "tripserv_vol" in=20
  "/etc/lvmtab.d/tripserv_vol.tmp"<BR>vgscan -- renaming=20
  "/etc/lvmtab.d/tripserv_vol.tmp" to =
"/etc/lvmtab.d/tripserv_vol"<BR>vgscan --=20
  removing special files and directory for volume group =
"tripserv_vol"<BR>vgscan=20
  -- creating directory and group character special file for=20
  "tripserv_vol"<BR>vgscan -- creating block device special files for=20
  tripserv_vol<BR>vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" =
successfully=20
  created<BR>vgscan -- WARNING: This program does not do a VGDA backup =
of your=20
  volume group<BR></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>#lvscan</DIV></FONT>
  <DIV><FONT face=3DArial size=3D2>lvscan -- ACTIVE&nbsp;&nbsp; Original =

  "/dev/tripserv_vol/docu" [512 MB] striped[4]<BR>lvscan -- =
ACTIVE&nbsp;&nbsp;=20
  Original "/dev/tripserv_vol/install" [10 GB] striped[4]<BR>lvscan --=20
  ACTIVE&nbsp;&nbsp; Original "/dev/tripserv_vol/pages" [20 GB]=20
  striped[4]<BR>lvscan --=20
  =
ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =

  "/dev/tripserv_vol/gfx" [10 GB] striped[4]<BR>lvscan --=20
  =
ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =

  "/dev/tripserv_vol/sfx" [10 GB] striped[4]<BR>lvscan --=20
  =
ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =

  "/dev/tripserv_vol/people" [20 GB] striped[4]<BR>lvscan -- =
ACTIVE&nbsp;&nbsp;=20
  Original "/dev/tripserv_vol/dim" [2 GB] striped[4]<BR>lvscan --=20
  =
ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =

  "/dev/tripserv_vol/mp3" [20 GB] striped[4]<BR>lvscan --=20
  =
ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =

  "/dev/tripserv_vol/applications" [2 GB] striped[4]<BR>lvscan --=20
  ACTIVE&nbsp;&nbsp; Original "/dev/tripserv_vol/code" [512 MB]=20
  striped[4]<BR>lvscan --=20
  =
ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =

  "/dev/tripserv_vol/dumpdir" [10 GB] striped[4]<BR>lvscan -- =
ACTIVE&nbsp;&nbsp;=20
  Original "/dev/tripserv_vol/homes" [10 GB] striped[4]<BR>lvscan --=20
  ACTIVE&nbsp;&nbsp; Original "/dev/tripserv_vol/info" [5 GB]=20
  striped[4]<BR>lvscan --=20
  =
ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =

  "/dev/tripserv_vol/log" [252 MB] striped[3]<BR>lvscan --=20
  =
ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =

  "/dev/tripserv_vol/store" [608 MB] striped[4]<BR>lvscan -- =
ACTIVE&nbsp;&nbsp;=20
  Snapshot "/dev/tripserv_vol/docusnap" [492.19 MB] of=20
  /dev/tripserv_vol/docu<BR>lvscan -- ACTIVE&nbsp;&nbsp; Snapshot=20
  "/dev/tripserv_vol/installsnap" [9.84 GB] of=20
  /dev/tripserv_vol/install<BR>lvscan -- ACTIVE&nbsp;&nbsp; Snapshot=20
  "/dev/tripserv_vol/dimsnap" [1.97 GB] of =
/dev/tripserv_vol/dim<BR>lvscan --=20
  ACTIVE&nbsp;&nbsp; Snapshot "/dev/tripserv_vol/codesnap" [504 MB] of=20
  /dev/tripserv_vol/code<BR>lvscan -- ACTIVE&nbsp;&nbsp; Snapshot=20
  "/dev/tripserv_vol/pagessnap" [19.69 GB] of =
/dev/tripserv_vol/pages<BR>lvscan=20
  -- ACTIVE&nbsp;&nbsp; Snapshot "/dev/tripserv_vol/infosnap" [4.92 GB] =
of=20
  /dev/tripserv_vol/info<BR>lvscan -- ACTIVE&nbsp;&nbsp; Snapshot=20
  "/dev/tripserv_vol/homessnap" [9.84 GB] of =
/dev/tripserv_vol/homes<BR>lvscan=20
  -- 22 logical volumes with 168.08 GB total in 1 volume group<BR>lvscan =
-- 22=20
  active logical volumes<BR></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2># lvdisplay =
/dev/tripserv_vol/docu<BR>--- Logical=20
  volume ---<BR>LV=20
  =
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
  /dev/tripserv_vol/docu<BR>VG=20
  =
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
  tripserv_vol<BR>LV Write =
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  read/write<BR>LV snapshot status&nbsp;&nbsp;&nbsp;&nbsp; source=20
  =
of<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  /dev/tripserv_vol/docusnap [active]<BR>LV=20
  =
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
  available<BR>LV=20
  =
#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  1<BR>#=20
  =
open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  1<BR>LV=20
  =
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
  512 MB<BR>Current=20
  =
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
  128<BR>Allocated=20
  LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  =
128<BR>Stripes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  4<BR>Stripe size (KByte)&nbsp;&nbsp;&nbsp;=20
  =
4<BR>Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;=20
  next free<BR>Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 120<BR>Block=20
  device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  58:0<BR></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2># lvdisplay =
/dev/tripserv_vol/people<BR>---=20
  Logical volume ---<BR>LV=20
  =
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
  /dev/tripserv_vol/people<BR>VG=20
  =
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
  tripserv_vol<BR>LV Write =
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  read/write<BR>LV=20
  =
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
  available<BR>LV=20
  =
#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  6<BR>#=20
  =
open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  0<BR>LV=20
  =
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
  20 GB<BR>Current=20
  =
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
  5120<BR>Allocated=20
  LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  =
5120<BR>Stripes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  4<BR>Stripe size (KByte)&nbsp;&nbsp;&nbsp;=20
  =
4<BR>Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;=20
  next free<BR>Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 120<BR>Block=20
  device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  58:5</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2># lvdisplay =
/dev/tripserv_vol/pages<BR>---=20
  Logical volume ---<BR>LV=20
  =
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
  /dev/tripserv_vol/pages<BR>VG=20
  =
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
  tripserv_vol<BR>LV Write =
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  read/write<BR>LV snapshot status&nbsp;&nbsp;&nbsp;&nbsp; source=20
  =
of<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  /dev/tripserv_vol/pagessnap [active]<BR>LV=20
  =
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
  available<BR>LV=20
  =
#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  3<BR>#=20
  =
open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  0<BR>LV=20
  =
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
  20 GB<BR>Current=20
  =
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
  5120<BR>Allocated=20
  LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  =
5120<BR>Stripes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  4<BR>Stripe size (KByte)&nbsp;&nbsp;&nbsp;=20
  =
4<BR>Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;=20
  next free<BR>Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 120<BR>Block=20
  device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  58:2<BR></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>tripserv:/# lvdisplay=20
  /dev/tripserv_vol/pagessnap<BR>--- Logical volume ---<BR>LV=20
  =
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
  /dev/tripserv_vol/pagessnap<BR>VG=20
  =
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
  tripserv_vol<BR>LV Write =
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read=20
  only<BR>LV snapshot status&nbsp;&nbsp;&nbsp;&nbsp; active destination =
for=20
  /dev/tripserv_vol/pages<BR>LV=20
  =
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
  available<BR>LV=20
  =
#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  20<BR>#=20
  =
open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  0<BR>LV=20
  =
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
  20 GB<BR>Current=20
  =
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
  5120<BR>Allocated=20
  LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  5120<BR>snapshot chunk size&nbsp;&nbsp;&nbsp; 64 KB<BR>Allocated to=20
  snapshot&nbsp; 0.00% [0/19.69 GB]<BR>Allocated to COW-table 320=20
  =
MB<BR>Stripes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  4<BR>Stripe size (KByte)&nbsp;&nbsp;&nbsp;=20
  =
4<BR>Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;=20
  next free<BR>Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 120<BR>Block=20
  device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  58:19<BR></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2># lvdisplay =
/dev/tripserv_vol/docusnap<BR>---=20
  Logical volume ---<BR>LV=20
  =
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
  /dev/tripserv_vol/docusnap<BR>VG=20
  =
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
  tripserv_vol<BR>LV Write =
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read=20
  only<BR>LV snapshot status&nbsp;&nbsp;&nbsp;&nbsp; active destination =
for=20
  /dev/tripserv_vol/docu<BR>LV=20
  =
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
  available<BR>LV=20
  =
#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  16<BR>#=20
  =
open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  0<BR>LV=20
  =
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;=20
  512 MB<BR>Current=20
  =
LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
  128<BR>Allocated=20
  LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
128<BR>snapshot=20
  chunk size&nbsp;&nbsp;&nbsp; 64 KB<BR>Allocated to snapshot&nbsp; =
0.05% [256=20
  KB/492.19 MB]<BR>Allocated to COW-table 7.81=20
  =
MB<BR>Stripes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  4<BR>Stripe size (KByte)&nbsp;&nbsp;&nbsp;=20
  =
4<BR>Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;=20
  next free<BR>Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; 120<BR>Block=20
  device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
  58:15<BR></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>So it all looks good!</FONT></DIV>
  <DIV><FONT face=3DArial =
size=3D2>&nbsp;</DIV></BLOCKQUOTE></FONT></BODY></HTML>

------=_NextPart_000_00ED_01C25F2B.F7B2AE30--
