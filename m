Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mB9KGHv2017126
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 15:16:17 -0500
Received: from d01.online-netz.de (d01.online-netz.de [213.160.90.171])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id mB9KG0mh018537
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 15:16:00 -0500
Received: from news.conactive.com (fandango.conactive.com [212.202.99.226])
	by d01.online-netz.de (Postfix) with ESMTP id 8B346F9229
	for <linux-lvm@redhat.com>; Tue,  9 Dec 2008 21:15:15 +0100 (CET)
Date: Tue, 09 Dec 2008 21:15:15 +0100
Subject: Re: [linux-lvm] shift PV from disk to raid device?
Message-Id: <VA.000034fb.04c01c18@news.conactive.com>
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

> The solution to this problem is to create the raid device with a
> superblock format of 1.1 or 1.2 (aka, -e 1.1 or -e 1.2).

Is this an option to mdraid? mdadm --create --help doesn't show me this=20
option. Might mdadm-2.6.4-1.el5 on 5.2 be too old? Or is this an option to =

fdisk/sfdisk?

Kai

--=20
Kai Sch=EF=BF=BDtzl, Berlin, Germany
Get your web at Conactive Internet Services: http://www.conactive.com
