Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CE3760FDF
	for <linux-lvm@redhat.com>; Fri, 25 Jan 2019 21:53:51 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2BCBEC051663
	for <linux-lvm@redhat.com>; Fri, 25 Jan 2019 21:53:50 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id p7so11886703wru.0
	for <linux-lvm@redhat.com>; Fri, 25 Jan 2019 13:53:50 -0800 (PST)
References: <CAKM4Aexk-=PBRMCUvXwzHxXzWCbYL22dSo+uHFXaasVCVuKddA@mail.gmail.com>
	<CAKM4AexhaSRAv4=aiuFpwHeB30eYrHr5PgktM9Ef67Y84M30Fw@mail.gmail.com>
	<CAKM4Aezaxa-mFDbyq2uDvZZUM2xgi6GyGAHoQaeWnUn9JExcFw@mail.gmail.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <3d9fcd41-46df-aa71-7be9-f2258b7598e5@gmail.com>
Date: Fri, 25 Jan 2019 22:53:46 +0100
MIME-Version: 1.0
In-Reply-To: <CAKM4Aezaxa-mFDbyq2uDvZZUM2xgi6GyGAHoQaeWnUn9JExcFw@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Question about thin-pool/thin LV with stripes
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Eric Ren <renzhengeek@gmail.com>

Dne 24. 01. 19 v 16:06 Eric Ren napsal(a):
> Hi,
> 
>     With single command to create thin-pool, the metadata LV is not created
>     with striped
>     target. Is this designed on purpose, or just the command doesn't handle
>     this case very
>     well for now?
> 
>     My main concern here is, if the metadata LV use stripped target, can
>     thin_check/thin_repair tools work fine?
> 
> 
> In our use scenario, we want to use DM thinp for a lot of containers as 
> rootfs. The container use heavy on snapshots,
> so above 4K thin/snapshots LVs may share the thin pool concurrently.
> 
> This may make the space fragmented. So, another concern is, will using striped 
> thinp make
> fragmentation much more worse?

Hi

When 'stripe_size' is the 'right size' - striped device should appear faster,
but telling you what's the best size is some sort of 'black magic'  :)

Basically - strip size should match boundaries of thin-pool chunk sizes.

i.e. for thin-pool with 128K chunksize -  and 2 disks -
I'd assume best result you should get with 64K stripesize (so 2 disks will 
make it 128K stripe)  - but it depends on number of hw aspects.

So you will need to benchmark it.

Zdenek
