Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5GEq68J023071
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 10:52:06 -0400
Received: from mx03.syneticon.net (mx03.syneticon.net [87.79.32.166])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m5GEpjwP002729
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 10:51:45 -0400
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by mx03.syneticon.net (Postfix) with ESMTP id 0B7549654
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 16:51:45 +0200 (CEST)
Received: from mx03.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id Lm4gji6vSdcH for <linux-lvm@redhat.com>;
	Mon, 16 Jun 2008 16:51:37 +0200 (CEST)
Received: from [192.168.10.145] (koln-4d0b73de.pool.mediaWays.net
	[77.11.115.222]) by mx03.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 16:51:37 +0200 (CEST)
Message-ID: <48567DF8.7080600@wpkg.org>
Date: Mon, 16 Jun 2008 16:51:36 +0200
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Server hangs when writing to LVM volume due to LVM
	Snapshots
References: <20080616135319.GA29234@campbell-lange.net>	<4856715A.6050107@wpkg.org>
	<20080616141907.GH3765@campbell-lange.net>
In-Reply-To: <20080616141907.GH3765@campbell-lange.net>
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

Veselin Kantsev schrieb:
> Hello Tomasz,
> thank you much for the prompt reply.
> 
> The server has 6119216k of RAM in total.

That's quite a bit..
You would need terabytes of snapshots to fill it.
So perhaps it hangs for a different reason.

Capacitors? Hardware?


> And most of it is shown as used all the time (To my knowledge thats just how
> linux utilizes ram). 

Please show the output of "free" command. The "buffers/cache" line is 
your current RAM usage, excluding buffers (more or less).


> But from memory, the last time the server froze during copying (goes
> back to normal once I kill the copy process) I didn't notice any extreme
> RAM usage or swapping.

Kernel data in memory used for snapshots will not be swapped out.


> As I'm rotating LVM snapshots weekly, there are 7 snapshots on the system
> at all times, and 1 of them is active(the last one taken).

(...)

> Do you see a flaw in this process that might be causing the issues?

Unless you have terabytes of data in snapshots, it shouldn't be a problem.

Does it freeze for good? Machine stops responding, stops logging, etc.?


-- 
Tomasz Chmielewski
http://wpkg.org
