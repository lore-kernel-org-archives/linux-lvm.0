Return-Path: <medi@sc.prepass.com>
Message-ID: <3AE47CC3.149B6725@sc.prepass.com>
Date: Mon, 23 Apr 2001 12:04:35 -0700
From: Medi Montaseri <medi@sc.prepass.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Need help with LVM on RedHat 7.1
References: <Pine.LNX.4.33.0104232010370.13970-100000@chasqui.LaRed.net.pe>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Thanks, but I usually don't use Beta on a production box and
also RedHat 7.1 comes with a rather old version of lvm, I think 0.8final.

But the compile errors I'm getting are two basics to have passed QA of
any distributor...I just recompiled again with only LVM enabled and not RAID
and MD
and was getting syntactical errors (compile errors) leaving to belive that
some .h
file is missing.

I will try the 'make mrproprer', maybe that'll fix it...


Carlo Marcelo Arenas Belon wrote:

> > I have been holding my breath for 2.4 for so long and as I download and
> > install RedHat 7.1 with 2.4.2-2, I find that LVM is not by default
> > configured.
>
> LVM is not by default configured because the lvm on the kernel
> (0.9.1beta2) is broken AFAIK.
>
> > vgscan(1) reports no lvm.o module found.
>
> you should appy this patch to the initscripts also AFAIK
>
> --- initscripts-5.83/rc.d/init.d/halt.lvm       Wed Feb 28 17:18:49 2001
> +++ initscripts-5.83/rc.d/init.d/halt   Mon Apr 23 20:15:51 2001
> @@ -163,6 +163,9 @@
>
>  [ -f /proc/bus/usb/devices ] && umount /proc/bus/usb
>
> +# LVM shutdown
> +[ -e /proc/lvm -a -x /sbin/vgchange -a -f /etc/lvmtab ] && /sbin/vgchange
> -a n
> +
>  # Remount read only anything that's left mounted.
>  #echo $"Remounting remaining filesystems (if any) readonly"
>  mount | awk '/ext2/ { print $3 }' | while read line; do
>
> > So I get the sources and compile with RAID and LVM marked as modules.
>
> you should get the new lvm userland programas and kernel module from :
>
>   ftp://ftp.sistina.com/pub/LVM/0.9.1_beta/
>
> until the upgraded kernel module and programs get into the oficial kernel.
>
> <SNIP>
> > My make menuconfig; make dep; make clean; make bzImage are all fine.
> > Based on some docs, I was now supposed to do 'make modules'.
>
> while building a RH kernel don't forget to copy your configuration to a
> safe place and do a $(make mrproprer) before a $(make menuconfig) or you
> could end having strange dependency problems from what is left on the
> kernel-source RPM
>
> if you follow the LVM documentation you are going to be safe, i just
> happened to make it work for RH7.1beta and LVM 0.9.1beta6.
>
> and for sure, adding a new patch to the kernel SPEC and rebuilding to get
> new RPMS is a nice way to get it working.
>
> best regards,
>
> Carlo
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

--
=======================================================================
Medi Montaseri, medi@prepass.com, 408-450-7114
Prepass Inc, IT/Operations, Software Eng.
=======================================================================
