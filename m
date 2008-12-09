Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mB9JhC0B029118
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 14:43:12 -0500
Received: from d01.online-netz.de (d01.online-netz.de [213.160.90.171])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mB9JgwCm008689
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 14:42:59 -0500
Received: from news.conactive.com (fandango.conactive.com [212.202.99.226])
	by d01.online-netz.de (Postfix) with ESMTP id F1D60F90D1
	for <linux-lvm@redhat.com>; Tue,  9 Dec 2008 20:42:53 +0100 (CET)
Date: Tue, 09 Dec 2008 20:42:54 +0100
Subject: Re: [linux-lvm] shift PV from disk to raid device?
Message-Id: <VA.000034f7.04a27ead@news.conactive.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Kai Schaetzl <maillists@conactive.com>
In-Reply-To: <Pine.LNX.4.64.0812091325290.17327@bmsred.bmsi.com>
References: <VA.000034ec.0056c987@news.conactive.com>
	<493E48DE.3070705@redhat.com>
	<Pine.LNX.4.64.0812091146560.16428@bmsred.bmsi.com>
	<VA.000034f2.04473327@news.conactive.com>
	<493EB3A0.6020306@redhat.com>
	<VA.000034f4.0456d5b7@news.conactive.com>
	<Pine.LNX.4.64.0812091325290.17327@bmsred.bmsi.com>
Reply-To: maillists@conactive.com,
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

Stuart D. Gathman wrote on Tue, 9 Dec 2008 13:38:46 -0500 (EST):

> 1) create md2 from sda3 and sdb3
> 2) pvcreate md2
> 3) add sda3 to VG - LVM complains about dup and uses sdb3 instead

A bit different. But thanks for this hint. I checked my bash history now.=20
Short summary:

mdadm --create --verbose /dev/md3 --level=3D1 --raid-devices=3D2 /dev/sda3 =
missing
mdadm --detail /dev/md3
pvcreate /dev/md3
pvcreate /dev/md3 -ff
vgcreate dom1 /dev/md3 (to avoid name clash with dom0 on sdb3)
.. some lvcreate and other stuff
mdadm --detail /dev/md3
reboot
vgchange dom1 -an

vgrename dom1 dom0


vgchange dom0 -ay
mdadm /dev/md3 -a /dev/sdb3
reboot

So, I did it all alright. I was wrong with my assumption about using the wr=
ong=20
device for the PV. However, I only notice now that /dev/md3 is gone for goo=
d,=20
mdadm cannot find it. I had not been paying attention and thought that md2 =
was=20
the array in question. (Thinking md0=3Dsda1/sdb1, md1=3Dsda2/sdb2, md2=3Dsd=
a3/sdb3, but=20
I used md0=3Dsda1/sdb1, md2=3Dsda2/sdb2, md3=3Dsda3/sdb3). So I didn't noti=
ce it.

Going further back in the history, it seems I forgot to pvremove the earlie=
r=20
existing PV /dev/sda3 (which had the same structure and data) before creati=
ng the=20
PV on /dev/md3. That's why I had to -ff /dev/md3 I assume. It seems that af=
ter=20
adding sdb3 to the array and rebooting the array dissolved completely and t=
he=20
existing PVs on sda3 and sdb3 came back into existence. And I thought it wa=
s an=20
effect of the mirror sync.

So, I think I will just start over by removing /dev/sda3 now completely,
recreating the raid array and then recreating the PV on it. I think I shoul=
d then=20
be able to pvmove the LVs from /dev/sdb3 to /dev/md3, right? Problem solved=
. This=20
time.

However, as this is the second time that this or a similar array just vanis=
hes I=20
wonder if there's something else going on. e.g. some kind of unwanted inter=
action=20
between LVM and mdraid partitions. The other two raid arrays on the disk ar=
e=20
absolutely stable and don't use LVM.



Kai

--=20
Kai Sch=EF=BF=BDtzl, Berlin, Germany
Get your web at Conactive Internet Services: http://www.conactive.co
