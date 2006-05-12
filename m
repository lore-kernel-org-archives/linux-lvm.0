Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4CI3Om7030478
	for <linux-lvm@redhat.com>; Fri, 12 May 2006 14:03:24 -0400
Received: from web38802.mail.mud.yahoo.com (web38802.mail.mud.yahoo.com
	[209.191.125.93])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id k4CI3I9B004551
	for <linux-lvm@redhat.com>; Fri, 12 May 2006 14:03:18 -0400
Message-ID: <20060512180312.36362.qmail@web38802.mail.mud.yahoo.com>
Date: Fri, 12 May 2006 11:03:12 -0700 (PDT)
From: Brian Kelly <brian_kelly_at_home@yahoo.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1006598058-1147456992=:34453"
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] uuid incorrect for drive in LVM after running fdisk on
	new drive
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

--0-1006598058-1147456992=:34453
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I am running FC4, kernel 2.6.14-1.1644_FC4smp, using lvm 2.01.08.  I have a=
 LVM volume group which has 6 physical drives for a total of 1.5TB. I was a=
dding a seventh drive. =20

I powered down the machine and added a SATA drive to my four port promise c=
ontroller (sda was already part of the LVM and a 400GB drive).  I was now a=
dding sdb (also 400GB).  I booted up the machine, dmesg reported it was the=
re and my normal LVM mounted ok.  All looked fine in dmesg.  So I went abou=
t my proceedure to add this drive:

$fdisk /dev/sdb

created a new primary partition and wrote it.

This all seemed to go ok.  However, once I tried doing a vgscan now, I had =
a problem.  I got messages of this type:

  Couldn't find device with uuid 'YGcFW9-G7tz-40nM-1tir-MXAx-CJBn-bngtXg'.
  Couldn't find all physical volumes for volume group VolGroup10.

Mind you, I haven't done anything that would start the process of adding th=
is to the LVM.  THe above uuid is for my sda 400GB drive.

I used fdisk to view the partition tables for the various drives that make =
up this LVM.  I found sda had a missing partition table!  This was my first=
 SATA drive that was already in the LVM array and is attached to the same c=
ontroller for the new drive I was adding: sdb.  So, I decided to disconnect=
 the new drive, sdb, and do a reboot.  The LVM didn't mount, but fdisk at l=
east showed a partition table for sda. =20

Now with the new drive not connected, I find that pvscan shows me an 'unkno=
wn device' with the same size as my SATA drive (sda and sdb are both 400GB =
drives).

$pvscan
  PV /dev/hda2        VG VolGroup00   lvm2 [7.75 GB / 32.00 MB free]
  PV /dev/hdi1        VG VolGroup10   lvm2 [232.88 GB / 0    free]
  PV /dev/hdk1        VG VolGroup10   lvm2 [232.88 GB / 0    free]
  PV /dev/hdc1        VG VolGroup10   lvm2 [232.88 GB / 0    free]
  PV /dev/hde1        VG VolGroup10   lvm2 [232.88 GB / 0    free]
  PV /dev/hdg1        VG VolGroup10   lvm2 [232.88 GB / 384.00 MB free]
  PV unknown device   VG VolGroup10   lvm2 [372.59 GB / 0    free]
  PV /dev/sda1                        lvm2 [372.61 GB]
  Total: 8 [1.87 TB] / in use: 7 [1.51 TB] / in no VG: 1 [372.61 GB]
 =20
As I read the above it looks like the 'unknown device' should be sda1.  Whe=
n I run 'pvscan -u' to get the uuid I see that the 'unknown device' has the=
 same uuid as the given in the errors above for the device it couldn't find=
.  And now sda1 seems to have a new uuid.  Though I don't have a printout o=
f what pvscan would have given prior to this.

I know that sda1 was entirely full, should be reporting 0 free.  Also, now =
it looks like it thinks it should be 1.87 TB, when really it should be 1.5T=
B. =20

It appears that the device with the specific uuid above must be my sda1 dri=
ve.  I believe if I could force sda1 to have a different uuid I might get t=
his to work.  It appears the drive is there... but I'm afraid of losing all=
 that is on it.  And am not sure what the safest way to proceed is.  Please=
 advise.  Does anyone know how to force the uuid value for that drive?  Is =
that the safest route?   Is there a way of changing the LVM metadata to loo=
k to the new uuid and not the old?  Is there anything I can do with the arc=
hive and backup directories under /etc/lvm?

I've found that the /etc/lvm/archive/VolumeGroupName_XXXXX.vg
backup file lists the bngtXg uuid as /dev/sda not /dev/sda1.  Not sure if t=
hat's significant or not.

	=09
---------------------------------
How low will we go? Check out Yahoo! Messenger=EF=BF=BDs low  PC-to-Phone c=
all rates.
--0-1006598058-1147456992=:34453
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I am running FC4, kernel 2.6.14-1.1644_FC4smp, using lvm 2.01.08.&nbsp; I h=
ave a LVM volume group which has 6 physical drives for a total of 1.5TB. I =
was adding a seventh drive. &nbsp;<br><br>I powered down the machine and ad=
ded a SATA drive to my four port promise controller (sda was already part o=
f the LVM and a 400GB drive).&nbsp; I was now adding sdb (also 400GB).&nbsp=
; I booted up the machine, dmesg reported it was there and my normal LVM mo=
unted ok.&nbsp; All looked fine in dmesg.&nbsp; So I went about my proceedu=
re to add this drive:<br><br>$fdisk /dev/sdb<br><br>created a new primary p=
artition and wrote it.<br><br>This all seemed to go ok.&nbsp; However, once=
 I tried doing a vgscan now, I had a problem.&nbsp; I got messages of this =
type:<br><br>&nbsp; Couldn't find device with uuid 'YGcFW9-G7tz-40nM-1tir-M=
XAx-CJBn-bngtXg'.<br>&nbsp; Couldn't find all physical volumes for volume g=
roup VolGroup10.<br><br>Mind you, I haven't done anything that would start =
the process
 of adding this to the LVM.&nbsp; THe above uuid is for my sda 400GB drive.=
<br><br>I used fdisk to view the partition tables for the various drives th=
at make up this LVM.&nbsp; I found sda had a missing partition table!&nbsp;=
 This was my first SATA drive that was already in the LVM array and is atta=
ched to the same controller for the new drive I was adding: sdb.&nbsp; So, =
I decided to disconnect the new drive, sdb, and do a reboot.&nbsp; The LVM =
didn't mount, but fdisk at least showed a partition table for sda. &nbsp;<b=
r><br>Now with the new drive not connected, I find that pvscan shows me an =
'unknown device' with the same size as my SATA drive (sda and sdb are both =
400GB drives).<br><br>$pvscan<br>&nbsp; PV /dev/hda2&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; VG VolGroup00&nbsp;&nbsp; lvm2 [7.75 GB / 32.00 MB free=
]<br>&nbsp; PV /dev/hdi1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VG VolGr=
oup10&nbsp;&nbsp; lvm2 [232.88 GB / 0&nbsp;&nbsp;&nbsp; free]<br>&nbsp; PV
 /dev/hdk1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VG VolGroup10&nbsp;&nb=
sp; lvm2 [232.88 GB / 0&nbsp;&nbsp;&nbsp; free]<br>&nbsp; PV /dev/hdc1&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VG VolGroup10&nbsp;&nbsp; lvm2 [232.8=
8 GB / 0&nbsp;&nbsp;&nbsp; free]<br>&nbsp; PV /dev/hde1&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; VG VolGroup10&nbsp;&nbsp; lvm2 [232.88 GB / 0&nbsp;&=
nbsp;&nbsp; free]<br>&nbsp; PV /dev/hdg1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; VG VolGroup10&nbsp;&nbsp; lvm2 [232.88 GB / 384.00 MB free]<br>&nbs=
p; PV unknown device&nbsp;&nbsp; VG VolGroup10&nbsp;&nbsp; lvm2 [372.59 GB =
/ 0&nbsp;&nbsp;&nbsp; free]<br>&nbsp; PV /dev/sda1&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lvm2 [372.61 GB]<br>&nbsp; Total: 8 =
[1.87 TB] / in use: 7 [1.51 TB] / in no VG: 1 [372.61 GB]<br>&nbsp; <br>As =
I read the above it looks like the 'unknown device' should be sda1.&nbsp; W=
hen I run
 'pvscan -u' to get the uuid I see that the 'unknown device' has the same u=
uid as the given in the errors above for the device it couldn't find.&nbsp;=
 And now sda1 seems to have a new uuid.&nbsp; Though I don't have a printou=
t of what pvscan would have given prior to this.<br><br>I know that sda1 wa=
s entirely full, should be reporting 0 free.&nbsp; Also, now it looks like =
it thinks it should be 1.87 TB, when really it should be 1.5TB. &nbsp;<br><=
br>It appears that the device with the specific uuid above must be my sda1 =
drive.&nbsp; I believe if I could force sda1 to have a different uuid I mig=
ht get this to work.&nbsp; It appears the drive is there... but I'm afraid =
of losing all that is on it.&nbsp; And am not sure what the safest way to p=
roceed is.&nbsp; Please advise.&nbsp; Does anyone know how to force the uui=
d value for that drive?&nbsp; Is that the safest route?&nbsp;&nbsp; Is ther=
e a way of changing the LVM metadata to look to the new uuid and not the ol=
d?&nbsp; Is
 there anything I can do with the archive and backup directories under /etc=
/lvm?<br><br>I've found that the <tt class=3D"filename">/etc/lvm/archive/Vo=
lumeGroupName_XXXXX.vg<br>backup file lists the bngtXg uuid as /dev/sda not=
 /dev/sda1.&nbsp; Not sure if that's significant or not.<br></tt><p>
		<hr size=3D1>How low will we go? Check out Yahoo! Messenger=EF=BF=BDs low=
 <a href=3D"http://us.rd.yahoo.com/mail_us/taglines/postman8/*http://us.rd.=
yahoo.com/evt=3D39663/*http://voice.yahoo.com"> PC-to-Phone call rates.
--0-1006598058-1147456992=:34453--
