Message-ID: <4D663807.9010802@redhat.com>
Date: Thu, 24 Feb 2011 10:50:47 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <ik41em$6rl$1@dough.gmane.org>
In-Reply-To: <ik41em$6rl$1@dough.gmane.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Errors after adding new md pv (boot only?)
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Tomasz Nowak <tnowak@netventure.pl>

On 02/23/2011 10:24 PM, Tomasz Nowak wrote:
> md: ... autorun DONE.
> md: Autodetecting RAID arrays.
> md: autorun ...
> md: ... autorun DONE.
> 
> ------------------------ and here come the problem -----------------------
> 
> Scanning logical volumes
>   Reading all physical volumes.  This may take a while...
>   Couldn't find device with uuid qeDW2q-nq5b-Yh5U-5sKY-7Rkd-1UXh-LAxL8j.
>   Found volume group "vg0" using metadata type lvm2
> Activating logical volumes
>   Couldn't find device with uuid qeDW2q-nq5b-Yh5U-5sKY-7Rkd-1UXh-LAxL8j.
>   8 logical volume(s) in volume group "vg0" now active
> Creating root device.
> Mounting root filesystem.
> kjournald starting.  Commit interval 5 seconds
> EXT3-fs: mounted filesystem with ordered data mode.
> Setting up other filesystems.
> Setting up new root fs
> no fstab.sys, mounting internal defaults
> Switching to new root and running init.
> unmounting old /dev
> unmounting old /proc
> unmounting old /sys

The initramfs doesn't know about your new array so it's not activating it during
early boot (before mounting root). This leads to the partial LV errors since the
tools will not allow an incomplete LV to be activated without manual
intervention (but at least it doesn't cause the boot to fail completely ;).

You need to rebuild your initramfs (mkinitrd on CentOS 5.5) to include the
configuration for the newly defined MD array.

Something like:

mkinitrd /boot/initrd-$(uname -r).img $(uname -r)

Regards,
Bryn.
