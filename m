Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q6VBUDIr024393
	for <linux-lvm@redhat.com>; Tue, 31 Jul 2012 07:30:13 -0400
Received: from mail.profihost.ag (mail.profihost.ag [85.158.179.208])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q6VBU7d7009882
	for <linux-lvm@redhat.com>; Tue, 31 Jul 2012 07:30:09 -0400
Message-ID: <5017C1BB.1000500@profihost.ag>
Date: Tue, 31 Jul 2012 13:30:03 +0200
From: Stefan Priebe - Profihost AG <s.priebe@profihost.ag>
MIME-Version: 1.0
References: <5016DD33.3050000@profihost.ag>	<CANN7Ug1O7oJiqK8OZpT9uqZoDXoa6Q048ZtMWNn34CEWQgu-TQ@mail.gmail.com>
	<50177A60.7020707@profihost.ag> <5017AD32.8010300@gdp-group.com>
In-Reply-To: <5017AD32.8010300@gdp-group.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] how to online resize pv?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Yes that's a workaround - i just wanted to know if this is the only way 
and if it is correct that there's no other way.
Am 31.07.2012 12:02, schrieb andreas nastke:
> how about
>
> - create new part on other drive
> - add that to vg
> - pvmove part 2 to other drive
> - remove part2 from vg
> - pvremove part 2
> - delete part 2
> - create new (larger) part 2
> - partprobe
> - then add new part to vg and 'pvmove' back
>
> andreas
>
> Stefan Priebe schrieb:
>> Am 30.07.2012 21:25, schrieb Scott Merrilees:
>>> partprobe ?
>>
>> does not work when the partition is mounted
>>
>> Stefan
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
