Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.11.6/8.11.6) with SMTP id i3MLetw10506
	for <linux-lvm@redhat.com>; Thu, 22 Apr 2004 17:41:00 -0400
Received: from mta2.cl.cam.ac.uk
	(IDENT:V1duYA1538+SnnqpiJRyFUHD6i0paHfN@mta2.cl.cam.ac.uk
	[128.232.0.14])
	by mx2.redhat.com (8.12.10/8.12.10) with SMTP id i3MLeCxF006738
	for <linux-lvm@redhat.com>; Thu, 22 Apr 2004 17:40:13 -0400
Received: from greta.cl.cam.ac.uk ([128.232.8.169] helo=cl.cam.ac.uk
	ident=[KEHcgMaqKbaD4qisqYgPCycQdBnn7fVQ])
	by mta2.cl.cam.ac.uk with esmtp (Exim 3.092 #1) id 1BGlt5-0003tr-00
	for linux-lvm@redhat.com; Thu, 22 Apr 2004 22:37:39 +0100
Subject: Re: [linux-lvm] About Extending LVM size with Hardware Raid 
In-Reply-To: Message from Glen Harris <glen@gbrmpa.gov.au> 
	of "Fri, 23 Apr 2004 07:12:45 +1000." <4088354D.3080503@gbrmpa.gov.au> 
References: <01285A15-9419-11D8-B982-000A95730E92@spamaps.org> 
	<40875353.8020104@gbrmpa.gov.au>
	<1082652373.9271.29.camel@arthur.cbd.careercast.com>
	<4088354D.3080503@gbrmpa.gov.au>
Mime-Version: 1.0
Date: Thu, 22 Apr 2004 22:37:39 +0100
From: Piete Brooks <Piete.Brooks@cl.cam.ac.uk>
Message-Id: <E1BGlt5-0003tr-00@mta2.cl.cam.ac.uk>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

> PATA disks are difficult.

Similar problems for SATA and SCSI ...

> There is a very slight chance of damaging the interface electronics,
> and motor driver electronics.

As below, that can be fixed ...

> There is also a chance of data loss, as it is difficult to guarantee that
> no write-behind cache is in operation.

If under RAID, use "raidsetfaulty" first, or otherwise make it quiescent.

> Finally, the operating system has to be able to disable an IDE device
> and redetect it,

There is code to do that, e.g. for laptop selectbays.

> including partition tables, etc

That works just fine, so long as no partition is in use, which it should not 
be.

> - somewhat of a grey area in the Linux kernel from my reading
> of the kernel sources. If that's changed, please let me know!

I re-partition disks "on the fly" fairly frequently.
I use RAID1 for all data, so I turn swapping off on the required disc, the 
"raidsetfaulty" and "raidhotremove" all the data partitions, then write the 
new partition tables which the kernels sees (check with /proc/partitions), 
then raidhotadd the partitions, mkswap and swapon, then repeat on the other 
disk, and bingo -- repartitioned without needing a reboot.
> There are cheap($30) hotswap caddies with a power switch which removes
> power from the drive and places the interface bus in Hi-Z state, but
> this still leaves the caching and operating system disable/redetect
> issues.
> 
> Cheers, glen.
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
