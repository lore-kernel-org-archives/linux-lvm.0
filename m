Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 90B755C881
	for <linux-lvm@redhat.com>; Mon, 11 Sep 2017 10:35:39 +0000 (UTC)
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 89C1BC0D7978
	for <linux-lvm@redhat.com>; Mon, 11 Sep 2017 10:35:38 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id 108so13608016wra.5
	for <linux-lvm@redhat.com>; Mon, 11 Sep 2017 03:35:38 -0700 (PDT)
References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<0c6c96790329aec2e75505eaf544bade@assyoma.it>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
Date: Mon, 11 Sep 2017 12:35:35 +0200
MIME-Version: 1.0
In-Reply-To: <0c6c96790329aec2e75505eaf544bade@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Gionatan Danti <g.danti@assyoma.it>

Dne 10.9.2017 v 00:04 Gionatan Danti napsal(a):
> Il 08-09-2017 12:35 Gionatan Danti ha scritto:
>> Hi list,
>> as by the subject: is it possible to reserve space for specific thin
>> logical volumes?
>>
>> This can be useful to "protect" critical volumes from having their
>> space "eaten" by other, potentially misconfigured, thin volumes.
>>
>> Another, somewhat more convoluted, use case is to prevent snapshot
>> creation when thin pool space is too low, causing the pool to fill up
>> completely (with all the associated dramas for the other thin
>> volumes).
>>
>> Thanks.
> 
> Hi all,
> anyone with some informations?
> 
> Any comment would be very appreciated :)
> Thanks.


Hi


Not sure for which information are you looking for ??

Having 'reserved' space for thinLV - means - you have to add more space
to this thin-pool -  there is not much point in keeping space in VG,
which could be only used for extension of particular LV ??

What we do have thought is 'shard' "_pmspare' extra space for metadata 
recovery, but there is nothing  like that for data space (and not even planned).

There is support for so-called- fully-provisioned thinLVs withing thin-pool 
in-plan, but that probably doesn't suit your needs.


The first question here is - why do you want to use thin-provisioning ?

As thin-provisioning is about 'promising the space you can deliver later when 
needed'  - it's not about hidden magic to make the space out-of-nowhere.
The idea of planning to operate thin-pool on 100% fullness boundary is simply 
not going to work well - it's  not been designed for that use-case - so if 
that's been your plan - you will need to seek for other solution.
(Unless you seek for those 100% provisioned devices)

Regards


Zdenek
