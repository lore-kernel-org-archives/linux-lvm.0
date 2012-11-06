Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id qA625O83000400
	for <linux-lvm@redhat.com>; Mon, 5 Nov 2012 21:05:25 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qA625Mvt008967
	for <linux-lvm@redhat.com>; Mon, 5 Nov 2012 21:05:23 -0500
Received: from melissa.gathman.org (ip72-205-26-231.dc.dc.cox.net
	[72.205.26.231]) (authenticated bits=0)
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id qA625KPW008294
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 5 Nov 2012 21:05:21 -0500
Message-ID: <50987060.7060609@bmsi.com>
Date: Mon, 05 Nov 2012 21:05:20 -0500
From: Stuart D Gathman <stuart@bmsi.com>
MIME-Version: 1.0
References: <alpine.BSF.2.00.1211051646040.1851@tdream.lly.earlham.edu>
In-Reply-To: <alpine.BSF.2.00.1211051646040.1851@tdream.lly.earlham.edu>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] how to swap a bad drive on a non-standard mirror
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
To: linux-lvm@redhat.com

Long ago, Nostradamus foresaw that on 11/05/2012 04:59 PM, Randy Schultz
would write:
> Hey all,
>
> I have a system that somebody set up, reportedly during the RHEL
> install, to have the 2 on-board drives
> mirrored.  We lost the second drive.  I know how to do deal with this
> on a standard setup with 2 PV's, but it
> looks like there is only 1 PV and I cannot find any documentation on
> how to deal with this.
>
>
> DMsetup shows:
>      ? dmsetup status
>      isw_ccebcbejfi_Volume0p2: 0 1953295155 linear
>      isw_ccebcbejfi_Volume0p1: 0 208782 linear
>      VolGroup00-LogVol03: 0 1666580480 linear
>      VolGroup00-LogVol02: 0 51183616 linear
>      VolGroup00-LogVol01: 0 184287232 linear
>      VolGroup00-LogVol00: 0 51183616 linear
>      isw_ccebcbejfi_Volume0: 0 1953519352 mirror 2 8:0 8:16
> 14905/14905 1 AR 1 core
>
>
> Here's where things get weird.  Pvscan shows only 1 device:
>      ? pvscan -v
>          Wiping cache of LVM-capable devices
>          Wiping internal VG cache
>          Walking through all physical volumes
>        PV /dev/mapper/isw_ccebcbejfi_Volume0p2   VG VolGroup00   lvm2
> [931.38 GB / 0    free]
>        Total: 1 [931.38 GB] / in use: 1 [931.38 GB] / in no VG: 0 [0   ]
>
>
> So, if I understand this correctly, sda2 and sdb2 were tied together
> somehow as a mirror, then this was
> presented to lvm as the PV.  Cool, but how do I swap out sdb?!
This has nothing to do with LVM, but google is your friend ("isw
mirror").  This is Intel Raid, and dmsetup cannot rebuild it.  There
might be some Intel tool to do so, but I would highly recommend
converting to standard software raid (mdadm).

The steps would be (untested, of course):

1) shut down system and boot from live media - you can't snapshot a VG
2) attach the new disk in some way that the Intel raid won't be using
it.  Maybe via USB.
3) Create software RAID partitions on the new disk.  They will need to
be slightly larger to hold the md metadata.
4) Start mdadm for the new partitions.  Check that the logical size of
the md devices is >= your isw partitions.
5) copy the PV (sda2) to new md device.   Copy the boot partition (sda1)
also.
6) remove sda and replace with sdb (keep sda safe in case you need to
start over), boot from SuperGrub or live media to install grub
7) Boot from converted system.  You might need to chroot from live media
and rebuild initramfs to include md driver.  The VG will be recognized
by UUID, even though it is now on a different device.
8) When You are sure everything is working well, add old sda as second
disk and add partitions as mirrors for md raid.  It might be safer to
just buy another disk if you haven't figured out how to disable the
Intel raid.
