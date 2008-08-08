Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m788dqhe018757
	for <linux-lvm@redhat.com>; Fri, 8 Aug 2008 04:39:52 -0400
Received: from smtp-msa-out01.orange.fr (smtp-msa-out01.orange.fr
	[193.252.23.120])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m788deU3029589
	for <linux-lvm@redhat.com>; Fri, 8 Aug 2008 04:39:40 -0400
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf2353.orange.fr (SMTP Server) with ESMTP id 097AB700008A
	for <linux-lvm@redhat.com>; Fri,  8 Aug 2008 10:39:35 +0200 (CEST)
Received: from [172.20.20.150] (LPuteaux-151-41-11-129.w217-128.abo.wanadoo.fr
	[217.128.26.129])
	by mwinf2353.orange.fr (SMTP Server) with ESMTP id D37C17000089
	for <linux-lvm@redhat.com>; Fri,  8 Aug 2008 10:39:34 +0200 (CEST)
Message-ID: <489C0647.9070101@squirk.org>
Date: Fri, 08 Aug 2008 10:39:35 +0200
From: Jean Spirat <jeanspirat@squirk.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] the lvm shared storage question of the week
References: <48985774.2080509@squirk.org>	<54CA3782-8BC9-4F64-B209-2066B2315E77@redhat.com>	<489946F6.60706@squirk.org>
	<1218133329.4013.20.camel@dogen.thepride.>
In-Reply-To: <1218133329.4013.20.camel@dogen.thepride.>
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


> CLVM needs a distributed lock manager to work (which communicates over
> the network, not via the disk).  This is usually provided with the help
> of the RedHat Cluster Suite.
>   

locking on the disk seems easier to setup than network port firewall 
rules and so on but if it was not done i assume there was a good reason 
for it that my poor brain cannot see :)  if each node is gived a unique 
key then you could use on disk  locking with a special lock metadata and 
a timestamps for reloading configuration for the other node. Of course 
it seems too easy to have not been thinked about so there must be a 
major flaw in my thinking :)



> by default, locking type 2 or 3 requires clvmd, which as I say will
> require a cluster setup of some kind.
>
> You *can* work without a cluster manager but I'm not sure how advised it
> is.  So you leave your locking type as 1 and use "lvchange
> --refresh /dev/vg/*" on all nodes to reload metadata from disk whenever
> you make a change.  Can be a bit risky.
>
> John.
>   
strange that this use case has not handled in an safer/easier way :)


if each lvm partition is mounted on only one box where does the risk 
lies in your opinion ?

regards,
Jean.
