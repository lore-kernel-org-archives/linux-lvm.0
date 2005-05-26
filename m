Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4QIF6O18057
	for <linux-lvm@redhat.com>; Thu, 26 May 2005 14:15:06 -0400
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j4QIF4ID030233
	for <linux-lvm@redhat.com>; Thu, 26 May 2005 14:15:04 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DbMM9-0004j4-Fz
	for linux-lvm@redhat.com; Thu, 26 May 2005 19:41:17 +0200
Received: from pd95eac6e.dip.t-dialin.net ([217.94.172.110])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 26 May 2005 19:41:17 +0200
Received: from bill.mair by pd95eac6e.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 26 May 2005 19:41:17 +0200
From: Bill Mair <bill.mair@web.de>
Date: Thu, 26 May 2005 21:42:08 +0200
Message-ID: <d751l5$u0e$1@sea.gmane.org>
References: <4295B7F7.9060802@hp.com> <d74ged$ueo$1@sea.gmane.org>
	<429606D1.7040106@hp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <429606D1.7040106@hp.com>
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Re: Daemon or Thread with 5 minute interval
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
To: linux-lvm@redhat.com

Howard Rifkin wrote:
> 
> We do have the right kernel support for our didsks. But, you do not need 
> a lot of CPU activity to generate noise. Just enough to disrupt the 
> cashe. Does kupdated run every 5 minutes? If so it could still be the 
> culprit.

kupdated - journal update
kswapd - swapper
bdflush - flush IO

All/any of them could cause problems fir what you are doing, but I don't think
LVM is your problem.

--
Bill
