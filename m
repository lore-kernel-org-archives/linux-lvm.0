Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 35255219EFE
	for <linux-lvm@redhat.com>; Sun, 11 Oct 2020 20:23:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1E3B102F1E0
	for <linux-lvm@redhat.com>; Sun, 11 Oct 2020 20:23:37 +0000 (UTC)
Received: from shell.thinkmo.de (shell.thinkmo.de
	[IPv6:2a01:4f8:221:1902:0:22:0:1])
	by s1-smtprelay.thinkmo.de (Postfix) with ESMTPS id 4C8Y2t2dBWz41
	for <linux-lvm@redhat.com>; Sun, 11 Oct 2020 20:15:34 +0000 (UTC)
Date: Sun, 11 Oct 2020 22:15:33 +0200
From: Bastian Blank <bblank@thinkmo.de>
Message-ID: <20201011201533.waxeyvbrp6cjdi2z@shell.thinkmo.de>
References: <269f632e-591e-56c3-a3be-31ac6060f73f.ref@yahoo.co.uk>
	<269f632e-591e-56c3-a3be-31ac6060f73f@yahoo.co.uk>
MIME-Version: 1.0
In-Reply-To: <269f632e-591e-56c3-a3be-31ac6060f73f@yahoo.co.uk>
Content-Disposition: inline
Subject: Re: [linux-lvm] raid0 - no performance increase??
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Sat, Oct 10, 2020 at 05:52:32PM +0100, lejeczek wrote:
> I have a simple raid0 lvm comprising of two NVME devices.
> I'd expect performance of such a volume to be higher than a
> "regular" volume ran of a single NVME, but simple dbench
> shows such raid0 volume to the same "slow" as a single NVME
> volume.

Why do you think?  What is dbench anyway?  Linear access is not going to
be faster, as it is dominated by latency.  Please use fio with _random_
reads or writes and a useful queue depth.

Also, what do you mean with slow?  500k IOPS?

Bastian

-- 
War is never imperative.
		-- McCoy, "Balance of Terror", stardate 1709.2
