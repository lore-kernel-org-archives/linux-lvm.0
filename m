Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mB9D9l6G019593
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 08:09:47 -0500
Received: from d01.online-netz.de (d01.online-netz.de [213.160.90.171])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mB9D9UfC011286
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 08:09:31 -0500
Received: from news.conactive.com (fandango.conactive.com [212.202.99.226])
	by d01.online-netz.de (Postfix) with ESMTP id B099CF882D
	for <linux-lvm@redhat.com>; Tue,  9 Dec 2008 14:09:26 +0100 (CET)
Date: Tue, 09 Dec 2008 14:09:26 +0100
Subject: Re: [linux-lvm] shift PV from disk to raid device?
Message-Id: <VA.000034ed.033a3e5f@news.conactive.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Kai Schaetzl <maillists@conactive.com>
In-Reply-To: <493E48DE.3070705@redhat.com>
References: <VA.000034ec.0056c987@news.conactive.com>
	<493E48DE.3070705@redhat.com>
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

Bryn M. Reeves wrote on Tue, 09 Dec 2008 10:30:54 +0000:

I notice that I wrote "/dev/sda" where I should have written "/dev/sda3",=20
of course. But I guess this doesn't make a difference.

> pvmove

thank you. I remember this command from reading the LVM how-to some months =

ago, but had forgotten by now. I had checked the pvchange command, but not =

this one. After reading man pvmove I'm not sure if using that would really =

be helpful. If I understand correctly using it will still copy a lot of=20
data (all the data on the LVs). Basically it seems to move out all data=20
from dev/sdan to a temporary lv, then move them back in to /dev/mdn. From=20
my non-expert view this might create a quite "unfavorable" data layout as=20
it is all happening within the same "data location" on the disk. And all=20
in all it might also take longer than a brute-force approach. I had hoped=20
there's some way to just move lvm metadata so that it knows it belongs to=20
/dev/mdn and not /dev/sdan anymore.
So, I wonder if it isn't as good or even better if I do the following:

- break the raid array md2=20
   (made from /dev/sda3 and /dev/sdb3 with duplicate PVs)
- remove the PV on /dev/sda3
- recreate it and all LVs on /dev/md2
- copy over the data from the LVs on /dev/sdb3

?

Kai

--=20
Kai Sch=EF=BF=BDtzl, Berlin, Germany
Get your web at Conactive Internet Services: http://www.conactive.com
