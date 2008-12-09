Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mB9IMOXq008128
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 13:22:24 -0500
Received: from d01.online-netz.de (d01.online-netz.de [213.160.90.171])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mB9IKJCn022913
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 13:20:53 -0500
Received: from news.conactive.com (fandango.conactive.com [212.202.99.226])
	by d01.online-netz.de (Postfix) with ESMTP id 8D560F9206
	for <linux-lvm@redhat.com>; Tue,  9 Dec 2008 19:20:15 +0100 (CET)
Date: Tue, 09 Dec 2008 19:20:15 +0100
Subject: Re: [linux-lvm] shift PV from disk to raid device?
Message-Id: <VA.000034f4.0456d5b7@news.conactive.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Kai Schaetzl <maillists@conactive.com>
In-Reply-To: <493EB3A0.6020306@redhat.com>
References: <VA.000034ec.0056c987@news.conactive.com>
	<493E48DE.3070705@redhat.com>
	<Pine.LNX.4.64.0812091146560.16428@bmsred.bmsi.com>
	<VA.000034f2.04473327@news.conactive.com>
	<493EB3A0.6020306@redhat.com>
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

Bryn M. Reeves wrote on Tue, 09 Dec 2008 18:06:24 +0000:

> Are you sure? If the MD array is a straightforward RAID1 mirror of two=20
> SD devices then the PV data should also be visible on the MD device -=20
> see my other post.

how could I confirm that? pvs? No, it gives me:

  Found duplicate PV cs0HTBNIjwhdDD2fd6wvHTzAN61x8aWD: using /dev/sdb3 not =

/dev/sda3
  PV         VG   Fmt  Attr PSize   PFree
  /dev/sdb3  dom0 lvm2 a-   456.34G 350.34G

Kai

--=20
Kai Sch=EF=BF=BDtzl, Berlin, Germany
Get your web at Conactive Internet Services: http://www.conactive.com
