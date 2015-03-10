Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2A9YW6N008684
	for <linux-lvm@redhat.com>; Tue, 10 Mar 2015 05:34:33 -0400
Received: from mail.webx.cz (mail.webx.cz [109.123.222.201])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2A9YSxZ020357
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 10 Mar 2015 05:34:29 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.webx.cz (Postfix) with ESMTP id 468003FFBA
	for <linux-lvm@redhat.com>; Tue, 10 Mar 2015 10:34:27 +0100 (CET)
Received: from mail.webx.cz ([127.0.0.1])
	by localhost (mail1.webx.cz [127.0.0.1]) (amavisd-new, port 10042)
	with LMTP id F54gSD8UdSyP for <linux-lvm@redhat.com>;
	Tue, 10 Mar 2015 10:34:27 +0100 (CET)
Received: from libor-nb.localnet (remote.bcom.cz [88.208.120.34])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.webx.cz (Postfix) with ESMTPSA id 11F043FFC0
	for <linux-lvm@redhat.com>; Tue, 10 Mar 2015 10:34:27 +0100 (CET)
From: Libor =?utf-8?B?S2xlcMOhxI0=?= <libor.klepac@bcom.cz>
Date: Tue, 10 Mar 2015 10:34:26 +0100
Message-ID: <12305881.n8GeDYuzBu@libor-nb>
In-Reply-To: <CAE7pJ3B1oSS1WvfKH7e9zux4kbTVL9WvA2-uWsgpsxF17-dK4Q@mail.gmail.com>
References: <2134825.VZEVSUbKJK@libor-nb>
	<CAE7pJ3B1oSS1WvfKH7e9zux4kbTVL9WvA2-uWsgpsxF17-dK4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="nextPart3952121.DiMfKxZBe6"
Content-Transfer-Encoding: 7Bit
Subject: Re: [linux-lvm] Removing disk from raid LVM
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

This is a multi-part message in MIME format.

--nextPart3952121.DiMfKxZBe6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,
thanks for the link.
I think, this procedure was used last week, maybe i read it on this ver=
y page.

Shutdown computer, replace disk, boot computer, create PV with old uuid=
, then=20
do vgcfgrestore.

This "echo 1 > /sys/block/sde/device/delete" is what i test now in virt=
ual=20
machine, it's like if disk failed completly, i think LVM raid should be=
 able to handle=20
this situation ;)

With regards,
Libor

On =C3=9At 10. b=C5=99ezna 2015 10:23:08 emmanuel segura wrote:
> echo 1 > /sys/block/sde/device/delete #this is wrong from my point of=

> view, you need first try to remove the disk from lvm
>=20
> vgreduce -ff vgPecDisk2 /dev/sde #doesn't allow me to remove
>=20
> vgreduce --removemissing vgPecDisk2 #doesn't allow me to remove
>=20
> vgreduce --removemissing --force vgPecDisk2 #works, alerts me about
> rimage and rmeta LVS
>=20
>=20
> 1: remove the failed device physically not from lvm and insert the ne=
w
> device 2: pvcreate --uuid "FmGRh3-zhok-iVI8-7qTD-S5BI-MAEN-NYM5Sk"
> --restorefile /etc/lvm/archive/VG_00050.vg /dev/sdh1 #to create the p=
v
> with OLD UUID of remove disk
> 3: now you can restore the vg metadata
>=20
>=20
>=20
https://www.centos.org/docs/5/html/Cluster_Logical_Volume_Manager/mdata=
re
cov
> er.html
> 2015-03-09 12:21 GMT+01:00 Libor Klep=C3=A1=C4=8D <libor.klepac@bcom.=
cz>:
> > Hello,
> >=20
> > web have 4x3TB disks in LVM for backups and I setup per customer/pe=
r
> > "task"
> > LV type raid5 on it.
> >=20
> > Last week, smartd started to alarm us, that one of the disk will so=
on go
> > away.
> >=20
> > So we shut down the computer, replaced disk and then i used vgcfgre=
store
> > on
> > new disk to restore metadata.
> >=20
> > Result was, that some LVs came up with damaged filesystem, some did=
n't
> > came
> > up at all with messages like (one of rimage and rmeta was "wrong", =
when i
> > used KVPM util, it was type "virtual"
> >=20
> > ----
> >=20
> > [123995.826650] mdX: bitmap initialized from disk: read 4 pages, se=
t 1 of
> > 98312 bits
> >=20
> > [124071.037501] device-mapper: raid: Failed to read superblock of d=
evice
> > at
> > position 2
> >=20
> > [124071.055473] device-mapper: raid: New device injected into exist=
ing
> > array without 'rebuild' parameter specified
> >=20
> > [124071.055969] device-mapper: table: 253:83: raid: Unable to assem=
ble
> > array: Invalid superblocks
> >=20
> > [124071.056432] device-mapper: ioctl: error adding target to table
> >=20
> > ----
> >=20
> > After that, i tried several combinations of
> >=20
> > lvconvert --repair
> >=20
> > and
> >=20
> > lvchange -ay --resync
> >=20
> >=20
> >=20
> > Without success. So i saved some data and than created new empty LV=
's=20
and
> > started backups from scratch.
> >=20
> >=20
> >=20
> > Today, smartd alerted on another disk.
> >=20
> > So how can i safely remove disk from VG?
> >=20
> > I tried to simulate it on VM
> >=20
> >=20
> >=20
> > echo 1 > /sys/block/sde/device/delete
> >=20
> > vgreduce -ff vgPecDisk2 /dev/sde #doesn't allow me to remove
> >=20
> > vgreduce --removemissing vgPecDisk2 #doesn't allow me to remove
> >=20
> > vgreduce --removemissing --force vgPecDisk2 #works, alerts me about=
=20
rimage
> > and rmeta LVS
> >=20
> >=20
> >=20
> > vgchange -ay vgPecDisk2 #works but LV isn't active, only rimage and=
 rmeta
> > LV show up.
> >=20
> >=20
> >=20
> > So how to safely remove soon-to-be-bad-drive and insert new drive t=
o
> > array?
> >=20
> > Server has no more physical space for new drive, so we cannot use=20=

pvmove.
> >=20
> >=20
> >=20
> > Server is debian wheezy, but kernel is 2.6.14.
> > 
--nextPart3952121.DiMfKxZBe6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/=
REC-html40/strict.dtd">
<html><head><meta name=3D"qrichtext" content=3D"1" /><style type=3D"tex=
t/css">
p, li { white-space: pre-wrap; }
</style></head><body style=3D" font-family:'DejaVu Sans'; font-size:9pt=
; font-weight:400; font-style:normal;">
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Hi,=
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">tha=
nks for the link.</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">I t=
hink, this procedure was used last week, maybe i read it on this very p=
age.</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Shu=
tdown computer, replace disk, boot computer, create PV with old uuid, t=
hen do vgcfgrestore.</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Thi=
s &quot;echo 1 &gt; /sys/block/sde/device/delete&quot; is what i test n=
ow in virtual machine, it's like if disk failed completly, i think LVM =
raid should be able to handle this situation ;)</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Wit=
h regards,</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Lib=
or</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">On =
=C3=9At 10.=C2=A0b=C5=99ezna=C2=A02015 10:23:08 emmanuel segura wrote:<=
/p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; echo 1 &gt; /sys/block/sde/device/delete #this is wrong from my point=
 of</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; view, you need first try to remove the disk from lvm</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; vgreduce -ff vgPecDisk2 /dev/sde #doesn't allow me to remove</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; vgreduce --removemissing vgPecDisk2 #doesn't allow me to remove</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; vgreduce --removemissing --force vgPecDisk2 #works, alerts me about</=
p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; rimage and rmeta LVS</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; 1: remove the failed device physically not from lvm and insert the ne=
w</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; device 2: pvcreate --uuid &quot;FmGRh3-zhok-iVI8-7qTD-S5BI-MAEN-NYM5S=
k&quot;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; --restorefile /etc/lvm/archive/VG_00050.vg /dev/sdh1 #to create the p=
v</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; with OLD UUID of remove disk</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; 3: now you can restore the vg metadata</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; https://www.centos.org/docs/5/html/Cluster_Logical_Volume_Manager/mda=
tarecov</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; er.html</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; 2015-03-09 12:21 GMT+01:00 Libor Klep=C3=A1=C4=8D &lt;libor.klepac@bc=
om.cz&gt;:</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; Hello,</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; web have 4x3TB disks in LVM for backups and I setup per customer=
/per</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; &quot;task&quot;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; LV type raid5 on it.</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; Last week, smartd started to alarm us, that one of the disk will=
 soon go</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; away.</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; So we shut down the computer, replaced disk and then i used vgcf=
grestore</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; on</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; new disk to restore metadata.</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; Result was, that some LVs came up with damaged filesystem, some =
didn't</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; came</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; up at all with messages like (one of rimage and rmeta was &quot;=
wrong&quot;, when i</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; used KVPM util, it was type &quot;virtual&quot;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; ----</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; [123995.826650] mdX: bitmap initialized from disk: read 4 pages,=
 set 1 of</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; 98312 bits</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; [124071.037501] device-mapper: raid: Failed to read superblock o=
f device</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; at</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; position 2</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; [124071.055473] device-mapper: raid: New device injected into ex=
isting</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; array without 'rebuild' parameter specified</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; [124071.055969] device-mapper: table: 253:83: raid: Unable to as=
semble</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; array: Invalid superblocks</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; [124071.056432] device-mapper: ioctl: error adding target to tab=
le</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; ----</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; After that, i tried several combinations of</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; lvconvert --repair</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; and</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; lvchange -ay --resync</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; Without success. So i saved some data and than created new empty=
 LV's and</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; started backups from scratch.</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; Today, smartd alerted on another disk.</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; So how can i safely remove disk from VG?</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; I tried to simulate it on VM</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; echo 1 &gt; /sys/block/sde/device/delete</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; vgreduce -ff vgPecDisk2 /dev/sde #doesn't allow me to remove</p>=

<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; vgreduce --removemissing vgPecDisk2 #doesn't allow me to remove<=
/p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; vgreduce --removemissing --force vgPecDisk2 #works, alerts me ab=
out rimage</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; and rmeta LVS</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; vgchange -ay vgPecDisk2 #works but LV isn't active, only rimage =
and rmeta</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; LV show up.</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; So how to safely remove soon-to-be-bad-drive and insert new driv=
e to</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; array?</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; Server has no more physical space for new drive, so we cannot us=
e pvmove.</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; Server is debian wheezy, but kernel is 2.6.14.</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; Lvm is in version 2.02.95-8 , but i have another copy i use for =
raid</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; operations, which is in version 2.02.104</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; With regards</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; Libor</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; _______________________________________________</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; linux-lvm mailing list</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; linux-lvm@redhat.com</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; https://www.redhat.com/mailman/listinfo/linux-lvm</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; &gt; read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/</p></bod=
y></html>
--nextPart3952121.DiMfKxZBe6--
