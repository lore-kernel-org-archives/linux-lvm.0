Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F65C5C207
	for <linux-lvm@redhat.com>; Fri,  1 Mar 2019 05:42:38 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C8DF7C00734E
	for <linux-lvm@redhat.com>; Fri,  1 Mar 2019 05:42:36 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id z196so16396443lff.4
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2019 21:42:36 -0800 (PST)
MIME-Version: 1.0
References: <2b82b876-1fea-5eb4-e37f-bc8bd3262a83@gmail.com>
In-Reply-To: <2b82b876-1fea-5eb4-e37f-bc8bd3262a83@gmail.com>
From: Chris Murphy <lists@colorremedies.com>
Date: Thu, 28 Feb 2019 22:42:22 -0700
Message-ID: <CAJCQCtQVsWfh0bpHvL2osC0iADhShm3pRc-tJDVCJdHe9xGUsg@mail.gmail.com>
Subject: Re: [linux-lvm] LVM thin provisioning on encrypted root unreliable
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Feb 28, 2019 at 2:32 PM kurcze <wannabeachicken@gmail.com> wrote:
>
> Hello everyone,
>
>
> I can't manage to get thinly provisioned LVM setup to work.
>
> The problem is: I can't get to the decryption prompt to enter a password
> to decrypt root filesystem. It just hangs there.
>
> My Setup:
>
> VG with 3 PVs: 1 SSD, 1 HDD, 1 NVMe SSD
>
> Thin pool in this VG with 2 LVs (for / and /var mountpoints)
>
> both partitions are encrypted using LUKS
>
>
> I've spent quite a lot of time trying many possible solutions. The worst
> thing is: sometimes it seems to work flawlessly for several boots. These
> moments convince me every time, that the previous solution I tried was
> the correct one and I can happily go on with my life. That is not the
> case. Sometimes it doesn't work the first 3 times (after reboot) and
> then suddenly it does (possibly after some tweaking with kernel
> parameters). I can't recognize any pattern. I can also reboot 3 times
> without doing anything and the 4th time it works.
>
> Unfortunately I'm not a pro in this area and I don't know any way to
> debug it.
>
> I would really appreciate the help. I would also gladly provide any
> additional information or command output. Following files might be helpful:
>
> 1. dmesg output from initramfs prompt (with Call Trace)
>
> https://pastebin.com/HJkSixCs

I'd start with
rd.udev.debug

There's a nearly 1 minute delay with at least ata6.0, a.k.a. /dev/sdc
I can't imagine what device is taking that long to be discovered. The
transient nature makes it sound like a race could be happening. So the
gotcha with debug options is that this can affect the race condition.
Other options for debugging:

rd.debug will show dracut/initrd debug messages
systemd.log_level=debug will show systemd debug messages

They can all three be used at the same go, but it will slow down boot
a lot, and that itself might make the problem no longer happen.

>>[    0.000000] Command line: BOOT_IMAGE=/vmlinuz-4.19.0-0.bpo.1-amd64 root=/dev/mapper/crroot ro nomodeset apparmor=1 security=apparmor debug break=mountroot

This has no rd.luks or rd.lvm hints for dracut to do early activation.
I can't tell off hand what the layout is, if you've encrypted
partitions on each drive, and then the dmcrypt devices are made PV's;
or if the partitions are PV's, and you encrypt each LV separately?
Either method is valid but will make a difference in how it gets
assembled and therefore why and where it's failing. And anyway it
seems like that command line needs the proper hints, but I'm not
convinced that's the central problem because there's this huge 60
second gap in the dmesg where udevd is waiting for a drive apparently
to even appear and that's pretty strange.

So maybe the problem there is that gap is when you're entering in the
LUKS passphrase. So maybe the problem is that you enter that in, and
dracut is only passing the passphrase to one or two devices, and the
third device isn't there yet, so it never gets unlocked (?) and that's
why volume assembly fails is because one device is just coming up a
bit too slow.

In that case you might need a delay somewhere to improve the chance
the slow device is discovered. But that's speculation. Really we just
need more information on the storage stack, like a partition by
partition summary. If you get a successful boot, a sorted blkid (it
comes out unsorted by default) would be useful. And also if you can
figure out which drive is taking a long time to be discovered? It
wouldn't happen to be an drive in a USB enclosure would it?


-- 
Chris Murphy
