Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5GJIsxk009676
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 15:18:54 -0400
Received: from mx03.syneticon.net (mx03.syneticon.net [87.79.32.166])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m5GJIdjg003237
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 15:18:40 -0400
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by mx03.syneticon.net (Postfix) with ESMTP id D7013946A
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 21:18:38 +0200 (CEST)
Received: from mx03.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id Wt-Tnk15BFbL for <linux-lvm@redhat.com>;
	Mon, 16 Jun 2008 21:18:33 +0200 (CEST)
Received: from [192.168.10.145] (koln-4d0b73de.pool.mediaWays.net
	[77.11.115.222]) by mx03.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 21:18:33 +0200 (CEST)
Message-ID: <4856BC88.4060602@wpkg.org>
Date: Mon, 16 Jun 2008 21:18:32 +0200
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Server hangs when writing to LVM volume due to LVM
	Snapshots
References: <20080616135319.GA29234@campbell-lange.net>	<4856715A.6050107@wpkg.org>	<20080616141907.GH3765@campbell-lange.net>	<48567DF8.7080600@wpkg.org>
	<20080616151014.GJ3765@campbell-lange.net>
In-Reply-To: <20080616151014.GJ3765@campbell-lange.net>
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

> The snapshots are 180GB each.

So that makes 7 snapshots, each is 180GB? What percentage is filled?


> The current writing process freezes and working with the LV becomes
> impossible both locally and through the network.

LVM-2 doesn't scale very well.

If you have I/O intensive workloads, I'd discourage using (multiple) 
snapshots.

A single write to the origin mean additional writes to each and every 
snapshot of that origin.


-- 
Tomasz Chmielewski
http://wpkg.org
