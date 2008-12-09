Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mB9IIFkC005735
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 13:18:16 -0500
Received: from d01.online-netz.de (d01.online-netz.de [213.160.90.171])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mB9IGmUL020842
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 13:17:23 -0500
Received: from news.conactive.com (fandango.conactive.com [212.202.99.226])
	by d01.online-netz.de (Postfix) with ESMTP id 5EC60F9206
	for <linux-lvm@redhat.com>; Tue,  9 Dec 2008 19:16:43 +0100 (CET)
Date: Tue, 09 Dec 2008 19:16:43 +0100
Subject: Re: [linux-lvm] shift PV from disk to raid device?
Message-Id: <VA.000034f3.0453966b@news.conactive.com>
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

Thanks for the long reply, Stuart. Still trying to digest it. As a quick=20
info: I'm using CentoS 5.2 with mdadm-2.6.4-1.el5.

I created a partition /dev/sda3, created /dev/md2 with it and then=20
pvcreated /dev/sda3 mistakenly. I think (!) I remember that if I tried to=20
do it the other way around (create PV and LVs on /dev/sda3, then create an =

md device from sda3) it would fail with device busy until I deactivated=20
the LVs. Then I could do that and it seemingly worked and didn't destroy=20
the data. But there were some error messages when using pv/lvdisplay if I=20
remember right. I just did this for testing what I can do with all that as =

I had the chance to do it :-) before recreating the array the correct way=20
and filling it with my backup data on sdb3. Unfortunately, then I=20
overlooked this tiny bit and created the PV on the wrong device ...

Kai

--=20
Kai Sch=EF=BF=BDtzl, Berlin, Germany
Get your web at Conactive Internet Services: http://www.conactive.com
