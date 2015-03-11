Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2BD5iC8031818
	for <linux-lvm@redhat.com>; Wed, 11 Mar 2015 09:05:44 -0400
Received: from mail.webx.cz (mail.webx.cz [109.123.222.201])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2BD5eFE003654
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 11 Mar 2015 09:05:41 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.webx.cz (Postfix) with ESMTP id AE2D740665
	for <linux-lvm@redhat.com>; Wed, 11 Mar 2015 14:05:38 +0100 (CET)
Received: from mail.webx.cz ([127.0.0.1])
	by localhost (mail1.webx.cz [127.0.0.1]) (amavisd-new, port 10042)
	with LMTP id ldGreP3i1Z95 for <linux-lvm@redhat.com>;
	Wed, 11 Mar 2015 14:05:38 +0100 (CET)
Received: from libor-nb.localnet (remote.bcom.cz [88.208.120.34])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.webx.cz (Postfix) with ESMTPSA id 78FA23FEC9
	for <linux-lvm@redhat.com>; Wed, 11 Mar 2015 14:05:38 +0100 (CET)
From: Libor =?utf-8?B?S2xlcMOhxI0=?= <libor.klepac@bcom.cz>
Date: Wed, 11 Mar 2015 14:05:37 +0100
Message-ID: <1586988.am8mh8BZtm@libor-nb>
In-Reply-To: <21758.64050.13647.314608@quad.stoffel.home>
References: <2134825.VZEVSUbKJK@libor-nb>
	<21758.64050.13647.314608@quad.stoffel.home>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="nextPart11798727.ikoFWsyqai"
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

--nextPart11798727.ikoFWsyqai
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hello John,

On =C3=9At 10. b=C5=99ezna 2015 10:05:38 John Stoffel wrote:
> Libor> web have 4x3TB disks in LVM for backups and I setup per
> Libor> customer/per "task" LV type raid5 on it.
>=20
> Can you post the configuration details please, since they do matter.
> It would seem to me, that it would be better to use 'md' to create th=
e
> underlying RAID5 device, and then use LVM on top of that /dev/md0 to
> create the customer LV(s) as needed.

I used mdraid everytime before (in fact, OS is on another disks on mdra=
id). But i=20
really loved idea/flexibility of raid in LVM and wanted to try it.

>=20
> Libor> Last week, smartd started to alarm us, that one of the disk
> Libor> will soon go away.
>=20
> Libor> So we shut down the computer, replaced disk and then i used
> Libor> vgcfgrestore on new disk to restore metadata.
>=20
> You should have shutdown the system, added in a new disk, and then
> rebooted the system.  At that point you would add the new disk into
> the RAID5, and then fail the dying disk.  It would be transparent to
> the LVM setup and be much safer.
>=20

I see, but there is no physical space for extra disk. Maybe external di=
sk should=20
do the trick, but it would take hours to migrate data and server is in =
remote=20
housing facility.

> I'd also strongly advise you to get RAID6 setup and have a hot spare
> also setup, so that you don't have this type of issue in the future.
>=20
> Libor> Result was, that some LVs came up with damaged filesystem, som=
e
> Libor> didn't came up at all with messages like (one of rimage and
> Libor> rmeta was "wrong", when i used KVPM util, it was type "virtual=
"
>=20
> This sounds very much like you just lost a bunch of data, which RAID5=

> shouldn't do.  So please post the details of your setup, starting at
> the disk level and moving up the stack to the filesystem(s) you have
> mounted for backups.  We don't need the customer names, etc, just the=

> details of the system.
>=20

System is Dell T20.

Backup disks are connected over=20
00:1f.2 SATA controller: Intel Corporation Lynx Point 6-port SATA Contr=
oller 1=20
[AHCI mode] (rev 04)
System disks are connected over
04:00.0 SATA controller: Marvell Technology Group Ltd. 88SE9230 PCIe SA=
TA=20
6Gb/s Controller (rev 10)

First three are 3TB sata discs, 3,5'', 7200RPM
[0:0:0:0]    disk    ATA      TOSHIBA MG03ACA3 n/a   /dev/sda=20
[1:0:0:0]    disk    ATA      ST3000NM0033-9ZM n/a   /dev/sdb=20
[2:0:0:0]    disk    ATA      ST3000NM0033-9ZM n/a   /dev/sdg=20
[3:0:0:0]    disk    ATA      TOSHIBA MG03ACA3 n/a   /dev/sdd

Remaining two are 500GB 2,5'' disks for system
[6:0:0:0]    disk    ATA      ST9500620NS      n/a   /dev/sde=20
[8:0:0:0]    disk    ATA      ST9500620NS      n/a   /dev/sdf=20

System is on mdraid (raid1) + LVM

On top of LVs, we use ext4 for OS and XFS for backup/customer disks.

> Also, which version of lvm, md, linux kernel, etc are you using?  The=

> more details the better.

It's Debian Wheezy, with kernel 3.14(.14)
System LVM is
 LVM version:     2.02.95(2) (2012-03-06)
  Library version: 1.02.74 (2012-03-06)
  Driver version:  4.27.0

I also use another copy of lvm, for raid operations (creating LV, exten=
ding LVs,=20
show progress of resync) ...
  LVM version:     2.02.104(2) (2013-11-13)
  Library version: 1.02.83 (2013-11-13)
  Driver version:  4.27.0


Should the problem be, that VG/LVs are first constructed using system o=
ld utils?
I think, i could upgrade whole system to Debian Jessie as last resort o=
peration.
This should bring kernel to version 3.16 and lvm to 2.02.111

Thanks for your reply

With regards,
Libor




> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--nextPart11798727.ikoFWsyqai
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
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Hel=
lo John,</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">On =
=C3=9At 10.=C2=A0b=C5=99ezna=C2=A02015 10:05:38 John Stoffel wrote:</p>=

<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; Libor&gt; web have 4x3TB disks in LVM for backups and I setup per</p>=

<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; Libor&gt; customer/per &quot;task&quot; LV type raid5 on it.</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; Can you post the configuration details please, since they do matter.<=
/p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; It would seem to me, that it would be better to use 'md' to create th=
e</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; underlying RAID5 device, and then use LVM on top of that /dev/md0 to<=
/p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; create the customer LV(s) as needed.</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">I u=
sed mdraid everytime before (in fact, OS is on another disks on mdraid)=
. But i really loved idea/flexibility of raid in LVM and wanted to try =
it.</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; Libor&gt; Last week, smartd started to alarm us, that one of the disk=
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; Libor&gt; will soon go away.</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; Libor&gt; So we shut down the computer, replaced disk and then i used=
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; Libor&gt; vgcfgrestore on new disk to restore metadata.</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; You should have shutdown the system, added in a new disk, and then</p=
>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; rebooted the system.  At that point you would add the new disk into</=
p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; the RAID5, and then fail the dying disk.  It would be transparent to<=
/p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; the LVM setup and be much safer.</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; </p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">I s=
ee, but there is no physical space for extra disk. Maybe external disk =
should do the trick, but it would take hours to migrate data and server=
 is in remote housing facility.</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; I'd also strongly advise you to get RAID6 setup and have a hot spare<=
/p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; also setup, so that you don't have this type of issue in the future.<=
/p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; Libor&gt; Result was, that some LVs came up with damaged filesystem, =
some</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; Libor&gt; didn't came up at all with messages like (one of rimage and=
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; Libor&gt; rmeta was &quot;wrong&quot;, when i used KVPM util, it was =
type &quot;virtual&quot;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; This sounds very much like you just lost a bunch of data, which RAID5=
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; shouldn't do.  So please post the details of your setup, starting at<=
/p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; the disk level and moving up the stack to the filesystem(s) you have<=
/p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; mounted for backups.  We don't need the customer names, etc, just the=
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; details of the system.</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; </p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Sys=
tem is Dell T20.</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Bac=
kup disks are connected over </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">00:=
1f.2 SATA controller: Intel Corporation Lynx Point 6-port SATA Controll=
er 1 [AHCI mode] (rev 04)</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Sys=
tem disks are connected over</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">04:=
00.0 SATA controller: Marvell Technology Group Ltd. 88SE9230 PCIe SATA =
6Gb/s Controller (rev 10)</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Fir=
st three are 3TB sata discs, 3,5'', 7200RPM</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">[0:=
0:0:0]    disk    ATA      TOSHIBA MG03ACA3 n/a   /dev/sda </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">[1:=
0:0:0]    disk    ATA      ST3000NM0033-9ZM n/a   /dev/sdb </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">[2:=
0:0:0]    disk    ATA      ST3000NM0033-9ZM n/a   /dev/sdg </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">[3:=
0:0:0]    disk    ATA      TOSHIBA MG03ACA3 n/a   /dev/sdd</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Rem=
aining two are 500GB 2,5'' disks for system</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">[6:=
0:0:0]    disk    ATA      ST9500620NS      n/a   /dev/sde </p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">[8:=
0:0:0]    disk    ATA      ST9500620NS      n/a   /dev/sdf </p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Sys=
tem is on mdraid (raid1) + LVM</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">On =
top of LVs, we use ext4 for OS and XFS for backup/customer disks.</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; Also, which version of lvm, md, linux kernel, etc are you using?  The=
</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; more details the better.</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">It'=
s Debian Wheezy, with kernel 3.14(.14)</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Sys=
tem LVM is</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;"> LV=
M version:     2.02.95(2) (2012-03-06)</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
ibrary version: 1.02.74 (2012-03-06)</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  D=
river version:  4.27.0</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">I a=
lso use another copy of lvm, for raid operations (creating LV, extendin=
g LVs, show progress of resync) ...</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
VM version:     2.02.104(2) (2013-11-13)</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  L=
ibrary version: 1.02.83 (2013-11-13)</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">  D=
river version:  4.27.0</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Sho=
uld the problem be, that VG/LVs are first constructed using system old =
utils?</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">I t=
hink, i could upgrade whole system to Debian Jessie as last resort oper=
ation.</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Thi=
s should bring kernel to version 3.16 and lvm to 2.02.111</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Tha=
nks for your reply</p>
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
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px=
; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0p=
x; ">&nbsp;</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; _______________________________________________</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; linux-lvm mailing list</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; linux-lvm@redhat.com</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; https://www.redhat.com/mailman/listinfo/linux-lvm</p>
<p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; margin=
-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">&gt=
; read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/</p></body></h=
tml>
--nextPart11798727.ikoFWsyqai--
