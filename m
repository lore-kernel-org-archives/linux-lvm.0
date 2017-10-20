Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8428B5D762
	for <linux-lvm@redhat.com>; Fri, 20 Oct 2017 10:38:55 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1C632C04B952
	for <linux-lvm@redhat.com>; Fri, 20 Oct 2017 10:38:52 +0000 (UTC)
Received: from webmail.dds.nl (app2.dds.nl [81.21.136.118])
	by smtp2.signet.nl (Postfix) with ESMTP id AD70140BCD52
	for <linux-lvm@redhat.com>; Fri, 20 Oct 2017 12:38:50 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 20 Oct 2017 10:38:50 +0000
From: Xen <list@xenhideout.nl>
In-Reply-To: <62efc412-fd2b-5412-9de5-015dd8136bf2@member.fsf.org>
References: <f30cd99b-2ea1-2766-a8c9-fd61c2f2e41c@member.fsf.org>
	<e1f18d05e7670e9d63075854195a2c70@xenhideout.nl>
	<62efc412-fd2b-5412-9de5-015dd8136bf2@member.fsf.org>
Message-ID: <133a1f046bbd53375d8c1230b2c1660f@xenhideout.nl>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Oleg Cherkasov schreef op 20-10-2017 10:21:
> On 19. okt. 2017 20:13, Xen wrote:
>> 
>> The main cause was a way too slow SSD but at the same time... that 
>> sorta thing still shouldn't happen, locking up the entire system.
>> 
>> I haven't had a chance to try again with a faster SSD.
> 
> I have double checked with MegaRAID/CLI and all disks on that rig
> (including SSD ones of course) are SAS 6Gb/s both devices and links.
> My first thought about those SSDs was that those are slower than RAID5
> however it seems not the case.
> 
> Could it be TRIMing issue because those are from 2012?

You mean that the SATA version is too low to interleave TRIMs with data 
access?

Because I think that was the case with my mSata SSD.

I don't currently remember the sata version that allowed interleaving 
but that SSD didn't reach or have it.

After trimming performance would go up greatly.

So I don't know about SAS but it might be similar right.
