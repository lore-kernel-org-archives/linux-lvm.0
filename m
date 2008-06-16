Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5GLN2Bg028917
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 17:23:02 -0400
Received: from mx03.syneticon.net (mx03.syneticon.net [87.79.32.166])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m5GLMIIs010082
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 17:22:20 -0400
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by mx03.syneticon.net (Postfix) with ESMTP id D277F960A
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 23:22:17 +0200 (CEST)
Received: from mx03.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id bv5Ev26nF9XU for <linux-lvm@redhat.com>;
	Mon, 16 Jun 2008 23:22:14 +0200 (CEST)
Received: from [192.168.10.145] (koln-4d0b73de.pool.mediaWays.net
	[77.11.115.222]) by mx03.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 23:22:14 +0200 (CEST)
Message-ID: <4856D985.6050503@wpkg.org>
Date: Mon, 16 Jun 2008 23:22:13 +0200
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Server hangs when writing to LVM volume due to LVM
	Snapshots
References: <20080616135319.GA29234@campbell-lange.net>	<4856715A.6050107@wpkg.org>	<20080616141907.GH3765@campbell-lange.net>	<48567DF8.7080600@wpkg.org>	<20080616151014.GJ3765@campbell-lange.net>	<4856BC88.4060602@wpkg.org>
	<20080616211844.GL3765@campbell-lange.net>
In-Reply-To: <20080616211844.GL3765@campbell-lange.net>
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
> Hi Thomas,
> I think I've misunderstood the concept of snapshots.
> 
> So If I have 7 snapshots of the same volume (created at different times)
> and a file is changed, would the change affect all 7 snapshots or 
> just the latest one created?
> 
> If the former, then I imagine changing a 1GB+ file, in my
> situation will result in an unpleasant experience with the LVM snapshots.

Yes, writing 1 GB will in effect end up in writing 8 GB if you have 7 
snapshots.


-- 
Tomasz Chmielewski
http://wpkg.org
