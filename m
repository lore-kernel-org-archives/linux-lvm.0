Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n39BhCcr002289
	for <linux-lvm@redhat.com>; Thu, 9 Apr 2009 07:43:13 -0400
Subject: Re: [linux-lvm] Will LVM2 ever be able to do striped mirrors "raid
	10"? >>> Use HARDWARE RAID CONTROLLERS
From: "Bryn M. Reeves" <bmr@redhat.com>
In-Reply-To: <49DDA10D.3070005@awerner.homeip.net>
References: <49DCA275.8070203@Calva.COM> <49DDA10D.3070005@awerner.homeip.net>
Date: Thu, 09 Apr 2009 12:45:13 +0100
Message-Id: <1239277513.4484.234.camel@breeves.fab.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 2009-04-09 at 09:17 +0200, Axel Werner wrote:
> Why you need RAID 10 at all ?
> 
> Usualy because the need of performance and additional redundancy/fault 
> tollerance.
> So if u need performance a "Software RAID Solution" would always be a 
> bad choice. If you need some sort of redundancy and no performance, go 
> for it. if u need performance youll better get yourself a real HARDWARE 
> RAID CONTROLLER for your drives. Those cost a bit. but are worth it.

Common myth; as John says please present benchmarks to support this.
While there are some advantages to hardware RAID that can be a benefit
in some situations it's not safe to assume that the hardware solution
outperforms the software approach. It can do but usually only when the
number of disks to manage reaches a level where PCI bus saturation
becomes an issue. Below this point, particularly for RAID levels
involving parity calculations software will often outperform a hardware
solution (it uses the host CPU for these calculations instead of the
itty-bitty embedded processor on the RAID card).

> Best RAID Controllers around i do know are those from ICP VORTEX 
> (meanwhile belongs to Adaptec). Best Linux Support ever! Accustic alarm, 
> SNMP, GUI, CLI Interfaces and Text-oriented tools to handle/configure 
> the raid controller within the running os and all.

ICP Vortex use the aacraid chipset from Adaptec (also shipped in
different forms by a number of other OEMs and system integrators).

> also working good with linux are LSI Logic MEgaRaids. BUT... they dont 
> support GNU Linux , only RH Enterprise and Suse Enterprise are 

What are you talking about? The megaraid driver has been in the kernel
for years now. It's been a very long time since you had to use
out-of-tree modules for these cards (even if the vendors still provide
their own packaged binary modules).

> DO NOT USE CHEAP "PSEUDO HARDWARE RAID CONTROLLERS" like DAWI Controll, 
> Silicon Chip crap or those other 150$ shity RAID 0 or RAID 1 crap. those 
> cheap controllers are NO REAL HARDWARE RAIDs. Those are just simple 
> ATA/SATA Adapters with a "more advanced driver". Those Raid controllers 

The vendor provided drivers for these cards are generally junk. Most ATA
soft-RAID cards now work reasonably well with the dmraid tools.

> are NOTHING without their drivers. just a bunch of disks. And that is 
> what you usualy can see if you boot a linux on such a controller. even 
> if you have configured a RAID5 or RAID1 with only ONE logical drive, 

RAID5 with one drive?

> those controllers will still present ALL physical DRIVES to the OS as 
> there would be no RAID configuration at all. Drop those controllers... 
> trash em.

Yep, that's where dmraid comes in - it interprets the on-disk metadata
and generates an appropriate device-mapper table to map the arrays on
the disks without any need for the proprietary drivers.

Regards,
Bryn.
