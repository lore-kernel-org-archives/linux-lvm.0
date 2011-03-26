Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p2Q5Pjsf013716
	for <linux-lvm@redhat.com>; Sat, 26 Mar 2011 01:25:45 -0400
Received: from eastrmfepo203.cox.net (eastrmfepo203.cox.net [68.230.241.218])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2Q5PeO6016966
	for <linux-lvm@redhat.com>; Sat, 26 Mar 2011 01:25:41 -0400
Received: from eastrmimpo02.cox.net ([68.1.16.120]) by eastrmfepo203.cox.net
	(InterMail vM.8.01.04.00 201-2260-137-20101110) with ESMTP id
	<20110326052540.YZBB32702.eastrmfepo203.cox.net@eastrmimpo02.cox.net>
	for <linux-lvm@redhat.com>; Sat, 26 Mar 2011 01:25:40 -0400
Message-ID: <4D8D78D5.7050701@cox.net>
Date: Sat, 26 Mar 2011 00:25:41 -0500
From: Ron Johnson <ron.l.johnson@cox.net>
MIME-Version: 1.0
References: <alpine.LRH.2.00.1103260013380.25820@bmsred.bmsi.com>	<4D8D6EAF.8050403@cox.net>
	<alpine.LRH.2.00.1103260047590.26023@bmsred.bmsi.com>
In-Reply-To: <alpine.LRH.2.00.1103260047590.26023@bmsred.bmsi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Powerfailure and snapshot consistency
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

On 03/25/2011 11:52 PM, Stuart D. Gathman wrote:
> On Fri, 25 Mar 2011, Ron Johnson wrote:
>
>> On 03/25/2011 11:24 PM, Stuart D. Gathman wrote:
>> [snip]
>>>
>>> 2) make sure important LVs do not span multiple PVs (except for LVM
>>> mirroring) - you could be unhappy in the event of a system crash.
>>>
>>
>> But isn't "volumes larger than physical devices" (one of) the raison
>> d'etre of LVM?
>
> Yes, but a power failure can then mess up the ordering of write completions
> distributed between 2 or more PVs, which could defeat the assumptions made
> by your file system journaling.
>

File a bug...  But against what?  LVM?  The FS?  The block layer?

> and
>
> No, YMMV, but I generally have a number of smaller LVs (for virtual
> machines)
> and it is nice to have a larger pool of PVs from which they are allocated.
>

I guess I'm just a DP Dinosaur who thinks that if a machine is beefy
enough to run a bunch of services then those services should run 
directly on the machine.  (Obviously I don't work for a web hosting 
company...)

-- 
"Neither the wisest constitution nor the wisest laws will secure
the liberty and happiness of a people whose manners are universally
corrupt."
Samuel Adams, essay in The Public Advertiser, 1749
