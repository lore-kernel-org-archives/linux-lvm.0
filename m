Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uA7IxLGP013633
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Mon, 7 Nov 2016 13:59:21 -0500
Received: from smtp1.dds.nl (smtp1.dds.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 55B673B3D2
	for <linux-lvm@redhat.com>; Mon,  7 Nov 2016 18:59:18 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id DA818951C1
	for <linux-lvm@redhat.com>; Mon,  7 Nov 2016 19:59:16 +0100 (CET)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon, 07 Nov 2016 19:59:16 +0100
From: Xen <list@xenhideout.nl>
In-Reply-To: <5820B2A0.4090203@tlinx.org>
References: <af56dc3b8b8dee6b36edba635380a517@xenhideout.nl>
	<5820B2A0.4090203@tlinx.org>
Message-ID: <3512be4dc11db194eeab0ef4f8bed421@dds.nl>
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
To: linux-lvm@redhat.com

Linda A. Walsh schreef op 07-11-2016 17:58:
> Xen wrote:
>> Now at boot (prior to running of systemd) I activate both 
>> coll/msata-lv and msata/root.
> ---
>    Systemd requires that it be PID 1 (the first process to run
> on your system).  I'm told that it won't run unless that is true.  So
> how can you do anything before systemd has been run?

Hey lover :p.

Because I do it in the initrd. I'm not sure how much of that is "handed 
over" to systemd but it makes a big difference. For example, 
pre-activating one half of my (embedded) mirrors was the key to making 
sure the entire mirror is activated properly upon boot.

If not, I would have to run something like vgchange --refresh or 
lvchange --refresh or something of the kind.




>> 
>> This works fine when both mirrors are present.
>> 
>> As a test I removed the primary (SSD) mirror of the root volume (and 
>> the boot volume). Now the system still boots (off of another disk 
>> which has grub on it, but only the grub core and boot image, nothing 
>> else, so it still references my VG) and the root volume still gets 
>> activated but the boot volume doesn't get activated anymore.
>> 
>> What can cause this? It ought to get activated by udev rules.
>> 
>> You remember I patched the udev file to ensure a PV directly on disk 
>> always gets activated but this is not that disk.
>> 
>> Could it be that the msata/boot volume doesn't get activated because 
>> the PV had already been activated in the initrd but only as an LV and 
>> not its volumes?
>    Sounds very similar to opensuse's requirement that /usr be on
> the same partition as root -- if not, then you have to boot using
> a ramdisk, which mounts /usr, and then does the real system boot, so
> of course, booting directly from disk (which is what my machine does)
> is not supported.  I also mount "/usr" as a first step in my boot
> process, but that disallows a systemd boot, which some define as
> systemd being pid 1.

So you skip an initrd right(or initramfs). My Ubuntu thing just mounts 
itself as /, then pivots to the real root after activating some stuff.

On Ubuntu (and Debian) you create hooks and scripts and then they just 
get embedded into initramfs and that just gets loaded prior to systemd 
doing anything.

It was said that LVM (or actually, SystemD and UDev) just processes all 
things again; all devices all passed through the udev system once more, 
and so everything is getting activated or at least processed (creates a 
udev trigger for something to happen).

The strange thing was -- and I was just a bit confused just a moment 
about about a similar Grub question I asked somewhere -- that...

while booting from my regular msata thing that had the first half of the 
mirrors, and while pre-activating the outer-embedding PV (and its LV) 
that is used for that second half, this was enough to get the boot 
volume completely activated without explicitly doing so.

Meaning, the second PV to "msata" volume group was now activated and 
this PV contains both the second half of msata/root and the second half 
of msata/boot. As a consequence, when boot is activated by systemd, it 
finds the volume (PV) just fine.

But now for some strange reason it does not, so now that I remove the 
msata disk, the PV for it (the second half that is still there) is still 
getting activated but now that the first half is not found, and 
triggered, so to speak...

the second half suddenly does not prompt a systemd activation anymore. 
Actually systemd is no part of it at all, it is just the udev rule that 
rules the pvchange.

So *apparently* there is no udev rule being run on the second-half PV 
(that contains both second-halves) and the *root* one has already been 
activated by my initrd (ramfs) so there's no problem there.

The boot one (which is just one half at this point) does not get 
activated at all. Which leads me to leave the udev rule misses it.

>    I'm told systemd has changed the meaning of 'fstab' to not
> be a table of disks to mount, but to be a table of disks to keep 
> mounted
> (even if umount'd by an administrator).  Since udev's functionality was
> incorporated into systemd, might it not be doing something similar --
> trying to maintain the boot-state in effect before you added the 
> mirror?

I don't think so. At this point there is no mirror because I am only 
providing one half. I am pretty sure the bootstate is maintained if I 
were to preactivate the boot LV in the initrd(ramfs).

I am sorry for not having responded to your email of last January. I 
guess I'm living in a slow-time bubble. There was a reason I couldn't 
respond, I don't remember what it was.

Seems like 3 days ago for me. Nothing much happens except for terrible 
things. Everything moves as fast as my feet can take me, which is not 
very fast.
