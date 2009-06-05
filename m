Received: from glen-mhor.englab.brq.redhat.com
	(glen-mhor.englab.brq.redhat.com [10.34.32.149])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n55800a5000831
	for <linux-lvm@redhat.com>; Fri, 5 Jun 2009 04:00:01 -0400
Message-ID: <4A28D080.3070804@redhat.com>
Date: Fri, 05 Jun 2009 10:00:00 +0200
From: Marian Csontos <mcsontos@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm on a single big partition or just a single big
	partition?
References: <20090603164231.GA23418@m364d1.ece.northwestern.edu>	<Pine.LNX.4.64.0906031436460.14629@bmsred.bmsi.com>
	<20090603184601.GA25936@m364d1.ece.northwestern.edu>
In-Reply-To: <20090603184601.GA25936@m364d1.ece.northwestern.edu>
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

Zhengquan Zhang wrote:
> On Wed, Jun 03, 2009 at 02:42:29PM -0400, Stuart D. Gathman wrote:
>   
>> On Wed, 3 Jun 2009, Zhengquan Zhang wrote:
>>
>>     
>>> For one harddrive I often create a /boot parition that is not lvm and
>>> create a huge partition on the rest of the harddrive for PV of lvm. Now
>>> I am thinking what is the difference between doing partition like this
>>> and just a single big partition without lvm?
>>>       
>> With LVM, you can create many logical volumes.  If you only ever create one
>> logical volume that fills the entire PV, and you aren't spanning drives
>> (multiple PVs) or mirroring, then LVM is not doing anything for you.
>>     
Not at the moment, but the moment you run out of space and decide to add 
another drive, it will save you a lot of trouble moving all your 
partitions around...
> That is what I am doing, so I am not fully utilizing lvm. another
> question, is it advisable to create on pv for one harddrive? 
>
>   
Yes, it is the right way. Having 2 PVs on single drive offer no benefit 
I can think of, and actually it is a step back - you can not share "free 
space" between PVs, thus it is a way to simulate old fashioned partitions.
>> Even with just one LV, leave some space for a snapshot.  Then you can
>> take more consistent backups by creating a snapshot of your main LV
>> and backing that up instead.  Put your swap space in LVM as well.
>>     
>
> Thanks for pointing out this. I never thought of leaving space for
> snapshot. and the swap too, why it is good to put swap in lvm?
>
>   
I think most of installers do not think of it neither (unless you 
partition you disk yourself, which is not so difficult, but may be a bit 
scary for newbies) - I would like an install option "leave N% of created 
PV free and use only the rest now".
>> One reason to create multiple LVs is for virtual machines.  If you
>> run Xen, VMWare, or other virtual machine, then each virtual machine
>> should have its own LVs for disk drives.  This is more efficient
>> than using a filesystem file for a virtual disk.
>>     
>
> Oh really, I never thought about this, so virtual machine can directly
> use lv for the as their filesystem?
>
>   
>> PS.  I wonder if Grub will ever support LVM?  Does LILO work with LVM?
>>     
>
> As I know, LILO does, buy anyway we've got separate /boot.
>
> Thanks a lot Stuart, it helped me a lot,
>
>   
