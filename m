Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0NI3Mjw020857
	for <linux-lvm@redhat.com>; Fri, 23 Jan 2009 13:03:22 -0500
Received: from sitemail.siteprotect.com (fw.mfg.onr.siteprotect.com
	[64.26.60.152])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n0NI2kpA006402
	for <linux-lvm@redhat.com>; Fri, 23 Jan 2009 13:02:46 -0500
Received: from localhost (localhost [127.0.0.1])
	by app00.sm.onr.chicago.hostway (Postfix) with ESMTP id D3712D0C106
	for <linux-lvm@redhat.com>; Fri, 23 Jan 2009 12:02:45 -0600 (CST)
MIME-Version: 1.0
Message-ID: <34915.1232733765@minneapolish3.com>
Content-Type: multipart/alternative;
	boundary="=_704b74cc3bea3aa180682cf180601ad1"
Date: Fri, 23 Jan 2009 12:02:45 -0600
Subject: Re: [linux-lvm] LVM Volume Size Question
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--=_704b74cc3bea3aa180682cf180601ad1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

  BODY { font-family:Arial, Helvetica, sans-serif;font-size:12px;
}Francois,
 Here is the output you requested:
 mythserver michael # vgdisplay -v vg
     Using volume group(s) on command line
     Finding volume group "vg"
   --- Volume group ---
   VG Name               vg
   System ID
   Format                lvm2
   Metadata Areas        4
   Metadata Sequence No  10
   VG Access             read/write
   VG Status             resizable
   MAX LV                0
   Cur LV                1
   Open LV               1
   Max PV                0
   Cur PV                2
   Act PV                2
   VG Size               1.59 TB
   PE Size               4.00 MB
   Total PE              417316
   Alloc PE / Size       417024 / 1.59 TB
   Free  PE / Size       292 / 1.14 GB
   VG UUID               2a2Vzo-3HUx-gUU0-EYk3-md1s-PgAg-MM0bQ6
   --- Logical volume ---
   LV Name                /dev/vg/myth
   VG Name                vg
   LV UUID                4Auu9y-47vW-6BBd-Rdd5-PP63-3sYB-lvmNmQ
   LV Write Access        read/write
   LV Status              available
   # open                 1
   LV Size                1.59 TB
   Current LE             417024
   Segments               2
   Allocation             inherit
   Read ahead sectors     auto
   - currently set to     256
   Block device           254:0
   --- Physical volumes ---
   PV Name               /dev/sdc1
   PV UUID               DX11mo-r0Eh-jN5N-objS-oqo6-eVSU-MShkS2
   PV Status             allocatable
   Total PE / Free PE    238466 / 0
   PV Name               /dev/sdb1
   PV UUID               SetyUA-DkWL-zDDo-W8Om-3avR-nJH8-OnUujv
   PV Status             allocatable
   Total PE / Free PE    178850 / 292
 mythserver michael # lvdisplay /dev/vg/myth
   --- Logical volume ---
   LV Name                /dev/vg/myth
   VG Name                vg
   LV UUID                4Auu9y-47vW-6BBd-Rdd5-PP63-3sYB-lvmNmQ
   LV Write Access        read/write
   LV Status              available
   # open                 1
   LV Size                1.59 TB
   Current LE             417024
   Segments               2
   Allocation             inherit
   Read ahead sectors     auto
   - currently set to     256
   Block device           254:0
 So it does appear that /dev/vg/myth is the full 1.59TB.  Any reason
that it appears that the output of df does not agree with this or am I
confused?
 Regarding your recommended steps, I understand that those steps will
not eliminate my reliance on the two drives not failing but the steps
will setup a stripped mapping which can improve performance, right?
 In my situation, the directory mapped to /dev/vg/myth is just used
to store recorded programs from mythtv.  Therefore, the data is not
critical, but the desire is to present a directory that is as big as
possible to allow mythtv to not run out of recording space (I think
1.6TB should do it!!!).
 Also, I assume that the second "dd" command line you wrote should
have referenced /dev/sdc and not sdb, correct?
 Thanks a ton for your insight.
 Take it easy,
 Mike
 On Fri 09/01/23 10:44 , "F-D. Cami" fcami@winsoft.fr sent:
 Hi Mike,
 Could you give us the output of :
 vgdisplay -v vg
 lvdisplay /dev/vg/myth
 I think your myth LV is already 1.5TB, so you only need to run :
 # mount -o remount,resize /dev/vg/myth
 for the JFS filesystem to be resized.
 Please backup everything before running that :)
 However, since what you're doing essentially amounts to RAID0
without the
 performance benefits (if you lose one drive, your data is lost), I'd
run a full backup
 and run the following commands to create a striped LV :
 lvremove /dev/vg/myth
 vgremove vg
 pvremove /dev/sdb1
 pvremove /dev/sdc1
 dd if=3D/dev/zero of=3D/dev/sdb bs=3D4096 count=3D10000
 dd if=3D/dev/zero of=3D/dev/sdb bs=3D4096 count=3D10000
 pvcreate /dev/sdb
 pvcreate /dev/sdc
 vgcreate vg /dev/sdb /dev/sdc
 lcreate -i 2 -I 8 -L 1700M -n myth vg /dev/sdb /dev/sdc
    (adjust 1700 to whatever your drives will take)
 mkfs.jfs /dev/vg/myth
 You will lose a bit of space but gain some performance ; the
available VG size can
 then be used for other LVs or snapshots.
 Best,
 Francois
 On Fri, 23 Jan 2009 11:14:35 -0600
 ctd@minneapolish3.com [1] wrote:
 > Hey there,
 >=20
 >=20
 >=20
 > I have most likely a simple question concerning LVM that I figured
someone might be able to provide some insight into.
 >=20
 >=20
 >=20
 > I just setup LVM with both /dev/sdb1 and /dev/sdc1 being assigned
to my =E2=80=9Cvg=E2=80=9D volume group. There is only one logical volume
=E2=80=9Cmyth=E2=80=9D off of =E2=80=9Cvg=E2=80=9D.
 >=20
 >=20
 >=20
 > My steps:
 >=20
 > fdisk /dev/sdc [created 1 partition to span the entire drive of
type 8e]
 > emerge lvm2
 > vgscan
 > vgchange -a y=20
 > pvcreate /dev/sdc1
 > vgcreate vg /dev/sdc1
 > lvcreate -L900GB -nmyth vg
 > mkfs.jfs /dev/vg/myth
 > fdisk /dev/sdb [created 1 partition to span the entire drive of
type 8e]
 > pvcreate /dev/sdb1
 > vgextend vg /dev/sdb1
 > lvextend -L+700G /dev/vg/myth
 >=20
 >=20
 > Sdb1: 700GB drive with one partition
 >=20
 > Sdd1: 1TB drive with one partition
 >=20
 >=20
 > My question is related to the space available in /dev/vg/myth. I
 > would assume that I should have ~1.7TB of space on that logical
 > partition, but df does not seems to indicate that.=20
 >=20
 >=20
 >  # df
 > Filesystem           1K-blocks      Used Available Use% Mounted on
 > =E2=80=A6
 > /dev/mapper/vg-myth  943656628 544996248 398660380  58% /mnt/store
 > =E2=80=A6
 > mythserver michael # pvdisplay /dev/sdb1
 >   --- Physical volume ---
 >   PV Name               /dev/sdb1
 >   VG Name               vg
 >   PV Size               698.64 GB / not usable 2.34 MB
 >   Allocatable           yes
 >   PE Size (KByte)       4096
 >   Total PE              178850
 >   Free PE               292
 >   Allocated PE          178558
 >   PV UUID               SetyUA-DkWL-zDDo-Wm-3avR-nJH8-OnUujv
 > mythserver michael # pvdisplay /dev/sdc1
 >   --- Physical volume ---
 >   PV Name               /dev/sdc1
 >   VG Name               vg
 >   PV Size               931.51 GB / not usable 3.19 MB
 >   Allocatable           yes (but full)
 >   PE Size (KByte)       4096
 >   Total PE              238466
 >   Free PE               0
 >   Allocated PE          238466
 >   PV UUID               DX11mo-r0Eh-jN5N-objS-oqo6-eVSU-MShkS2
 > mythserver michael # lvextend -L+700G /dev/vg/myth
 >   Extending logical volume myth to 2.27 TB
 >   Insufficient free space: 179200 extents needed, but only 292
available
 >=20
 > I am guessing that I should have run these commands to extend the
logical volume to its desired size:
 > vgextend vg /dev/sdb1
 > lvextend -L+700G /dev/vg/myth
 >=20
 > before creating the filesystem with this command which I am
guessing locked the size to the 900GB with I used in my setup steps
 > mkfs.jfs /dev/vg/myth
 >=20
 > =20
 > Does that sound like my issue?
 >=20
 > Any thoughts on how to get out of this situation while ensuring no
loss of my data that currently resides on /dev/mapper/vg-myth?
 >=20
 >=20
 > I am thinking that the following steps should work:
 > Copy all of my files on /dev/mapper/vg-myth to other paritions (I
 > assume the call to mkfs.jfs below will delete all the contents of
this
 > partition)
 > "lvreduce -L-641G /dev/vg/myth" (to get the size matched up with
931GB + 698GB [ 2.27TB =E2=80=93 931GB =E2=80=93 698GB)
 > "mkfs.jfs /dev/vg/myth" (recreate the filesystem now that the size
has been corrected)=20
 > remount /dev/vg/myth
 > copy back the files
 >=20
 > Thanks in advance
 > Mike=20
 >=20
 > _______________________________________________
 > linux-lvm mailing list
 > linux-lvm@redhat.com [2]
 > https://www.redhat.com/mailman/listinfo/linux-lvm
 > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
 _______________________________________________
 linux-lvm mailing list
 linux-lvm@redhat.com [3]
 https://www.redhat.com/mailman/listinfo/linux-lvm
 read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
=20

Links:
------
[1] mailto:ctd@minneapolish3.com
[2] mailto:linux-lvm@redhat.com
[3] mailto:linux-lvm@redhat.com

--=_704b74cc3bea3aa180682cf180601ad1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"

<HTML>
<style> BODY { font-family:Arial, Helvetica, sans-serif;font-size:12px; }</=
style>Francois,<br>
<br>
Here is the output you requested:<br>
mythserver michael # vgdisplay -v vg<br>
&nbsp;&nbsp;&nbsp; Using volume group(s) on command line<br>
&nbsp;&nbsp;&nbsp; Finding volume group "vg"<br>
&nbsp; --- Volume group ---<br>
&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; vg<br>
&nbsp; System ID<br>
&nbsp; Format&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; lvm2<br>
&nbsp; Metadata Areas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4<br>
&nbsp; Metadata Sequence No&nbsp; 10<br>
&nbsp; VG Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; read/write<br>
&nbsp; VG Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; resizable<br>
&nbsp; MAX LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
&nbsp; Cur LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<br>
&nbsp; Open LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 1<br>
&nbsp; Max PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
&nbsp; Cur PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; 2<br>
&nbsp; Act PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; 2<br>
&nbsp; VG Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 1.59 TB<br>
&nbsp; PE Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 4.00 MB<br>
&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; 417316<br>
&nbsp; Alloc PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 417024 / 1.59 TB=
<br>
&nbsp; Free&nbsp; PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 292 / 1.14 =
GB<br>
&nbsp; VG UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 2a2Vzo-3HUx-gUU0-EYk3-md1s-PgAg-MM0bQ6<br>
<br>
&nbsp; --- Logical volume ---<br>
&nbsp; LV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/vg/myth<br>
&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vg<br>
&nbsp; LV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4Auu9y-47vW-6BBd-Rdd5-PP63-3sYB-lvmNmQ<br>
&nbsp; LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write=
<br>
&nbsp; LV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; available<br>
&nbsp; # open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<br>
&nbsp; LV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.59 TB<br>
&nbsp; Current LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; 417024<br>
&nbsp; Segments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; 2<br>
&nbsp; Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; inherit<br>
&nbsp; Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; auto<br>
&nbsp; - currently set to&nbsp;&nbsp;&nbsp;&nbsp; 256<br>
&nbsp; Block device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 254:0<br>
<br>
&nbsp; --- Physical volumes ---<br>
&nbsp; PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; /dev/sdc1<br>
&nbsp; PV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; DX11mo-r0Eh-jN5N-objS-oqo6-eVSU-MShkS2<br>
&nbsp; PV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; allocatable<br>
&nbsp; Total PE / Free PE&nbsp;&nbsp;&nbsp; 238466 / 0<br>
<br>
&nbsp; PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; /dev/sdb1<br>
&nbsp; PV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; SetyUA-DkWL-zDDo-W8Om-3avR-nJH8-OnUujv<br>
&nbsp; PV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; allocatable<br>
&nbsp; Total PE / Free PE&nbsp;&nbsp;&nbsp; 178850 / 292<br>
<br>
mythserver michael # lvdisplay /dev/vg/myth<br>
&nbsp; --- Logical volume ---<br>
&nbsp; LV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/vg/myth<br>
&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vg<br>
&nbsp; LV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4Auu9y-47vW-6BBd-Rdd5-PP63-3sYB-lvmNmQ<br>
&nbsp; LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; read/write=
<br>
&nbsp; LV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; available<br>
&nbsp; # open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<br>
&nbsp; LV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.59 TB<br>
&nbsp; Current LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; 417024<br>
&nbsp; Segments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; 2<br>
&nbsp; Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; inherit<br>
&nbsp; Read ahead sectors&nbsp;&nbsp;&nbsp;&nbsp; auto<br>
&nbsp; - currently set to&nbsp;&nbsp;&nbsp;&nbsp; 256<br>
&nbsp; Block device&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 254:0<br>
<br>
<br>
So it does appear that /dev/vg/myth is the full 1.59TB.&nbsp; Any reason th=
at it appears that the output of df does not agree with this or am I confus=
ed?<br>
<br>
Regarding your recommended steps, I understand that those steps will not el=
iminate my reliance on the two drives not failing but the steps will setup =
a stripped mapping which can improve performance, right?<br>
<br>
In my situation, the directory mapped to /dev/vg/myth is just used to store=
 recorded programs from mythtv.&nbsp; Therefore, the data is not critical, =
but the desire is to present a directory that is as big as possible to allo=
w mythtv to not run out of recording space (I think 1.6TB should do it!!!).=
<br>
<br>
Also, I assume that the second "dd" command line you wrote should have refe=
renced /dev/sdc and not sdb, correct?<br>
<br>
Thanks a ton for your insight.<br>
<br>
Take it easy,<br>
Mike<br>
<br>
<br>
 <br>
<br>
<span style=3D"font-weight: bold;">On Fri 09/01/23 10:44 , "F-D. Cami" fcam=
i@winsoft.fr sent:<br>
</span><blockquote style=3D"border-left: 2px solid rgb(245, 245, 245); marg=
in-left: 5px; margin-right: 0px; padding-left: 5px; padding-right: 0px;"><b=
r>

Hi Mike,<br>

<br>

Could you give us the output of :<br>

<br>

vgdisplay -v vg<br>

lvdisplay /dev/vg/myth<br>

<br>

I think your myth LV is already 1.5TB, so you only need to run :<br>

# mount -o remount,resize /dev/vg/myth<br>

for the JFS filesystem to be resized.<br>

Please backup everything before running that :)<br>

<br>

However, since what you're doing essentially amounts to RAID0 without the<b=
r>

performance benefits (if you lose one drive, your data is lost), I'd run a =
full backup<br>

and run the following commands to create a striped LV :<br>

<br>

lvremove /dev/vg/myth<br>

vgremove vg<br>

pvremove /dev/sdb1<br>

pvremove /dev/sdc1<br>

dd if=3D/dev/zero of=3D/dev/sdb bs=3D4096 count=3D10000<br>

dd if=3D/dev/zero of=3D/dev/sdb bs=3D4096 count=3D10000<br>

pvcreate /dev/sdb<br>

pvcreate /dev/sdc<br>

vgcreate vg /dev/sdb /dev/sdc<br>

lcreate -i 2 -I 8 -L 1700M -n myth vg /dev/sdb /dev/sdc<br>

   (adjust 1700 to whatever your drives will take)<br>

mkfs.jfs /dev/vg/myth<br>

<br>

You will lose a bit of space but gain some performance ; the available VG s=
ize can<br>

then be used for other LVs or snapshots.<br>

<br>

Best,<br>

<br>

Francois<br>

<br>

<br>

<br>

On Fri, 23 Jan 2009 11:14:35 -0600<br>

<a href=3D"mailto:ctd@minneapolish3.com">ctd@minneapolish3.com</a> wrote:<b=
r>

<br>

<span style=3D"color: rgb(102, 102, 102);">&gt; Hey there,</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; I have most likely a simple=
 question concerning LVM that I figured someone might be able to provide so=
me insight into.</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; I just setup LVM with both =
/dev/sdb1 and /dev/sdc1 being assigned to my =E2=80=9Cvg=E2=80=9D volume gr=
oup. There is only one logical volume =E2=80=9Cmyth=E2=80=9D off of =E2=80=
=9Cvg=E2=80=9D.</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; My steps:</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; fdisk /dev/sdc [created 1 p=
artition to span the entire drive of type 8e]</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; emerge lvm2</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; vgscan</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; vgchange -a y </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; pvcreate /dev/sdc1</span><b=
r>

<span style=3D"color: rgb(102, 102, 102);">&gt; vgcreate vg /dev/sdc1</span=
><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; lvcreate -L900GB -nmyth vg<=
/span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; mkfs.jfs /dev/vg/myth</span=
><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; fdisk /dev/sdb [created 1 p=
artition to span the entire drive of type 8e]</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; pvcreate /dev/sdb1</span><b=
r>

<span style=3D"color: rgb(102, 102, 102);">&gt; vgextend vg /dev/sdb1</span=
><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; lvextend -L+700G /dev/vg/my=
th</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; Sdb1: 700GB drive with one =
partition</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; Sdd1: 1TB drive with one pa=
rtition</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; My question is related to t=
he space available in /dev/vg/myth. I</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; would assume that I should =
have ~1.7TB of space on that logical</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; partition, but df does not =
seems to indicate that. </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt;  # df</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; Filesystem&nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;1K-blocks&nbsp; &nbsp; &nbsp; Used Available Use% M=
ounted on</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; =E2=80=A6</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; /dev/mapper/vg-myth&nbsp; 9=
43656628 544996248 398660380&nbsp; 58% /mnt/store</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; =E2=80=A6</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; mythserver michael # pvdisp=
lay /dev/sdb1</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; &nbsp; --- Physical volume =
---</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; &nbsp; PV Name&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/dev/sdb1</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; &nbsp; VG Name&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vg</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; &nbsp; PV Size&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;698.64 GB / not usable 2.34 MB</s=
pan><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; &nbsp; Allocatable&nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;yes</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; &nbsp; PE Size (KByte)&nbsp=
; &nbsp; &nbsp; &nbsp;4096</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; &nbsp; Total PE&nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 178850</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; &nbsp; Free PE&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;292</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; &nbsp; Allocated PE&nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; 178558</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; &nbsp; PV UUID&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;SetyUA-DkWL-zDDo-Wm-3avR-nJH8-OnU=
ujv</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; mythserver michael # pvdisp=
lay /dev/sdc1</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; &nbsp; --- Physical volume =
---</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; &nbsp; PV Name&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/dev/sdc1</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; &nbsp; VG Name&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vg</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; &nbsp; PV Size&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;931.51 GB / not usable 3.19 MB</s=
pan><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; &nbsp; Allocatable&nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;yes (but full)</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; &nbsp; PE Size (KByte)&nbsp=
; &nbsp; &nbsp; &nbsp;4096</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; &nbsp; Total PE&nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 238466</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; &nbsp; Free PE&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; &nbsp; Allocated PE&nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; 238466</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; &nbsp; PV UUID&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DX11mo-r0Eh-jN5N-objS-oqo6-eVSU-M=
ShkS2</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; mythserver michael # lvexte=
nd -L+700G /dev/vg/myth</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; &nbsp; Extending logical vo=
lume myth to 2.27 TB</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; &nbsp; Insufficient free sp=
ace: 179200 extents needed, but only 292 available</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; I am guessing that I should=
 have run these commands to extend the logical volume to its desired size:<=
/span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; vgextend vg /dev/sdb1</span=
><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; lvextend -L+700G /dev/vg/my=
th</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; before creating the filesys=
tem with this command which I am guessing locked the size to the 900GB with=
 I used in my setup steps</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; mkfs.jfs /dev/vg/myth</span=
><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; 	</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; Does that sound like my iss=
ue?</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; Any thoughts on how to get =
out of this situation while ensuring no loss of my data that currently resi=
des on /dev/mapper/vg-myth?</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; I am thinking that the foll=
owing steps should work:</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; Copy all of my files on /de=
v/mapper/vg-myth to other paritions (I</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; assume the call to mkfs.jfs=
 below will delete all the contents of this</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; partition)</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; "lvreduce -L-641G /dev/vg/m=
yth" (to get the size matched up with 931GB + 698GB [ 2.27TB =E2=80=93 931G=
B =E2=80=93 698GB)</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; "mkfs.jfs /dev/vg/myth" (re=
create the filesystem now that the size has been corrected) </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; remount /dev/vg/myth</span>=
<br>

<span style=3D"color: rgb(102, 102, 102);">&gt; copy back the files</span><=
br>

<span style=3D"color: rgb(102, 102, 102);">&gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; Thanks in advance</span><br=
>

<span style=3D"color: rgb(102, 102, 102);">&gt; Mike </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; </span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; ___________________________=
____________________</span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; linux-lvm mailing list</spa=
n><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; <a href=3D"mailto:linux-lvm=
@redhat.com">linux-lvm@redhat.com</a></span><br>

<span style=3D"color: rgb(102, 102, 102);">&gt; <a target=3D"_blank" href=
=3D"https://www.redhat.com/mailman/listinfo/linux-lvm"><span style=3D"color=
: red;">https://www.redhat.com/mailman/listinfo/linux-lvm</span></a></span>=
<br>

<span style=3D"color: rgb(102, 102, 102);">&gt; read the LVM HOW-TO at <a t=
arget=3D"_blank" href=3D"http://tldp.org/HOWTO/LVM-HOWTO/"><span style=3D"c=
olor: red;">http://tldp.org/HOWTO/LVM-HOWTO/</span></a></span><br>

<br>

_______________________________________________<br>

linux-lvm mailing list<br>

<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>

<a target=3D"_blank" href=3D"https://www.redhat.com/mailman/listinfo/linux-=
lvm"><span style=3D"color: red;">https://www.redhat.com/mailman/listinfo/li=
nux-lvm</span></a><br>

read the LVM HOW-TO at <a target=3D"_blank" href=3D"http://tldp.org/HOWTO/L=
VM-HOWTO/"><span style=3D"color: red;">http://tldp.org/HOWTO/LVM-HOWTO/</sp=
an></a><br>

<br>

</blockquote></HTML>
--=_704b74cc3bea3aa180682cf180601ad1--
