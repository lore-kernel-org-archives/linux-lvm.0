Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A67049CC2
	for <linux-lvm@redhat.com>; Thu,  7 Feb 2019 18:15:31 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 63668C0669CC
	for <linux-lvm@redhat.com>; Thu,  7 Feb 2019 18:15:29 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id i12so292876pfo.7
	for <linux-lvm@redhat.com>; Thu, 07 Feb 2019 10:15:29 -0800 (PST)
Date: Thu, 7 Feb 2019 19:13:02 +0100
From: suscricions@gmail.com
Message-ID: <20190207191302.1b1dcadd@gmail.com>
In-Reply-To: <b2ccc7a2-b4fa-4acb-63d8-1126e7a01959@redhat.com>
References: <20190206183841.69e38617@gmail.com>
	<b2ccc7a2-b4fa-4acb-63d8-1126e7a01959@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] [systemd-devel] Possible race condition with LVM
 activation during boot
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: systemd-devel@lists.freedesktop.org
Cc: linux-lvm@redhat.com

El Thu, 7 Feb 2019 11:18:40 +0100
Peter Rajnoha <prajnoha@redhat.com> escribi=C3=B3:

> On 2/6/19 6:38 PM, suscricions@gmail.com wrote:
> > Hi,
> >=20
> > First of all apologies if this is not the correct channel to request
> > for help with this issue. I've tried asking in Arch Linux forums
> > without luck for the moment.
> >=20
> > Long story short, from time to time I'm dropped to a rescue shell
> > during boot because of a logical volume that cannot be found, so the
> > respective .mount service fails making the local-fs.target stop
> > normal boot process.
> >=20
> > local-fs.target: Job local-fs.target/start failed with result
> > 'dependency'.
> >=20
> > Under normal circumstances I'd assume that a logical volume should
> > be activated first in order to be mounted, but a few times mounting
> > happens first so causing the error. I think this can be a race
> > condition or something similar because strikes randomly. Booting
> > again avoids the problem for the moment, which happened twice
> > during past days.
> >=20
> > All the relevant parts from logs and information about my system
> > partition scheme is posted here:
> > https://bbs.archlinux.org/viewtopic.php?pid=3D1830442
> >=20
> > Hope some of you can help me to find the root cause and again
> > apologies if this is not the place or the issue is too obvious.
> >  =20
>=20
> If there's a mount unit, it's bound to certain device for which
> systemd waits to appear on the system. So yes, the device must be
> activated first before the mounting happens. If device doesn't appear
> within a timeout, you usually get dropped to a rescue shell.
>=20
> Please, if you hit the problem again, try to collect LVM debug info by
> running the "lvmdump -u -l -s" command that creates a tarball with
> various LVM-related debug info we can analyze. It contains content of
> the journal for the current boot, the udev environment, LVM
> configuration, device stack listing and various other useful
> information for more thorough debugging.
>=20
> I'm adding CC linux-lvm, let's move this discussion there. Thanks.
>=20

There's been a reply in Arch Linux forums and at least I can apply some
contingency measures. If it happens again I will provide more info
following your advice.

Many thanks!

--
Miguel
