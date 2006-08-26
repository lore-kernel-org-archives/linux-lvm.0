Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7QN3j8G001221
	for <linux-lvm@redhat.com>; Sat, 26 Aug 2006 19:03:45 -0400
Received: from web30305.mail.mud.yahoo.com (web30305.mail.mud.yahoo.com
	[209.191.69.67])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	k7QN3h2J000548
	for <linux-lvm@redhat.com>; Sat, 26 Aug 2006 19:03:43 -0400
Message-ID: <20060826230337.49756.qmail@web30305.mail.mud.yahoo.com>
Date: Sat, 26 Aug 2006 16:03:37 -0700 (PDT)
From: Tom+Dale <tdmyth@yahoo.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1028726450-1156633417=:47663"
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Lost logical volume?
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

--0-1028726450-1156633417=:47663
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Greetings.
  =20
  I am hoping that some LVM experts can help me out.  I have a partial volu=
me group that spans two drives and I would like to recover the logical volu=
me that was on it so that the data is accessible.  The group (VolGroup00) w=
as originally set up spanning part of one drive and all of the other drive =
(both IDE).  The group was entirely applied to a single logical volume (Log=
Vol00) to be mounted as /video.  This was working until I tried to make som=
e changes and I fear that I may have lost the data.  I cannot seem to resol=
ve this problem anywhere else.  I have spent almost two weeks searching for=
 clues and asking for help in other forums, but I do not yet have a solutio=
n.  I hope to provide all of the useful information below.
  =20
  =20
  History
  I am relatively new to linux, having built my own PVR using Fedora and My=
thTV during the last year.  I have relied heavily upon HowTos and guides wr=
itten by other users.  One of the guides that I followed instructed me to s=
et up XFS using LVM which would allow me to span multiple hard disks.  Rece=
ntly, I added a new SATA drive to my MythTV system. The new drive was desig=
nated as /dev/sda.  It appeared to add into the existing volume group witho=
ut any problem, though I did not get it to the point where the space was ac=
cessible. I planned to further research that problem; however, the new hard=
 drive failed before I got that far.  Here=EF=BF=BDs what things looked lik=
e after removing the drive:
  =20
  [root[at]mythserver ~]# pvdisplay=20
Couldn't find device with uuid 'fxlccO-4li0-nmyD-9avZ-Vc60-GGWX-jUhqOv'.=20
Couldn't find device with uuid 'fxlccO-4li0-nmyD-9avZ-Vc60-GGWX-jUhqOv'.=20
--- Physical volume ---=20
PV Name /dev/hda5=20
VG Name VolGroup00=20
PV Size 66.12 GB / not usable 0=20
Allocatable yes (but full)=20
PE Size (KByte) 4096=20
Total PE 16926=20
Free PE 0=20
Allocated PE 16926=20
PV UUID 317l2C-oay1-TWFG-5NTX-XJS3-vLal-Xh5bBL=20

--- Physical volume ---=20
PV Name /dev/hdb=20
VG Name VolGroup00=20
PV Size 298.09 GB / not usable 0=20
Allocatable yes (but full)=20
PE Size (KByte) 4096=20
Total PE 76311=20
Free PE 0=20
Allocated PE 76311=20
PV UUID nfLxS1-0u3t-5Zr9-57iu-1oZe-Bkkd-75SERQ=20

--- Physical volume ---=20
PV Name unknown device=20
VG Name VolGroup00=20
PV Size 232.88 GB / not usable 0=20
Allocatable yes=20
PE Size (KByte) 4096=20
Total PE 59617=20
Free PE 225=20
Allocated PE 59392=20
PV UUID fxlccO-4li0-nmyD-9avZ-Vc60-GGWX-jUhqOv=20

[root[at]mythserver ~]# vgdisplay=20
Couldn't find device with uuid 'fxlccO-4li0-nmyD-9avZ-Vc60-GGWX-jUhqOv'.=20
Couldn't find all physical volumes for volume group VolGroup00.=20
Couldn't find device with uuid 'fxlccO-4li0-nmyD-9avZ-Vc60-GGWX-jUhqOv'.=20
Couldn't find all physical volumes for volume group VolGroup00.=20
Couldn't find device with uuid 'fxlccO-4li0-nmyD-9avZ-Vc60-GGWX-jUhqOv'.=20
Couldn't find all physical volumes for volume group VolGroup00.=20
Couldn't find device with uuid 'fxlccO-4li0-nmyD-9avZ-Vc60-GGWX-jUhqOv'.=20
Couldn't find all physical volumes for volume group VolGroup00.=20
Volume group "VolGroup00" doesn't exist=20

[root[at]mythserver ~]# pvcreate -u fxlccO-4li0-nmyD-9avZ-Vc60-GGWX-jUhqOv =
/dev/sda=20
Device /dev/sda not found.=20

[root[at]mythserver ~]# vgcfgrestore -tnVolGroup00 /dev/VolGroup00=20
Test mode: Metadata will NOT be updated.=20
Couldn't find device with uuid 'fxlccO-4li0-nmyD-9avZ-Vc60-GGWX-jUhqOv'.=20
Couldn't find all physical volumes for volume group VolGroup00.=20
Restore failed.
  =20
  Current Status
  Based on suggestions made elsewhere, I tried to recover the logical volum=
e which was originally on the two functioning drives.  Since the new drive =
failed before I had made the space available to the group, I believed that =
all data should be recoverable if the LVM structure could be put back to th=
e way it was prior to the addition of the SATA drive.  First, I tried "vgre=
duce --removemissing VolGroup00" which seemed to work. Then, I tried "vgcha=
nge -ay --partial VolGroup00" which also appeared to complete successfully.=
  It seems like I was partly successful but I cannot get the logical volume=
 to be recognized.  I tried a few other things shown below, and I have done=
 nothing since.  I=EF=BF=BDm afraid to try to experiment commands that I do=
n=EF=BF=BDt fully understand, and some things don=EF=BF=BDt seem to be work=
ing the way I would expect based upon the LVM HowTo.  Please let me know if=
 you can assist me.  Thanks in advance for any help you can provide!
  =20
  [root[at]mythserver ~]# mount -a=20
mount: special device /dev/VolGroup00/LogVol00 does not exist
  =20
  [root[at]mythserver ~]# vgchange -a y VolGroup00=20
0 logical volume(s) in volume group "VolGroup00" now active=20

[root[at]mythserver ~]# pvdisplay=20
--- Physical volume ---=20
PV Name /dev/hda5=20
VG Name VolGroup00=20
PV Size 66.12 GB / not usable 0=20
Allocatable yes=20
PE Size (KByte) 4096=20
Total PE 16926=20
Free PE 16926=20
Allocated PE 0=20
PV UUID 317l2C-oay1-TWFG-5NTX-XJS3-vLal-Xh5bBL=20

--- Physical volume ---=20
PV Name /dev/hdb=20
VG Name VolGroup00=20
PV Size 298.09 GB / not usable 0=20
Allocatable yes=20
PE Size (KByte) 4096=20
Total PE 76311=20
Free PE 76311=20
Allocated PE 0=20
PV UUID nfLxS1-0u3t-5Zr9-57iu-1oZe-Bkkd-75SERQ=20

[root[at]mythserver ~]# vgscan=20
Reading all physical volumes. This may take a while...=20
Found volume group "VolGroup00" using metadata type lvm2=20

[root[at]mythserver ~]# vgck -vv VolGroup00=20
Setting global/locking_type to 1=20
Setting global/locking_dir to /var/lock/lvm=20
File-based locking enabled.=20
Using volume group(s) on command line=20
Locking /var/lock/lvm/V_VolGroup00 RB=20
Finding volume group "VolGroup00"=20
/dev/sda: No label detected=20
/dev/hda1: No label detected=20
/dev/hda2: No label detected=20
/dev/hda3: No label detected=20
/dev/hda5: lvm2 label detected=20
/dev/hdb: lvm2 label detected=20
/dev/hda5: lvm2 label detected=20
/dev/hdb: lvm2 label detected=20
/dev/hda5: lvm2 label detected=20
/dev/hdb: lvm2 label detected=20
/dev/hda5: lvm2 label detected=20
/dev/hdb: lvm2 label detected=20
Unlocking /var/lock/lvm/V_VolGroup00
  =20
  [root[at]mythserver ~]# lvchange -vvvay /dev/VolGroup00/LogVol00=20
Processing: lvchange -vvvay /dev/VolGroup00/LogVol00=20
O_DIRECT will be used=20
Setting global/locking_type to 1=20
Setting global/locking_dir to /var/lock/lvm=20
File-based locking enabled.=20
Using logical volume(s) on command line=20
Locking /var/lock/lvm/V_VolGroup00 WB=20
Opened /dev/sda RW=20
/dev/sda: block size is 4096 bytes=20
/dev/sda: No label detected=20
Opened /dev/hda1 RW=20
/dev/hda1: block size is 1024 bytes=20
/dev/hda1: No label detected=20
Opened /dev/hda2 RW=20
/dev/hda2: block size is 4096 bytes=20
/dev/hda2: No label detected=20
Opened /dev/hda3 RW=20
/dev/hda3: block size is 4096 bytes=20
/dev/hda3: No label detected=20
Opened /dev/hda5 RW=20
/dev/hda5: block size is 512 bytes=20
/dev/hda5: lvm2 label detected=20
lvmcache: /dev/hda5 now orphaned=20
lvmcache: /dev/hda5 now in VG VolGroup00=20
Opened /dev/hdb RW=20
/dev/hdb: block size is 4096 bytes=20
/dev/hdb: lvm2 label detected=20
lvmcache: /dev/hdb now orphaned=20
lvmcache: /dev/hdb now in VG VolGroup00=20
/dev/hda5: lvm2 label detected=20
/dev/hdb: lvm2 label detected=20
/dev/hda5: lvm2 label detected=20
/dev/hdb: lvm2 label detected=20
Read VolGroup00 metadata (11) from /dev/hda5 at 18944 size 720=20
/dev/hda5: lvm2 label detected=20
/dev/hdb: lvm2 label detected=20
Read VolGroup00 metadata (11) from /dev/hdb at 16896 size 720=20
One or more specified logical volume(s) not found.=20
Unlocking /var/lock/lvm/V_VolGroup00=20
Closed /dev/sda=20
Closed /dev/hda1=20
Closed /dev/hda2=20
Closed /dev/hda3=20
Closed /dev/hda5=20
Closed /dev/hdb=20
[root[at]mythserver ~]# lvscan -vvv=20
Processing: lvscan -vvv=20
O_DIRECT will be used=20
Setting global/locking_type to 1=20
Setting global/locking_dir to /var/lock/lvm=20
File-based locking enabled.=20
Finding all logical volumes=20
Opened /dev/sda RO=20
/dev/sda: block size is 4096 bytes=20
/dev/sda: No label detected=20
Closed /dev/sda=20
Opened /dev/hda1 RO=20
/dev/hda1: block size is 1024 bytes=20
/dev/hda1: No label detected=20
Closed /dev/hda1=20
Opened /dev/hda2 RO=20
/dev/hda2: block size is 4096 bytes=20
/dev/hda2: No label detected=20
Closed /dev/hda2=20
Opened /dev/hda3 RO=20
/dev/hda3: block size is 4096 bytes=20
/dev/hda3: No label detected=20
Closed /dev/hda3=20
Opened /dev/hda5 RO=20
/dev/hda5: block size is 512 bytes=20
/dev/hda5: lvm2 label detected=20
Closed /dev/hda5=20
lvmcache: /dev/hda5 now orphaned=20
Opened /dev/hda5 RO=20
/dev/hda5: block size is 512 bytes=20
Closed /dev/hda5=20
lvmcache: /dev/hda5 now in VG VolGroup00=20
Opened /dev/hdb RO=20
/dev/hdb: block size is 4096 bytes=20
/dev/hdb: lvm2 label detected=20
Closed /dev/hdb=20
lvmcache: /dev/hdb now orphaned=20
Opened /dev/hdb RO=20
/dev/hdb: block size is 4096 bytes=20
Closed /dev/hdb=20
lvmcache: /dev/hdb now in VG VolGroup00=20
Locking /var/lock/lvm/V_VolGroup00 RB=20
Opened /dev/hda5 RO=20
/dev/hda5: block size is 512 bytes=20
/dev/hda5: lvm2 label detected=20
Opened /dev/hdb RO=20
/dev/hdb: block size is 4096 bytes=20
/dev/hdb: lvm2 label detected=20
/dev/hda5: lvm2 label detected=20
/dev/hdb: lvm2 label detected=20
Read VolGroup00 metadata (11) from /dev/hda5 at 18944 size 720=20
/dev/hda5: lvm2 label detected=20
/dev/hdb: lvm2 label detected=20
Read VolGroup00 metadata (11) from /dev/hdb at 16896 size 720=20
Unlocking /var/lock/lvm/V_VolGroup00=20
Closed /dev/hda5=20
Closed /dev/hdb=20
[root[at]mythserver ~]# lvdisplay -vvv=20
Processing: lvdisplay -vvv=20
O_DIRECT will be used=20
Setting global/locking_type to 1=20
Setting global/locking_dir to /var/lock/lvm=20
File-based locking enabled.=20
Finding all logical volumes=20
Opened /dev/sda RO=20
/dev/sda: block size is 4096 bytes=20
/dev/sda: No label detected=20
Closed /dev/sda=20
Opened /dev/hda1 RO=20
/dev/hda1: block size is 1024 bytes=20
/dev/hda1: No label detected=20
Closed /dev/hda1=20
Opened /dev/hda2 RO=20
/dev/hda2: block size is 4096 bytes=20
/dev/hda2: No label detected=20
Closed /dev/hda2=20
Opened /dev/hda3 RO=20
/dev/hda3: block size is 4096 bytes=20
/dev/hda3: No label detected=20
Closed /dev/hda3=20
Opened /dev/hda5 RO=20
/dev/hda5: block size is 512 bytes=20
/dev/hda5: lvm2 label detected=20
Closed /dev/hda5=20
lvmcache: /dev/hda5 now orphaned=20
Opened /dev/hda5 RO=20
/dev/hda5: block size is 512 bytes=20
Closed /dev/hda5=20
lvmcache: /dev/hda5 now in VG VolGroup00=20
Opened /dev/hdb RO=20
/dev/hdb: block size is 4096 bytes=20
/dev/hdb: lvm2 label detected=20
Closed /dev/hdb=20
lvmcache: /dev/hdb now orphaned=20
Opened /dev/hdb RO=20
/dev/hdb: block size is 4096 bytes=20
Closed /dev/hdb=20
lvmcache: /dev/hdb now in VG VolGroup00=20
Locking /var/lock/lvm/V_VolGroup00 RB=20
Opened /dev/hda5 RO=20
/dev/hda5: block size is 512 bytes=20
/dev/hda5: lvm2 label detected=20
Opened /dev/hdb RO=20
/dev/hdb: block size is 4096 bytes=20
/dev/hdb: lvm2 label detected=20
/dev/hda5: lvm2 label detected=20
/dev/hdb: lvm2 label detected=20
Read VolGroup00 metadata (11) from /dev/hda5 at 18944 size 720=20
/dev/hda5: lvm2 label detected=20
/dev/hdb: lvm2 label detected=20
Read VolGroup00 metadata (11) from /dev/hdb at 16896 size 720=20
Unlocking /var/lock/lvm/V_VolGroup00=20
Closed /dev/hda5=20
Closed /dev/hdb
  =20
  =20
  P.S. A full history of my posts on the MythTV mailing list can be viewed =
here:
  http://www.gossamer-threads.com/lists/mythtv/users/218118
  =20
  Thank you, again. :-)
  -Tom-

 	=09
---------------------------------
 All-new Yahoo! Mail - Fire up a more powerful email and get things done fa=
ster.
--0-1028726450-1156633417=:47663
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<DIV class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><SPAN style=3D"COLOR: =
black; FONT-FAMILY: Verdana">Greetings.<?xml:namespace prefix =3D o ns =3D =
"urn:schemas-microsoft-com:office:office" /><o:p></o:p></SPAN></DIV>  <DIV =
class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><SPAN style=3D"COLOR: black=
; FONT-FAMILY: Verdana"><o:p>&nbsp;</o:p></SPAN></DIV>  <DIV class=3DMsoNor=
mal style=3D"MARGIN: 0in 0in 0pt"><SPAN style=3D"COLOR: black; FONT-FAMILY:=
 Verdana">I am hoping that some LVM experts can help me out.<SPAN style=3D"=
mso-spacerun: yes">&nbsp; </SPAN>I have a partial volume group that spans t=
wo drives and I would like to recover the logical volume that was on it so =
that the data is accessible.<SPAN style=3D"mso-spacerun: yes">&nbsp; </SPAN=
>The group (VolGroup00) was originally set up spanning part of one drive an=
d all of the other drive (both IDE).<SPAN style=3D"mso-spacerun: yes">&nbsp=
; </SPAN>The group was entirely applied to a single logical volume (LogVol0=
0) to be mounted as /video.<SPAN
 style=3D"mso-spacerun: yes">&nbsp; </SPAN>This was working until I tried t=
o make some changes and I fear that I may have lost the data.<SPAN style=3D=
"mso-spacerun: yes">&nbsp; </SPAN>I cannot seem to resolve this problem any=
where else. <SPAN style=3D"mso-spacerun: yes">&nbsp;</SPAN>I have spent alm=
ost two weeks searching for clues and asking for help in other forums, but =
I do not yet have a solution.<SPAN style=3D"mso-spacerun: yes">&nbsp; </SPA=
N>I hope to provide all of the useful information below.<o:p></o:p></SPAN><=
/DIV>  <DIV class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><SPAN style=3D"=
COLOR: black; FONT-FAMILY: Verdana"><o:p>&nbsp;</o:p></SPAN></DIV>  <DIV cl=
ass=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><SPAN style=3D"COLOR: black; =
FONT-FAMILY: Verdana"><o:p></o:p></SPAN>&nbsp;</DIV>  <DIV class=3DMsoNorma=
l style=3D"MARGIN: 0in 0in 0pt"><SPAN style=3D"COLOR: black; FONT-FAMILY: V=
erdana"><STRONG>History<o:p></o:p></STRONG></SPAN></DIV>  <DIV class=3DMsoN=
ormal style=3D"MARGIN: 0in 0in 0pt"><SPAN
 style=3D"COLOR: black; FONT-FAMILY: Verdana">I am relatively new to linux,=
 having built my own PVR using Fedora and MythTV during the last year.<SPAN=
 style=3D"mso-spacerun: yes">&nbsp; </SPAN>I have relied heavily upon HowTo=
s and guides written by other users.<SPAN style=3D"mso-spacerun: yes">&nbsp=
; </SPAN>One of the guides that I followed instructed me to set up XFS usin=
g LVM which would allow me to span multiple hard disks.<SPAN style=3D"mso-s=
pacerun: yes">&nbsp; </SPAN>Recently, I added a new SATA drive to my MythTV=
 system. The new drive was designated as /dev/sda. <SPAN style=3D"mso-space=
run: yes">&nbsp;</SPAN>It appeared to add into the existing volume group wi=
thout any problem, though I did not get it to the point where the space was=
 accessible. I planned to further research that problem; however, the new h=
ard drive failed before I got that far. <SPAN style=3D"mso-spacerun: yes">&=
nbsp;</SPAN>Here=EF=BF=BDs what things looked like after removing the drive=
:<o:p></o:p></SPAN></DIV>  <DIV
 class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><SPAN style=3D"COLOR: blac=
k; FONT-FAMILY: Verdana"><o:p>&nbsp;</o:p></SPAN></DIV>  <DIV class=3DMsoNo=
rmal style=3D"MARGIN: 0in 0in 0pt"><SPAN style=3D"COLOR: black; FONT-FAMILY=
: Verdana">[root[at]mythserver ~]# pvdisplay <BR>Couldn't find device with =
uuid 'fxlccO-4li0-nmyD-9avZ-Vc60-GGWX-jUhqOv'. <BR>Couldn't find device wit=
h uuid 'fxlccO-4li0-nmyD-9avZ-Vc60-GGWX-jUhqOv'. <BR>--- Physical volume --=
- <BR>PV Name /dev/hda5 <BR>VG Name VolGroup00 <BR>PV Size 66.12 GB / not u=
sable 0 <BR>Allocatable yes (but full) <BR>PE Size (KByte) 4096 <BR>Total P=
E 16926 <BR>Free PE 0 <BR>Allocated PE 16926 <BR>PV UUID 317l2C-oay1-TWFG-5=
NTX-XJS3-vLal-Xh5bBL <BR><BR>--- Physical volume --- <BR>PV Name /dev/hdb <=
BR>VG Name VolGroup00 <BR>PV Size 298.09 GB / not usable 0 <BR>Allocatable =
yes (but full) <BR>PE Size (KByte) 4096 <BR>Total PE 76311 <BR>Free PE 0 <B=
R>Allocated PE 76311 <BR>PV UUID nfLxS1-0u3t-5Zr9-57iu-1oZe-Bkkd-75SERQ <BR=
><BR>--- Physical volume
 --- <BR>PV Name unknown device <BR>VG Name VolGroup00 <BR>PV Size 232.88 G=
B / not usable 0 <BR>Allocatable yes <BR>PE Size (KByte) 4096 <BR>Total PE =
59617 <BR>Free PE 225 <BR>Allocated PE 59392 <BR>PV UUID fxlccO-4li0-nmyD-9=
avZ-Vc60-GGWX-jUhqOv <BR><BR>[root[at]mythserver ~]# vgdisplay <BR>Couldn't=
 find device with uuid 'fxlccO-4li0-nmyD-9avZ-Vc60-GGWX-jUhqOv'. <BR>Couldn=
't find all physical volumes for volume group VolGroup00. <BR>Couldn't find=
 device with uuid 'fxlccO-4li0-nmyD-9avZ-Vc60-GGWX-jUhqOv'. <BR>Couldn't fi=
nd all physical volumes for volume group VolGroup00. <BR>Couldn't find devi=
ce with uuid 'fxlccO-4li0-nmyD-9avZ-Vc60-GGWX-jUhqOv'. <BR>Couldn't find al=
l physical volumes for volume group VolGroup00. <BR>Couldn't find device wi=
th uuid 'fxlccO-4li0-nmyD-9avZ-Vc60-GGWX-jUhqOv'. <BR>Couldn't find all phy=
sical volumes for volume group VolGroup00. <BR>Volume group "VolGroup00" do=
esn't exist <BR><BR>[root[at]mythserver ~]# pvcreate -u
 fxlccO-4li0-nmyD-9avZ-Vc60-GGWX-jUhqOv /dev/sda <BR>Device /dev/sda not fo=
und. <BR><BR>[root[at]mythserver ~]# vgcfgrestore -tnVolGroup00 /dev/VolGro=
up00 <BR>Test mode: Metadata will NOT be updated. <BR>Couldn't find device =
with uuid 'fxlccO-4li0-nmyD-9avZ-Vc60-GGWX-jUhqOv'. <BR>Couldn't find all p=
hysical volumes for volume group VolGroup00. <BR>Restore failed.<o:p></o:p>=
</SPAN></DIV>  <DIV class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><SPAN s=
tyle=3D"COLOR: black; FONT-FAMILY: Verdana"><o:p>&nbsp;</o:p></SPAN></DIV> =
 <DIV class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><SPAN style=3D"COLOR:=
 black; FONT-FAMILY: Verdana"><STRONG>Current Status<o:p></o:p></STRONG></S=
PAN></DIV>  <DIV class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><SPAN styl=
e=3D"COLOR: black; FONT-FAMILY: Verdana">Based on suggestions made elsewher=
e, I tried to recover the logical volume which was originally on the two fu=
nctioning drives.<SPAN style=3D"mso-spacerun: yes">&nbsp; </SPAN>Since the =
new drive failed before I had
 made the space available to the group, I believed that all data should be =
recoverable if the LVM structure could be put back to the way it was prior =
to the addition of the SATA drive.<SPAN style=3D"mso-spacerun: yes">&nbsp; =
</SPAN>First, I tried "vgreduce --removemissing VolGroup00" which seemed to=
 work. Then, I tried "vgchange -ay --partial VolGroup00" which also appeare=
d to complete successfully.<SPAN style=3D"mso-spacerun: yes">&nbsp; </SPAN>=
It seems like I was partly successful but I cannot get the logical volume t=
o be recognized.<SPAN style=3D"mso-spacerun: yes">&nbsp; </SPAN>I tried a f=
ew other things shown below, and I have done nothing since.<SPAN style=3D"m=
so-spacerun: yes">&nbsp; </SPAN>I=EF=BF=BDm afraid to try to experiment com=
mands that I don=EF=BF=BDt fully understand, and some things don=EF=BF=BDt =
seem to be working the way I would expect based upon the LVM HowTo.<SPAN st=
yle=3D"mso-spacerun: yes">&nbsp; </SPAN>Please let me know if you can assis=
t me.<SPAN style=3D"mso-spacerun: yes">&nbsp;
 </SPAN><U>Thanks in advance for any help you can provide!<o:p></o:p></U></=
SPAN></DIV>  <DIV class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><SPAN sty=
le=3D"COLOR: black; FONT-FAMILY: Verdana"><o:p>&nbsp;</o:p></SPAN></DIV>  <=
DIV class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><SPAN style=3D"COLOR: b=
lack; FONT-FAMILY: Verdana">[root[at]mythserver ~]# mount -a <BR>mount: spe=
cial device /dev/VolGroup00/LogVol00 does not exist<o:p></o:p></SPAN></DIV>=
  <DIV class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><SPAN style=3D"COLOR=
: black; FONT-FAMILY: Verdana"><o:p>&nbsp;</o:p></SPAN></DIV>  <DIV class=
=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><SPAN style=3D"COLOR: black; FON=
T-FAMILY: Verdana">[root[at]mythserver ~]# vgchange -a y VolGroup00 <BR>0 l=
ogical volume(s) in volume group "VolGroup00" now active <BR><BR>[root[at]m=
ythserver ~]# pvdisplay <BR>--- Physical volume --- <BR>PV Name /dev/hda5 <=
BR>VG Name VolGroup00 <BR>PV Size 66.12 GB / not usable 0 <BR>Allocatable y=
es <BR>PE Size (KByte) 4096 <BR>Total
 PE 16926 <BR>Free PE 16926 <BR>Allocated PE 0 <BR>PV UUID 317l2C-oay1-TWFG=
-5NTX-XJS3-vLal-Xh5bBL <BR><BR>--- Physical volume --- <BR>PV Name /dev/hdb=
 <BR>VG Name VolGroup00 <BR>PV Size 298.09 GB / not usable 0 <BR>Allocatabl=
e yes <BR>PE Size (KByte) 4096 <BR>Total PE 76311 <BR>Free PE 76311 <BR>All=
ocated PE 0 <BR>PV UUID nfLxS1-0u3t-5Zr9-57iu-1oZe-Bkkd-75SERQ <BR><BR>[roo=
t[at]mythserver ~]# vgscan <BR>Reading all physical volumes. This may take =
a while... <BR>Found volume group "VolGroup00" using metadata type lvm2 <BR=
><BR>[root[at]mythserver ~]# vgck -vv VolGroup00 <BR>Setting global/locking=
_type to 1 <BR>Setting global/locking_dir to /var/lock/lvm <BR>File-based l=
ocking enabled. <BR>Using volume group(s) on command line <BR>Locking /var/=
lock/lvm/V_VolGroup00 RB <BR>Finding volume group "VolGroup00" <BR>/dev/sda=
: No label detected <BR>/dev/hda1: No label detected <BR>/dev/hda2: No labe=
l detected <BR>/dev/hda3: No label detected <BR>/dev/hda5: lvm2 label detec=
ted
 <BR>/dev/hdb: lvm2 label detected <BR>/dev/hda5: lvm2 label detected <BR>/=
dev/hdb: lvm2 label detected <BR>/dev/hda5: lvm2 label detected <BR>/dev/hd=
b: lvm2 label detected <BR>/dev/hda5: lvm2 label detected <BR>/dev/hdb: lvm=
2 label detected <BR>Unlocking /var/lock/lvm/V_VolGroup00<o:p></o:p></SPAN>=
</DIV>  <DIV class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><SPAN style=3D=
"COLOR: black; FONT-FAMILY: Verdana"><o:p>&nbsp;</o:p></SPAN></DIV>  <DIV c=
lass=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><SPAN style=3D"COLOR: black;=
 FONT-FAMILY: Verdana">[root[at]mythserver ~]# lvchange -vvvay /dev/VolGrou=
p00/LogVol00 <BR>Processing: lvchange -vvvay /dev/VolGroup00/LogVol00 <BR>O=
_DIRECT will be used <BR>Setting global/locking_type to 1 <BR>Setting globa=
l/locking_dir to /var/lock/lvm <BR>File-based locking enabled. <BR>Using lo=
gical volume(s) on command line <BR>Locking /var/lock/lvm/V_VolGroup00 WB <=
BR>Opened /dev/sda RW <BR>/dev/sda: block size is 4096 bytes <BR>/dev/sda: =
No label detected
 <BR>Opened /dev/hda1 RW <BR>/dev/hda1: block size is 1024 bytes <BR>/dev/h=
da1: No label detected <BR>Opened /dev/hda2 RW <BR>/dev/hda2: block size is=
 4096 bytes <BR>/dev/hda2: No label detected <BR>Opened /dev/hda3 RW <BR>/d=
ev/hda3: block size is 4096 bytes <BR>/dev/hda3: No label detected <BR>Open=
ed /dev/hda5 RW <BR>/dev/hda5: block size is 512 bytes <BR>/dev/hda5: lvm2 =
label detected <BR>lvmcache: /dev/hda5 now orphaned <BR>lvmcache: /dev/hda5=
 now in VG VolGroup00 <BR>Opened /dev/hdb RW <BR>/dev/hdb: block size is 40=
96 bytes <BR>/dev/hdb: lvm2 label detected <BR>lvmcache: /dev/hdb now orpha=
ned <BR>lvmcache: /dev/hdb now in VG VolGroup00 <BR>/dev/hda5: lvm2 label d=
etected <BR>/dev/hdb: lvm2 label detected <BR>/dev/hda5: lvm2 label detecte=
d <BR>/dev/hdb: lvm2 label detected <BR>Read VolGroup00 metadata (11) from =
/dev/hda5 at 18944 size 720 <BR>/dev/hda5: lvm2 label detected <BR>/dev/hdb=
: lvm2 label detected <BR>Read VolGroup00 metadata (11) from /dev/hdb at 16=
896 size 720
 <BR>One or more specified logical volume(s) not found. <BR>Unlocking /var/=
lock/lvm/V_VolGroup00 <BR>Closed /dev/sda <BR>Closed /dev/hda1 <BR>Closed /=
dev/hda2 <BR>Closed /dev/hda3 <BR>Closed /dev/hda5 <BR>Closed /dev/hdb <BR>=
[root[at]mythserver ~]# lvscan -vvv <BR>Processing: lvscan -vvv <BR>O_DIREC=
T will be used <BR>Setting global/locking_type to 1 <BR>Setting global/lock=
ing_dir to /var/lock/lvm <BR>File-based locking enabled. <BR>Finding all lo=
gical volumes <BR>Opened /dev/sda RO <BR>/dev/sda: block size is 4096 bytes=
 <BR>/dev/sda: No label detected <BR>Closed /dev/sda <BR>Opened /dev/hda1 R=
O <BR>/dev/hda1: block size is 1024 bytes <BR>/dev/hda1: No label detected =
<BR>Closed /dev/hda1 <BR>Opened /dev/hda2 RO <BR>/dev/hda2: block size is 4=
096 bytes <BR>/dev/hda2: No label detected <BR>Closed /dev/hda2 <BR>Opened =
/dev/hda3 RO <BR>/dev/hda3: block size is 4096 bytes <BR>/dev/hda3: No labe=
l detected <BR>Closed /dev/hda3 <BR>Opened /dev/hda5 RO <BR>/dev/hda5: bloc=
k size is 512
 bytes <BR>/dev/hda5: lvm2 label detected <BR>Closed /dev/hda5 <BR>lvmcache=
: /dev/hda5 now orphaned <BR>Opened /dev/hda5 RO <BR>/dev/hda5: block size =
is 512 bytes <BR>Closed /dev/hda5 <BR>lvmcache: /dev/hda5 now in VG VolGrou=
p00 <BR>Opened /dev/hdb RO <BR>/dev/hdb: block size is 4096 bytes <BR>/dev/=
hdb: lvm2 label detected <BR>Closed /dev/hdb <BR>lvmcache: /dev/hdb now orp=
haned <BR>Opened /dev/hdb RO <BR>/dev/hdb: block size is 4096 bytes <BR>Clo=
sed /dev/hdb <BR>lvmcache: /dev/hdb now in VG VolGroup00 <BR>Locking /var/l=
ock/lvm/V_VolGroup00 RB <BR>Opened /dev/hda5 RO <BR>/dev/hda5: block size i=
s 512 bytes <BR>/dev/hda5: lvm2 label detected <BR>Opened /dev/hdb RO <BR>/=
dev/hdb: block size is 4096 bytes <BR>/dev/hdb: lvm2 label detected <BR>/de=
v/hda5: lvm2 label detected <BR>/dev/hdb: lvm2 label detected <BR>Read VolG=
roup00 metadata (11) from /dev/hda5 at 18944 size 720 <BR>/dev/hda5: lvm2 l=
abel detected <BR>/dev/hdb: lvm2 label detected <BR>Read VolGroup00 metadat=
a (11) from
 /dev/hdb at 16896 size 720 <BR>Unlocking /var/lock/lvm/V_VolGroup00 <BR>Cl=
osed /dev/hda5 <BR>Closed /dev/hdb <BR>[root[at]mythserver ~]# lvdisplay -v=
vv <BR>Processing: lvdisplay -vvv <BR>O_DIRECT will be used <BR>Setting glo=
bal/locking_type to 1 <BR>Setting global/locking_dir to /var/lock/lvm <BR>F=
ile-based locking enabled. <BR>Finding all logical volumes <BR>Opened /dev/=
sda RO <BR>/dev/sda: block size is 4096 bytes <BR>/dev/sda: No label detect=
ed <BR>Closed /dev/sda <BR>Opened /dev/hda1 RO <BR>/dev/hda1: block size is=
 1024 bytes <BR>/dev/hda1: No label detected <BR>Closed /dev/hda1 <BR>Opene=
d /dev/hda2 RO <BR>/dev/hda2: block size is 4096 bytes <BR>/dev/hda2: No la=
bel detected <BR>Closed /dev/hda2 <BR>Opened /dev/hda3 RO <BR>/dev/hda3: bl=
ock size is 4096 bytes <BR>/dev/hda3: No label detected <BR>Closed /dev/hda=
3 <BR>Opened /dev/hda5 RO <BR>/dev/hda5: block size is 512 bytes <BR>/dev/h=
da5: lvm2 label detected <BR>Closed /dev/hda5 <BR>lvmcache: /dev/hda5 now o=
rphaned
 <BR>Opened /dev/hda5 RO <BR>/dev/hda5: block size is 512 bytes <BR>Closed =
/dev/hda5 <BR>lvmcache: /dev/hda5 now in VG VolGroup00 <BR>Opened /dev/hdb =
RO <BR>/dev/hdb: block size is 4096 bytes <BR>/dev/hdb: lvm2 label detected=
 <BR>Closed /dev/hdb <BR>lvmcache: /dev/hdb now orphaned <BR>Opened /dev/hd=
b RO <BR>/dev/hdb: block size is 4096 bytes <BR>Closed /dev/hdb <BR>lvmcach=
e: /dev/hdb now in VG VolGroup00 <BR>Locking /var/lock/lvm/V_VolGroup00 RB =
<BR>Opened /dev/hda5 RO <BR>/dev/hda5: block size is 512 bytes <BR>/dev/hda=
5: lvm2 label detected <BR>Opened /dev/hdb RO <BR>/dev/hdb: block size is 4=
096 bytes <BR>/dev/hdb: lvm2 label detected <BR>/dev/hda5: lvm2 label detec=
ted <BR>/dev/hdb: lvm2 label detected <BR>Read VolGroup00 metadata (11) fro=
m /dev/hda5 at 18944 size 720 <BR>/dev/hda5: lvm2 label detected <BR>/dev/h=
db: lvm2 label detected <BR>Read VolGroup00 metadata (11) from /dev/hdb at =
16896 size 720 <BR>Unlocking /var/lock/lvm/V_VolGroup00 <BR>Closed /dev/hda=
5 <BR>Closed
 /dev/hdb<o:p></o:p></SPAN></DIV>  <DIV class=3DMsoNormal style=3D"MARGIN: =
0in 0in 0pt"><SPAN style=3D"COLOR: black; FONT-FAMILY: Verdana"><o:p>&nbsp;=
</o:p></SPAN></DIV>  <DIV class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><=
SPAN style=3D"COLOR: black; FONT-FAMILY: Verdana"><o:p>&nbsp;</o:p></SPAN><=
/DIV>  <DIV class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt">P.S. A full his=
tory of my posts on the MythTV mailing list can be viewed here:</DIV>  <DIV=
 class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><A href=3D"http://www.goss=
amer-threads.com/lists/mythtv/users/218118">http://www.gossamer-threads.com=
/lists/mythtv/users/218118</A></DIV>  <DIV class=3DMsoNormal style=3D"MARGI=
N: 0in 0in 0pt"><o:p>&nbsp;</o:p></DIV>  <DIV class=3DMsoNormal style=3D"MA=
RGIN: 0in 0in 0pt">Thank you, again. :-)</DIV>  <DIV class=3DMsoNormal styl=
e=3D"MARGIN: 0in 0in 0pt">-Tom-<o:p></o:p></DIV><p>&#32;
		<hr size=3D1><a href=3D"http://us.rd.yahoo.com/evt=3D43256/*http://advisi=
on.webevents.yahoo.com/mailbeta"> All-new Yahoo! Mail </a>- Fire up a more =
powerful email and get things done faster.
--0-1028726450-1156633417=:47663--
