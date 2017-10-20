Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E349E5C1A3
	for <linux-lvm@redhat.com>; Fri, 20 Oct 2017 09:59:05 +0000 (UTC)
Received: from erato-smout.broadpark.no (erato-smout.broadpark.no
	[80.202.10.26]) by mx1.redhat.com (Postfix) with ESMTP id 3BF0E343366
	for <linux-lvm@redhat.com>; Fri, 20 Oct 2017 09:59:03 +0000 (UTC)
MIME-version: 1.0
Content-Transfer-Encoding: 8bit
Received: from osl1cloudm2.nextgentel.net ([80.202.10.59])
	by erato-smout.broadpark.no
	(Oracle Communications Messaging Server 7u4-27.01(7.0.4.27.0) 64bit
	(built Aug
	30 2012)) with ESMTP id <0OY4004OK8ZM3O30@erato-smout.broadpark.no> for
	linux-lvm@redhat.com; Fri, 20 Oct 2017 11:59:02 +0200 (CEST)
References: <541215543.377417.1508458336923.ref@mail.yahoo.com>
	<541215543.377417.1508458336923@mail.yahoo.com>
	<20caebee6f708ec9180ba192d6001d39@xenhideout.nl>
From: Oleg Cherkasov <o1e9@member.fsf.org>
Message-id: <84dfb96f-5fd0-300d-b619-621394dc1a72@member.fsf.org>
Date: Fri, 20 Oct 2017 11:59:01 +0200
In-reply-to: <20caebee6f708ec9180ba192d6001d39@xenhideout.nl>
Content-language: en-US
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
To: linux-lvm@redhat.com

On 20. okt. 2017 08:46, Xen wrote:
> matthew patton schreef op 20-10-2017 2:12:
>>> It is just a backup server,
>>
>> Then caching is pointless.
> 
> That's irrelevant and not up to another person to decide.
> 
>> Furthermore any half-wit caching solution
>> can detect streaming read/write and will deliberately bypass the
>> cache.
> 
> The problem was not performance, it was stability.
> 
>> Furthermore DD has never been a useful benchmark for anything.
>> And if you're not using 'odirect' it's even more pointless.
> 
> Performance was not the issue, stability was.
> 
>>> Server has 2x SSD drives by 256Gb each
>>
>> and for purposes of 'cache' should be individual VD and not waste
>> capacity on RAID1.
> 
> Is probably also going to be quite irrelevant to the problem at hand.
> 
>>> 10x 3Tb drives.  In addition  there are two
>>> MD1200 disk arrays attached with 12x 4Tb disks each.  All
>>
>> Raid5 for this size footprint is NUTs. Raid6 is the bare minimum.
> 
> That's also irrelevant to the problem at hand.

Hi Matthew,

I mostly agree with Xen about stability vs usability issues.  I have a 
stable system and available SSD partition with unused 240Gb so decided 
to run tests with LVM caching using different cache modes.  The _test_ 
results are in my posts so LVM caching has stability issues indeed 
regardless how I did set it up.

I do agree I would need to make a separate Virtual hardware volume for 
the cache and the most likely do not mirror it.  However, the 
performance of the system is defined by a weakest point so it may be 
indeed the slow SSD of course.  I may expect performance degradation 
because of that but not whole system lock down, deny of any services and 
follow with reboot.

Your assumptions about streaming operations of _just a backup server_ 
are not quite right.  Bareos Directory configuration running on a 
separate server pushes that Storage to run multiple backups in parallel 
and eventually restores at the same time.  Therefore even there are just 
few streams going in and out the RAID is really doing random read and 
write operations.

DD is definitely is not a good way to test any caching system, I do 
agree, however it is first first to try and see any good/bad/ugly 
results before running other tests like bonnie++.  In my case, the right 
next command after 'lvconvert' to cache and 'pvs' to check the status, 
were 'dd if=some_250G_file of=/dev/null bs=8M status=process' and that 
was the moment everything went completely unexpected with an unplanned 
reboot.

About RAID5 vs RAIS6, well, as I mentioned in a separate message there 
is a logical volume built of 3 hardware RAID5 virtual disks so it is not 
30+ disks in one RAID5 or something.  Besides, that server is a 
front-end to LTO-6 library so even unexpected happens it would take 3-4 
days to pile-up it from client hosts anyway. And I have few disks in 
stock so replacing and rebuilding RAID5 takes no more than 12 hours. 
RAID5 vs RAID6 is a matter of operational activities efficiency: watch 
dog system logs with Graylog2 and Dell OpenManage/MegaRAID, have spare 
disk and do everything on time.


Cheers,
Oleg
