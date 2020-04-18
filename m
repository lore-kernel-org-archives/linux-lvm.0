Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B7FA82028CD3
	for <linux-lvm@redhat.com>; Sat, 18 Apr 2020 17:46:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CCDB800297
	for <linux-lvm@redhat.com>; Sat, 18 Apr 2020 17:46:28 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id j16so5077871oih.10
	for <linux-lvm@redhat.com>; Sat, 18 Apr 2020 10:46:25 -0700 (PDT)
MIME-Version: 1.0
References: <CANnVG6mMTcRkWQEEhZSEELfyGHqNkGPx2LmdR9NS+-wkAieGSw@mail.gmail.com>
	<7c124ead-e1cf-fa63-16b6-f02009e8578e@redhat.com>
In-Reply-To: <7c124ead-e1cf-fa63-16b6-f02009e8578e@redhat.com>
From: Michael Stapelberg <michael+lvm@stapelberg.ch>
Date: Sat, 18 Apr 2020 19:46:13 +0200
Message-ID: <CANnVG6nWWM+m38yTJO_JBBzjg4QZ9wY_tRvpSFvjRiZKZavXbw@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] udev/10-dm.rules.in: unexpectedly skipping device?
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
Content-Type: text/plain; charset="utf-8"
To: Peter Rajnoha <prajnoha@redhat.com>
Cc: linux-lvm@redhat.com

Hi Peter,

thank you very much for the detailed response, I learnt a lot from it!

Answers inline:

On Fri, Apr 17, 2020 at 2:57 PM Peter Rajnoha <prajnoha@redhat.com> wrote:
>
> Hi,
>
> On 4/17/20 9:42 AM, Michael Stapelberg wrote:
> > Hey,
> >
> > I’m starting to use LVM (+LUKS) on a computer of mine, but ran into
> > trouble getting it to work.
> >
> > The issue I’m running into is that systemd boot hangs until the
> > default unit timeout elapses. This is because the cryptroot device is
> > not found, which in turn is because udev doesn’t create the symlinks
> > (e.g. in /dev/disk/by-uuid). udevadm info shows:
> >
> > # udevadm info -p /sys/block/dm-0
> > P: /devices/virtual/block/dm-0
> > N: dm-0
> > L: 0
> > E: DEVPATH=/devices/virtual/block/dm-0
> > E: DEVNAME=/dev/dm-0
> > E: DEVTYPE=disk
> > E: MAJOR=254
> > E: MINOR=0
> > E: SUBSYSTEM=block
> > E: USEC_INITIALIZED=6522555
> > E: DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1
> > E: DM_UDEV_DISABLE_DISK_RULES_FLAG=1
> > E: DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
> > E: SYSTEMD_READY=0
> > E: TAGS=:systemd:
> >
> > I pinpointed this result to udev rule
> > https://sourceware.org/git/?p=lvm2.git;a=blob;f=udev/10-dm.rules.in;hb=ecae76c713bd4fa6c9d8f2a2c990625e4f38b504#l87,
> > i.e.:
> > ENV{DM_UDEV_RULES_VSN}!="1", ENV{DM_UDEV_PRIMARY_SOURCE_FLAG}!="1",
> > GOTO="dm_disable"
> >
> > I assume I’m running into this rule because I’m using a custom initrd
> > which does not run systemd nor udev. Instead, my initrd is directly
> > calling vgchange -ay and vgmknodes.
> >
> > I understand that this is not a common setup, but booting without
> > systemd/udev in the initrd should be supported, no?
> >
>
> You hit the painful spot here!
>
> Unfortunately, we don't support this case with existing rules. It's not that
> we wouldn't like to see this case supported, but the issue is in recognition
> of the uevents.
>
> To answer why in a way it makes sense, I need to be a little bit wordy here,
> sorry for that in advance...
>
> Device-mapper device activation consists of three steps for which different
> uevents are generated:
>
>   - DM device creation (ADD uevent)
>   - DM table load (no uevent)
>   - DM device resume which also activates the mapping as described by the
> table (CHANGE uevent)
>
> Right after the first step (with the ADD uevent), the device is not usable
> yet, obviously, because it has no table loaded yet. So we need to make sure
> that no udev rule causes this device to be accessed at this point in time.
>
> One of the elementary udev rule is a call to "blkid" which scans the device
> and extracts metadata information based on which the /dev/disk/by-* content is
> created and other udev rules can act further based on the information. That's
> why we need to postpone this device access within udev rule processing up
> until we're sure the device is ready, that is, after the CHANGE uevent when
> the table is made active.
>
> On the contra, we have coldplugging (calling "udevadm trigger --action=add").

To save others some unnecessary confusion: I had originally looked for
mentions of cold-plugging (in various spellings) in systemd/src/udev,
but couldn’t find anything. Starting systemd-udevd did not result in
any uevent messages as reported by “udevadm monitor”.

I eventually figured out that the systemd unit
systemd-udev-trigger.service literally calls e.g. “/usr/bin/udevadm
trigger --type=devices --action=add” at boot time on my system.

> At boot, coldplugging is used to make up for all the devices that have been
> activated before udevd is started from root fs (to make udevd conscious about
> those devices which were handled inside initrd). These "coldplug uevents" are
> in essence unrecognizable from other ADD uevents - there's no mark or flag
> saying this uevent is coming from the coldplug. And that is exactly the
> problematic part - we don't know whether this is the coldplug's ADD uevent
> AFTER we did the proper activation sequence or if this is spurious ADD uevent
> that comes before the device is properly activated. We simply don't know.

Another approach that comes to mind is plumbing DM_COOKIE from
libdevmapper via the DM_DEV_CREATE ioctl to the resulting action=add
uevent, and then in the udev rules only skip action=add events when a
flag is set.

>
> To alleviate this problem, when a DM device is being activated, that is,
> libdevmapper in userspace calls create + table load + device resume sequence,
> it also provides the DM_UDEV_PRIMARY_SOURCE_FLAG=1 so that it is attached to
> the "resume device" call (...then this flag appears in the uevent the "resume
> device" call causes inside kernel). Once we have uevents with this flag set,

Ah, thanks for the explanation! This was the missing puzzle piece to
programmatically skip hidden subLVs
(https://github.com/distr1/distri/commit/a4288d5901f33d27e7e60a15e8a0d92f5d32e41e)
in my initrd implementation
(https://michael.stapelberg.ch/posts/2020-01-21-initramfs-from-scratch-golang/)
:)

> it is stored in udev database. When we're processing any other subsequent
> uevent, we know we have already passed this activation sequence correctly.
> This also applies for processing any "coldplug uevents" - we simply look at
> the udev database content and if it has that flag set (that's exactly the
> IMPORT{db}=DM_UDEV_PRIMARY_SOURCE_FLAG call that you can also see in
> 10-dm.rules), we know we can just rerun udev rules for such uevents as the
> device has already gone through the activation sequence properly.
>
> Now, if we have initrd completely without udev and then switching over to root
> fs where we have udevd running, we're getting into the problem you are hitting
> here:
>
>   - device is activated in initrd without udev (so we have no udev db record
> about this device)
>
>   - switching over to root fs
>
>   - running udevd
>
>   - running coldplug (udevadm trigger --action=add)
>
>   - udev rules reacting to coldplug uevents
>
>   - 10-dm.rules trying to import the DM_UDEV_PRIMARY_SOURCE_FLAG, but since
> there was no udevd to record this information inside inird, we conclude the
> device has not yet passed activation sequence correctly and this is just a
> spurious uevent, hence ignoring it - and that's exactly what you see.
>
> You can also simulate this problem by executing:
>
>   - udevadm info --cleanup-db
>   - udevadm trigger --action=add
>
> ...which gets you into exactly the same situation (do that only on a test
> system :) ).
>
>
> However...
>
> When it comes to improving uevent recognition, there's a kernel patch I did
> back in 2017 which adds SYNTH_UUID (and other possible SYNTH_* variables) to
> synthetic/coldplug uevents:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f36776fafbaa0094390dd4e7e3e29805e0b82730
>
>
> There are also userspace patches for systemd/udevd (which still need some
> cherishing before systemd guys take that):
>
> https://github.com/systemd/systemd/pull/13881
>
> With this in, we could be in a better position to fix udev rules too.

Thanks, that’s a great pointer! I have applied a minimal version of
the required changes and it does seem to work AFAICT!
https://github.com/distr1/distri/commit/5ca8ced08f46123ba506b3f2b39c20cf44e0f41e

>
> > I’m not sure where DM_UDEV_PRIMARY_SOURCE_FLAG is supposed to be set,
> > or why it isn’t set in my scenario. Do you have any ideas regarding
> > what I could check?
> >
>
> As described above, it's set by libdevmapper, then libdevmapper passing that
> through DM ioctl to kernel, then kernel generating uevent with this flag, then
> udevd receiving the uevent with this flag set. Any subsequent uevents reimport
> this flag from existing udev database records.
>
> > Thanks in advance,
> > Best regards,
> > Michael
> >
> > PS: As a workaround, I’m just commenting out that rule. Does that have
> > any negative consequences?
> >
>
> Yes, there's a race because of the 3 step sequence to activate a DM device.
> With commenting out that rule, you make it possible to access a DM device
> where the table is not yet loaded and made active (hence unusable device). If
> you're lucky, when the ADD event is being processed, the "load table + resume"
> part could have already executed because it takes some time for udevd to react
> to uevents, but it doesn't need to be always the case. If you're not lucky,
> you can get non-deterministic behavior (the blkid scan will fail, various
> other records in udev may be set based on that incorrectly etc.).
>
> --
> Peter
>
