Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1MDRq114084
	for <linux-lvm@redhat.com>; Wed, 22 Feb 2006 08:27:52 -0500
Received: from kivasystems.com (10.67.14.204.dsci-net.com [204.14.67.10] (may
	be forged))
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1MDRoAU004340
	for <linux-lvm@redhat.com>; Wed, 22 Feb 2006 08:27:50 -0500
Received: from localhost (localhost [127.0.0.1])
	by kivasystems.com (Postfix) with ESMTP id F33BA73FAE9
	for <linux-lvm@redhat.com>; Wed, 22 Feb 2006 08:27:49 -0500 (EST)
Received: from kivasystems.com ([127.0.0.1])
	by localhost (formicarium.kivasystems.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 08889-10 for <linux-lvm@redhat.com>;
	Wed, 22 Feb 2006 08:27:43 -0500 (EST)
Received: from [192.168.3.188] (unknown [192.168.3.188])
	by kivasystems.com (Postfix) with ESMTP id 6CF1073FACB
	for <linux-lvm@redhat.com>; Wed, 22 Feb 2006 08:27:43 -0500 (EST)
Mime-Version: 1.0 (Apple Message framework v746.2)
In-Reply-To: <43FC6330.3090406@redhat.com>
References: <BD8C22BB-D4AF-4117-A615-D67AAD9E81F3@kivasystems.com>	<20060222084902.GB23655@redhat.com>
	<F54A1B51-5C2E-4F94-AA7D-0F33E256E3BC@kivasystems.com>
	<43FC6330.3090406@redhat.com>
Message-Id: <3C7F6729-9AD3-4EAA-BD57-24F321451862@kivasystems.com>
Content-Transfer-Encoding: 7bit
From: Joshua ChaitinPollak <jpollak@kivasystems.com>
Subject: Re: [linux-lvm] Volume Groups and Clusters
Date: Wed, 22 Feb 2006 08:27:41 -0500
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>


On Feb 22, 2006, at 8:12 AM, Patrick Caulfield wrote:

> Joshua ChaitinPollak wrote:
>>
>> On Feb 22, 2006, at 3:49 AM, Heinz Mauelshagen wrote:
>>
>>> On Tue, Feb 21, 2006 at 04:22:10PM -0500, Joshua ChaitinPollak  
>>> wrote:
>>>> Hello, I found this mention of sharing Volume Groups across  
>>>> Clusters
>>>> on the LVM howto:
>>>>
>>>> http://www.tldp.org/HOWTO/LVM-HOWTO/sharinglvm1.html
>>>>
>>>> Am I right in assuming that this means you can have a single volume
>>>> group active on multiple nodes in a cluster, provided that you  
>>>> doing
>>>> mount the same logical volume on more than one node at a time?
>>>
>>> Yes, you assume right *but* you need a cluster filesystem (eg, GFS)
>>> as well to be able to mount shared logical volumes on multiple nodes
>>> at once or you mess up the data.
>>
>> Right, but I don't need GFS if I'm only going to mount the file  
>> system
>> on one machine at a time, right?
>
> No, just a lot of care and discipline :)

Great! And, my co-workers keep telling me, "You lack discipline!"

-- 
Joshua ChaitinPollak
Software Engineer
Kiva Systems
