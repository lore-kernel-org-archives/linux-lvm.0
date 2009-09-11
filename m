Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8BDeEBC004246
	for <linux-lvm@redhat.com>; Fri, 11 Sep 2009 09:40:14 -0400
Received: from smtp2b.orange.fr (smtp2b.orange.fr [80.12.242.144])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8BDe05Y029622
	for <linux-lvm@redhat.com>; Fri, 11 Sep 2009 09:40:01 -0400
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf2b04.orange.fr (SMTP Server) with ESMTP id 26D7470000A6
	for <linux-lvm@redhat.com>; Fri, 11 Sep 2009 15:40:00 +0200 (CEST)
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf2b04.orange.fr (SMTP Server) with ESMTP id 170BD70000B9
	for <linux-lvm@redhat.com>; Fri, 11 Sep 2009 15:40:00 +0200 (CEST)
Received: from gillibert.homelinux.net
	(ACaen-251-1-56-139.w83-115.abo.wanadoo.fr [83.115.198.139])
	by mwinf2b04.orange.fr (SMTP Server) with ESMTP id CED2570000A6
	for <linux-lvm@redhat.com>; Fri, 11 Sep 2009 15:39:59 +0200 (CEST)
Received: from fixlaptop ([192.168.1.209]
	helo=fixlaptop.gillibert.homelinux.net)
	by gillibert.homelinux.net with esmtp (Exim 4.69)
	(envelope-from <rcvxdg@gmail.com>) id 1Mm6M3-0004wQ-7w
	for linux-lvm@redhat.com; Fri, 11 Sep 2009 15:39:59 +0200
Date: Fri, 11 Sep 2009 15:39:58 +0200
From: =?UTF-8?B?QW5kcsOp?= Gillibert <rcvxdg@gmail.com>
Subject: Re: [linux-lvm] Understanding if a disk is partioned with LVM or not
Message-ID: <20090911153958.24cc2cdc@fixlaptop.gillibert.homelinux.net>
In-Reply-To: <352f9c2a0909100135i64ac861awaf7089ea27c1b3b3@mail.gmail.com>
References: <352f9c2a0909092319h2e115e07lbf867825c68c102e@mail.gmail.com>
	<20090910063511.GA7247@maude.comedia.it>
	<352f9c2a0909100135i64ac861awaf7089ea27c1b3b3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm@redhat.com

pent 5971 <pent5971@gmail.com> wrote:
> Hi,
> Luca thanks for your answer . the disk seems to be regular one. So for
> the new added disk
> i have followed the
> http://jamesthornton.com/redhat/linux/7.3/Reference-Guide/s1-filesystem-e=
xt3-create.html
>  and rebooted the server (edited the fstab ). But the disk doesnt seem
> to be
> mounted . So what can be the problem?
>=20
1) Check that the relevant partitions exist. Assuming your disk is /dev/sdb=
, partitions may be /dev/sdb1 /dev/sdb2, etc.
2) Try to mount them manually.
Your boot script may not automatically mount all partitions. In that case:
$ mount /mount/point
should work.
Or, maybe there's an issue with label detection.
In that case, specify the partition.
$ mount -t ext3 /dev/sdb1 /mount/point

--=20
Andr=C3=A9 Gillibert
