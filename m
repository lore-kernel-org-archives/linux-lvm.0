Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mB9I3i7g021115
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 13:03:44 -0500
Received: from d01.online-netz.de (d01.online-netz.de [213.160.90.171])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mB9I3HQ1013862
	for <linux-lvm@redhat.com>; Tue, 9 Dec 2008 13:03:17 -0500
Received: from news.conactive.com (fandango.conactive.com [212.202.99.226])
	by d01.online-netz.de (Postfix) with ESMTP id 3C906F90D1
	for <linux-lvm@redhat.com>; Tue,  9 Dec 2008 19:03:11 +0100 (CET)
Date: Tue, 09 Dec 2008 19:03:11 +0100
Subject: Re: [linux-lvm] shift PV from disk to raid device?
Message-Id: <VA.000034f2.04473327@news.conactive.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Kai Schaetzl <maillists@conactive.com>
In-Reply-To: <Pine.LNX.4.64.0812091146560.16428@bmsred.bmsi.com>
References: <VA.000034ec.0056c987@news.conactive.com>
	<493E48DE.3070705@redhat.com>
	<Pine.LNX.4.64.0812091146560.16428@bmsred.bmsi.com>
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

Stuart D. Gathman wrote on Tue, 9 Dec 2008 11:54:08 -0500 (EST):

Hallo, thanks for the suggestions. I'll try to follow that logically and wi=
th=20
possible commands, see below with comments/questions.

> 1) remove sda from md2 array

mdadm /dev/md2 --fail /dev/sda3 --remove /dev/sda3

> 2) use dd or pvremove to clear PV info in md2.  This should not
>    affect sda since sda is removed from md2

md2 shouldn't have PV info. do you mean sdb3? (this would destroy my data o=
n=20
sdb3 then), so:

vgchange dom0 -an (deactivate the LVs on sdb3)
pvremove /dev/sdb3 ?
After this point a pvdisplay should show /dev/sda3 as the active PV for dom=
0.
(At the moment I get: "using /dev/sdb3 not /dev/sda3")

> 3) pvcreate md2 as a new PV and add to volume group

pvcreate /dev/md2
I fear I will get "device busy", not? (just a feeling from recent experienc=
e=20
with juggling with md and lvm that are on top of each other)
vgextend dom0 /dev/md2
(dom0 then consists of sda3 and md2)

> 4) pvmove sda -> md2.  The data should physically go on sdb, or whatever =
the
>    other mirror of md2 is.

ok

> 5) check that all LVs are gone from sda, and remove from volume group

vgreduce dom0 /dev/sda

> 6) pvremove sda

ok

> 7) add sda to md2 array, and synchronize.

ok

Did I get it so far correctly? What about (2) (3) where I'm not sure?



Kai

--=20
Kai Sch=EF=BF=BDtzl, Berlin, Germany
Get your web at Conactive Internet Services: http://www.conactive.com
