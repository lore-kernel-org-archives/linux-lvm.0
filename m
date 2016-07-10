Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6AM2QWM012689
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sun, 10 Jul 2016 18:02:26 -0400
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2A057627EE
	for <linux-lvm@redhat.com>; Sun, 10 Jul 2016 22:02:25 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id w75so13967519wmd.1
	for <linux-lvm@redhat.com>; Sun, 10 Jul 2016 15:02:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAEmTpZGkbJQ9-j8k2rMqTw0JKiuAiOz4JvioK4H6keUJkO-BTw@mail.gmail.com>
References: <20160708155231.GA27423@bdmcc-us.com>
	<fc811677-56eb-ca28-d8a3-605ee72fe287@alteeve.ca>
	<CAEmTpZGkbJQ9-j8k2rMqTw0JKiuAiOz4JvioK4H6keUJkO-BTw@mail.gmail.com>
From: emmanuel segura <emi2fast@gmail.com>
Date: Mon, 11 Jul 2016 00:02:23 +0200
Message-ID: <CAE7pJ3ARBWgFmuHKCm+pMO+K2=20bcps6P-T_RL7-rwbEgHKKQ@mail.gmail.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

the lvm metadata is stored in the begining of the physical volume, the
logical volume is simple block device, so using dd you don't overwrite
any lvm header.

2016-07-09 19:33 GMT+02:00 Марк Коренберг <socketpair@gmail.com>:
> One note: `sync` does not syncs written data, since it affects only
> data, written through filesystem. You should use `dd ....
> conv=fdatasync` instead.
>
> 2016-07-09 22:00 GMT+05:00 Digimer <lists@alteeve.ca>:
>> On 08/07/16 11:52 AM, Brian McCullough wrote:
>>>
>>> I have been hunting for some time over the past couple of days, and find
>>> several documentss that talk about converting from an LVM2 volume to a
>>> raw disk image for Xen, but nothing about the reverse.
>>>
>>> I have a VHD disk file that I would like to put on to an LVM2 volume,
>>> like my other DomU guests.
>>>
>>> I can see using dd, but am concerned about overwriting the LVM2 header.
>>>
>>>
>>> Does anybody have any suggestions?
>>
>> I've done this with KVM before just fine. The LV metadata won't be
>> overwritten when you write to the actual LV. So this would work fine;
>>
>> dd if=/path/to/image.raw of=/dev/vg0/lv_foo bs=4M; sync
>>
>> Then just change your server's definition to point at the LV instead of
>> the raw file and voila.
>>
>> --
>> Digimer
>> Papers and Projects: https://alteeve.ca/w/
>> What if the cure for cancer is trapped in the mind of a person without
>> access to education?
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
>
> --
> Segmentation fault
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/



-- 
  .~.
  /V\
 //  \\
/(   )\
^`~'^
