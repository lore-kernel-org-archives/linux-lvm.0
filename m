Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8GGm4YR023130
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 12:48:04 -0400
Received: from interhosting.it (smtpauth.interfree.it [213.158.72.43])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id n8GGlpkd008228
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 12:47:52 -0400
Received: from delo.gdit (delo.gdit [127.0.0.1])
	by delo.gdit (8.14.2/8.14.2) with ESMTP id n8GGloP3019393
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 18:47:50 +0200
Received: (from root@localhost)
	by delo.gdit (8.14.2/8.14.2/Submit) id n8GGlnVl019391
	for linux-lvm@redhat.com; Wed, 16 Sep 2009 18:47:49 +0200
Subject: Re: [linux-lvm] Using LVM Mirroring to obtain a usable backup
From: Ambrogio De Lorenzo <ambrogio.de.lorenzo@alice.it>
In-Reply-To: <20090916170533.62999698@fixlaptop.gillibert.homelinux.net>
References: <1253109566.5326.15.camel@delo.gdit>
	<20090916170533.62999698@fixlaptop.gillibert.homelinux.net>
Date: Wed, 16 Sep 2009 18:47:49 +0200
Message-Id: <1253119669.5326.32.camel@delo.gdit>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Il giorno mer, 16/09/2009 alle 17.05 +0200, Andr=C3=A9 Gillibert ha scritto:

> Mirroring is software RAID1.
> What you want looks like LVM snapshots.
> See LVM HOWTO to see how to create snapshots.
> A backup may be a good thing to do, too.

snapshot is not a good choise for me. I want to have an identical copy
(like dd) on another identical disk, for fast recovery in case of
failure.

This is what I do with raid hardware, and I would like to know if is
possible to do it with lvm mirroring.

I'm looking also on mdadm to mirror a disk (or partition) but I think it
is not usable when disk is already partitioned and used without mdadm.

Backup is good but is not a good choise in this case, because a full
restore is a long process

Tnx
 Ambrogio
