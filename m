Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5UFGKLr021742
	for <linux-lvm@redhat.com>; Fri, 30 Jun 2006 11:16:20 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5UFGG69012988
	for <linux-lvm@redhat.com>; Fri, 30 Jun 2006 11:16:16 -0400
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id CD2381F422A
	for <linux-lvm@redhat.com>; Fri, 30 Jun 2006 17:16:09 +0200 (CEST)
Received: from conterra.de ([127.0.0.1])
	by localhost (vvv.conterra.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 10508-08 for <linux-lvm@redhat.com>;
	Fri, 30 Jun 2006 17:16:01 +0200 (CEST)
Message-ID: <44A5402F.8020903@conterra.de>
Date: Fri, 30 Jun 2006 17:15:59 +0200
From: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] 2 VG's in separated HD's
References: <44A530AA.7040506@minicom.com.br>
In-Reply-To: <44A530AA.7040506@minicom.com.br>
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

Du wrote:
> I put another HD on my box to test with LVM, my primary HD is working
> all with LVM and a VG called vg_root. When I initialize and create a VG
> in the secondary HD, works well, I create a LV, perfectly...but when I
> reboot...donno what happens but the sistem doesnt initialize INIT, and
> send me a BusyBox (Debian).
> 
> And then I must mount the root LV, chroot to it and fdisk to erase the
> secondary HD, and reboot. Otherwise it doenst starts INIT.
> 
> Does anybody knows what's happening?

what do you mean by "doenst starts INIT"? Is the kernel not found
(a LILO or GRUB problem) or does "init" not find the root partition?
Or was the LV-partition, you created, not found?

Are both disks connected to the same controller?
Are they IDE or SATA disks?

If you have several disk controllers on board, you may be
surprised to find /dev/hda1 turning into /dev/hde1, as
the sequence of your different controllers is not necessary
stable, if you connect additional disks.

BTW: why do you want an new VG? Why not expanding your current
VG by a new disk?

Dieter.
