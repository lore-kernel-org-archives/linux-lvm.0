Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u15GCsNg007918
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Fri, 5 Feb 2016 11:12:54 -0500
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mx1.redhat.com (Postfix) with ESMTPS id DFF4B35BA50
	for <linux-lvm@redhat.com>; Fri,  5 Feb 2016 16:12:52 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id b35so70781098qge.0
	for <linux-lvm@redhat.com>; Fri, 05 Feb 2016 08:12:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <56B4BD12.3050103@redhat.com>
References: <CAGU4k=2NLJqM2P+_fNiOc82Ynfppk5qNShZsSVy4S=hJMxw7_A@mail.gmail.com>
	<CAAYit8T1Wh+zQT_fsEk88D=1hv2A=kLVGWQAcdccjzx5xPuh5g@mail.gmail.com>
	<56B4BD12.3050103@redhat.com>
Date: Sat, 6 Feb 2016 00:12:52 +0800
Message-ID: <CAAYit8SG+PrSfGzi6S0eYpX8SQhECCvaeWvN9Gqq9z8VwA8SmQ@mail.gmail.com>
From: "M.H. Tsai" <mingnus@gmail.com>
Subject: Re: [linux-lvm] Repair thin pool
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

2016-02-05 23:17 GMT+08:00 Zdenek Kabelac <zkabelac@redhat.com>:
> Dne 5.2.2016 v 12:44 M.H. Tsai napsal(a):
>>
>> Hi,
>>
>> Seems that your steps are wrong.  You should run thin_repair before
>> swapping the pool metadata.
>
> Nope - actually they were correct.
>
>> Also, thin_restore is for XML(text) input, not for binary metadata
>> input, so it's normal to get segmentation fault...
>>
>> "lvconvert --repair ... " is a command wrapping "thin_repair +
>> swapping metadata"  into a single step.
>> If it doesn't work, then you might need to dump the metadata manually,
>> to check if there's serious corruption in mapping trees or not....
>> (I recommend to use the newest thin-provisioning-tools to get better
>> result)
>>
>> 1. active the pool metadata (It's okay if the command failed. We just
>> want to activate the hidden metadata LV)
>> lvchange -ay vgg1/pool_nas
>>
>> 2. dump the metadata, then checkout the output XML
>> thin_dump /dev/mapper/vgg1-pool_nas_tmeta -o thin_dump.xml -r
>
> Here is actually what goes wrong.
>
> You should not try to access 'life' metadata (unless you take thin-pool
> snapshot of them)
>
> So by using thin-dump on life changed volume you often get 'corruptions'
> listed which actually do not exist.
>
> That said - if your thin-pool got 'blocked' for whatever reason
> (deadlock?) - reading such data which cannot be changed anymore could
> provide the 'best' guess data you could get - so in some cases it depends on
> use-case
> (i.e. you disk is dying and it may not run at all after reboot)...
>
> You should always repair data where you are sure they are not changing in
> background.
>
> That's why --repair requires currently offline state of thin-pool.
> It should do all 'swap' operations in proper order.
>
> Zdenek

Yes, we should repair the metadata when the pool is offline, but LVM
cannot activate a hidden metadata LV. So the easiest way is activating
the entire pool. Maybe we need some option to force activate a hidden
volume, like "lvchange -ay vgg1/pool_nas_tmeta -ff". It's useful for
repairing metadata. Otherwise, we should use dmsetup to manually
create the device.

In my experience, if the metadata had serious problem, then the pool
device usually cannot be created, so the metadata is not accessed by
kernel... Just a coincidence.


Ming-Hung Tsai
