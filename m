Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1KKiUTm007267
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 15:44:30 -0500
Received: from rwcrmhc13.comcast.net (rwcrmhc13.comcast.net [216.148.227.153])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l1KKiSrT007768
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 15:44:28 -0500
Received: from [192.168.1.3] (marvin.localnet [192.168.1.3])
	by furio.localnet (8.13.8/8.13.7) with ESMTP id l1KKiKWF018123
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 15:44:21 -0500
Message-ID: <45DB5DA4.7080304@mattgillen.net>
Date: Tue, 20 Feb 2007 15:44:20 -0500
From: Matthew Gillen <me@mattgillen.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Grub/LVM boot problem
References: <512064.59586.qm@web50705.mail.yahoo.com>
In-Reply-To: <512064.59586.qm@web50705.mail.yahoo.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

John Koshi wrote:
> Hi,
> 
> I have a problem with the grub bootloader, as follows. I have a
> laptop, with an 80G disk, with Windows XP on the first half of
> the disk (NTFS), and Fedora core 4 (LVM) on the rest. Dual boot
> is managed by grub, installed with the Fedora install.
> 
> I wish to clone this disk, so I don't lose hours of setup/installs
> on both OS's, and my work, in case of a crash. I did the following:
> 
> 1) Installed Acronis 10 under Windows, and cloned the entire disk
>    to a 120G USB disk.
> 2) Restored from that clone onto a new 80G disk of the same geometry,
>    and replaced the existing disk with the newly cloned one.
> 3) On start-up, got a grub hang, so did the following:
>       a) Boot from Fedora core 4 rescue CD
>       b) chroot /mnt/sysimage
>       c) grub-install /dev/hda
>       d) Enter grub
>       e) grub> find /grub/stage1 -> gave me (hd0,3)
>       f) grub> root (hd0,3)
>       g) grub> kernel /vmlinuz-2.6.17-1.2142_FC4 ro root=/dev/hda4
>       h) grub> initrd /initrd-2.6.17-1.2142_FC4.img -> gave me 
>                     "Error 16: Inconsistent filesystem structure"
>       i) Exit grub, repeat to step b) above, and rebuild initrd:
>          "mkinitrd -v -f initrd-2.6.17-1.2142_FC4.img 2.6.17-1.2142_FC4
>       j) Repeat from d) again, and get the same Error 16 as above.
> 4) Note that after step 3-c) above, I got past the grub hang, and was able
>    to boot Windows. But selecting the Linux installation gave me "Error 17:
>    Cannot mount selected partition". That's when I did the remaining steps
>    above.
> 
> Sorry about the long-winded explanation, but this is frustrating, and I
> wanted to provide all the details, in the hope that some-one could throw
> some light on the dark innards of grub vis-a-vis LVM, to resolve this.
> 
> Thanks in advance.

If you boot rescue disk, but don't try to mount the system, can you run fsck
on the linux partitions?  Is that error from step 4 from grub, or after the
kernel starts booting?  If the latter, and your root filesystem is a Logical
Volume, you might replace the 'root=/dev/hda4' with
'root=/dev/VolGroup00/LogVol00' or whatever the device name is for your
configuration.

Is there any reason you're not using RAID-1?  Keeps your backup in sync
automatically in real time, and works with LVM...

I've never heard of Acronis, so I can't speak to it's abilities, but I'm
typically suspicious of windows-based software when dealing with linux
partitions.

HTH,
Matt
