Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B1203176C3
	for <linux-lvm@redhat.com>; Tue, 11 Apr 2017 18:26:06 +0000 (UTC)
Received: from nm2-vm7.bullet.mail.ir2.yahoo.com
	(nm2-vm7.bullet.mail.ir2.yahoo.com [212.82.96.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A427E61B97
	for <linux-lvm@redhat.com>; Tue, 11 Apr 2017 18:26:04 +0000 (UTC)
References: <2048a92a-0505-78c3-da00-8bf2043f4cbf@yahoo.co.uk>
	<38e06f2a-5af9-6469-ec2c-5bde2c1b199b@gmail.com>
	<3e790d03-8da8-13c4-d1d3-e1f5f7b3c6f9@yahoo.co.uk>
	<7242e565-8540-74c1-d7db-39e84d029bf1@redhat.com>
	<570e1a57-6b36-3f09-af6c-f147c728e217@yahoo.co.uk>
	<96c8bb8b-7678-07cc-dea4-579c62a85c32@redhat.com>
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <4be4afa6-5f00-80be-4694-5e919113eb2a@yahoo.co.uk>
Date: Tue, 11 Apr 2017 19:26:02 +0100
MIME-Version: 1.0
In-Reply-To: <96c8bb8b-7678-07cc-dea4-579c62a85c32@redhat.com>
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
To: Marian Csontos <mcsontos@redhat.com>, linux-lvm@redhat.com



On 11/04/17 18:37, Marian Csontos wrote:
> On 04/10/2017 04:27 PM, lejeczek wrote:
>>
>>
>> On 10/04/17 13:27, Marian Csontos wrote:
>>> On 04/10/2017 01:16 PM, lejeczek wrote:
>>>
>>>>
>>>> I had 3 stripe LV, you know, three PVs, and wanted the 
>>>> LV to have 4
>>>> stripes, wanted to add 4th PV, you can see it from 
>>>> above lvdisplay.
>>>
>>> What you want is "reshape" not extend. This was 
>>> committed as RAID
>>> feature to 2.02.169, but it is still somewhat 
>>> experimental. You would
>>> need to convert stripe LV to RAID0 (aka takeover) and 
>>> then reshape.
>>>
>> convert from stipe to raid0 would not preserve stripe 
>> sizes? is this
>> correct?
>
> It should keep stripe size and if it does not it is a bug.
>
then probably a bug, I don't have it as was on the console 
in front of me now, but should be easy to replicate.
I had stripe LV with 16KB stripe and conversion(successful) 
to raid0 said I got 64KB stripe raid0 - is how I remember it.


>> nor it would:
>>
>> -I/--stripesize not allowed for LV dellH200.InternalB/0 
>> when converting
>> from striped to raid0.
>
> As it says, the option is simply not allowed. Also it 
> would be meaningless - one can not change stripe size 
> while converting stripe to raid0. At least not in RHEL-7.3 
> (lvm2-2.02.166). This is supposed to work in 
> upstream/2.02.169, but keep in mind that is a new feature, 
> and it is altering data, so better keep a working backup.
>
>>
>>   LVM version:     2.02.166(2)-RHEL7 (2016-11-16)
>>   Library version: 1.02.135-RHEL7 (2016-11-16)
>>   Driver version:  4.35.0
>
