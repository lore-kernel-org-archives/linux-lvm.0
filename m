Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8GF5moB028504
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 11:05:48 -0400
Received: from smtp2b.orange.fr (smtp2b.orange.fr [80.12.242.146])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8GF5a9n012714
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 11:05:37 -0400
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf2b19.orange.fr (SMTP Server) with ESMTP id 0F68080000B6
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 17:05:36 +0200 (CEST)
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf2b19.orange.fr (SMTP Server) with ESMTP id 028E380000A3
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 17:05:36 +0200 (CEST)
Received: from gillibert.homelinux.net
	(ACaen-251-1-53-207.w83-115.abo.wanadoo.fr [83.115.195.207])
	by mwinf2b19.orange.fr (SMTP Server) with ESMTP id C58B180000B6
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 17:05:35 +0200 (CEST)
Received: from fixlaptop ([192.168.1.209]
	helo=fixlaptop.gillibert.homelinux.net)
	by gillibert.homelinux.net with esmtp (Exim 4.69)
	(envelope-from <rcvxdg@gmail.com>) id 1Mnw4c-0005ua-FX
	for linux-lvm@redhat.com; Wed, 16 Sep 2009 17:05:34 +0200
Date: Wed, 16 Sep 2009 17:05:33 +0200
From: =?UTF-8?B?QW5kcsOp?= Gillibert <rcvxdg@gmail.com>
Subject: Re: [linux-lvm] Using LVM Mirroring to obtain a usable backup
Message-ID: <20090916170533.62999698@fixlaptop.gillibert.homelinux.net>
In-Reply-To: <1253109566.5326.15.camel@delo.gdit>
References: <1253109566.5326.15.camel@delo.gdit>
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

Ambrogio De Lorenzo <ambrogio.de.lorenzo@alice.it> wrote:
> Hi all.
> I'm doing a big upgrade on my computer and I tryed to use lv mirroring
> to obtain a copy of my data before to do it.
>=20
> As I do with LVM on other OS i thought that after mirroring one could
> chose to split the mirrored lv.
>=20
> I can't find how to do it with LVM2 on Linux.
>=20
> There is a way?

Mirroring is software RAID1.
What you want looks like LVM snapshots.
See LVM HOWTO to see how to create snapshots.
A backup may be a good thing to do, too.

--=20
Andr=C3=A9 Gillibert
