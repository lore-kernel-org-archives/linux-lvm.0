Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3GGfiKJ027312
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 12:41:44 -0400
Received: from mail.brunson.com (www.brunson.com [72.249.20.185])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n3GGfRjr017636
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 12:41:27 -0400
Received: from [172.20.11.71] (unknown [12.109.229.8])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.brunson.com (Postfix) with ESMTP id 125F76C37B
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 10:41:25 -0600 (MDT)
Message-ID: <49E75FB5.2050700@brunson.com>
Date: Thu, 16 Apr 2009 10:41:25 -0600
From: Eric Brunson <brunson@brunson.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Move an array/volgroup to another machine.
References: <49E757A9.6090108@verizon.net>
	<49E758EF.40309@brunson.com>	<49E75944.9080100@brunson.com>
	<49E75DDD.7040500@verizon.net>
In-Reply-To: <49E75DDD.7040500@verizon.net>
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

On 04/16/2009 10:33 AM, Gerry Reno wrote:
> Eric Brunson wrote:
>> On 04/16/2009 10:12 AM, Eric Brunson wrote:
>>> On 04/16/2009 10:07 AM, Gerry Reno wrote:
>>>> We built a replacement server (x86_64) for an older server (x86).  
>>>> Now we want to move a RAID-5 array intact from the older machine 
>>>> over to the new machine.  We know the UUID of the array and of all 
>>>> the PV and VG on the array.  So what commands should we perform 
>>>> after plugging in all the array drives to the new server to bring 
>>>> up the array and lvm on the new machine?
>>>
>>> "vgscan" and "vgchange -a VGNAME" I believe.
>>
>>
>> Sorry, doing three things at once:  vgchange -a y VGNAME
>>
>>
>>>
>>> Make sure your VG name doesn't conflict with any already in the 
>>> machine.
>>>
> Will vgchange activate the raid array?


Is it an md (software) RAID or a hardware RAID device?

If the former, then I'm not sure.  I'll have to defer to someone with 
more md experience.
If the latter, then it depends of if you have the correct drivers and 
hardware detection.


>
> The new server just has a couple raid-1 arrays on it right now.  But 
> we need the raid-5 to be activated because there is a volgroup that 
> uses the raid-5 device as it's PV.
>
> Regards,
> Gerry
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
