Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8U3KQr08962
	for <linux-lvm@redhat.com>; Wed, 29 Sep 2004 23:20:26 -0400
Received: from geeksite.geeksite.org (ibz.geeksite.org [63.227.242.54])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8U3KPxD001067
	for <linux-lvm@redhat.com>; Wed, 29 Sep 2004 23:20:25 -0400
Received: from localhost (unknown [127.0.0.1])
	by geeksite.geeksite.org (Postfix) with ESMTP id 7CAE320D220
	for <linux-lvm@redhat.com>; Wed, 29 Sep 2004 21:24:13 -0600 (MDT)
Received: from geeksite.geeksite.org ([127.0.0.1])
	by localhost (geeksite [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 20335-05 for <linux-lvm@redhat.com>;
	Wed, 29 Sep 2004 21:24:07 -0600 (MDT)
Received: from [192.168.0.4] (xscott.theserrs.net [63.227.243.149])
	by geeksite.geeksite.org (Postfix) with ESMTP id 5011220D4A9
	for <linux-lvm@redhat.com>; Wed, 29 Sep 2004 21:24:07 -0600 (MDT)
Message-ID: <415B7B88.8060402@theserrs.net>
Date: Wed, 29 Sep 2004 21:20:40 -0600
From: Scott Serr <serrs@theserrs.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvmove unable to move extents to multiple smaller pvs
References: <415A53B4.60001@theserrs.net> <415B14E7.1010401@theserrs.net>
	<1096489215.1685.109.camel@localhost>
In-Reply-To: <1096489215.1685.109.camel@localhost>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

For anyone out there with this problem...  if pvmove doesn't seem to 
understand specified PE ranges on the source PV, then upgrade to a newer 
LVM2.  Gentoo's current stable .08 does not have this, but the source 
2.00.25 sure does.

Clint Byrum wrote:

>On Wed, 2004-09-29 at 13:02, Scott Serr wrote:
>  
>
>>Some more information that may be of use:
>>kernel 2.4.26 (vanilla) on gentoo on a P4 HT and SMP is enabled
>>lvm 2.00.08
>>
>>It seems that everytime I do a "pvmove" it would be hard to always go to 
>>a contiguous pv the same size or bigger.  This is why I wonder if I'm 
>>doing something wrong.
>>
>>    
>>
>
>Scott, I think this was just discussed on the list last week. What you
>need to do is pvmove in smaller chunks. pvmove only sees the first
>available block of PE's.
>
>So
>
>pvmove /dev/diskdev:1-11194
>
>Or something like that. Check the list archives from 2 or 3 days ago.
>
>  
>
>>Thanks again [to anyone out there],
>>Scott Serr
>>
>>Scott Serr wrote:
>>
>>    
>>
>>>I'm trying to use pvmove to shuffle things around.  I have a pv with 
>>>22375 extents which I would like to remove from the system.  I've 
>>>added two (2) pvs with 11194 extents each.  I get an error message:
>>>
>>>Insufficient contiguous allocatable extents (11194) for logical volume 
>>>pvmove0: 22375 required
>>>Allocation for temporary pvmove LV
>>>
>>>Now before you say, don't make it contiguous... It seems that it isn't 
>>>already.
>>>
>>># lvchange --contiguous n /dev/data_vg/data_lv
>>>Allocation policy of logical volume "data_lv" is already not contiguous
>>>
>>>Is this normal?  Do I really need all that contiguous space on 1 pv?
>>>
>>>Thanks in advance,
>>>Scott Serr
>>>
>>>_______________________________________________
>>>linux-lvm mailing list
>>>linux-lvm@redhat.com
>>>https://www.redhat.com/mailman/listinfo/linux-lvm
>>>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>      
>>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@redhat.com
>>https://www.redhat.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>>    
>>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>  
>
