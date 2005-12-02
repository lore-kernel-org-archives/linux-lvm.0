Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jB20FKV07954
	for <linux-lvm@redhat.com>; Thu, 1 Dec 2005 19:15:20 -0500
Received: from palrel13.hp.com (palrel13.hp.com [156.153.255.238])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jB20FEJr006018
	for <linux-lvm@redhat.com>; Thu, 1 Dec 2005 19:15:14 -0500
Received: from smtp2.ptp.hp.com (smtp2.ptp.hp.com [15.1.28.240])
	by palrel13.hp.com (Postfix) with ESMTP id D548536FB3
	for <linux-lvm@redhat.com>; Thu,  1 Dec 2005 16:15:13 -0800 (PST)
Received: from [15.244.57.26] (airwolf.cup.hp.com [15.244.57.26])
	by smtp2.ptp.hp.com (Postfix) with ESMTP id 72F8C1CCEFC
	for <linux-lvm@redhat.com>; Fri,  2 Dec 2005 00:15:13 +0000 (UTC)
Message-ID: <438F9210.3000900@cup.hp.com>
Date: Thu, 01 Dec 2005 16:15:12 -0800
From: John DeFranco <defranco@cup.hp.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] clvmd interface question
References: <437CC1DF.7060306@cup.hp.com> <437D8D72.4050909@redhat.com>
In-Reply-To: <437D8D72.4050909@redhat.com>
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

Patrick Caulfield wrote:

>John DeFranco wrote:
>  
>
>>Hi, I'm looking for some information. I'm interested in learning more
>>about the clvmd daemon. I've search and found various pieces of info in
>>addition to looking at the code. Specifically I looking to for
>>information (a spec) on how one might be able to add a new cluster
>>manager plugin if you will (if that is even possible). I know that clvmd
>>interfaces with a couple of different cluster managers now but I'd like
>>to expland this if possible.
>>    
>>
>
>clvmd supports cman and gulm, it has it's own internal function switch that
>determines what to do for each cluster manager.
>
>To be honest it's not a good API as it was originally only designed to work with
>cman and the gulm support was bolted on later - so adding a new cluster manager
>might be a bit of work.
>
>Have a look at the bottom of LVM2/daemons/clvmd/clvmd-cman for the function switch.
>
>You'll also need to be aware that CMAN provides its own messaging system, which
>gulm does not. If your cluster manager provides a messaging system then I
>recommend you use it - otherwise you should be able to use the tcp-comms.c file
>with clvmd (that gulm support uses).
>
>Another way, that might be easier, is to patch clvmd with the libcman patch in
>head of cluster CVS (cluster/cman/lib/clvmd-libcman.diff) and write a library
>for your cluster manager that emulates libcman - that one is a nice simple API
>and it will be supported by future versions of cman too.
>
>  
>
Thanks for the info. I'll be looking into this.

-- 
==========
Cheers
   -jdf
