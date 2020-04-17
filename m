Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 395132166B30
	for <linux-lvm@redhat.com>; Fri, 17 Apr 2020 07:42:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83074800295
	for <linux-lvm@redhat.com>; Fri, 17 Apr 2020 07:42:37 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id i22so694539otp.12
	for <linux-lvm@redhat.com>; Fri, 17 Apr 2020 00:42:34 -0700 (PDT)
MIME-Version: 1.0
From: Michael Stapelberg <michael+lvm@stapelberg.ch>
Date: Fri, 17 Apr 2020 09:42:22 +0200
Message-ID: <CANnVG6mMTcRkWQEEhZSEELfyGHqNkGPx2LmdR9NS+-wkAieGSw@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] udev/10-dm.rules.in: unexpectedly skipping device?
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
To: linux-lvm@redhat.com
Cc: prajnoha@redhat.com

Hey,

I’m starting to use LVM (+LUKS) on a computer of mine, but ran into
trouble getting it to work.

The issue I’m running into is that systemd boot hangs until the
default unit timeout elapses. This is because the cryptroot device is
not found, which in turn is because udev doesn’t create the symlinks
(e.g. in /dev/disk/by-uuid). udevadm info shows:

# udevadm info -p /sys/block/dm-0
P: /devices/virtual/block/dm-0
N: dm-0
L: 0
E: DEVPATH=/devices/virtual/block/dm-0
E: DEVNAME=/dev/dm-0
E: DEVTYPE=disk
E: MAJOR=254
E: MINOR=0
E: SUBSYSTEM=block
E: USEC_INITIALIZED=6522555
E: DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG=1
E: DM_UDEV_DISABLE_DISK_RULES_FLAG=1
E: DM_UDEV_DISABLE_OTHER_RULES_FLAG=1
E: SYSTEMD_READY=0
E: TAGS=:systemd:

I pinpointed this result to udev rule
https://sourceware.org/git/?p=lvm2.git;a=blob;f=udev/10-dm.rules.in;hb=ecae76c713bd4fa6c9d8f2a2c990625e4f38b504#l87,
i.e.:
ENV{DM_UDEV_RULES_VSN}!="1", ENV{DM_UDEV_PRIMARY_SOURCE_FLAG}!="1",
GOTO="dm_disable"

I assume I’m running into this rule because I’m using a custom initrd
which does not run systemd nor udev. Instead, my initrd is directly
calling vgchange -ay and vgmknodes.

I understand that this is not a common setup, but booting without
systemd/udev in the initrd should be supported, no?

I’m not sure where DM_UDEV_PRIMARY_SOURCE_FLAG is supposed to be set,
or why it isn’t set in my scenario. Do you have any ideas regarding
what I could check?

Thanks in advance,
Best regards,
Michael

PS: As a workaround, I’m just commenting out that rule. Does that have
any negative consequences?
