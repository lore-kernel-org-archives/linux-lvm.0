Message-ID: <3E2D1861.8D998D13@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Lilo Defvs and Root Raid1, Having trouble booting
References: <H0004a6d101c8ca3.1043106948.seurat.artisan.calpoly.edu@MHS>
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Tue Jan 21 03:52:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, mfusco@calpoly.edu

mfusco@calpoly.edu wrote:
> 
> Need help please!

Maybe you should ask a software raid mailing list, and not the
LVM mailing list.

 
>    Here is my current system.
>    /boot is a md0 raid1 mirrored over 4 scsi disk, host0 target9, h0t10, h1t9,
> h1t10.
>    / is a md11 raid1 mirrored over the same four disks.
>    md0 is part1 and md11 is part2
>    my lilo has the option for raid-????-boot=mbr-only and LILO does load the
> kernel.

i always mark the /boot partition bootable on all disks, and use the
default mbr
or the one that in debian comes from the install-mbr command
In lilo.conf i write boot=/dev/mdX
And it works so far.


>    heres the problem.  raidautostart /dev/md0 failed kernel unable to mount
> root directory 09:00.  I have tried to make a initrd with --preload raid1 and -
> -with=raid1 but still no luck.  also unzip my initrd and looked in the /dev
> only entry was md0 which was a symbolic link to md/0.  Tried to mknod the
> files, sda, sdb... sda1, sda2, ... and md0, md11 and still no luck?

Did you change the partition types to linux raid autodetect ?
(is that "fd" or is "fd" LVM ?)
 
> Please any ides would be really helpful

read the linux software raid howto




JonB
