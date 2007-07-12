Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6C9sCBl031089
	for <linux-lvm@redhat.com>; Thu, 12 Jul 2007 05:54:12 -0400
Received: from smtp-4.hut.fi (smtp-4.hut.fi [130.233.228.94])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l6C9sBHL016094
	for <linux-lvm@redhat.com>; Thu, 12 Jul 2007 05:54:11 -0400
Received: from localhost (putosiko.hut.fi [130.233.228.114])
	by smtp-4.hut.fi (8.13.6/8.12.10) with ESMTP id l6C9s57u003762
	for <linux-lvm@redhat.com>; Thu, 12 Jul 2007 12:54:05 +0300
Received: from smtp-4.hut.fi ([130.233.228.94])
	by localhost (putosiko.hut.fi [130.233.228.114]) (amavisd-new,
	port 10024) with LMTP id 24961-31-5 for <linux-lvm@redhat.com>;
	Thu, 12 Jul 2007 12:54:05 +0300 (EEST)
Received: from aski.hut.fi (aski.hut.fi [130.233.79.196])
	by smtp-4.hut.fi (8.13.6/8.12.10) with ESMTP id l6C9rrda003719
	for <linux-lvm@redhat.com>; Thu, 12 Jul 2007 12:53:53 +0300
Received: from localhost (localhost [127.0.0.1])
	by aski.hut.fi (Postfix) with ESMTP id DF01E33B8A
	for <linux-lvm@redhat.com>; Thu, 12 Jul 2007 12:53:52 +0300 (EEST)
Date: Thu, 12 Jul 2007 12:53:52 +0300 (EEST)
From: Vesa-Pekka Palmu <palmu@aski.hut.fi>
Subject: Re: [linux-lvm] pvmove fails with "Failure parsing mirror status
	fraction: 1 core"
In-Reply-To: <4695E421.4040106@redhat.com>
Message-ID: <Pine.LNX.4.62.0707121253170.22959@aski.hut.fi>
References: <Pine.LNX.4.62.0707120828240.22959@aski.hut.fi>
	<4695E421.4040106@redhat.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 12 Jul 2007, Milan Broz wrote:

> Hi,
> there is bug in status string - and pvmove use it for monitoring,
> unfotunatelly the fix is not in 2.6.22 stable tree yet...
> (kernel 2.6.21 is ok)
>
> Patch is here
> http://www.kernel.org/pub/linux/kernel/people/agk/patches/2.6/editing/dm-raid1-fix-status.patch
>

Thanks.
