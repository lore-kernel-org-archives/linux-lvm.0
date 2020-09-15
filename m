Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 53D40112D19F
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2020 22:32:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB7EF800800
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2020 22:32:13 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 16 Sep 2020 00:32:06 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <5070f4fa-81ad-9c9a-b0a7-8d5463ea09d3@redhat.com>
References: <3f51904f43c45f8c1259f1b050402358@assyoma.it>
	<5070f4fa-81ad-9c9a-b0a7-8d5463ea09d3@redhat.com>
Message-ID: <056d2d5dd9a7846a56971ce5f4cb3537@assyoma.it>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvmcache with vdo - inconsistent block size
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Il 2020-09-15 20:34 Zdenek Kabelac ha scritto:
> Dne 14. 09. 20 v 23:44 Gionatan Danti napsal(a):
>> Hi all,
>> I am testing lvmcache with VDO and I have issue with devices block 
>> size.
>> 
>> The big & slow VDO device is on top of a 4-disk MD RAID 10 device 
>> (itself on top of dm-integrity). Over the VDO device I created a 
>> thinpool and a thinvol [1]. When adding the cache device to the volume 
>> group via vgextend, I get an error stating "Devices have inconsistent 
>> logical block sizes (4096 and 512)." [2]
>> 
>> Now, I know why the error shows and what i means. However, I don't 
>> know how to force the cache device to act as a 4k sector device, 
>> and/if this is really required to cache a VDO device.
>> 
>> My current workaround is to set VDO with --emulate512=enabled, but 
>> this can be suboptimal and it is not recommended.
>> 
>> Any idea on what I am doing wrong?
> 
> Hi
> 
> LVM currently does not support mixing devices of different sector sizes 
> within
> a single VG as it brings lot of troubles we have not yet clear vision 
> what
> to do with all of them.

Hi Zdenek, yes, I understand. What surprised me is that lvmvdo *can* be 
combined with caching, and it does not suffer from this issue. Can you 
elaborate on why it works in this case?

> Also this combination of provisioned devices is not advised - since
> you are combining 2 kind of devices on top of each other and it can be
> a big problem
> to solve recovery case.

True.

> On lvm2 side we do not allow to use 'VDO LV' as backend for thin-pool 
> device.

I noticed it. However, from what I can read on RedHat docs, thinpool 
over VDO device should be perfectly fine (the other way around, not so 
much).

> So ATM it's on a user to solve all the possible scenarios that may 
> appear on
> such device stack.
> 
> Zdenek

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
