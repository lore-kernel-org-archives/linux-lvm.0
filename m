Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n1J37Zif002943
	for <linux-lvm@redhat.com>; Wed, 18 Feb 2009 22:07:35 -0500
Received: from rv-out-0506.google.com (rv-out-0506.google.com [209.85.198.226])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n1J36eKe004598
	for <linux-lvm@redhat.com>; Wed, 18 Feb 2009 22:06:40 -0500
Received: by rv-out-0506.google.com with SMTP id f6so212042rvb.51
	for <linux-lvm@redhat.com>; Wed, 18 Feb 2009 19:06:39 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 19 Feb 2009 11:06:39 +0800
Message-ID: <667c2e1e0902181906y350ad9afh8e51adf48381b1d1@mail.gmail.com>
From: Noob Centos Admin <centos.admin@gmail.com>
Content-Type: multipart/alternative; boundary=000e0cd1555238116c04633cd309
Subject: [linux-lvm] LVM Recovery Help
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

--000e0cd1555238116c04633cd309
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi, I need some urgent help with recovering a system from disk/MD/LVM
failure.

Background
=========
The system had 6 disks, 2x750GB, 2x1TB, 2x1.5TB. The 750GB were the original
drives and partitioned as
/boot (MD0), /tmp, /VolumeGroup
/boot(MD0), /swap, /VolumeGroup

The VolGroup01 is PV on  /dev/md1 an MD Raid 1 array. Logical groups for
/root (LV_Root), /home (LV_Home), /var (LV_Var) and /home/data (LV_Data)
were created.

The 1TB and 1.5TB were added subsequently as MD Raid 1 PV to the same
VolumeGroup to expand only LV_Data.

Note: The 1TB were added to the system with a reformat/re-install because I
screwed up the manual hot add so ananconda did most of it. But with the
1.5TB, having learnt more, was manually added and I made the mistake of
somehow creating it on /dev/md  without any node number.

Situation
======
For 4 months everything was fine and dandy until something hit the server
(which I now guess is the 1.5TB Seagate finally deciding to do the fall out
of raid array thing people were talking about) causing smb to freeze and a
high WA% (0.5~0.6) to be experienced. At this point both smartd and
proc/mdstat indicates no disk problem though.

Rebooting the machine caused it to freeze on boot until one of the 1TB was
removed, upon which LVM choke because it cannot find one of the physical
devices in the Volgroup. This struck me as odd since all PV are raid 1 so it
shouldn't matter if I took out one drive.

Replacing the drive with a new and cloned replacement did not solve this
problem.

Further investigation indicates the missing physical device UUID pointed to
the PV using /dev/md aka the 1.5TB Seagates. So thinking that maybe the
array totally crapped out with both drives dropping out, I tried to recreate
the md device.

Attempts so far
===========
Restoring the MD arrays
-----------------------------------

Following instructions on line, using the Centos 5.1 DVD linux rescue mode,
I used mdadm --examine --scan to determine the MD members and recreate a
/etc/mdadm.conf. mdadm -A -s correctly loads up the MD devices each with
only 1 device for now to keep the other disk safe from my meddling.

Note: prior to finding the correct instructions, I had changed the MD uuid
of two of the arrays by mistakenly trying to recreate the md devices
manually using mdadm --create. However, this appears to be fine as --create
did not initialize the drives, the data are still intact as later events
prove. I'm only concerned that the changed uuid might be a contributing
factor later to the LVM situation.

Following that, I followed other instructions to determine the
original/latest LVM definitions by extracting the meta data using dd to dump
the first 255 bytes. This was when I noted the problem of one of the PV
using /dev/md since I did it correctly this time round and the 1.5TB is
using /dev/md3 instead.

I tried to change the md config, manually creating the /dev/md node with
mknod and editing mdadm.conf to use that for the 1.5TB. That worked and I
could activate the volume group, mount  LV_Root and access it.

However after updating LV_Root/etc/mdadm.conf, a reboot faced the same
problem. LVM still could not find the physical device used by the PV.

So I thought maybe that's because md would not recreate the /dev/md device
since it's an abnormality.

Hence I redit the md conf to use /dev/md3, followed instructions online to
update the LVM configuration, updating the PV with the problematic uuid to
use /dev/md3 instead of /dev/md

After all this was done, confirmed to work in rescue mode, I rebooted
again... and got the same problem.

Since I cannot boot even into a command line normally, there was no way for
me to determine if LVM was still trying to find /dev/md or did md failed to
load the new md configuration, or something else was going on.

After more probing, I realized that in rescue mode, I could mount all my LV
except LV_Var, which mount complains is not a valid file or directory.

Since LV_Var was just /var and pehaps mistakenly I thought it was not
crucial, I dropped LV_Var and recreated the LV. I did not make any fs on it
because I could not figured out how, since makefs was not available in
rescue mode. Not sure if that will affect things.

But mount still won't mount the newly created LV, same error message.

At this point I have no idea what else could I try or do except plan for the
worst, i.e. buy 2x 1.5TB drives and spend wait 10 hours to copy everything
in rescue mode and redo the whole system again.

However, before that, I would still like to know if anything still can be
done to restore the system and learn what was it I did wrong or what went
wrong so that I could be prepared for it if it happens again.

Thanks for reading this long chunk of noob misadventure :)

--000e0cd1555238116c04633cd309
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi, I need some urgent help with recovering a system from disk/MD/LVM failu=
re.<br><br>Background<br>=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>The system had 6 di=
sks, 2x750GB, 2x1TB, 2x1.5TB. The 750GB were the original drives and partit=
ioned as<br>/boot (MD0), /tmp, /VolumeGroup<br>
/boot(MD0), /swap, /VolumeGroup<br><br>The VolGroup01 is PV on&nbsp; /dev/m=
d1 an MD Raid 1 array. Logical groups for /root (LV_Root), /home (LV_Home),=
 /var (LV_Var) and /home/data (LV_Data) were created.<br><br>The 1TB and 1.=
5TB were added subsequently as MD Raid 1 PV to the same VolumeGroup to expa=
nd only LV_Data.<br>
<br>Note: The 1TB were added to the system with a reformat/re-install becau=
se I screwed up the manual hot add so ananconda did most of it. But with th=
e 1.5TB, having learnt more, was manually added and I made the mistake of s=
omehow creating it on /dev/md&nbsp; without any node number.<br>
<br>Situation<br>=3D=3D=3D=3D=3D=3D<br>For 4 months everything was fine and=
 dandy until something hit the server (which I now guess is the 1.5TB Seaga=
te finally deciding to do the fall out of raid array thing people were talk=
ing about) causing smb to freeze and a high WA% (0.5~0.6) to be experienced=
. At this point both smartd and proc/mdstat indicates no disk problem thoug=
h.<br>
<br>Rebooting the machine caused it to freeze on boot until one of the 1TB =
was removed, upon which LVM choke because it cannot find one of the physica=
l devices in the Volgroup. This struck me as odd since all PV are raid 1 so=
 it shouldn&#39;t matter if I took out one drive.<br>
<br>Replacing the drive with a new and cloned replacement did not solve thi=
s problem.<br><br>Further investigation indicates the missing physical devi=
ce UUID pointed to the PV using /dev/md aka the 1.5TB Seagates. So thinking=
 that maybe the array totally crapped out with both drives dropping out, I =
tried to recreate the md device.<br>
<br>Attempts so far<br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>Restoring the M=
D arrays<br>-----------------------------------<br><br>Following instructio=
ns on line, using the Centos 5.1 DVD linux rescue mode, I used mdadm --exam=
ine --scan to determine the MD members and recreate a /etc/mdadm.conf. mdad=
m -A -s correctly loads up the MD devices each with only 1 device for now t=
o keep the other disk safe from my meddling.<br>
<br>Note: prior to finding the correct instructions, I had changed the MD u=
uid of two of the arrays by mistakenly trying to recreate the md devices ma=
nually using mdadm --create. However, this appears to be fine as --create d=
id not initialize the drives, the data are still intact as later events pro=
ve. I&#39;m only concerned that the changed uuid might be a contributing fa=
ctor later to the LVM situation.<br>
<br>Following that, I followed other instructions to determine the original=
/latest LVM definitions by extracting the meta data using dd to dump the fi=
rst 255 bytes. This was when I noted the problem of one of the PV using /de=
v/md since I did it correctly this time round and the 1.5TB is using /dev/m=
d3 instead.<br>
<br>I tried to change the md config, manually creating the /dev/md node wit=
h mknod and editing mdadm.conf to use that for the 1.5TB. That worked and I=
 could activate the volume group, mount&nbsp; LV_Root and access it.<br><br=
>
However after updating LV_Root/etc/mdadm.conf, a reboot faced the same prob=
lem. LVM still could not find the physical device used by the PV.<br><br>So=
 I thought maybe that&#39;s because md would not recreate the /dev/md devic=
e since it&#39;s an abnormality.<br>
<br>Hence I redit the md conf to use /dev/md3, followed instructions online=
 to update the LVM configuration, updating the PV with the problematic uuid=
 to use /dev/md3 instead of /dev/md<br><br>After all this was done, confirm=
ed to work in rescue mode, I rebooted again... and got the same problem.<br=
>
<br>Since I cannot boot even into a command line normally, there was no way=
 for me to determine if LVM was still trying to find /dev/md or did md fail=
ed to load the new md configuration, or something else was going on.<br>
<br>After more probing, I realized that in rescue mode, I could mount all m=
y LV except LV_Var, which mount complains is not a valid file or directory.=
 <br><br>Since LV_Var was just /var and pehaps mistakenly I thought it was =
not crucial, I dropped LV_Var and recreated the LV. I did not make any fs o=
n it because I could not figured out how, since makefs was not available in=
 rescue mode. Not sure if that will affect things.<br>
<br>But mount still won&#39;t mount the newly created LV, same error messag=
e. <br><br>At this point I have no idea what else could I try or do except =
plan for the worst, i.e. buy 2x 1.5TB drives and spend wait 10 hours to cop=
y everything in rescue mode and redo the whole system again.<br>
<br>However, before that, I would still like to know if anything still can =
be done to restore the system and learn what was it I did wrong or what wen=
t wrong so that I could be prepared for it if it happens again.<br><br>
Thanks for reading this long chunk of noob misadventure :)<br><br>

--000e0cd1555238116c04633cd309--
