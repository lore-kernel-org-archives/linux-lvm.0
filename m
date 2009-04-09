Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n397I761002263
	for <linux-lvm@redhat.com>; Thu, 9 Apr 2009 03:18:07 -0400
Received: from viefep18-int.chello.at (viefep18-int.chello.at [62.179.121.38])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n397HhAR013051
	for <linux-lvm@redhat.com>; Thu, 9 Apr 2009 03:17:44 -0400
Received: from edge04.upc.biz ([192.168.13.239]) by viefep18-int.chello.at
	(InterMail vM.7.09.01.00 201-2219-108-20080618) with ESMTP
	id <20090409071743.DFNU25163.viefep18-int.chello.at@edge04.upc.biz>
	for <linux-lvm@redhat.com>; Thu, 9 Apr 2009 09:17:43 +0200
Received: from [127.0.0.1] (unknown [192.168.0.7])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by freiburg.homeip.net (Postfix) with ESMTPSA id C1E9D1486D3
	for <linux-lvm@redhat.com>; Thu,  9 Apr 2009 09:18:08 +0200 (CEST)
Message-ID: <49DDA10D.3070005@awerner.homeip.net>
Date: Thu, 09 Apr 2009 09:17:33 +0200
From: Axel Werner <mail@awerner.homeip.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Will LVM2 ever be able to do striped mirrors "raid
	10"? >>> Use HARDWARE RAID CONTROLLERS
References: <49DCA275.8070203@Calva.COM>
In-Reply-To: <49DCA275.8070203@Calva.COM>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Why you need RAID 10 at all ?

Usualy because the need of performance and additional redundancy/fault 
tollerance.
So if u need performance a "Software RAID Solution" would always be a 
bad choice. If you need some sort of redundancy and no performance, go 
for it. if u need performance youll better get yourself a real HARDWARE 
RAID CONTROLLER for your drives. Those cost a bit. but are worth it.

Best RAID Controllers around i do know are those from ICP VORTEX 
(meanwhile belongs to Adaptec). Best Linux Support ever! Accustic alarm, 
SNMP, GUI, CLI Interfaces and Text-oriented tools to handle/configure 
the raid controller within the running os and all.

2nd best are ADAPTEC Raid controllers,

also working good with linux are LSI Logic MEgaRaids. BUT... they dont 
support GNU Linux , only RH Enterprise and Suse Enterprise are 
supported. All software comes within RPM packages. (pretty bullshit!) - 
The only thing that works good is a CLI tool. with some scripting you 
can monitor your drives and raid within the os then. no accustic alarm. 
pretty crappy.

DO NOT USE CHEAP "PSEUDO HARDWARE RAID CONTROLLERS" like DAWI Controll, 
Silicon Chip crap or those other 150$ shity RAID 0 or RAID 1 crap. those 
cheap controllers are NO REAL HARDWARE RAIDs. Those are just simple 
ATA/SATA Adapters with a "more advanced driver". Those Raid controllers 
are NOTHING without their drivers. just a bunch of disks. And that is 
what you usualy can see if you boot a linux on such a controller. even 
if you have configured a RAID5 or RAID1 with only ONE logical drive, 
those controllers will still present ALL physical DRIVES to the OS as 
there would be no RAID configuration at all. Drop those controllers... 
trash em.

Get ICP Vortex (Adaptec) and Adaptec - Those Rock!

greets
Axel



Am 08.04.2009 15:11, John Hughes schrieb:
>                if (lp->stripes > 1) {
>                        log_error("mirrors and stripes are currently "
>                                  "incompatible");
>                        return 0;
>                }
>
> Should I just stick with mdadm for my mirroring and striping needs?
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
