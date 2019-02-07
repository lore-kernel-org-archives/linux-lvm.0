Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C33D76013E
	for <linux-lvm@redhat.com>; Thu,  7 Feb 2019 21:51:21 +0000 (UTC)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E7D10C058CB0
	for <linux-lvm@redhat.com>; Thu,  7 Feb 2019 21:51:19 +0000 (UTC)
Message-ID: <c27673ee58cb15cfd0533bd3bb3f3379e57ca6c8.camel@suse.de>
From: Martin Wilck <mwilck@suse.de>
Date: Thu, 07 Feb 2019 22:51:17 +0100
In-Reply-To: <20190207191302.1b1dcadd@gmail.com>
References: <20190206183841.69e38617@gmail.com>
	<b2ccc7a2-b4fa-4acb-63d8-1126e7a01959@redhat.com>
	<20190207191302.1b1dcadd@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: suscricions@gmail.com, systemd-devel@lists.freedesktop.org
Cc: linux-lvm@redhat.com

On Thu, 2019-02-07 at 19:13 +0100, suscricions@gmail.com wrote:
> El Thu, 7 Feb 2019 11:18:40 +0100
> 
> There's been a reply in Arch Linux forums and at least I can apply
> some
> contingency measures. If it happens again I will provide more info
> following your advice.

The log shows clearly that the device was available first:

feb 06 12:07:09 systemd[1]: Starting File System Check on /dev/disk/by-uuid/cabdab31-983b-401f-be30-dda0ae462080...
feb 06 12:07:09 systemd-fsck[520]: multimedia: limpio, 1051/953984 ficheros, 193506294/244189184 bloques
feb 06 12:07:09 systemd[1]: Started File System Check on /dev/disk/by-uuid/cabdab31-983b-401f-be30-dda0ae462080.

That wouldn't be possible without the device being visible to the system.
Shortly after you get

feb 06 12:07:09 mount[544]: mount: /mnt/multimedia: el dispositivo especial /dev/disk/by-uuid/cabdab31-983b-401f-be30-dda0ae462080 no existe.

... So the device that had already been visible must have disappeared temporarily.
After the mount failure, we see messages about the LV becoming active:

[...]
feb 06 12:07:09 lvm[483]:   1 logical volume(s) in volume group "storage" now active
[...]
feb 06 12:07:09 lvm[494]:   1 logical volume(s) in volume group "storage" now active

There are two "lvm pvscan" processes (483 and 494) that may be interfering 
with each other and/or with the "mount" process. These processes are running 
on 8:17 (/dev/sdb1) and 254:1. I couldn't figure out from your logs what this latter
device might be. 

Wild guess: the pvscan processes working on the VG while it's already
visible are causing the device to get offline for a short time span,
and if the mount is attempted in that time window, the error occurs.

There's another lvm process (340) started earlier by the lvm2-monitor
unit ("Monitoring of LVM2 mirrors, snapshots etc. using dmeventd or
progress polling."). Immediately after termination of this process, the
device seems to be detected by systemd and the above fsck/mount
sequence begins, while the pvscan processes are still running. "lvm2-
monitor.service" runs "vgchange --monitor y". It almost looks as if
this had caused the devices to be visible by systemd, but that would be
wrong AFAICT.

Can you reproduce this with "udev.log-priority=debug"?

Regards,
Martin
