Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mBA0Vd59020970
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 19:31:39 -0500
Received: from d01.online-netz.de (d01.online-netz.de [213.160.90.171])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mBA0VJYC007315
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 19:31:19 -0500
Received: from news.conactive.com (fandango.conactive.com [212.202.99.226])
	by d01.online-netz.de (Postfix) with ESMTP id 7F58AF922A
	for <linux-lvm@redhat.com>; Wed, 10 Dec 2008 01:31:15 +0100 (CET)
Date: Wed, 10 Dec 2008 01:31:15 +0100
Subject: Re: [linux-lvm] shift PV from disk to raid device?
Message-Id: <VA.00003502.05aa7bda@news.conactive.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Kai Schaetzl <maillists@conactive.com>
In-Reply-To: <VA.000034f7.04a27ead@news.conactive.com>
References: <VA.000034ec.0056c987@news.conactive.com>
	<493E48DE.3070705@redhat.com>
	<Pine.LNX.4.64.0812091146560.16428@bmsred.bmsi.com>
	<VA.000034f2.04473327@news.conactive.com>
	<493EB3A0.6020306@redhat.com>
	<VA.000034f4.0456d5b7@news.conactive.com>
	<Pine.LNX.4.64.0812091325290.17327@bmsred.bmsi.com>
	<VA.000034f7.04a27ead@news.conactive.com>
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

Kai Schaetzl wrote on Tue, 09 Dec 2008 20:42:54 +0100:

> So, I think I will just start over by removing /dev/sda3 now completely,
> recreating the raid array and then recreating the PV on it. I think I sho=
uld then=20
> be able to pvmove the LVs from /dev/sdb3 to /dev/md3, right?

pvmove worked great. Here's what I used to get back to my wanted setup:

boot with only one disk (sda)
vgchange -an dom1
pvremove /dev/sda3
reboot
mdadm --create /dev/md3 --level=3D1 --raid-devices=3D2 /dev/sda3 missing
pvcreate /dev/md3
pvextend dom0 /dev/md3
pvmove /dev/sdb3 /dev/md3
pvdisplay (shows /dev/sdb3 as empty now)
pvremove /dev/sdb3
vgreduce dom0 /dev/sdb3
pvremove /dev/sdb3
mdadm /dev/md3 -a /dev/sdb3

Thanks for all the help and information to everyone!

Kai

--=20
Kai Sch=EF=BF=BDtzl, Berlin, Germany
Get your web at Conactive Internet Services: http://www.conactive.com
