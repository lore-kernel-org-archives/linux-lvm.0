Return-Path: <steve.wray@the.net.nz>
From: "Steve Wray" <steve.wray@the.net.nz>
Subject: RE: [linux-lvm] Migrating to an LVM system (boot/root) disk
Date: Sun, 3 Jun 2001 17:02:41 +1200
Message-ID: <NBBBKLKHMJHIJLHOGAOJCEALIPAA.steve.wray@the.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20010602191624.E21442@linux.interlinx.bc.ca>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

1. In the LFS howto, I saw a warning to the effect of: NEVER run lilo
from a chrooted environment. You can destroy your MBR making
your system bootable only from floppy... Dunno if it applied here.

2. Having a /boot on LVM *is* possible, BUT you will need to boot
from floppy. This is because the info on /boot is needed at boot time,
and without it you won't be able to even get an init ramdrive.
(unless there is a new feature of LVM that allows this?)

3. to get over your night horrors, make a boot disk that includes the LVM
tools. A good starting point is miniroot. I posted a URL to it on this
list a little while ago. I don't have it to hand but it'll be in the
archive!
:)


> -----Original Message-----
> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of Brian J. Murrell
> Sent: Sunday, June 03, 2001 2:16 PM
> To: linux-lvm@sistina.com
> Subject: [linux-lvm] Migrating to an LVM system (boot/root) disk
> 
> 
> I would like to migrate my system disk to using LVM, completely --
> boot and root filesystems (as well as others).  I have 0.9.1beta7 as
> well as the lilo patch posted previous to this list.
> 
> Fortunately I have a new ide disk that is larger than my system disk
> currently so I can migrate to it.  My current system disk is on
> /dev/hda and the new disk is on /dev/hdc.  I have created one large
> /dev/hdc1 partition on the new disk.
> 
> I have also created a PV, a VG and two LVs -- root and boot.  I have
> mounted the lvs and copied my boot and root filesytems to the PVs.  I
> also create the lvm initrd.  So far so good.
> 
> I edited my /etc/lilo.conf on the new root filesystem to change the
> following:
> 
> ...
> -boot=/dev/hda
> +boot=/dev/hdc
> ...
> image=/boot/vmlinuz
>         label=linux
> -       root=/dev/hda5
> +       root=/dev/system/boot
> +       initrd=/boot/initrd-lvm-2.4.5-1.1mdk.gz
>         read-only
> 
> However when I chroot to the root filesystem on the new disk and run
> the lilo command I get the following:
> 
> # lilo
> Warning: /dev/hdc is not on the first disk
> Fatal: This version of LVM does not support boot LVs
> 
> The warning I understand but it would seem there is some problem with
> what I have cobbled together here as my lilo does not like my LVM for
> booting.
> 
> One other thing that has occurred to me is that the PV that underlies
> the VG was named as /dev/hdc1.  I have a suspicion that I will not be
> able to simply move that drive from the secondary IDE bus to the
> primary IDE bus as it will then be known as /dev/sda1.  Is this
> correct?
> 
> Is there a better way to do this migration if my desire is really to
> have one large parition/PV for my VG rather than using a bunch of
> partitions/PV's?
> 
> Any comments most welcome.
> 
> Thanx much, in advance,
> b.
> 
> 
> P.S.  I also have horrible nightsweats of trying to boot an LVM box from
> "emergency" boot media (diskettes, CDROM, etc.).  :-)
> 
> -- 
> Brian J. Murrell
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
