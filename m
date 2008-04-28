Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3SGnsRe028152
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 12:49:54 -0400
Received: from smtp05.atlngahp.sys.nuvox.net (smtp-out5.atlngahp.sys.nuvox.net
	[70.43.63.23])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3SGnevJ020126
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 12:49:41 -0400
Received: from smtp.media-brokers.com (70.43.81.99.nw.nuvox.net [70.43.81.99])
	by smtp05.atlngahp.sys.nuvox.net (8.13.1/8.13.1) with ESMTP id
	m3SGnY6Q029906
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 12:49:35 -0400
Received: from [192.168.1.110] (sjester.atl.media-brokers.com [192.168.1.110])
	by smtp.media-brokers.com (Postfix) with ESMTPSA id C82633748D5
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 12:49:34 -0400 (EDT)
Message-ID: <4816001E.6010909@Media-Brokers.com>
Date: Mon, 28 Apr 2008 12:49:34 -0400
From: Charles Marcus <CMarcus@Media-Brokers.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How to move /usr from LVM back to non-LVM?
References: <Pine.LNX.4.44.0804281239560.32095-100000@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.44.0804281239560.32095-100000@bmsred.bmsi.com>
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

On 4/28/2008, Stuart D. Gathman (stuart@bmsi.com) wrote:
>> So, I'm now curious how/what other people generally use LVM for?

> And now I regret it because I can't use snapshots to take backups
> of the system.  The only drawback to LVM is that initrd is trickier.
> And a good LiveCD makes it possible to recover from boot problems -
> even remotely.

Good point...

Actually my question was incomplete... it should have read:

I'm curious what partitions/directories other people use LVM for?

-- 

Best regards,

Charles
