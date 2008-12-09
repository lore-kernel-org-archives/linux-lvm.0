Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mB9HNFj0026838
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 12:23:15 -0500
Received: from d01.online-netz.de (d01.online-netz.de [213.160.90.171])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mB9HN05F020688
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 12:23:00 -0500
Received: from news.conactive.com (fandango.conactive.com [212.202.99.226])
	by d01.online-netz.de (Postfix) with ESMTP id 75276F90D1
	for <linux-lvm@redhat.com>; Tue,  9 Dec 2008 18:22:54 +0100 (CET)
Date: Tue, 09 Dec 2008 18:22:54 +0100
Subject: Re: [linux-lvm] shift PV from disk to raid device?
Message-Id: <VA.000034f0.04225307@news.conactive.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Kai Schaetzl <maillists@conactive.com>
In-Reply-To: <493E7FB1.2090403@redhat.com>
References: <VA.000034ec.0056c987@news.conactive.com>
	<493E48DE.3070705@redhat.com>
	<VA.000034ed.033a3e5f@news.conactive.com>
	<493E7FB1.2090403@redhat.com>
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

Bryn M. Reeves wrote on Tue, 09 Dec 2008 14:24:49 +0000:

> I also don't really=20
> understand why you want to do all this if the data is already on md2.

Maybe I didn't make the problem clear in my first posting.
I created a single member md RAID1 device /dev/md2 on top of /dev/sda3=20
(single member because the other disk /dev/sdb3 was holding the data).=20
Then I created a PV on /dev/sda3 and a VG on it. I should have done this=20
on /dev/md2, though. Small oversight on my part. (I had to recreate that=20
array after a complete lowlevel format of the disk and I had the data all=20
fine on /dev/sdb3. So I accidentally created the PV on the "counterpart"=20
/dev/sda3 instead of the existing raid device.)
Then I moved all the LVs and data back on that PV, added /dev/sdb3 to the=20
md device and let it sync. And now I have two identical PVs on both disks=20
instead of one PV on the md device.
So, you think pvmove /dev/sda3 /dev/md2 would just do what I want?
Should I break the array and perform the move on the single member array,=20
so that I can keep my data on /dev/sdb3 in case something goes wrong?

Kai

--=20
Kai Sch=EF=BF=BDtzl, Berlin, Germany
Get your web at Conactive Internet Services: http://www.conactive.com
