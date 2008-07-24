Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6OFb5Qj013292
	for <linux-lvm@redhat.com>; Thu, 24 Jul 2008 11:37:05 -0400
Received: from crow1.exxs.net (crow1.exxs.net [213.202.244.7])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m6OFapAt018170
	for <linux-lvm@redhat.com>; Thu, 24 Jul 2008 11:36:52 -0400
Received: from [192.168.178.37] (p4FE59F6B.dip0.t-ipconnect.de
	[79.229.159.107])
	by crow1.exxs.net (Postfix) with ESMTP id 336A5A5402B
	for <linux-lvm@redhat.com>; Thu, 24 Jul 2008 17:37:38 +0200 (CEST)
Message-ID: <4888A190.2090103@exxs.net>
Date: Thu, 24 Jul 2008 17:36:48 +0200
From: "exxs.net - matevz sernc-urban" <ms@exxs.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Every now and then LVM is not recognized - LVM2 on
	RAID10
References: <48871F04.9090002@exxs.net> <20080723173514.GC30203@soda.linbit>
In-Reply-To: <20080723173514.GC30203@soda.linbit>
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

Lars Ellenberg schrieb:
> On Wed, Jul 23, 2008 at 02:07:32PM +0200, exxs.net - matevz sernc-urban wrote:
>>
>> i am running into a very interesting situation today, that our LVM  
>> metadata is recognized only sometimes. LVM was running fine for some  
>> weeks and now from today on running pvscan 10 times one after another i  
>> get about 4 positive and 6 negative results (its somehow a coincidence  
>> that LVM is recognized).
>>
...
>>
>> Any hints?
>>
>> Where should it look regarding "/dev/md2: No label detected" vs.  
>> "/dev/md2: lvm2 label detected"??
>>
>> It seems like RAID-10 is not sync'ed well maybe? But, mdstat reports all  
>> disks are up.
> 
> just a shot in the dark:
> 
> for dev in /dev/sd{a,b,c,d}5; do
> 	md5=$(dd if=$dev iflag=direct bs=1M count=1 | md5sum)
> 	echo "$dev: $md5"
> done

this is a RAID 10,f2 (with 2 far copies)
so the starting order of blocks is different on all 4 hdd's (and 
therefore all four md5's are different).

> 
> echo check > /sys/block/md2/md/sync_action
> 

i did this, and it finished without any failures - all disks are up and 
sync'ed again. RAID is therefore not a possible problem.

i must add that the logical volumes are in use and working. i just 
really do not want to reboot the machine as i suppose they couldn't be 
brought up again.

Any other hints of why sometimes i get "/dev/md2: No label detected" vs.
  "/dev/md2: lvm2 label detected"?

thanks in advance for any possible hints
mat
