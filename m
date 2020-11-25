Received: from localhost.localdomain (unknown [10.33.36.184])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 19BFE60855
	for <linux-lvm@redhat.com>; Wed, 25 Nov 2020 12:36:14 +0000 (UTC)
Date: Wed, 25 Nov 2020 12:36:11 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
Message-ID: <20201125123611.GA2419337@localhost.localdomain>
References: <CAMaziXuSe+YncMw622UAeGp_3DKtoCuz-US1yh6+tkrmDyQ4=g@mail.gmail.com>
	<20201120111433.GI1787072@localhost.localdomain>
	<CAMaziXss8HAjSjV6g5kFjzkxnYCGZSowfZcT-nJVRm-tf0rJEQ@mail.gmail.com>
	<20201123131321.GC2229389@localhost.localdomain>
	<CAMaziXvoqVUOD=iAks4x9bhOxeZCNcGcT6mJwaJCUEk29AoTOw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMaziXvoqVUOD=iAks4x9bhOxeZCNcGcT6mJwaJCUEk29AoTOw@mail.gmail.com>
Subject: Re: [linux-lvm] Unusually long boot times with LVM Snapshots
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

On Tue, Nov 24, 2020 at 05:27:21PM +0530, Sreyan Chakravarty wrote:
> But I am unable to boot now due to these errors:
> 
> Nov 24 10:44:00 localhost.HPNotebook dracut-initqueue[861]: Scanning
> devices dm-0  for LVM logical volumes vgfedora/fedora
> Nov 24 10:44:00 localhost.HPNotebook dracut-initqueue[886]: inactive
> '/dev/vgfedora/pool00' [929.75 GiB] inherit
> Nov 24 10:44:00 localhost.HPNotebook dracut-initqueue[886]: inactive
> '/dev/vgfedora/fedora' [700.00 GiB] inherit
> Nov 24 10:44:00 localhost.HPNotebook dracut-initqueue[888]: modprobe:
> FATAL: Module dm-thin-pool not found in directory
> /lib/modules/5.8.18-200.fc32.x86_64
> Nov 24 10:44:00 localhost.HPNotebook dracut-initqueue[888]:
> /usr/sbin/modprobe failed: 1
> Nov 24 10:44:00 localhost.HPNotebook dracut-initqueue[888]: Can't process
> LV vgfedora/fedora: thin target support missing from kernel?
> 
> I have tried to mark the volumes as active by :
> 
>                 lvchange -kn vgfedora/pool00
>                 lvchange -kn vgfedora/fedora
> 
> But no change.
> 
> 
> 
> How do I add the dm-thin-pool module ? I can't even boot.

Most likely you are just missing the dm-thin-pool module in the dracut
initramfs image.

You can re-build it with the following command:

  # dracut -f /boot/initramfs-$(uname -r).img $(uname -r)

If the running kernel matches the initramfs you want to rebuild then
you can leave out the file and kernel version:

  # dracut -f

To build an initramfs with only the drivers that the running host
uses add the -H switch (the dm-thin-pool module must be loaded at
the time you run dracut for this to work):

  # dracut -fH

See the dracut man page for more details.

Regards,
Bryn.
