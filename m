Date: Sat, 17 Jun 2000 11:03:28 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@Sistina.com>
Subject: Re: [linux-lvm] LVM patch for linux-xfs-2.4
Message-ID: <20000617110328.A6436@hmsysv.t-online.de>
Reply-To: Mauelshagen@Sistina.com
References: <20000617024951.A15926@ladystrange.bluehorizon.nl>
Mime-Version: 1.0
In-Reply-To: <20000617024951.A15926@ladystrange.bluehorizon.nl>; from pamvdam@ramoth.xs4all.nl on Sat, Jun 17, 2000 at 02:49:51AM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pamvdam@ramoth.xs4all.nl
Cc: linux-lvm@msede.com


Thanks Pascal,

i've applied it.

On Sat, Jun 17, 2000 at 02:49:51AM +0200, pamvdam@ramoth.xs4all.nl wrote:
> 
> Hi!
> 
> I'm currenlty hacking the latest XFS tree from SGI which is based on
> linux kernel 2.4test1 with LVM. Except for the XFS addition this
> kernel has more customizations. One of them, stops the LVM tools from working.
> 
> Symptoms: vgscan, pvscan, pvcreate and friends aren't able to recogneize
> 	  any PV's or disks/partitions any more.
> 
> The SGI xfs-2.4test1 tree has also an addition which adds some extra fields
> to /proc/partitions.
> 
> [/proc/partitions]
> ------------------
> 
> shadylady:~# cat /proc/partitions
> major minor  #blocks  name     rio rmerge rsect ruse wio wmerge wsect wuse running use aveq
> 
> ------------------
> 
> The file lvm_dir_cache.c contains routines to parse only 4 fields of this file
> and rapidly goes out of sync.
> 
> The attached patch solves the problem for all future /proc/partitions additions
> unless the format of the first 4 would be changed.
> 
> Best regards,
> 
> 	Pascal van Dam
> 

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
