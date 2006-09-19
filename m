Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8JMf2ao022278
	for <linux-lvm@redhat.com>; Tue, 19 Sep 2006 18:41:02 -0400
Received: from calvin.slamb.org (calvin.slamb.org [216.136.66.56])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8JMf1uU022744
	for <linux-lvm@redhat.com>; Tue, 19 Sep 2006 18:41:01 -0400
Received: from [IPv6:::1] (localhost.slamb.org [127.0.0.1])
	by calvin.slamb.org (Postfix) with ESMTP id 7E3416FDE2
	for <linux-lvm@redhat.com>; Tue, 19 Sep 2006 17:40:45 -0500 (CDT)
Mime-Version: 1.0 (Apple Message framework v752.2)
In-Reply-To: <20060918193728.GC28043@arvo.suso.org>
References: <1158603016.7182.12.camel@localhost.localdomain>
	<450EEEA0.7020703@mdmiller.com>
	<1158606792.7182.15.camel@localhost.localdomain>
	<1158607438.19905.30.camel@bounty.rider.geekspirit.net>
	<1158608077.7182.18.camel@localhost.localdomain>
	<20060918193728.GC28043@arvo.suso.org>
Message-Id: <4B875923-CB76-4792-837B-EDA3B9E53756@slamb.org>
Content-Transfer-Encoding: 7bit
From: Scott Lamb <slamb@slamb.org>
Subject: Re: [linux-lvm] Misleading documentation (was: HDD Failure)
Date: Tue, 19 Sep 2006 15:40:43 -0700
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

On Sep 18, 2006, at 12:37 PM, Mark Krenz wrote:
>   LVM != RAID
>
>   You should have been doing RAID if you wanted to be able to  
> handle the
> failure of one drive.

This is my biggest beef with LVM - why doesn't *any* of the  
documentation point this out? There are very few good reasons to use  
LVM without RAID, and "ignorance" certainly isn't among them. I don't  
see any mention of RAID or disk failures in the manual pages or in  
the HOWTO.

For example, the recipes chapter [1] of the HOWTO shows a non-trivial  
setup with four volume groups split across seven physical drives.  
There's no mention of RAID. This is a ridiculously bad idea - if  
*any* of those seven drives are lost, at least one volume group will  
fail. In some cases, more than one. This document should be showing  
best practices, and it's instead showing how to throw away your data.

The "lvcreate" manual page is pretty bad, too. It mentions the  
ability to tune stripe size, which on casual read, might suggest that  
it uses real RAID. Instead, I think this is just RAID-0.

[1] - http://tldp.org/HOWTO/LVM-HOWTO/recipeadddisk.html

-- 
Scott Lamb <http://www.slamb.org/>
