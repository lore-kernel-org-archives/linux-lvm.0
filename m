Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o655svx1016135
	for <linux-lvm@redhat.com>; Mon, 5 Jul 2010 01:54:58 -0400
Received: from mail-gw0-f46.google.com (mail-gw0-f46.google.com [74.125.83.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o655skOo008763
	for <linux-lvm@redhat.com>; Mon, 5 Jul 2010 01:54:47 -0400
Received: by gwj21 with SMTP id 21so744188gwj.33
	for <linux-lvm@redhat.com>; Sun, 04 Jul 2010 22:54:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <AANLkTinHO7upxegO7jMqa4OtWQ8i-4EOB7rb25G_tmuc@mail.gmail.com>
References: <AANLkTinHO7upxegO7jMqa4OtWQ8i-4EOB7rb25G_tmuc@mail.gmail.com>
Date: Sun, 4 Jul 2010 22:54:46 -0700
Message-ID: <AANLkTikCxnSq4nyGf8V_uC5AqejaFwr7DgJuCcA4wY62@mail.gmail.com>
From: Bryan Whitehead <driver@megahappy.net>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Rebuilding ext4 filesystem on an LV
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Dig deep into your memory (or just try different combos) of running
mkfs.ext4 -n /dev/yourVG/yourLV

-n is like a dry run so you can look for the alternate superblock locations.

Using the above info, run fsck.ext4 -b <alt location> /dev/yourVG/yourLV

Even if it can find an alternate superblock, I'm not confident the
fsck would be able to help much�

That said, I think you might be out of luck. Go ahead and give it a
shot, I'm curious how much data you'll get.

On Sun, Jul 4, 2010 at 6:30 PM, Ken Bass <daytooner@gmail.com> wrote:
> In short:
>
> - originally created LV with several physical drives (5)
> - formatted LV for ext4
> - one physical drive got many sectors trashed. Those included the partition
> and metadata.
> - did the following to recover the LV (VolGroupX-LogVolX):
> ---pvcreate --uuid <original uuid>� /dev/sdX� (successfully created)
> ---vgcfgrestore VolGroupX (restsored volume group VolGroupX)
> ---vgscan� (found volume group "VolGroupX" using metadata type lvm2)
> --- vgchange -ay VolGroupX ( note response:
> " device-mapper: reload ioctl failed: Invalid argument.
> �1 logical volume(s) in volume group "VolGroupX" now active")
>
> At this pont, /dev/mapper/VolGroupX-LogVolX exists, but I can't run any
> utilities on it, since it can't find any superblock. For example:
> ________________
> [root@Elmer ken] # e2fsck� /dev/mapper/VolGroupX-LogVolX
> e2fsck 1.41.9 (22-Aug-2009)
> e2fsck: Invalid argument while trying to open /dev/mapper/VolGroupX-LogVolX
>
> The superblock could not be read or does not describe a correct ext2
> filesystem.� If the device is valid and it really contains an ext2
> filesystem (and not swap or ufs or something else), then the superblock
> is corrupt, and you might try running e2fsck with an alternate superblock:
> ��� e2fsck -b 8193 <device>
>
> [root@Elmer ken] #
> _________________________
> I really want to recover at least the data on the 4 other drives, and any
> data left from this drive as well.
>
> Any help will be greatly appreciated.
>
> TIA
>
> ken
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
