Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jA9HbBV21851
	for <linux-lvm@redhat.com>; Wed, 9 Nov 2005 12:37:11 -0500
Received: from xproxy.gmail.com (xproxy.gmail.com [66.249.82.201])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jA9HaSob025550
	for <linux-lvm@redhat.com>; Wed, 9 Nov 2005 12:37:02 -0500
Received: by xproxy.gmail.com with SMTP id r21so548401wxc
	for <linux-lvm@redhat.com>; Wed, 09 Nov 2005 09:37:02 -0800 (PST)
Message-ID: <ddaf98bd0511090937k1fd05f5ep20cc5a643955d916@mail.gmail.com>
Date: Wed, 9 Nov 2005 11:37:02 -0600
From: Cory Zerwas <gannas@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_4314_8609806.1131557822424"
Subject: [linux-lvm] Missing 1 of 3 PVs and all partition tables are good
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

------=_Part_4314_8609806.1131557822424
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi all,

I'm in a pinch. I've got about 500Gb of data trapped in a non-functioning
VG... Here's the deal:

I upgraded from FC3 to FC4, or tried to. The whole update bombed out but
during this time the LVM disks were unplugged from the system. When I got
the new system up on the old FS my LVM conf still appears to be in place. I
powered up the 3 drives and reset the system and I found the VG won't
activate.
I did not export the volume first. I realize now that this was a mistake.

I have 3 whole disks for this VG, each with 1 partition, type 8e, occupying
the entire disk. These are hdb1, hdc1, hdd1.

I'm noticing that an "fdisk -l" lists hdb, hdc, and hdd as all having
partitions of type 8e from beginning to end of disk. However, when I go int=
o
LVM and run "pvscan" I only see two PVs belonging to my VG "bloaty" and it
shows:

PV /dev/hdc1 VG bloaty lvm2 [111.78 GB / 0 free]
PV /dev/hdd1 VG bloaty lvm2 [115.03 GB / 64.00 MB free]
Total: 2 [266.81 GB] / in use: 2 [226.81 GB] / in no VG: 0 [0 ]

LVM doesn't seem to notice /dev/hdb1? It's a 232.88 Gb PV, how can this be?
And why isn't PVSCAN complaining about a missing PV? It should be, shouldn'=
t
it?

When I perform a "lvmdiskscan" I get (the parenthesis outline my input):

/dev/hda1 [ 101.94 MB]
(^^this is the /boot partition)
/dev/hdc1 [ 111.79 GB] LVM physical volume
/dev/hda2 [ 17.54 GB]
(^^this is the / partition)
/dev/hda3 [ 1.00 GB]
(^^this is the swap partition)
/dev/hdb1 [ 232.88 GB]
(^^THIS SHOULD BE A PV)
/dev/hdd1 [ 115.04 GB] LVM physical volume

Is there some trick here I don't know about? Do I have to restore the LVM
conf?

I am stumped. I'm pretty sure I'm not a newb, but I am definately not a
wizard. I've got my LPIC Level 1 cert if that means anything.

Heh, thanks for any help,
Cory

------=_Part_4314_8609806.1131557822424
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi all,<br>
<br>
I'm in a pinch.&nbsp; I've got about 500Gb of data trapped in a non-functio=
ning VG...&nbsp; Here's the deal:<br>
<br>
I upgraded from FC3 to FC4, or tried to.&nbsp; The whole update bombed
out but during this time the LVM disks were unplugged from the
system.&nbsp; When I got the new system up on the old FS my LVM conf
still appears to be in place.&nbsp; I powered up the 3 drives and reset
the system and I found the VG won't activate.<br>
I did not export the volume first.&nbsp; I realize now that this was a mist=
ake.<br>
<br>
I have 3 whole disks for this VG, each with 1 partition, type 8e, occupying=
 the entire disk.&nbsp; These are hdb1, hdc1, hdd1.<br>
<br>
I'm noticing that an &quot;fdisk -l&quot; lists hdb, hdc, and hdd as all ha=
ving
partitions of type 8e from beginning to end of disk.&nbsp; However,
when I go into LVM and run &quot;pvscan&quot; I only see two PVs belonging =
to my
VG &quot;bloaty&quot; and it shows:<br>
<br>
PV /dev/hdc1&nbsp;&nbsp; VG bloaty&nbsp;&nbsp; lvm2 [111.78 GB / 0&nbsp;&nb=
sp;&nbsp; free]<br>
PV /dev/hdd1&nbsp;&nbsp; VG bloaty&nbsp;&nbsp; lvm2 [115.03 GB / 64.00 MB f=
ree]<br>
Total: 2 [266.81 GB] / in use: 2 [226.81 GB] / in no VG: 0 [0&nbsp;&nbsp; ]=
<br>
<br>
LVM doesn't seem to notice /dev/hdb1?&nbsp; It's a 232.88 Gb PV, how
can this be?&nbsp; And why isn't PVSCAN complaining about a missing
PV?&nbsp; It should be, shouldn't it?<br>
<br>
When I perform a &quot;lvmdiskscan&quot; I get (the parenthesis outline my =
input):<br>
<br>
/dev/hda1 [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 101.94 MB]<br>
(^^this is the /boot partition)<br>
/dev/hdc1 [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 111.79 GB] LVM physical volume<br=
>
/dev/hda2 [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 17.54 GB]<br>
(^^this is the / partition)<br>
/dev/hda3 [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.00 GB]<br>
(^^this is the swap partition)<br>
/dev/hdb1 [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 232.88 GB]<br>
(^^THIS SHOULD BE A PV)<br>
/dev/hdd1 [&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 115.04 GB] LVM physical volume<br=
>
<br>
Is there some trick here I don't know about?&nbsp; Do I have to restore the=
 LVM conf?<br>
<br>
I am stumped.&nbsp; I'm pretty sure I'm not a newb, but I am definately
not a wizard.&nbsp; I've got my LPIC Level 1 cert if that means
anything.<br>
<br>
Heh, thanks for any help,<br>
Cory<br>

------=_Part_4314_8609806.1131557822424--
