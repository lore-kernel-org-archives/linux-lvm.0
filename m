Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8JMHdnm000673
	for <linux-lvm@redhat.com>; Sat, 19 Sep 2009 18:17:39 -0400
Received: from smtp27.orange.fr (smtp27.orange.fr [80.12.242.95])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8JMHUtV017192
	for <linux-lvm@redhat.com>; Sat, 19 Sep 2009 18:17:31 -0400
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf2711.orange.fr (SMTP Server) with ESMTP id 4A6151C00085
	for <linux-lvm@redhat.com>; Sun, 20 Sep 2009 00:17:29 +0200 (CEST)
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf2711.orange.fr (SMTP Server) with ESMTP id 3AEDF1C00088
	for <linux-lvm@redhat.com>; Sun, 20 Sep 2009 00:17:29 +0200 (CEST)
Received: from gillibert.homelinux.net
	(ACaen-251-1-24-36.w83-115.abo.wanadoo.fr [83.115.209.36])
	by mwinf2711.orange.fr (SMTP Server) with ESMTP id EBFC21C00085
	for <linux-lvm@redhat.com>; Sun, 20 Sep 2009 00:17:28 +0200 (CEST)
Received: from fixlaptop ([192.168.1.209]
	helo=fixlaptop.gillibert.homelinux.net)
	by gillibert.homelinux.net with esmtp (Exim 4.69)
	(envelope-from <rcvxdg@gmail.com>) id 1Mp8FD-0001vQ-Th
	for linux-lvm@redhat.com; Sun, 20 Sep 2009 00:17:27 +0200
Date: Sun, 20 Sep 2009 00:17:27 +0200
From: =?UTF-8?B?QW5kcsOp?= Gillibert <rcvxdg@gmail.com>
Subject: Re: [linux-lvm] Question on compatibility with 2.6.31 kernel.
Message-ID: <20090920001727.536e396c@fixlaptop.gillibert.homelinux.net>
In-Reply-To: <4AB520E3.4080209@Media-Brokers.com>
References: <4AB3DE8E.9080301@candelatech.com> <4AB3E3F7.2060704@redhat.com>
	<4AB3F3EE.5040004@candelatech.com>
	<4AB520E3.4080209@Media-Brokers.com>
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

Charles Marcus <CMarcus@Media-Brokers.com> wrote:
> On 9/18/2009, Ben Greear (greearb@candelatech.com) wrote:
> > > I recently tried to boot 2.6.31 on Fedora 8, and it couldn't
> > > find the volume groups.  The same kernel works fine on F11.
> >=20
> > try to recompile kernel with
> > CONFIG_SYSFS_DEPRECATED=3Dy
> > CONFIG_SYSFS_DEPRECATED_V2=3Dy
> >=20
> > (old lvm will not understand new sysfs design, this should
> > provide old sysfs entries)=20
>=20
> I'm also an lvm newbie, and since I'll obviously be running into this
> sometime soon...
>=20
> If lvm2 is updated first (before the kernel), I'm assuming it would
> still be backward compatible with older kernels?
>=20
Yes, I'm almost sure it is. I run a 2.6.30 kernel with CONFIG_SYSFS_DEPRECA=
TED=3Dy and have a relatively recent LVM, and it works well.

> Or, if I updated the kernel first and compiled it with the above
> options, when lvm2 gets updated, will I need to recompile the kernel
> with the above options disabled before the next reboot?
>=20

I don't think so. LVM guys are not evil. :)

--=20
Andr=C3=A9 Gillibert
