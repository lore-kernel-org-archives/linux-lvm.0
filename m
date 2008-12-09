Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mB9Ko2dQ007539
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 15:50:02 -0500
Received: from d01.online-netz.de (d01.online-netz.de [213.160.90.171])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mB9Knihw020380
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 15:49:44 -0500
Received: from news.conactive.com (fandango.conactive.com [212.202.99.226])
	by d01.online-netz.de (Postfix) with ESMTP id 349CDF9206
	for <linux-lvm@redhat.com>; Tue,  9 Dec 2008 21:49:40 +0100 (CET)
Date: Tue, 09 Dec 2008 21:49:40 +0100
Subject: Re: [linux-lvm] shift PV from disk to raid device?
Message-Id: <VA.000034fd.04df9fe8@news.conactive.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Kai Schaetzl <maillists@conactive.com>
In-Reply-To: <1228852584.32405.37.camel@firewall.xsintricity.com>
References: <VA.000034ec.0056c987@news.conactive.com>
	<493E48DE.3070705@redhat.com>
	<Pine.LNX.4.64.0812091146560.16428@bmsred.bmsi.com>
	<VA.000034f2.04473327@news.conactive.com>
	<493EB3A0.6020306@redhat.com>
	<VA.000034f4.0456d5b7@news.conactive.com>
	<Pine.LNX.4.64.0812091325290.17327@bmsred.bmsi.com>
	<VA.000034f7.04a27ead@news.conactive.com>
	<1228852584.32405.37.camel@firewall.xsintricity.com>
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

Doug Ledford wrote on Tue, 09 Dec 2008 14:56:24 -0500:

> One thing that might be happening here (and I'm not sure since I'm not
> an LVM expert) is that when the lvm stack finds the pv on /dev/sdb3
> or /dev/sda3, it sees a full size partition (meaning it can access all
> the way to the end of the device).

But this couldn't normally happen if I just created LVM on top of the md=20
device, correct? However, as I created a PV on /dev/sda3, did not remove=20
it and then create the md array on it and then the PV on the md device=20
there might be something going on ... especially in case the array broke.

> The solution to this problem is to create the raid device with a
> superblock format of 1.1 or 1.2 (aka, -e 1.1 or -e 1.2).

man mdadm gives the difference between 1.1 and 1.2 as 1.2 putting the RAID =

superblock 4k after the beginning. Is this another measure against=20
accidental overwrites? Would you recommend 1.2 if I were to use a newer=20
superblock version?

Kai

--=20
Kai Sch=EF=BF=BDtzl, Berlin, Germany
Get your web at Conactive Internet Services: http://www.conactive.com
