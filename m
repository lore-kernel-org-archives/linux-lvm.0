Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k3TH1GTn023890
	for <linux-lvm@redhat.com>; Sat, 29 Apr 2006 13:01:16 -0400
Received: from mail.volved.com (c-71-192-139-98.hsd1.ma.comcast.net
	[71.192.139.98])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k3TH17aA027611
	for <linux-lvm@redhat.com>; Sat, 29 Apr 2006 13:01:07 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.volved.com (Postfix) with ESMTP id 7CC131032
	for <linux-lvm@redhat.com>; Sat, 29 Apr 2006 12:30:54 -0400 (EDT)
Received: from mail.volved.com ([127.0.0.1])
	by localhost (monolith [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 22405-17 for <linux-lvm@redhat.com>;
	Sat, 29 Apr 2006 12:30:45 -0400 (EDT)
Received: from [192.168.0.210] (unknown [192.168.0.210])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.volved.com (Postfix) with ESMTP id 854DA1B7E
	for <linux-lvm@redhat.com>; Sat, 29 Apr 2006 12:30:45 -0400 (EDT)
Message-ID: <445394B9.6040104@volved.com>
Date: Sat, 29 Apr 2006 12:30:49 -0400
From: Barnaby Claydon <bclaydon@volved.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgchange -ay Killed
References: <1146240603.23548.106.camel@localhost.localdomain>	<01309aa0302de7b36b75ce2612b38706@redhat.com>
	<1146262242.23548.207.camel@localhost.localdomain>
In-Reply-To: <1146262242.23548.207.camel@localhost.localdomain>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Have you tried creating less than 3,000 LVs at a time? Maybe start with 
1,000 and make sure it activates, then maybe 2,000 and test again - 
until you find the threshold where it breaks?

Not that I'm an expert on data storage, but if you need 3,000 LVs, then 
you should probably be using more than 1 VG...

-Barnaby



Ming Zhang wrote:
> no.  i do 
>
> lvcreate -L1G -nlv1 vg1
> ...
> lvcreate -L1G -nlv3000 vg1
>
> so total 3000 logical volumes.
>
> then optionally i do lvscan, vgscan, pvscan. all kinds of scan. seems
> not fast.
>
> then i reboot, and then the vg will fail to activate all lv.
>
> ming
>
>
> On Fri, 2006-04-28 at 17:09 -0500, Jonathan E Brassow wrote:
>   
>> You mean:
>> 1) lvcreate -L 3k -n lv vg
>> 2) vgchange -an vg
>> 3) vgchange -ay vg
>>
>> or do you mean something else?
>>
>>   brassow
>>
>> On Apr 28, 2006, at 11:10 AM, Ming Zhang wrote:
>>
>>     
>>> This is what i get when try to active a VG with 3K LVs. repeatable.
>>>
>>>   LVM version:     2.02.01 (2005-11-23)
>>>   Library version: 1.02.02 (2006-01-04)
>>>   Driver version:  4.4.0
>>>
>>>
>>> [root@dualxeon ~]# vgchange -ay
>>> Killed
>>>
>>>
>>> seem that "Locking memory" only appear once, and then stuck till 
>>> killed.
>>>
>>> --------some debug output if i use vgchang -ay -vvv--------------
>>>     Found volume group "vg1"
>>>         Getting device info for vg1-v678
>>>         dm info
>>> LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCejSzi1SuM3uO3NWrpDB2Fle5A3Uv6i367 N
>>> [16384]
>>>         Locking LV
>>> 8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCeL0DcqwlzsZSb0p6eIhXnV2uyE8KNAZG2 (R)
>>>       Finding volume group for uuid
>>> 8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCeL0DcqwlzsZSb0p6eIhXnV2uyE8KNAZG2
>>>       /dev/md0: lvm2 label detected
>>>       /dev/md1: lvm2 label detected
>>>       /dev/md0: lvm2 label detected
>>>       /dev/md1: lvm2 label detected
>>>         Read vg1 metadata (3001) from /dev/md0 at 272384 size 706783
>>>       /dev/md0: lvm2 label detected
>>>       /dev/md1: lvm2 label detected
>>>         Read vg1 metadata (3001) from /dev/md1 at 272384 size 706783
>>>     Found volume group "vg1"
>>>         Getting device info for vg1-v679
>>>         dm info
>>> LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCeL0DcqwlzsZSb0p6eIhXnV2uyE8KNAZG2 N
>>> [16384]
>>>         Locking LV
>>> 8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCeccjyapQkKwo75je1cFLyZ84RO4LWQnk5 (R)
>>>       Finding volume group for uuid
>>> 8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCeccjyapQkKwo75je1cFLyZ84RO4LWQnk5
>>>       /dev/md0: lvm2 label detected
>>>       /dev/md1: lvm2 label detected
>>>       /dev/md0: lvm2 label detected
>>>       /dev/md1: lvm2 label detected
>>>         Read vg1 metadata (3001) from /dev/md0 at 272384 size 706783
>>>       /dev/md0: lvm2 label detected
>>>       /dev/md1: lvm2 label detected
>>>         Read vg1 metadata (3001) from /dev/md1 at 272384 size 706783
>>>     Found volume group "vg1"
>>>         Getting device info for vg1-v680
>>>         dm info
>>> LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCeccjyapQkKwo75je1cFLyZ84RO4LWQnk5 N
>>> [16384]
>>>         dm info
>>> 8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCeccjyapQkKwo75je1cFLyZ84RO4LWQnk5 N
>>> [16384]
>>>         dm info vg1-v680  N   [16384]
>>>       Locking memory
>>>
>>>
>>> _______________________________________________
>>> linux-lvm mailing list
>>> linux-lvm@redhat.com
>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>
>>>       
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>   
