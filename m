Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CDEC07FAB3
	for <linux-lvm@redhat.com>; Tue, 24 Oct 2017 14:51:57 +0000 (UTC)
Received: from sonic307-7.consmr.mail.ir2.yahoo.com
	(sonic307-7.consmr.mail.ir2.yahoo.com [87.248.110.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7C556272B8
	for <linux-lvm@redhat.com>; Tue, 24 Oct 2017 14:51:50 +0000 (UTC)
References: <f30cd99b-2ea1-2766-a8c9-fd61c2f2e41c@member.fsf.org>
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <ce29901c-b939-9baa-bf15-26d246842d50@yahoo.co.uk>
Date: Tue, 24 Oct 2017 15:51:45 +0100
MIME-Version: 1.0
In-Reply-To: <f30cd99b-2ea1-2766-a8c9-fd61c2f2e41c@member.fsf.org>
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Subject: Re: [linux-lvm] cache on SSD makes system unresponsive
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>



On 19/10/17 18:54, Oleg Cherkasov wrote:
> Hi,
>
> Recently I have decided to try out LVM cache feature on 
> one of our Dell NX3100 servers running CentOS 7.4.1708 
> with 110Tb disk array (hardware RAID5 with H710 and H830 
> Dell adapters).  Two SSD disks each 256Gb are in hardware 
> RAID1 using H710 adapter with primary and extended 
> partitions so I decided to make ~240Gb LVM cache to see if 
> system I/O may be improved.  The server is running Bareos 
> storage daemon and beside sshd and Dell OpenManage 
> monitoring does not have any other services. Unfortunately 
> testing went not as I expected nonetheless at the end 
> system is up and running with no data corrupted.
>
> Initially I have tried the default writethrough mode and 
> after running dd reading test with 250Gb file got system 
> unresponsive for roughly 15min with cache allocation 
> around 50%.  Writing to disks it seems speed up the system 
> however marginally, so around 10% on my tests and I did 
> manage to pull more than 32Tb via backup from different 
> hosts and once system became unresponsive to ssh and icmp 
> requests however for a very short time.
>
> I though it may be something with cache mode so switched 
> to writeback via lvconvert and run dd reading test again 
> with 250Gb file however that time everything went 
> completely unexpected. System started to slow responding 
> for simple user interactions like list files and run top. 
> And then became completely unresponsive for about half an 
> hours.  Switching to main console via iLO I saw a lot of 
> OOM messages and kernel tried to survive therefore 
> randomly killed almost all processes.  Eventually I did 
> manage to reboot and immediately uncached the array.
>
> My question is about very strange behavior of LVM cache.  
> Well, I may expect no performance boost or even I/O 
> degradation however I do not expect run out of memory and 
> than OOM kicks in.  That server has only 12Gb RAM however 
> it does run only sshd, bareos SD daemon and OpenManange 
> java based monitoring system so no RAM problems were 
> notices for last few years running with our LVM cache.
>
> Any ideas what may be wrong?  I have second NX3200 server 
> with similar hardware setup and it would be switch to 
> FreeBSD 11.1 with ZFS very time soon however I may try to 
> install CentOS 7.4 first and see if the problem may be 
> reproduced.
>
> LVM2 installed is version lvm2-2.02.171-8.el7.x86_64.
>
>
> Thank you!
> Oleg

I realized that same day I replied, mailman disabled my 
subscription, so in case it did not get through, again:

hi

not much of an explanation nor insight as to what might be 
going wrong with your setup/system but, instead my own 
conclusions/suggestions as a result of bits of my 
experience, I will share...

I would - if bigger part of a storage subsystem resides in 
the hardware - stick to the hardware, use CacheCade, let the 
hardware do the lot.

On LVM - similarly, stick to LVM, let LVM manage the whole 
lot (you will loose ~50% of a single average core(opteron 
6376) with raid5). Use the simplest HBAs(dell have such), no 
raid, not even JBOD. If disks are in same one enclosure, or 
simply under same one HBA(even though it's just a HBA) - do 
*not *mix SATA & SAS(it may work, but better not, from my 
experience)

Last one, keep that freaking firmware updated, everywhere 
possible, disks too(my latest experience with Seagate 2TB 
SAS, over hundred of those in two enclosures - I cannot, 
update does not work - Seagate's off the website tech 
support => useless = stay away from Seagate.)

I'll keep my fingers crossed for you - On luck - never too 
much of it.

>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
