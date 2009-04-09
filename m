Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n39EfDOs030476
	for <linux-lvm@redhat.com>; Thu, 9 Apr 2009 10:41:13 -0400
Received: from yx-out-2324.google.com (yx-out-2324.google.com [74.125.44.30])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n39EeSOD027631
	for <linux-lvm@redhat.com>; Thu, 9 Apr 2009 10:40:48 -0400
Received: by yx-out-2324.google.com with SMTP id 8so392631yxm.81
	for <linux-lvm@redhat.com>; Thu, 09 Apr 2009 07:40:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <49DDA10D.3070005@awerner.homeip.net>
References: <49DCA275.8070203@Calva.COM> <49DDA10D.3070005@awerner.homeip.net>
Date: Thu, 9 Apr 2009 10:40:47 -0400
Message-ID: <2988d31b0904090740o1c6090fx9f46191c8d114a68@mail.gmail.com>
Subject: Re: [linux-lvm] Will LVM2 ever be able to do striped mirrors "raid 
	10"? >>> Use HARDWARE RAID CONTROLLERS
From: Greg Bledsoe <greg@bledsoehome.net>
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

I have to take issue with that.  Software raid is almost always faster
than hardware raid on any modern system.  I've run into a few special
cases where this isn't true, usually involving a database,
replication, and very large onboard raid cache.

Not to mention that adding a raid card is a single point of failure
and *poof* --  hope you had current backups.


On 4/9/09, Axel Werner <mail@awerner.homeip.net> wrote:
> Why you need RAID 10 at all ?
>
> Usualy because the need of performance and additional redundancy/fault
> tollerance.
> So if u need performance a "Software RAID Solution" would always be a
> bad choice. If you need some sort of redundancy and no performance, go
> for it. if u need performance youll better get yourself a real HARDWARE
> RAID CONTROLLER for your drives. Those cost a bit. but are worth it.
>
> Best RAID Controllers around i do know are those from ICP VORTEX
> (meanwhile belongs to Adaptec). Best Linux Support ever! Accustic alarm,
> SNMP, GUI, CLI Interfaces and Text-oriented tools to handle/configure
> the raid controller within the running os and all.
>
> 2nd best are ADAPTEC Raid controllers,
>
> also working good with linux are LSI Logic MEgaRaids. BUT... they dont
> support GNU Linux , only RH Enterprise and Suse Enterprise are
> supported. All software comes within RPM packages. (pretty bullshit!) -
> The only thing that works good is a CLI tool. with some scripting you
> can monitor your drives and raid within the os then. no accustic alarm.
> pretty crappy.
>
> DO NOT USE CHEAP "PSEUDO HARDWARE RAID CONTROLLERS" like DAWI Controll,
> Silicon Chip crap or those other 150$ shity RAID 0 or RAID 1 crap. those
> cheap controllers are NO REAL HARDWARE RAIDs. Those are just simple
> ATA/SATA Adapters with a "more advanced driver". Those Raid controllers
> are NOTHING without their drivers. just a bunch of disks. And that is
> what you usualy can see if you boot a linux on such a controller. even
> if you have configured a RAID5 or RAID1 with only ONE logical drive,
> those controllers will still present ALL physical DRIVES to the OS as
> there would be no RAID configuration at all. Drop those controllers...
> trash em.
>
> Get ICP Vortex (Adaptec) and Adaptec - Those Rock!
>
> greets
> Axel
>
>
>
> Am 08.04.2009 15:11, John Hughes schrieb:
>>                if (lp->stripes > 1) {
>>                        log_error("mirrors and stripes are currently "
>>                                  "incompatible");
>>                        return 0;
>>                }
>>
>> Should I just stick with mdadm for my mirroring and striping needs?
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

-- 
Sent from my mobile device

Greg

Prosperity is only an instrument to be used, not a deity to be worshipped.
-- Calvin Coolidge
