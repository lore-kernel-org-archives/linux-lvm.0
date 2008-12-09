Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mB9IY6V7016393
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 13:34:06 -0500
Received: from d01.online-netz.de (d01.online-netz.de [213.160.90.171])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mB9IX3Fk029943
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 13:33:04 -0500
Received: from news.conactive.com (fandango.conactive.com [212.202.99.226])
	by d01.online-netz.de (Postfix) with ESMTP id 7DD9DF9206
	for <linux-lvm@redhat.com>; Tue,  9 Dec 2008 19:32:58 +0100 (CET)
Date: Tue, 09 Dec 2008 19:32:58 +0100
Subject: Re: [linux-lvm] shift PV from disk to raid device?
Message-Id: <VA.000034f5.04627a10@news.conactive.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Kai Schaetzl <maillists@conactive.com>
In-Reply-To: <493EAC86.6010104@redhat.com>
References: <VA.000034ec.0056c987@news.conactive.com>
	<493E48DE.3070705@redhat.com>
	<Pine.LNX.4.64.0812091146560.16428@bmsred.bmsi.com>
	<493EAC86.6010104@redhat.com>
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

Bryn M. Reeves wrote on Tue, 09 Dec 2008 17:36:06 +0000:

> I'd have thought that you could just take a metadata backup=20
> (vgcfgbackup), wipe the labels from all devices and then run:
>=20
>    pvcreate --uuid=3D$the_uuid --restorefile=3D/path/to/backup /dev/md2
>    vgcfgrestore -f /path/to/backup $vgname

I had thought about something using vgcfgrestore, but wasn't sure after=20
reading the man pages if it would really help. I thought the restore might =

still contain information that it was on /dev/sd.. before and thus just=20
create the same situation again.

Possible sequence of commands:

- remove sdb3 from array
- check if PV sda3 and dom0 is now up and ok
- vgcfgbackup dom0 -f somefile
- wipe the labels on sda3 (how?)
- pvcreate --uuid=3Dnew uid? --restorefile=3Dsomefile /dev/md2
- vgcfgrestore -f somefile dom0

???

Kai

--=20
Kai Sch=EF=BF=BDtzl, Berlin, Germany
Get your web at Conactive Internet Services: http://www.conactive.com
