Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0NIoeD5013547
	for <linux-lvm@redhat.com>; Fri, 23 Jan 2009 13:50:40 -0500
Received: from sitemail.siteprotect.com (fw.mfg.onr.siteprotect.com
	[64.26.60.152])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n0NIoL96002031
	for <linux-lvm@redhat.com>; Fri, 23 Jan 2009 13:50:21 -0500
MIME-Version: 1.0
Message-ID: <48264.1232736621@minneapolish3.com>
Content-Type: multipart/alternative;
	boundary="=_956e879d06546924afa634b67990e4f7"
Date: Fri, 23 Jan 2009 12:50:21 -0600
Subject: Re: Re: [linux-lvm] LVM Volume Size Question
From: ctd@minneapolish3.com
Reply-To: ctd@minneapolish3.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
Cc: "F-D. Cami" <fcami@winsoft.fr>

--=_956e879d06546924afa634b67990e4f7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

  BODY { font-family:Arial, Helvetica, sans-serif;font-size:12px; }
 Francois,
 Good to know about how to improve performance, but I soon realized
that I do not have another 536GB of free space my other HDDs to backup
before performing those steps. =20
 With that said, I could not backup before resizing the partition.  I
am happy to report, the resizing worked as planned. =20
 Thanks again.
 Mike
 On Fri 09/01/23 11:18 , "F-D. Cami" fcami@winsoft.fr sent:
 Mike,
 df reports filesystem sizes, not block device sizes.
 You now only need to backup and grow the filesystem.
 Yes, what I meant was an improvement in performance at some space
 cost, if all you need is space, don't do it.=20
 And, yes, the 2nd dd should be sdc :)
 Cheers
 F
 On Fri, 23 Jan 2009 12:02:45 -0600
  wrote:
 >   BODY { font-family:Arial, Helvetica, sans-serif;font-size:12px;
 > }Francois,
 >  Here is the output you requested:
 >  mythserver michael # vgdisplay -v vg
 >      Using volume group(s) on command line
 >      Finding volume group "vg"
 >    --- Volume group ---
 >    VG Name               vg
 >    System ID
 >    Format                lvm2
 >    Metadata Areas        4
 >    Metadata Sequence No  10
 >    VG Access             read/write
 >    VG Status             resizable
 >    MAX LV                0
 >    Cur LV                1
 >    Open LV               1
 >    Max PV                0
 >    Cur PV                2
 >    Act PV                2
 >    VG Size               1.59 TB
 >    PE Size               4.00 MB
 >    Total PE              417316
 >    Alloc PE / Size       417024 / 1.59 TB
 >    Free  PE / Size       292 / 1.14 GB
 >    VG UUID               2a2Vzo-3HUx-gUU0-EYk3-md1s-PgAg-MM0bQ6
 >    --- Logical volume ---
 >    LV Name                /dev/vg/myth
 >    VG Name                vg
 >    LV UUID                4Auu9y-47vW-6BBd-Rdd5-PP63-3sYB-lvmNmQ
 >    LV Write Access        read/write
 >    LV Status              available
 >    # open                 1
 >    LV Size                1.59 TB
 >    Current LE             417024
 >    Segments               2
 >    Allocation             inherit
 >    Read ahead sectors     auto
 >    - currently set to     256
 >    Block device           254:0
 >    --- Physical volumes ---
 >    PV Name               /dev/sdc1
 >    PV UUID               DX11mo-r0Eh-jN5N-objS-oqo6-eVSU-MShkS2
 >    PV Status             allocatable
 >    Total PE / Free PE    238466 / 0
 >    PV Name               /dev/sdb1
 >    PV UUID               SetyUA-DkWL-zDDo-W8Om-3avR-nJH8-OnUujv
 >    PV Status             allocatable
 >    Total PE / Free PE    178850 / 292
 >  mythserver michael # lvdisplay /dev/vg/myth
 >    --- Logical volume ---
 >    LV Name                /dev/vg/myth
 >    VG Name                vg
 >    LV UUID                4Auu9y-47vW-6BBd-Rdd5-PP63-3sYB-lvmNmQ
 >    LV Write Access        read/write
 >    LV Status              available
 >    # open                 1
 >    LV Size                1.59 TB
 >    Current LE             417024
 >    Segments               2
 >    Allocation             inherit
 >    Read ahead sectors     auto
 >    - currently set to     256
 >    Block device           254:0
 >  So it does appear that /dev/vg/myth is the full 1.59TB.  Any
reason
 > that it appears that the output of df does not agree with this or
am I
 > confused?
 >  Regarding your recommended steps, I understand that those steps
will
 > not eliminate my reliance on the two drives not failing but the
steps
 > will setup a stripped mapping which can improve performance,
right?
 >  In my situation, the directory mapped to /dev/vg/myth is just
used
 > to store recorded programs from mythtv.  Therefore, the data is
not
 > critical, but the desire is to present a directory that is as big
as
 > possible to allow mythtv to not run out of recording space (I
think
 > 1.6TB should do it!!!).
 >  Also, I assume that the second "dd" command line you wrote should
 > have referenced /dev/sdc and not sdb, correct?
 >  Thanks a ton for your insight.
 >  Take it easy,
 >  Mike
 >  On Fri 09/01/23 10:44 , "F-D. Cami"  sent:
 >  Hi Mike,
 >  Could you give us the output of :
 >  vgdisplay -v vg
 >  lvdisplay /dev/vg/myth
 >  I think your myth LV is already 1.5TB, so you only need to run :
 >  # mount -o remount,resize /dev/vg/myth
 >  for the JFS filesystem to be resized.
 >  Please backup everything before running that :)
 >  However, since what you're doing essentially amounts to RAID0
 > without the
 >  performance benefits (if you lose one drive, your data is lost),
I'd
 > run a full backup
 >  and run the following commands to create a striped LV :
 >  lvremove /dev/vg/myth
 >  vgremove vg
 >  pvremove /dev/sdb1
 >  pvremove /dev/sdc1
 >  dd if=3D/dev/zero of=3D/dev/sdb bs=3D4096 count=3D10000
 >  dd if=3D/dev/zero of=3D/dev/sdb bs=3D4096 count=3D10000
 >  pvcreate /dev/sdb
 >  pvcreate /dev/sdc
 >  vgcreate vg /dev/sdb /dev/sdc
 >  lcreate -i 2 -I 8 -L 1700M -n myth vg /dev/sdb /dev/sdc
 >     (adjust 1700 to whatever your drives will take)
 >  mkfs.jfs /dev/vg/myth
 >  You will lose a bit of space but gain some performance ; the
 > available VG size can
 >  then be used for other LVs or snapshots.
 >  Best,
 >  Francois
 >  On Fri, 23 Jan 2009 11:14:35 -0600
 >   [1] wrote:
 >  > Hey there,
 >  >=20
 >  >=20
 >  >=20
 >  > I have most likely a simple question concerning LVM that I
figured
 > someone might be able to provide some insight into.
 >  >=20
 >  >=20
 >  >=20
 >  > I just setup LVM with both /dev/sdb1 and /dev/sdc1 being
assigned
 > to my =E2=80=9Cvg=E2=80=9D volume group. There is only one logical volum=
e
 > =E2=80=9Cmyth=E2=80=9D off of =E2=80=9Cvg=E2=80=9D.
 >  >=20
 >  >=20
 >  >=20
 >  > My steps:
 >  >=20
 >  > fdisk /dev/sdc [created 1 partition to span the entire drive of
 > type 8e]
 >  > emerge lvm2
 >  > vgscan
 >  > vgchange -a y=20
 >  > pvcreate /dev/sdc1
 >  > vgcreate vg /dev/sdc1
 >  > lvcreate -L900GB -nmyth vg
 >  > mkfs.jfs /dev/vg/myth
 >  > fdisk /dev/sdb [created 1 partition to span the entire drive of
 > type 8e]
 >  > pvcreate /dev/sdb1
 >  > vgextend vg /dev/sdb1
 >  > lvextend -L+700G /dev/vg/myth
 >  >=20
 >  >=20
 >  > Sdb1: 700GB drive with one partition
 >  >=20
 >  > Sdd1: 1TB drive with one partition
 >  >=20
 >  >=20
 >  > My question is related to the space available in /dev/vg/myth.
I
 >  > would assume that I should have ~1.7TB of space on that logical
 >  > partition, but df does not seems to indicate that.=20
 >  >=20
 >  >=20
 >  >  # df
 >  > Filesystem           1K-blocks      Used Available Use% Mounted
on
 >  > =E2=80=A6
 >  > /dev/mapper/vg-myth  943656628 544996248 398660380  58%
/mnt/store
 >  > =E2=80=A6
 >  > mythserver michael # pvdisplay /dev/sdb1
 >  >   --- Physical volume ---
 >  >   PV Name               /dev/sdb1
 >  >   VG Name               vg
 >  >   PV Size               698.64 GB / not usable 2.34 MB
 >  >   Allocatable           yes
 >  >   PE Size (KByte)       4096
 >  >   Total PE              178850
 >  >   Free PE               292
 >  >   Allocated PE          178558
 >  >   PV UUID               SetyUA-DkWL-zDDo-Wm-3avR-nJH8-OnUujv
 >  > mythserver michael # pvdisplay /dev/sdc1
 >  >   --- Physical volume ---
 >  >   PV Name               /dev/sdc1
 >  >   VG Name               vg
 >  >   PV Size               931.51 GB / not usable 3.19 MB
 >  >   Allocatable           yes (but full)
 >  >   PE Size (KByte)       4096
 >  >   Total PE              238466
 >  >   Free PE               0
 >  >   Allocated PE          238466
 >  >   PV UUID               DX11mo-r0Eh-jN5N-objS-oqo6-eVSU-MShkS2
 >  > mythserver michael # lvextend -L+700G /dev/vg/myth
 >  >   Extending logical volume myth to 2.27 TB
 >  >   Insufficient free space: 179200 extents needed, but only 292
 > available
 >  >=20
 >  > I am guessing that I should have run these commands to extend
the
 > logical volume to its desired size:
 >  > vgextend vg /dev/sdb1
 >  > lvextend -L+700G /dev/vg/myth
 >  >=20
 >  > before creating the filesystem with this command which I am
 > guessing locked the size to the 900GB with I used in my setup
steps
 >  > mkfs.jfs /dev/vg/myth
 >  >=20
 >  > =20
 >  > Does that sound like my issue?
 >  >=20
 >  > Any thoughts on how to get out of this situation while ensuring
no
 > loss of my data that currently resides on /dev/mapper/vg-myth?
 >  >=20
 >  >=20
 >  > I am thinking that the following steps should work:
 >  > Copy all of my files on /dev/mapper/vg-myth to other paritions
(I
 >  > assume the call to mkfs.jfs below will delete all the contents
of
 > this
 >  > partition)
 >  > "lvreduce -L-641G /dev/vg/myth" (to get the size matched up
with
 > 931GB + 698GB [ 2.27TB =E2=80=93 931GB =E2=80=93 698GB)
 >  > "mkfs.jfs /dev/vg/myth" (recreate the filesystem now that the
size
 > has been corrected)=20
 >  > remount /dev/vg/myth
 >  > copy back the files
 >  >=20
 >  > Thanks in advance
 >  > Mike=20
 >  >=20
 >  > _______________________________________________
 >  > linux-lvm mailing list
 >  >  [2]
 >  > https://www.redhat.com/mailman/listinfo/linux-lvm
 >  > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
 >  _______________________________________________
 >  linux-lvm mailing list
 >   [3]
 >  https://www.redhat.com/mailman/listinfo/linux-lvm
 >  read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
 > =20
 >=20
 > Links:
 > ------
 > [1]=20
 > [2]=20
 > [3]=20
=20
--=_956e879d06546924afa634b67990e4f7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"

<HTML>
<style> BODY { font-family:Arial, Helvetica, sans-serif;font-size:12px; }</=
style><br>
<span style=3D"color: rgb(102, 102, 102);">Francois</span>,<br>

<br>

Good to know about how to improve performance, but I soon realized that
I do not have another 536GB of free space my other HDDs to backup
before performing those steps.&nbsp; <br>

<br>

With that said, I could not backup before resizing the partition.&nbsp; I a=
m happy to report, the resizing worked as planned.&nbsp; <br>

<br>

Thanks again.<br>

<br>

Mike<br>
 <br>
<br>
<span style=3D"font-weight: bold;">On Fri 09/01/23 11:18 , "F-D. Cami" fcam=
i@winsoft.fr sent:<br>
</span><blockquote style=3D"border-left: 2px solid rgb(245, 245, 245); marg=
in-left: 5px; margin-right: 0px; padding-left: 5px; padding-right: 0px;"><b=
r>

Mike,<br>

<br>

df reports filesystem sizes, not block device sizes.<br>

You now only need to backup and grow the filesystem.<br>

Yes, what I meant was an improvement in performance at some space<br>

cost, if all you need is space, don't do it. <br>

And, yes, the 2nd dd should be sdc :)<br>

<br>

Cheers<br>

<br>

F<br>

<br>

<br>

On Fri, 23 Jan 2009 12:02:45 -0600<br>

<a href=3D"javascript:top.opencompose('ctd@minneapolish3.com','','','')">ct=
d@minneapolish3.com</a> wrote:<br>

<br>

<span style=3D"color: rgb(102, 102, 102);">&gt;   BODY { font-family:Arial,=
 Helvetica, sans-serif;font-size:12px;</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; }Francois,</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  Here is the output you req=
uested:</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  mythserver michael # vgdis=
play -v vg</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;      Using volume group(s) =
on command line</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;      Finding volume group "=
vg"</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    --- Volume group ---</sp=
an><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    VG Name               vg=
</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    System ID</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    Format                lv=
m2</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    Metadata Areas        4<=
/span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    Metadata Sequence No  10=
</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    VG Access             re=
ad/write</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    VG Status             re=
sizable</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    MAX LV                0<=
/span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    Cur LV                1<=
/span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    Open LV               1<=
/span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    Max PV                0<=
/span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    Cur PV                2<=
/span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    Act PV                2<=
/span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    VG Size               1.=
59 TB</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    PE Size               4.=
00 MB</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    Total PE              41=
7316</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    Alloc PE / Size       41=
7024 / 1.59 TB</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    Free  PE / Size       29=
2 / 1.14 GB</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    VG UUID               2a=
2Vzo-3HUx-gUU0-EYk3-md1s-PgAg-MM0bQ6</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    --- Logical volume ---</=
span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    LV Name                /=
dev/vg/myth</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    VG Name                v=
g</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    LV UUID                4=
Auu9y-47vW-6BBd-Rdd5-PP63-3sYB-lvmNmQ</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    LV Write Access        r=
ead/write</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    LV Status              a=
vailable</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    # open                 1=
</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    LV Size                1=
.59 TB</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    Current LE             4=
17024</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    Segments               2=
</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    Allocation             i=
nherit</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    Read ahead sectors     a=
uto</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    - currently set to     2=
56</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    Block device           2=
54:0</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    --- Physical volumes ---=
</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    PV Name               /d=
ev/sdc1</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    PV UUID               DX=
11mo-r0Eh-jN5N-objS-oqo6-eVSU-MShkS2</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    PV Status             al=
locatable</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    Total PE / Free PE    23=
8466 / 0</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    PV Name               /d=
ev/sdb1</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    PV UUID               Se=
tyUA-DkWL-zDDo-W8Om-3avR-nJH8-OnUujv</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    PV Status             al=
locatable</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    Total PE / Free PE    17=
8850 / 292</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  mythserver michael # lvdis=
play /dev/vg/myth</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    --- Logical volume ---</=
span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    LV Name                /=
dev/vg/myth</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    VG Name                v=
g</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    LV UUID                4=
Auu9y-47vW-6BBd-Rdd5-PP63-3sYB-lvmNmQ</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    LV Write Access        r=
ead/write</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    LV Status              a=
vailable</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    # open                 1=
</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    LV Size                1=
.59 TB</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    Current LE             4=
17024</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    Segments               2=
</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    Allocation             i=
nherit</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    Read ahead sectors     a=
uto</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    - currently set to     2=
56</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;    Block device           2=
54:0</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  So it does appear that /de=
v/vg/myth is the full 1.59TB.  Any reason</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; that it appears that the ou=
tput of df does not agree with this or am I</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; confused?</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  Regarding your recommended=
 steps, I understand that those steps will</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; not eliminate my reliance o=
n the two drives not failing but the steps</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; will setup a stripped mappi=
ng which can improve performance, right?</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  In my situation, the direc=
tory mapped to /dev/vg/myth is just used</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; to store recorded programs =
from mythtv.  Therefore, the data is not</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; critical, but the desire is=
 to present a directory that is as big as</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; possible to allow mythtv to=
 not run out of recording space (I think</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; 1.6TB should do it!!!).</sp=
an><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  Also, I assume that the se=
cond "dd" command line you wrote should</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; have referenced /dev/sdc an=
d not sdb, correct?</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  Thanks a ton for your insi=
ght.</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  Take it easy,</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  Mike</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  On Fri 09/01/23 10:44 , "F=
-D. Cami" <a href=3D"javascript:top.opencompose('fcami@winsoft.fr','','',''=
)">fcami@winsoft.fr</a> sent:</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  Hi Mike,</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  Could you give us the outp=
ut of :</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  vgdisplay -v vg</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  lvdisplay /dev/vg/myth</sp=
an><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  I think your myth LV is al=
ready 1.5TB, so you only need to run :</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  # mount -o remount,resize =
/dev/vg/myth</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  for the JFS filesystem to =
be resized.</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  Please backup everything b=
efore running that :)</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  However, since what you're=
 doing essentially amounts to RAID0</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; without the</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  performance benefits (if y=
ou lose one drive, your data is lost), I'd</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; run a full backup</span><br=
>

<span style=3D"color: rgb(102, 102, 102);">&gt;  and run the following comm=
ands to create a striped LV :</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  lvremove /dev/vg/myth</spa=
n><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  vgremove vg</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  pvremove /dev/sdb1</span><=
br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  pvremove /dev/sdc1</span><=
br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  dd if=3D/dev/zero of=3D/de=
v/sdb bs=3D4096 count=3D10000</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  dd if=3D/dev/zero of=3D/de=
v/sdb bs=3D4096 count=3D10000</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  pvcreate /dev/sdb</span><b=
r>

<span style=3D"color: rgb(102, 102, 102);">&gt;  pvcreate /dev/sdc</span><b=
r>

<span style=3D"color: rgb(102, 102, 102);">&gt;  vgcreate vg /dev/sdb /dev/=
sdc</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  lcreate -i 2 -I 8 -L 1700M=
 -n myth vg /dev/sdb /dev/sdc</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;     (adjust 1700 to whateve=
r your drives will take)</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  mkfs.jfs /dev/vg/myth</spa=
n><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  You will lose a bit of spa=
ce but gain some performance ; the</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; available VG size can</span=
><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  then be used for other LVs=
 or snapshots.</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  Best,</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  Francois</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  On Fri, 23 Jan 2009 11:14:=
35 -0600</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  <a href=3D"javascript:top.=
opencompose('ctd@minneapolish3.com','','','')">ctd@minneapolish3.com</a> [1=
] wrote:</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; Hey there,</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; I have most likely a =
simple question concerning LVM that I figured</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; someone might be able to pr=
ovide some insight into.</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; I just setup LVM with=
 both /dev/sdb1 and /dev/sdc1 being assigned</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; to my =E2=80=9Cvg=E2=80=9D =
volume group. There is only one logical volume</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; =E2=80=9Cmyth=E2=80=9D off =
of =E2=80=9Cvg=E2=80=9D.</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; My steps:</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; fdisk /dev/sdc [creat=
ed 1 partition to span the entire drive of</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; type 8e]</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; emerge lvm2</span><br=
>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; vgscan</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; vgchange -a y </span>=
<br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; pvcreate /dev/sdc1</s=
pan><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; vgcreate vg /dev/sdc1=
</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; lvcreate -L900GB -nmy=
th vg</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; mkfs.jfs /dev/vg/myth=
</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; fdisk /dev/sdb [creat=
ed 1 partition to span the entire drive of</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; type 8e]</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; pvcreate /dev/sdb1</s=
pan><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; vgextend vg /dev/sdb1=
</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; lvextend -L+700G /dev=
/vg/myth</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; Sdb1: 700GB drive wit=
h one partition</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; Sdd1: 1TB drive with =
one partition</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; My question is relate=
d to the space available in /dev/vg/myth. I</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; would assume that I s=
hould have ~1.7TB of space on that logical</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; partition, but df doe=
s not seems to indicate that. </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt;  # df</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; Filesystem           =
1K-blocks      Used Available Use% Mounted on</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; =E2=80=A6</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; /dev/mapper/vg-myth  =
943656628 544996248 398660380  58% /mnt/store</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; =E2=80=A6</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; mythserver michael # =
pvdisplay /dev/sdb1</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt;   --- Physical volume=
 ---</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt;   PV Name            =
   /dev/sdb1</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt;   VG Name            =
   vg</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt;   PV Size            =
   698.64 GB / not usable 2.34 MB</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt;   Allocatable        =
   yes</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt;   PE Size (KByte)    =
   4096</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt;   Total PE           =
   178850</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt;   Free PE            =
   292</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt;   Allocated PE       =
   178558</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt;   PV UUID            =
   SetyUA-DkWL-zDDo-Wm-3avR-nJH8-OnUujv</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; mythserver michael # =
pvdisplay /dev/sdc1</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt;   --- Physical volume=
 ---</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt;   PV Name            =
   /dev/sdc1</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt;   VG Name            =
   vg</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt;   PV Size            =
   931.51 GB / not usable 3.19 MB</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt;   Allocatable        =
   yes (but full)</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt;   PE Size (KByte)    =
   4096</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt;   Total PE           =
   238466</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt;   Free PE            =
   0</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt;   Allocated PE       =
   238466</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt;   PV UUID            =
   DX11mo-r0Eh-jN5N-objS-oqo6-eVSU-MShkS2</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; mythserver michael # =
lvextend -L+700G /dev/vg/myth</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt;   Extending logical v=
olume myth to 2.27 TB</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt;   Insufficient free s=
pace: 179200 extents needed, but only 292</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; available</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; I am guessing that I =
should have run these commands to extend the</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; logical volume to its desir=
ed size:</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; vgextend vg /dev/sdb1=
</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; lvextend -L+700G /dev=
/vg/myth</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; before creating the f=
ilesystem with this command which I am</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; guessing locked the size to=
 the 900GB with I used in my setup steps</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; mkfs.jfs /dev/vg/myth=
</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt;  </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; Does that sound like =
my issue?</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; Any thoughts on how t=
o get out of this situation while ensuring no</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; loss of my data that curren=
tly resides on /dev/mapper/vg-myth?</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; I am thinking that th=
e following steps should work:</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; Copy all of my files =
on /dev/mapper/vg-myth to other paritions (I</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; assume the call to mk=
fs.jfs below will delete all the contents of</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; this</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; partition)</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; "lvreduce -L-641G /de=
v/vg/myth" (to get the size matched up with</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; 931GB + 698GB [ 2.27TB =E2=
=80=93 931GB =E2=80=93 698GB)</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; "mkfs.jfs /dev/vg/myt=
h" (recreate the filesystem now that the size</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; has been corrected) </span>=
<br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; remount /dev/vg/myth<=
/span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; copy back the files</=
span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; Thanks in advance</sp=
an><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; Mike </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; _____________________=
__________________________</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; linux-lvm mailing lis=
t</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; <a href=3D"javascript=
:top.opencompose('linux-lvm@redhat.com','','','')">linux-lvm@redhat.com</a>=
 [2]</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; <a target=3D"_blank" =
href=3D"parse.php?redirect=3Dhttps%3A%2F%2Fwww.redhat.com%2Fmailman%2Flisti=
nfo%2Flinux-lvm"><span style=3D"color: red;">https://www.redhat.com/mailman=
/listinfo/linux-lvm</span></a></span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  &gt; read the LVM HOW-TO a=
t <a target=3D"_blank" href=3D"parse.php?redirect=3Dhttp%3A%2F%2Ftldp.org%2=
FHOWTO%2FLVM-HOWTO%2F"><span style=3D"color: red;">http://tldp.org/HOWTO/LV=
M-HOWTO/</span></a></span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  __________________________=
_____________________</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  linux-lvm mailing list</sp=
an><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  <a href=3D"javascript:top.=
opencompose('linux-lvm@redhat.com','','','')">linux-lvm@redhat.com</a> [3]<=
/span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  <a target=3D"_blank" href=
=3D"parse.php?redirect=3Dhttps%3A%2F%2Fwww.redhat.com%2Fmailman%2Flistinfo%=
2Flinux-lvm"><span style=3D"color: red;">https://www.redhat.com/mailman/lis=
tinfo/linux-lvm</span></a></span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  read the LVM HOW-TO at <a =
target=3D"_blank" href=3D"parse.php?redirect=3Dhttp%3A%2F%2Ftldp.org%2FHOWT=
O%2FLVM-HOWTO%2F"><span style=3D"color: red;">http://tldp.org/HOWTO/LVM-HOW=
TO/</span></a></span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; Links:</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; ------</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; [1] <a href=3D"javascript:t=
op.opencompose('ctd@minneapolish3.com','','','')">ctd@minneapolish3.com</a>=
</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; [2] <a href=3D"javascript:t=
op.opencompose('linux-lvm@redhat.com','','','')">linux-lvm@redhat.com</a></=
span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; [3] <a href=3D"javascript:t=
op.opencompose('linux-lvm@redhat.com','','','')">linux-lvm@redhat.com</a></=
span><br>

<br>

</blockquote></HTML>
--=_956e879d06546924afa634b67990e4f7--
