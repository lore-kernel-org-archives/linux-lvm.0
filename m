Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nAG4aPTa008142
	for <linux-lvm@redhat.com>; Sun, 15 Nov 2009 23:36:25 -0500
Received: from mail-gx0-f216.google.com (mail-gx0-f216.google.com
	[209.85.217.216])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nAG4a95Q023419
	for <linux-lvm@redhat.com>; Sun, 15 Nov 2009 23:36:10 -0500
Received: by gxk8 with SMTP id 8so4960683gxk.11
	for <linux-lvm@redhat.com>; Sun, 15 Nov 2009 20:36:09 -0800 (PST)
MIME-Version: 1.0
Date: Sun, 15 Nov 2009 20:36:09 -0800
Message-ID: <99f624940911152036y65fb3474ib4eb90cbca91da@mail.gmail.com>
From: Ken Bass <daytooner@gmail.com>
Content-Type: multipart/alternative; boundary=000e0cd4cbbc71512f0478758c14
Subject: [linux-lvm] Recovering data from an LV/VG w/ a crashed PV
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

--000e0cd4cbbc71512f0478758c14
Content-Type: text/plain; charset=ISO-8859-1

 (I know this topic has probably been brought up before, but I couldn't find
anything in the archives - if there is, please give me a link.)

I have an LV made up of 4 SCSI drives (PVs). One of those just crashed.
Specifically, the SCSI controller can't get anything but a not ready error
from it. Ergo, it is D-E-A-D. (And no, it wasn't part of a RAID :-(  ).

I've come to accept that, but now I want to know if I can recover anything
from the rest of the LV. Right now, at boot time, the LVM sees the VG with
an LV that is missing a PV, so it drops me to maintenance mode, where I
really can't do much. I can get the system to boot by physically removing
the VG (it's not my system VG), then disable it in fstab, and reboot again.
So, theoritically, I should have access to the VG/LV, missing the one dead
PV.

I can't migrate the extents off of the dead PV (duh), but can I remove that
PV from the LV/VG, and maybe recover some of the data on the other PVs?

FWIW, the filesystem is XFS. It is mainly used as a store and forward
server, and fortunately, most of the data on it had been saved. The rest of
it can be recreated, but it would be a very timely process (several days at
least). So any data that I can get off of the "amputated" LV would
definitely help.

I'm just about at the point where I will just rebuild the VG/LV from scratch
- that is, recreate a new VG/LV from the remaining PVs. But I just wanted to
know - before I commit - if I can recover anything.

Also - minor gripe - why won't the system boot if a VG has a bad LV, and
that VG is not the system VG? I'd like the LV to mount if it is okay, that
is why I have it in fstab. But, as above, when the system boots, and the LVM
sees that crippled VG/LV, the system goes to maintenance mode. Is there some
way to tell the system at mount time to continue w/o mounting that VG/LV?

As always, TIA

ken

--000e0cd4cbbc71512f0478758c14
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable


(I know this topic has probably been brought up before, but I couldn&#39;t
find anything in the archives - if there is, please give me a link.)<br>
<br>I have an LV made up of 4 SCSI drives (PVs). One of those just crashed.=
 Specifically, the SCSI controller can&#39;t get anything but a not ready e=
rror from it. Ergo, it is D-E-A-D. (And no, it wasn&#39;t part of a RAID :-=
(=A0 ).<br>
<br>I&#39;ve come to accept that, but now I want to know if I can recover a=
nything from the rest of the LV. Right now, at boot time, the LVM sees the =
VG with an LV that is missing a PV, so it drops me to maintenance mode, whe=
re I really can&#39;t do much. I can get the system to boot by physically r=
emoving the VG (it&#39;s not my system VG), then disable it in fstab, and r=
eboot again. So, theoritically, I should have access to the VG/LV, missing =
the one dead PV.<br>
<br>I can&#39;t migrate the extents off of the dead PV (duh), but can I rem=
ove that PV from the LV/VG, and maybe recover some of the data on the other=
 PVs?<br><br>FWIW, the filesystem is XFS. It is mainly used as a store and =
forward server, and fortunately, most of the data on it had been saved. The=
 rest of it can be recreated, but it would be a very timely process (severa=
l days at least). So any data that I can get off of the &quot;amputated&quo=
t; LV would definitely help.<br>
<br>I&#39;m just about at the point where I will just rebuild the VG/LV fro=
m scratch - that is, recreate a new VG/LV from the remaining PVs. But I jus=
t wanted to know - before I commit - if I can recover anything.<br><br>
Also - minor gripe - why won&#39;t the system boot if a VG has a bad LV, an=
d that VG is not the system VG? I&#39;d like the LV to mount if it is okay,=
 that is why I have it in fstab. But, as above, when the system boots, and =
the LVM sees that crippled VG/LV, the system goes to maintenance mode. Is t=
here some way to tell the system at mount time to continue w/o mounting tha=
t VG/LV?<br>
<br>As always, TIA<br><br>ken<br><br><br>

--000e0cd4cbbc71512f0478758c14--
