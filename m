Date: Sun, 25 Jun 2000 17:25:45 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@Sistina.com>
Subject: Re: [linux-lvm] Patch lvmcreate_initrd
Message-ID: <20000625172545.A4152@hmsysv.t-online.de>
Reply-To: Mauelshagen@Sistina.com
References: <39560230.BD4B8131@mpi-hd.mpg.de>
Mime-Version: 1.0
In-Reply-To: <39560230.BD4B8131@mpi-hd.mpg.de>; from Stefan.Helfert@mpi-hd.mpg.de on Sun, Jun 25, 2000 at 02:59:28PM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Helfert <Stefan.Helfert@mpi-hd.mpg.de>
Cc: linux-lvm@msede.com

On Sun, Jun 25, 2000 at 02:59:28PM +0200, Stefan Helfert wrote:
> Dear all,
> 
> sorry if this is old stuff but I did not find any reference in the
> archive.
> 
> When trying to install a root partition with lvm and reiserfs on a
> notebook, I found that the lvmcreate_initrd script is building a
> unusable initrd:
> [initrd]./linuxrc needs /bin/mount and /bin/umount, but those won't be
> copied.

Yes, this is a known bug which is already fixed in my development tree.

> 
> System: SuSE 6.4, but I rechecked this against the lvm_0.8final.tgz.
> 
> With this patch, everything is working fine:
> (since my kernel as the SuSE standard kernel does have lvm included in
> the kernel, not as module, the script complains about the missing lvm.o.
> This could be detected, also...)
> 
> 
> Stefan
> 
> --- lvmcreate_initrd    Tue Feb 22 03:09:33 2000
> +++ lvmcreate_initrd.new        Sun Jun 25 10:56:44 2000
> @@ -37,7 +37,7 @@
>  DEVRAM=/dev/ram1
>  INITRD=/boot/initrd.gz
>  INITRDSIZE=8192
> -INITRDFILES="/sbin/modprobe /sbin/vgchange /sbin/vgscan /bin/bash
> /bin/sh /bin/rm /sbin/insmod /sbin/modprobe /dev/*
> /lib/modules/${VERSION}/modules.dep /lib/modules/${VERSION}/block/lvm.o"
> +INITRDFILES="/sbin/modprobe /sbin/vgchange /sbin/vgscan /bin/bash
> /bin/sh /bin/rm /bin/mount /bin/umount /sbin/insmod /sbin/modprobe
> /dev/* /lib/modules/${VERSION}/modules.dep
> /lib/modules/${VERSION}/block/lvm.o"
>  TMP=/tmp/mnt.$$
> 
>  trap "
> -- 
> I wish there was a knob on the TV to turn up the intelligence. 
> There's a knob called brightness, but it doesn't seem to work. 
>                                                      Gallagher

-- 

Regards,
Heinz      -- The LVM guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Bartningstr. 12
                                                  64289 Darmstadt
                                                  Germany
Mauelshagen@Sistina.com                           +49 6151 7103 86
                                                       FAX 7103 96
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
