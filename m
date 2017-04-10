Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6D027BCC3
	for <linux-lvm@redhat.com>; Mon, 10 Apr 2017 14:19:44 +0000 (UTC)
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CD257C059747
	for <linux-lvm@redhat.com>; Mon, 10 Apr 2017 14:19:42 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id z109so9994532wrb.1
	for <linux-lvm@redhat.com>; Mon, 10 Apr 2017 07:19:42 -0700 (PDT)
References: <2048a92a-0505-78c3-da00-8bf2043f4cbf@yahoo.co.uk>
	<38e06f2a-5af9-6469-ec2c-5bde2c1b199b@gmail.com>
	<3e790d03-8da8-13c4-d1d3-e1f5f7b3c6f9@yahoo.co.uk>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <18cefd41-2c11-5655-a117-2572b1bc4b7a@gmail.com>
Date: Mon, 10 Apr 2017 16:19:40 +0200
MIME-Version: 1.0
In-Reply-To: <3e790d03-8da8-13c4-d1d3-e1f5f7b3c6f9@yahoo.co.uk>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] stripped LV with segments vs one segment
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
To: lejeczek <peljasz@yahoo.co.uk>, LVM general discussion and development <linux-lvm@redhat.com>

Dne 10.4.2017 v 13:16 lejeczek napsal(a):
>
>
> On 10/04/17 12:03, Zdenek Kabelac wrote:
>> Dne 10.4.2017 v 11:29 lejeczek napsal(a):
>>> hi there
>>>
>>> I could not extend my stripped LV, had 3 stripes and wanted to add one more.
>>> Only way LVM let me do it was where I ended up with this:
>>>
>>>   --- Segments ---
>>>   Logical extents 0 to 751169:
>>>     Type        striped
>>>     Stripes        3
>>>     Stripe size        16.00 KiB
>>>     Stripe 0:
>>>       Physical volume    /dev/sdd
>>>       Physical extents    0 to 250389
>>>     Stripe 1:
>>>       Physical volume    /dev/sde
>>>       Physical extents    0 to 250389
>>>     Stripe 2:
>>>       Physical volume    /dev/sdc
>>>       Physical extents    0 to 250389
>>>
>>>   Logical extents 751170 to 1001559:
>>>     Type        linear
>>>     Physical volume    /dev/sdf
>>>     Physical extents    0 to 250389
>>>
>>> 1st question - was this really the only way LVM would extend?
>>> 2nd - is there performance penalty with segments like above vs one stripped
>>> segment?
>>>
>>
>> Hi
>>
>>
>> Not really sure what you aim to do.
>>
>> If you have LV segment with 3 stripes - you have to keep also extension
>> using 3 stripes -  you can't  have 1st. halve of LV spanning 3 disk and add
>> there a new LV segment as linear - as listed in this post.
>>
>> Both segments must by striped.
>>
>> Regards
>>
>> Zdenek
>
> I had 3 stripe LV, you know, three PVs, and wanted the LV to have 4 stripes,
> wanted to add 4th PV, you can see it from above lvdisplay.
> I tried these and each time it errored:
> $ lvextend -v -i 4 -l+100%free dellH200.InternalB/0
> $ lvextend -v -i 4 -l+100%pv dellH200.InternalB/0 /dev/sdf

You can't request stripe 4  (needs 4 disks)  and pass just single  /dev/sdf 
device.


Zdenek
