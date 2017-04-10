Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 455A69AD2A
	for <linux-lvm@redhat.com>; Mon, 10 Apr 2017 14:27:53 +0000 (UTC)
Received: from nm40-vm2.bullet.mail.ir2.yahoo.com
	(nm40-vm2.bullet.mail.ir2.yahoo.com [212.82.97.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E4101C04B326
	for <linux-lvm@redhat.com>; Mon, 10 Apr 2017 14:27:51 +0000 (UTC)
References: <2048a92a-0505-78c3-da00-8bf2043f4cbf@yahoo.co.uk>
	<38e06f2a-5af9-6469-ec2c-5bde2c1b199b@gmail.com>
	<3e790d03-8da8-13c4-d1d3-e1f5f7b3c6f9@yahoo.co.uk>
	<7242e565-8540-74c1-d7db-39e84d029bf1@redhat.com>
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <570e1a57-6b36-3f09-af6c-f147c728e217@yahoo.co.uk>
Date: Mon, 10 Apr 2017 15:27:49 +0100
MIME-Version: 1.0
In-Reply-To: <7242e565-8540-74c1-d7db-39e84d029bf1@redhat.com>
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



On 10/04/17 13:27, Marian Csontos wrote:
> On 04/10/2017 01:16 PM, lejeczek wrote:
>
>>
>> I had 3 stripe LV, you know, three PVs, and wanted the LV 
>> to have 4
>> stripes, wanted to add 4th PV, you can see it from above 
>> lvdisplay.
>
> What you want is "reshape" not extend. This was committed 
> as RAID feature to 2.02.169, but it is still somewhat 
> experimental. You would need to convert stripe LV to RAID0 
> (aka takeover) and then reshape.
>
convert from stipe to raid0 would not preserve stripe sizes? 
is this correct?
nor it would:

-I/--stripesize not allowed for LV dellH200.InternalB/0 when 
converting from striped to raid0.

   LVM version:     2.02.166(2)-RHEL7 (2016-11-16)
   Library version: 1.02.135-RHEL7 (2016-11-16)
   Driver version:  4.35.0

>> I tried these and each time it errored:
>> $ lvextend -v -i 4 -l+100%free dellH200.InternalB/0
>> $ lvextend -v -i 4 -l+100%pv dellH200.InternalB/0 /dev/sdf
>> $ lvextend -i 4 -l 100%vg dellH200.InternalB/0
>>
>
> lvextend With -i 4 this would add another striped segment 
> with 4 devices after the first segment - and IIUC you do 
> not have enough space for that.
>
>
>> I did have only one segment, an LV spanning 100%vg with 
>> 100%each-pv.
>> And the above is the result of: $ lvextend -i 1 -l +100%free
>> dellH200.InternalB/0 /dev/sdf
>>
>> so, either I'm not getting it right or a stripped LV 
>> cannot be extended
>> this way - then: is there performance penalty with 
>> segments like above
>> vs one stripped
>> segment?
>>
>>
>>
>>
>>
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>
