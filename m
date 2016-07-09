Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u69HXtV1006382
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Sat, 9 Jul 2016 13:33:55 -0400
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C2609C04B331
	for <linux-lvm@redhat.com>; Sat,  9 Jul 2016 17:33:53 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id a10so7427368lfb.1
	for <linux-lvm@redhat.com>; Sat, 09 Jul 2016 10:33:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <fc811677-56eb-ca28-d8a3-605ee72fe287@alteeve.ca>
References: <20160708155231.GA27423@bdmcc-us.com>
	<fc811677-56eb-ca28-d8a3-605ee72fe287@alteeve.ca>
From: =?UTF-8?B?0JzQsNGA0Log0JrQvtGA0LXQvdCx0LXRgNCz?= <socketpair@gmail.com>
Date: Sat, 9 Jul 2016 22:33:51 +0500
Message-ID: <CAEmTpZGkbJQ9-j8k2rMqTw0JKiuAiOz4JvioK4H6keUJkO-BTw@mail.gmail.com>
Subject: Re: [linux-lvm] Copying a raw disk image to LVM2
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

One note: `sync` does not syncs written data, since it affects only
data, written through filesystem. You should use `dd ....
conv=fdatasync` instead.

2016-07-09 22:00 GMT+05:00 Digimer <lists@alteeve.ca>:
> On 08/07/16 11:52 AM, Brian McCullough wrote:
>>
>> I have been hunting for some time over the past couple of days, and find
>> several documentss that talk about converting from an LVM2 volume to a
>> raw disk image for Xen, but nothing about the reverse.
>>
>> I have a VHD disk file that I would like to put on to an LVM2 volume,
>> like my other DomU guests.
>>
>> I can see using dd, but am concerned about overwriting the LVM2 header.
>>
>>
>> Does anybody have any suggestions?
>
> I've done this with KVM before just fine. The LV metadata won't be
> overwritten when you write to the actual LV. So this would work fine;
>
> dd if=/path/to/image.raw of=/dev/vg0/lv_foo bs=4M; sync
>
> Then just change your server's definition to point at the LV instead of
> the raw file and voila.
>
> --
> Digimer
> Papers and Projects: https://alteeve.ca/w/
> What if the cure for cancer is trapped in the mind of a person without
> access to education?
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/



-- 
Segmentation fault
