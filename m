Received: from [192.168.1.2] (vpn-68-1.surrey.redhat.com [10.32.68.1])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id k1MDCG3E028700
	for <linux-lvm@redhat.com>; Wed, 22 Feb 2006 13:12:17 GMT
Message-ID: <43FC6330.3090406@redhat.com>
Date: Wed, 22 Feb 2006 13:12:16 +0000
From: Patrick Caulfield <pcaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Volume Groups and Clusters
References: <BD8C22BB-D4AF-4117-A615-D67AAD9E81F3@kivasystems.com>	<20060222084902.GB23655@redhat.com>
	<F54A1B51-5C2E-4F94-AA7D-0F33E256E3BC@kivasystems.com>
In-Reply-To: <F54A1B51-5C2E-4F94-AA7D-0F33E256E3BC@kivasystems.com>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Joshua ChaitinPollak wrote:
> 
> On Feb 22, 2006, at 3:49 AM, Heinz Mauelshagen wrote:
> 
>> On Tue, Feb 21, 2006 at 04:22:10PM -0500, Joshua ChaitinPollak wrote:
>>> Hello, I found this mention of sharing Volume Groups across Clusters
>>> on the LVM howto:
>>>
>>> http://www.tldp.org/HOWTO/LVM-HOWTO/sharinglvm1.html
>>>
>>> Am I right in assuming that this means you can have a single volume
>>> group active on multiple nodes in a cluster, provided that you doing
>>> mount the same logical volume on more than one node at a time?
>>
>> Yes, you assume right *but* you need a cluster filesystem (eg, GFS)
>> as well to be able to mount shared logical volumes on multiple nodes
>> at once or you mess up the data.
> 
> Right, but I don't need GFS if I'm only going to mount the file system
> on one machine at a time, right?

No, just a lot of care and discipline :)

-- 

patrick
