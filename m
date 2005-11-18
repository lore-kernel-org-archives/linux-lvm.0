Received: from fentible.pjc.net (vpn-68-1.surrey.redhat.com [10.32.68.1])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id jAI8EhEj016139
	for <linux-lvm@redhat.com>; Fri, 18 Nov 2005 08:14:43 GMT
Received: from jeltz.pjc.net ([192.168.1.2])
	by fentible.pjc.net with esmtp (Exim 4.50) id 1Ed1ON-0004uz-JJ
	for linux-lvm@redhat.com; Fri, 18 Nov 2005 08:14:43 +0000
Message-ID: <437D8D72.4050909@redhat.com>
Date: Fri, 18 Nov 2005 08:14:42 +0000
From: Patrick Caulfield <pcaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] clvmd interface question
References: <437CC1DF.7060306@cup.hp.com>
In-Reply-To: <437CC1DF.7060306@cup.hp.com>
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

John DeFranco wrote:
> Hi, I'm looking for some information. I'm interested in learning more
> about the clvmd daemon. I've search and found various pieces of info in
> addition to looking at the code. Specifically I looking to for
> information (a spec) on how one might be able to add a new cluster
> manager plugin if you will (if that is even possible). I know that clvmd
> interfaces with a couple of different cluster managers now but I'd like
> to expland this if possible.

clvmd supports cman and gulm, it has it's own internal function switch that
determines what to do for each cluster manager.

To be honest it's not a good API as it was originally only designed to work with
cman and the gulm support was bolted on later - so adding a new cluster manager
might be a bit of work.

Have a look at the bottom of LVM2/daemons/clvmd/clvmd-cman for the function switch.

You'll also need to be aware that CMAN provides its own messaging system, which
gulm does not. If your cluster manager provides a messaging system then I
recommend you use it - otherwise you should be able to use the tcp-comms.c file
with clvmd (that gulm support uses).

Another way, that might be easier, is to patch clvmd with the libcman patch in
head of cluster CVS (cluster/cman/lib/clvmd-libcman.diff) and write a library
for your cluster manager that emulates libcman - that one is a nice simple API
and it will be supported by future versions of cman too.

-- 

patrick
