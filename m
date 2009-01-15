Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0F1l1q6022249
	for <linux-lvm@redhat.com>; Wed, 14 Jan 2009 20:47:01 -0500
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n0F1kiNa030075
	for <linux-lvm@redhat.com>; Wed, 14 Jan 2009 20:46:44 -0500
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e36.co.us.ibm.com (8.13.1/8.13.1) with ESMTP id n0F1jjT4001024
	for <linux-lvm@redhat.com>; Wed, 14 Jan 2009 18:45:45 -0700
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id
	n0F1khSU210318
	for <linux-lvm@redhat.com>; Wed, 14 Jan 2009 18:46:44 -0700
Received: from d03av03.boulder.ibm.com (loopback [127.0.0.1])
	by d03av03.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	n0F1khPh014477
	for <linux-lvm@redhat.com>; Wed, 14 Jan 2009 18:46:43 -0700
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d03av03.boulder.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	n0F1khrR014459
	for <linux-lvm@redhat.com>; Wed, 14 Jan 2009 18:46:43 -0700
Date: Wed, 14 Jan 2009 17:46:42 -0800
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Major problems after soft raid 5 failure
Message-ID: <20090115014642.GA7668@us.ibm.com>
References: <496E8353.50207@gmail.com> <20090115010441.GA6852@us.ibm.com>
	<496E8E3A.8060901@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <496E8E3A.8060901@gmail.com>
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

Colin Faber [cfaber@gmail.com] wrote:
> Hi,
>
> malahal@us.ibm.com wrote:
>> Colin Faber [cfaber@gmail.com] wrote:
>>   
>>> was unavailable. After searching around I kept coming back to suggestions 
>>> stating that removal of the missing device from the volume group was the 
>>> solution to getting thing back online again. So using 'vgreduce 
>>> --removemissing raid' then 'lvchange -ay raid' to update the changes - 
>>> Neither command errored and vgreduce noted that 'raid' was not available 
>>> again.
>>>     
>>
>> Since your LV (array) is most likely allocated on md1 that disappeared,
>> you really want --partial (lvm command) rather than --removemissing.
>> Your metadata is updated and any knowledge about 'array' LV is now
>> almost gone due to the above 'vgreduce'. I say almost gone because it
>> might be there but you really need true LVM expertise now!
>>
>> Did you save a copy of your old LVM metadata before the reboot? See your
>> /etc/lvm/backup/raid has any reference to 'array' LV at all.
>>   
> Yes, it's still there (well /etc/lvm/archive/). So how do I back out of 
> this after I've already run removemissing? If I try and restore the old vg 
> backup it just tells me that it can't restore it because the uuid is 
> missing for md1.
>
> By the way, thank you very much for the response. Any suggestions and help 
> are greatly welcome.

Isn't there a force option to vgcfgrestore?  There maybe an easier way,
but I have not done much of LVM administration. Looking at the end of
'vgcfgrestore', you can create a PV that will have the same uuid and
size as your failed md1 using 'pvcreate ...'.

I would say, create a sparse file and use losetup to create a block
device against it. Then use 'pvcreate' to create an identical device
with md1's uuid. After that, use vgcfgrestore.

Thanks, Malahal.
PS: Try posting to dm-devel (they may suggest an easier method)
