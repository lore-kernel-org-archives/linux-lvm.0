Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8GKMlPO017259
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 16:22:47 -0400
Received: from interhosting.it (smtpauth.interfree.it [213.158.72.43])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id n8GKMZfk028211
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 16:22:36 -0400
Received: from delo.gdit (delo.gdit [127.0.0.1])
	by delo.gdit (8.14.2/8.14.2) with ESMTP id n8GKMX4D004511
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 22:22:33 +0200
Received: (from root@localhost)
	by delo.gdit (8.14.2/8.14.2/Submit) id n8GKMXIG004509
	for linux-lvm@redhat.com; Wed, 16 Sep 2009 22:22:33 +0200
Subject: Re: [linux-lvm] Using LVM Mirroring to obtain a usable backup
From: Ambrogio De Lorenzo <ambrogio.de.lorenzo@alice.it>
In-Reply-To: <20090916220353.23932049@fixlaptop.gillibert.homelinux.net>
References: <1253109566.5326.15.camel@delo.gdit>
	<20090916170533.62999698@fixlaptop.gillibert.homelinux.net>
	<1253119669.5326.32.camel@delo.gdit>
	<20090916220353.23932049@fixlaptop.gillibert.homelinux.net>
Date: Wed, 16 Sep 2009 22:22:33 +0200
Message-Id: <1253132553.3243.18.camel@delo.gdit>
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

Il giorno mer, 16/09/2009 alle 22.03 +0200, Andr=C3=A9 Gillibert ha scritto:

> > snapshot is not a good choise for me. I want to have an identical copy
> > (like dd) on another identical disk, for fast recovery in case of
> > failure.
> >=20
>=20
> Then, create a short-lived snapshot, dd the snapshot to the other disk, a=
nd then, remove the snapshot.

Hm...=20
Another no good approach.
In this way I loose everything appens to disk between the moment in
which I take the snap and the time in which dd end. I think at least 6/7
hours.

The good and most secure way is to mirror disks. In this way all blocks
are replicated, all I/O are replicated and disks are syncronized when I
shutdown the OS.

I will shutdown in a few moments and start an offline dd. Is the last
chance.
I hope it end fast

Bye
 Ambrogio
