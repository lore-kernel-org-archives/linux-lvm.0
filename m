Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA90A26367
	for <linux-lvm@redhat.com>; Fri,  8 Feb 2019 13:15:24 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 65E85E3E12
	for <linux-lvm@redhat.com>; Fri,  8 Feb 2019 13:15:21 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id y1so1562021pgk.11
	for <linux-lvm@redhat.com>; Fri, 08 Feb 2019 05:15:21 -0800 (PST)
Date: Fri, 8 Feb 2019 14:12:55 +0100
From: suscricions@gmail.com
Message-ID: <20190208141255.5e40bbb8@gmail.com>
In-Reply-To: <c27673ee58cb15cfd0533bd3bb3f3379e57ca6c8.camel@suse.de>
References: <20190206183841.69e38617@gmail.com>
	<b2ccc7a2-b4fa-4acb-63d8-1126e7a01959@redhat.com>
	<20190207191302.1b1dcadd@gmail.com>
	<c27673ee58cb15cfd0533bd3bb3f3379e57ca6c8.camel@suse.de>
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

El Thu, 07 Feb 2019 22:51:17 +0100
Martin Wilck <mwilck@suse.de> escribi=C3=B3:

> On Thu, 2019-02-07 at 19:13 +0100, suscricions@gmail.com wrote:
> > El Thu, 7 Feb 2019 11:18:40 +0100
> >=20
> > There's been a reply in Arch Linux forums and at least I can apply
> > some
> > contingency measures. If it happens again I will provide more info
> > following your advice. =20
>=20
> The log shows clearly that the device was available first:
>=20
> feb 06 12:07:09 systemd[1]: Starting File System Check
> on /dev/disk/by-uuid/cabdab31-983b-401f-be30-dda0ae462080... feb 06
> 12:07:09 systemd-fsck[520]: multimedia: limpio, 1051/953984 ficheros,
> 193506294/244189184 bloques feb 06 12:07:09 systemd[1]: Started File
> System Check
> on /dev/disk/by-uuid/cabdab31-983b-401f-be30-dda0ae462080.
>=20
> That wouldn't be possible without the device being visible to the
> system. Shortly after you get
>=20
> feb 06 12:07:09 mount[544]: mount: /mnt/multimedia: el dispositivo
> especial /dev/disk/by-uuid/cabdab31-983b-401f-be30-dda0ae462080 no
> existe.
>=20
> ... So the device that had already been visible must have disappeared
> temporarily. After the mount failure, we see messages about the LV
> becoming active:
>=20
> [...]
> feb 06 12:07:09 lvm[483]:   1 logical volume(s) in volume group
> "storage" now active [...]
> feb 06 12:07:09 lvm[494]:   1 logical volume(s) in volume group
> "storage" now active
>=20
> There are two "lvm pvscan" processes (483 and 494) that may be
> interfering with each other and/or with the "mount" process. These
> processes are running on 8:17 (/dev/sdb1) and 254:1. I couldn't
> figure out from your logs what this latter device might be.=20
>=20
> Wild guess: the pvscan processes working on the VG while it's already
> visible are causing the device to get offline for a short time span,
> and if the mount is attempted in that time window, the error occurs.
>=20
> There's another lvm process (340) started earlier by the lvm2-monitor
> unit ("Monitoring of LVM2 mirrors, snapshots etc. using dmeventd or
> progress polling."). Immediately after termination of this process,
> the device seems to be detected by systemd and the above fsck/mount
> sequence begins, while the pvscan processes are still running. "lvm2-
> monitor.service" runs "vgchange --monitor y". It almost looks as if
> this had caused the devices to be visible by systemd, but that would
> be wrong AFAICT.
>=20
> Can you reproduce this with "udev.log-priority=3Ddebug"?
>=20
> Regards,
> Martin
>=20
>=20
>=20

In /etc/udev/udev.conf with default values there's "udev_log=3Dinfo"
commented out. You mean changing logging levels here?

Meantime I've pasted online info about my lvm scheme that could help.

https://termbin.com/ipdq4


Best.
