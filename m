Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8KNLbBd018228
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 19:21:37 -0400
Received: from calvin.slamb.org (calvin.slamb.org [216.136.66.56])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k8KNLTmQ003795
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 19:21:29 -0400
Received: from [IPv6:::1] (localhost.slamb.org [127.0.0.1])
	by calvin.slamb.org (Postfix) with ESMTP id 739CB6FECF
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 18:21:13 -0500 (CDT)
Mime-Version: 1.0 (Apple Message framework v752.2)
In-Reply-To: <OF255DDD51.9A0BB030-ON852571EF.0048DBFE-852571EF.00498302@philips.com>
References: <OF255DDD51.9A0BB030-ON852571EF.0048DBFE-852571EF.00498302@philips.com>
Message-Id: <A5E5AC70-BA07-4697-96A7-2A436A58B932@slamb.org>
Content-Transfer-Encoding: 7bit
From: Scott Lamb <slamb@slamb.org>
Subject: Re: [linux-lvm] Misleading documentation (was: HDD Failure)
Date: Wed, 20 Sep 2006 16:21:12 -0700
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

On Sep 20, 2006, at 6:22 AM, Tobias Bluhm wrote:
> Scott Lamb wrote on 09/19/2006 06:40:43 PM:
>> This is my biggest beef with LVM - why doesn't *any* of the
>> documentation point this out? There are very few good reasons to use
>> LVM without RAID, and "ignorance" certainly isn't among them. I don't
>> see any mention of RAID or disk failures in the manual pages or in
>> the HOWTO.
>
> Good point. So if the docs make no mention of RAID or fail-over or
> redundency or spares, what made you assume that
> LVM had such capabilities????

If that "you" is second-person singular, I didn't. I probed deep  
enough to discover that it did not do RAID, but there were enough  
suggestions that it could do redundancy that it took me a while to  
come to that conclusion:

(1) the many-disk examples, which would be a horrible idea otherwise
(2) the striping tuning options
(3) some vague mention of mirroring...Heinz has mentioned it in this  
thread, but I don't see any actual information about how it's done.
(4) ...probably more I'm forgetting...

So I don't know why you are surprised that people are assuming this  
and ending up without raid. (Did you see Mark Krenz's email? Three  
people this week, one of whom actually lost data because of it.)

All is fixable. Fabien's suggested changes are a great improvement.

-- 
Scott Lamb <http://www.slamb.org/>
