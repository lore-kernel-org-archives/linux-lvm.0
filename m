Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uA7Hf9RU012357
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Mon, 7 Nov 2016 12:41:09 -0500
Received: from Ishtar.sc.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B908D338877
	for <linux-lvm@redhat.com>; Mon,  7 Nov 2016 17:41:07 +0000 (UTC)
Received: from [192.168.3.12] (Athenae [192.168.3.12])
	by Ishtar.sc.tlinx.org (8.14.7/8.14.4/SuSE Linux 0.8) with ESMTP id
	uA7H9Vpo067077
	for <linux-lvm@redhat.com>; Mon, 7 Nov 2016 09:09:33 -0800
Message-ID: <5820B2A0.4090203@tlinx.org>
Date: Mon, 07 Nov 2016 08:58:08 -0800
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
References: <af56dc3b8b8dee6b36edba635380a517@xenhideout.nl>
In-Reply-To: <af56dc3b8b8dee6b36edba635380a517@xenhideout.nl>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] boot volume in activated containing PV does not
	activate
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Xen wrote:
> Now at boot (prior to running of systemd) I activate both 
> coll/msata-lv and msata/root.
---
    Systemd requires that it be PID 1 (the first process to run
on your system).  I'm told that it won't run unless that is true.  So
how can you do anything before systemd has been run?
>
> This works fine when both mirrors are present.
>
> As a test I removed the primary (SSD) mirror of the root volume (and 
> the boot volume). Now the system still boots (off of another disk 
> which has grub on it, but only the grub core and boot image, nothing 
> else, so it still references my VG) and the root volume still gets 
> activated but the boot volume doesn't get activated anymore.
>
> What can cause this? It ought to get activated by udev rules.
>
> You remember I patched the udev file to ensure a PV directly on disk 
> always gets activated but this is not that disk.
>
> Could it be that the msata/boot volume doesn't get activated because 
> the PV had already been activated in the initrd but only as an LV and 
> not its volumes?
    Sounds very similar to opensuse's requirement that /usr be on
the same partition as root -- if not, then you have to boot using
a ramdisk, which mounts /usr, and then does the real system boot, so
of course, booting directly from disk (which is what my machine does)
is not supported.  I also mount "/usr" as a first step in my boot
process, but that disallows a systemd boot, which some define as
systemd being pid 1.

    I'm told systemd has changed the meaning of 'fstab' to not
be a table of disks to mount, but to be a table of disks to keep mounted
(even if umount'd by an administrator).  Since udev's functionality was
incorporated into systemd, might it not be doing something similar --
trying to maintain the boot-state in effect before you added the mirror?
