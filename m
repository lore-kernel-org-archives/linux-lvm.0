Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3LA4Yvm019200
	for <linux-lvm@redhat.com>; Mon, 21 Apr 2008 06:04:34 -0400
Received: from smtp04.atlngahp.sys.nuvox.net (smtp-out4.atlngahp.sys.nuvox.net
	[70.43.63.22])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3LA4Mt4021297
	for <linux-lvm@redhat.com>; Mon, 21 Apr 2008 06:04:23 -0400
Received: from smtp.media-brokers.com (70.43.81.99.nw.nuvox.net [70.43.81.99])
	by smtp04.atlngahp.sys.nuvox.net (8.13.1/8.13.1) with ESMTP id
	m3LA4IdC025334
	for <linux-lvm@redhat.com>; Mon, 21 Apr 2008 06:04:18 -0400
Received: from [192.168.1.110] (sjester.atl.media-brokers.com [192.168.1.110])
	by smtp.media-brokers.com (Postfix) with ESMTPSA id 35E51375052
	for <linux-lvm@redhat.com>; Mon, 21 Apr 2008 06:04:18 -0400 (EDT)
Message-ID: <480C66A1.9030909@Media-Brokers.com>
Date: Mon, 21 Apr 2008 06:04:17 -0400
From: Charles Marcus <CMarcus@Media-Brokers.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Adding PVs to a group
References: <48091663.2070404@Media-Brokers.com>	<480A3291.7070702@Media-Brokers.com>	<480AB63C.4070605@gmail.com>	<480B728C.9010708@Media-Brokers.com>
	<480BC65A.1080605@gmail.com>
In-Reply-To: <480BC65A.1080605@gmail.com>
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

On 4/20/2008, David Robinson (zxvdr.au@gmail.com) wrote:
>> OT: this list seems a little on the dead side... is there a more 
>> active LVM oriented list that you are aware of?

> The list is active, but its quiet on weekends ;)

Oh, right, I forget that some people actually have lives outside work, 
unlike me... ;)

> You could modify the partition table in one step rather than two. Use 
> fdisk to delete both partitions then create a new partition that 
> spans the entire device (just make sure that you create the partition 
> with the same start block). The end result should look something like:
> 
>    Device Boot      Start         End      Blocks   Id  System
> /dev/sdb1               1       58352   468712408+  8e  Linux LVM

I have read about doing this, but somehow it just gives me the shudders...

I'll have to play with it sometime in a VM...

>> resize /dev/sdb1, reboot, then

> You may not need to reboot at all... you could use "partprobe" or 
> "blockdev --rereadpt", but check /proc/partitions to make sure that 
> the kernel knows of the new partition table. I've seen instances 
> where partprobe doesn't actually cause the partition table to be 
> refreshed.

Thanks - have to read up on partprobe too...

Still feel like a newbie sometimes, even though I've been using Linux 
for almost two years now (came over from the windows world)...

>> So, again - does it really matter? Is having my vg2 in one big LVM 
>> partition 'better' than having it consist of two different partitions?

> There's no difference, LVM doesn't care.

Ok, thanks... thats what I'll do for now... I'm actually planning on 
replacing this server with a different one and rebuilding everything 
from scratch in a few months anyway, so I'll redo the partitions then...

For now, simple and safe is best... my main goal is to keep /var from 
filling up...

-- 

Best regards,

Charles
