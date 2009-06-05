Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n55Hmn4E010314
	for <linux-lvm@redhat.com>; Fri, 5 Jun 2009 13:48:49 -0400
Received: from ncore.ece.northwestern.edu (ncore.ece.northwestern.edu
	[129.105.8.9])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n55HmYZK023561
	for <linux-lvm@redhat.com>; Fri, 5 Jun 2009 13:48:34 -0400
Received: from m364d1.ece.northwestern.edu (m364d1.ece.northwestern.edu
	[129.105.6.180])
	by ncore.ece.northwestern.edu (Postfix) with ESMTP id 304C37C285
	for <linux-lvm@redhat.com>; Fri,  5 Jun 2009 12:48:34 -0500 (CDT)
Date: Fri, 5 Jun 2009 12:47:22 -0500
From: Zhengquan Zhang <zhang.zhengquan@gmail.com>
Subject: Re: [linux-lvm] lvm on a single big partition or just a single big
	partition?
Message-ID: <20090605174722.GB15305@m364d1.ece.northwestern.edu>
References: <20090603164231.GA23418@m364d1.ece.northwestern.edu>
	<Pine.LNX.4.64.0906031436460.14629@bmsred.bmsi.com>
	<20090603184601.GA25936@m364d1.ece.northwestern.edu>
	<4A28D080.3070804@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4A28D080.3070804@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Fri, Jun 05, 2009 at 10:00:00AM +0200, Marian Csontos wrote:
> Zhengquan Zhang wrote:
>> On Wed, Jun 03, 2009 at 02:42:29PM -0400, Stuart D. Gathman wrote:
>>   
>>> On Wed, 3 Jun 2009, Zhengquan Zhang wrote:
>>>
>>>     
>>>> For one harddrive I often create a /boot parition that is not lvm and
>>>> create a huge partition on the rest of the harddrive for PV of lvm. Now
>>>> I am thinking what is the difference between doing partition like this
>>>> and just a single big partition without lvm?
>>>>       
>>> With LVM, you can create many logical volumes.  If you only ever create one
>>> logical volume that fills the entire PV, and you aren't spanning drives
>>> (multiple PVs) or mirroring, then LVM is not doing anything for you.
>>>     
> Not at the moment, but the moment you run out of space and decide to add  
> another drive, it will save you a lot of trouble moving all your  
> partitions around...

Sounds great and definetely I will exploit this feature in the future.

>> That is what I am doing, so I am not fully utilizing lvm. another
>> question, is it advisable to create on pv for one harddrive? 
>>
>>   
> Yes, it is the right way. Having 2 PVs on single drive offer no benefit  
> I can think of, and actually it is a step back - you can not share "free  
> space" between PVs, thus it is a way to simulate old fashioned 
> partitions.

Thanks for confirming.

>>> Even with just one LV, leave some space for a snapshot.  Then you can
>>> take more consistent backups by creating a snapshot of your main LV
>>> and backing that up instead.  Put your swap space in LVM as well.
>>>     
>>
>> Thanks for pointing out this. I never thought of leaving space for
>> snapshot. and the swap too, why it is good to put swap in lvm?
>>
>>   
> I think most of installers do not think of it neither (unless you  
> partition you disk yourself, which is not so difficult, but may be a bit  
> scary for newbies) - I would like an install option "leave N% of created  
> PV free and use only the rest now".

Yeah, that would be great, for some installer I guess there are expert
mode which enables you to do more manipulation.

Thanks, Marian,

-- 
Zhengquan
