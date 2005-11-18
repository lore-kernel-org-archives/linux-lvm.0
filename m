Received: from [10.15.80.209] (dhcp80-209.msp.redhat.com [10.15.80.209])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id jAIHsaFM005101
	for <linux-lvm@redhat.com>; Fri, 18 Nov 2005 12:54:37 -0500
Mime-Version: 1.0 (Apple Message framework v623)
In-Reply-To: <437D8D72.4050909@redhat.com>
References: <437CC1DF.7060306@cup.hp.com> <437D8D72.4050909@redhat.com>
Message-Id: <ff57449f1c9444ba3e70a4c6cde5cea8@redhat.com>
Content-Transfer-Encoding: 7bit
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] clvmd interface question
Date: Fri, 18 Nov 2005 11:54:33 -0600
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

Also, there is a package called 'magma' that lives in the cluster tree. 
  This is an abstraction layer to different cluster managers and lock 
managers.  It has the ability to accept plugins for different cluster 
managers.  I wonder if it would be useful for clvm to use magma, then 
writing plugins is easy and you never have to touch code that makes use 
of the cluster managers.

Patrick would know if this is a worthwhile goal.

  brassow

On Nov 18, 2005, at 2:14 AM, Patrick Caulfield wrote:

> John DeFranco wrote:
>> Hi, I'm looking for some information. I'm interested in learning more
>> about the clvmd daemon. I've search and found various pieces of info 
>> in
>> addition to looking at the code. Specifically I looking to for
>> information (a spec) on how one might be able to add a new cluster
>> manager plugin if you will (if that is even possible). I know that 
>> clvmd
>> interfaces with a couple of different cluster managers now but I'd 
>> like
>> to expland this if possible.
>
> clvmd supports cman and gulm, it has it's own internal function switch 
> that
> determines what to do for each cluster manager.
>
> To be honest it's not a good API as it was originally only designed to 
> work with
> cman and the gulm support was bolted on later - so adding a new 
> cluster manager
> might be a bit of work.
>
> Have a look at the bottom of LVM2/daemons/clvmd/clvmd-cman for the 
> function switch.
>
> You'll also need to be aware that CMAN provides its own messaging 
> system, which
> gulm does not. If your cluster manager provides a messaging system 
> then I
> recommend you use it - otherwise you should be able to use the 
> tcp-comms.c file
> with clvmd (that gulm support uses).
>
> Another way, that might be easier, is to patch clvmd with the libcman 
> patch in
> head of cluster CVS (cluster/cman/lib/clvmd-libcman.diff) and write a 
> library
> for your cluster manager that emulates libcman - that one is a nice 
> simple API
> and it will be supported by future versions of cman too.
>
> -- 
>
> patrick
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
