Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p7U83Jeq030430
	for <linux-lvm@redhat.com>; Tue, 30 Aug 2011 04:03:21 -0400
Received: from mail-ww0-f46.google.com (mail-ww0-f46.google.com [74.125.82.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p7U83ElT013798
	for <linux-lvm@redhat.com>; Tue, 30 Aug 2011 04:03:15 -0400
Received: by wwg7 with SMTP id 7so4329677wwg.27
	for <linux-lvm@redhat.com>; Tue, 30 Aug 2011 01:03:14 -0700 (PDT)
Message-ID: <4E5C993F.7050706@gmail.com>
Date: Tue, 30 Aug 2011 10:03:11 +0200
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
MIME-Version: 1.0
References: <CAGRgLy7Q+Rd9-z_Wz6WGsEy5OmvtjaSBQNZ_Ez0uVxMXFM5j_g@mail.gmail.com>
	<4E5392A6.6000201@redhat.com>
	<CAGRgLy6AsAv-JMaTrzO0inR+y-9JkHGf8WjBBpKd+NevvMA7xg@mail.gmail.com>
	<CAJJYPd=-KrbxFG8uDf0muCzA+ZuF0zat0O+m0BENsAiUiYxAAA@mail.gmail.com>
	<CAGRgLy6OjHHwzs0Qufq2U6LG4U-zH10Nq2rA-0Ce=YiG1Fvsrw@mail.gmail.com>
In-Reply-To: <CAGRgLy6OjHHwzs0Qufq2U6LG4U-zH10Nq2rA-0Ce=YiG1Fvsrw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvm_vg_create_lv_linear() stuck in dm_udev_wait()
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
To: Alexander Lyakas <alex.bolshoy@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dne 29.8.2011 17:47, Alexander Lyakas napsal(a):
> Hello Zdenek,
> I did some investigations, and I think the problem is the following:
> 
> When an LV is created, udev event comes in. It looks like the problem
> happens only when this first udev event has the following properties:
> ID_FS_UUID=INtL1j-fpvA-Xx13-iXSL-XtDx-ekzV-8aGHg1 (or something else)
> ID_FS_UUID_ENC=INtL1j-fpvA-Xx13-iXSL-XtDx-ekzV-8aGHg1 (or something else)
> ID_FS_VERSION=LVM2\x20001
> ID_FS_TYPE=LVM2_member
> ID_FS_USAGE=raid
> 
> Usually, I see these properties on PVs (which are MD arrays) and not on LVs.
> I don't really know why these properties sometimes appear on a new LV
> (some leftover on disk???), but when it happens, then the following
> ubuntu udev rule kicks in:
> 
> ---------- code ----------
> # This file causes block devices with LVM signatures to be automatically
> # added to their volume group.
> # See udev(8) for syntax
> SUBSYSTEM=="block", ACTION=="add|change",
> ENV{ID_FS_TYPE}=="lvm*|LVM*", RUN+="watershed sh -c '/sbin/lvm vgscan;
> /sbin/lvm vgchange -a y'"
> ------ end code -------
> 
> This rule is described here:
> https://wiki.ubuntu.com/UdevLvm
> 
> So vgscan is issued and it gets stuck waiting for the LVM lock,
> because currently my thread is stuck in lv_create_linear(), waiting
> for udev event, and my thread holds this lock.
> 
> At this point the system is stuck. What I did then, I killed the
> vgscan and vgchange processes, but still additional udev events did
> not come. Then I issued 'udevadm settle' and next udev event arrived.
> This next event did not contain the problematic ID_FS_XXX fields. And
> then LV creation completed smoothly. Also, in all the cases, in which
> LV creation went smoothly, I did not see the ID_FS_XXX fields.
> 
> So I have several doubts:
> 1) I understand why vgscan was stuck, but do not understand why udev
> events stopped coming. Does udev need the previous event processing
> rules to complete, before sending new events?
> 2) Why these problematic ID_FS_XXX properties appeared, and how can we
> prevent this?
> 3) Or otherwise, do you think that ubuntu's rule is problematic? In my
> case, I don't need this rule, because I activate all the LVs in my
> code anyways.

I assume udev vars are being set from blkid execution on block device.

I really think version 2.02.66 is way to obsolete especially if all
surrounding apps (like udev) have been upgraded many times.

Vgscan should not be executed by any udev rules.

lvm2 package is bundled with its own  udev rules - which are tested and
verified to work. If a distribution decides to ignore them and bundle its own
version I afraid you need to ask for help the package maintainer in your
distro for such support.

So I'd suggest to to install latest version from upstream tarball otherwise
you will be losing your time fighting with more then a year old bugs.

Zdenek
