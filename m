Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jA8KijV13441
	for <linux-lvm@redhat.com>; Tue, 8 Nov 2005 15:44:45 -0500
Received: from nproxy.gmail.com (nproxy.gmail.com [64.233.182.198])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jA8Kiclj000513
	for <linux-lvm@redhat.com>; Tue, 8 Nov 2005 15:44:38 -0500
Received: by nproxy.gmail.com with SMTP id x37so182651nfc
	for <linux-lvm@redhat.com>; Tue, 08 Nov 2005 12:44:38 -0800 (PST)
Message-ID: <fe6db9f20511081244v744a549ewe99211b39c10cf3d@mail.gmail.com>
Date: Tue, 8 Nov 2005 21:44:37 +0100
From: "Mr, Radiks" <mrradiks@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_21403_15070585.1131482677714"
Subject: [linux-lvm] Dead Motherboard.. LVM Problems..
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

------=_Part_21403_15070585.1131482677714
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Ok, heres my bad luck story.. have a nice happy linux box runing 3 hdd's ..
2 of them nice SATA devices (/dev/sda1, /dev/sdb1) and one happy go lucky
200gig /dev/hda1 now, i noticed my bios was out of date.. so figured why no=
t
risk an upgrade.. ... and now the horror story.. in the middle of the
update.. the power to my hole house flickers off.. and very loud son of a
b*tch echo's through the house.. when the power came back on, my motherboar=
d
was dead, nothing more than a beeping paperwight.. soo, i ran out and bough=
t
me a new motherboard, i even upgraded from my dead ECS 755-A2 to a nice DFI
Lanparty UT nForce 3 250Gb .. i get the motherboard, hook every thing up..
it boots... and screams.. couldnt find device for uuid..... well i boot int=
o
linux rescue cd.. and run a nice vgscan.. pvscan.. lvscan.. and its all
happy.. finds every thing has no error msgs.. i can even move around the
hole LV and look at contents of files.. and every thing looks just find..
but.. still wont boot.. i gave up and figured maybe i can do a reinstall
booted into the installer and it says that /dev/hda1 isnt part of VolGroup0=
0
but.. if you goto edit it.. wow magicly you can edit it.. becuase its part
of VolGroup00!!! soo i cant asign my mount points becuase of size problems.=
.
i want to keep the data i have on this system.. i just want to be able to
boot again..
 this is a Fedora Core 4 system, i have the full install DVD/Rescue.. i hav=
e
tryed puting the disks in difrent orders, and difrent location to check and
see if there might be a problem there, and have goten no change.. i will tr=
y
to awnser any questions to the best of my abilitys..
Drive Layout..
/dev/hda1 - 200gig LVM
/dev/sda1 - /boot
/dev/sda2 - 120gig LVM
/dev/sdb1 - 140gig LVM
it is using /dev/sda as the primary boot device.. i even get the full color
pretty grub screen.. pvscan -u says everyone has there proper UUID's no
partition changes have been made at all.. this is direct rip out of the dea=
d
m-board and replaced with new .. only hardware change other that the
replacing of the motherboard was removing of 1 extra soundcard.. please hel=
p
me!. i dont have anyplace to store the 200gigs worth of importent data that=
s
on my linux system..
 Thanks for your time, and any help you may provide..

------=_Part_21403_15070585.1131482677714
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<div>Ok, heres my bad luck story.. have a nice happy linux box runing 3 hdd=
's .. 2 of them nice SATA devices (/dev/sda1, /dev/sdb1) and one happy go l=
ucky 200gig /dev/hda1 now, i noticed my bios was out of date.. so figured w=
hy not risk an upgrade.. ... and now the horror story.. in the middle of th=
e update.. the power to my hole house flickers off.. and very loud son of a=
 b*tch echo's through the house.. when the power came back on, my motherboa=
rd was dead, nothing more than a beeping paperwight.. soo, i ran out and bo=
ught me a new motherboard, i even upgraded from my dead ECS 755-A2 to a nic=
e DFI Lanparty UT nForce 3 250Gb .. i get the motherboard, hook every thing=
 up.. it boots... and screams.. couldnt find device for uuid..... well i bo=
ot into linux rescue cd.. and run a nice vgscan.. pvscan.. lvscan.. and its=
 all happy.. finds every thing has no error msgs.. i can even move around t=
he hole LV and look at contents of files.. and every thing looks just find.=
. but.. still wont boot.. i gave up and figured maybe i can do a reinstall =
booted into the installer and it says that /dev/hda1 isnt part of VolGroup0=
0 but.. if you goto edit it.. wow magicly you can edit it.. becuase its par=
t of VolGroup00!!! soo i cant asign my mount points becuase of size problem=
s.. i want to keep the data i have on this system.. i just want to be able =
to boot again..=20
</div>
<div>&nbsp;</div>
<div>this is a Fedora Core 4 system, i have the full install DVD/Rescue.. i=
 have tryed puting the disks in difrent orders, and difrent location to che=
ck and see if there might be a problem there, and have goten no change.. i =
will try to awnser any questions to the best of my abilitys..
</div>
<div>Drive Layout..</div>
<div>/dev/hda1 - 200gig LVM</div>
<div>/dev/sda1 - /boot</div>
<div>/dev/sda2 - 120gig LVM</div>
<div>/dev/sdb1 - 140gig LVM</div>
<div>it is using /dev/sda as the primary boot device.. i even get the full =
color pretty grub screen.. pvscan -u says everyone has there proper UUID's =
no partition changes have been made at all.. this is direct rip out of the =
dead m-board and replaced with new .. only hardware change other that the r=
eplacing of the motherboard was removing of 1 extra soundcard.. please help=
 me!. i dont have anyplace to store the 200gigs worth of importent data tha=
ts on my linux system..=20
</div>
<div>&nbsp;</div>
<div>Thanks for your time, and any help you may provide.. </div>

------=_Part_21403_15070585.1131482677714--
