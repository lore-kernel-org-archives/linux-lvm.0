Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06FD1E77BC
	for <linux-lvm@redhat.com>; Wed,  9 Sep 2020 15:01:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A02F118AE956
	for <linux-lvm@redhat.com>; Wed,  9 Sep 2020 15:01:42 +0000 (UTC)
Date: Wed, 9 Sep 2020 17:01:30 +0200 (CEST)
From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Message-ID: <83152674.4938205.1599663690759.JavaMail.zimbra@karlsbakk.net>
In-Reply-To: <53661d4eefb635710b51cf9bfee894ef@assyoma.it>
References: <79061390.1069833.1599071934227.JavaMail.zimbra@karlsbakk.net>
	<53661d4eefb635710b51cf9bfee894ef@assyoma.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Looking ahead - tiering with LVM?
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm <linux-lvm@redhat.com>
Cc: =?utf-8?Q?H=C3=A5kon?= <hawken@thehawken.org>

>> I just wonder how it could be possible some day, some year, to make
>> lvm use tiering. I guess this has been debated numerous times before
>> and I found this lvmts project, but it hasn't been updated for eight
>> years or so.
> 
> Hi, having developed and supported file-level form of tiered storage in
> response to a specific customer request, I have the feeling that tiered
> storage (both file and block based) is not so useful as it seems. Let me
> explain why I feel so...

First, filelevel is usually useless. Say you have 50 VMs with Windows server something. A lot of them are bound to have a ton of equal storage in the same areas, but the file size and content will vary over time. With blocklevel tiering, that could work better.

> The key difference between caching and tiering is that the former does
> not increase total available space, while the latter provides as much
> space as available in each storage tier. For example, 1 TB SSD + 10 TB
> HDD can be combined for a 11 TB tiered volume.

This is all known.

> Tiering is useful when the faster volume provides a significant portion
> of the total aggregated sum - which is often not the case. In the
> example above, the SSD only provides a 10% space increase over plain
> caching. You can argue that one can simple enlarge the performane tier,
> for example using a 4 TB SSD + 10 TB HDD, but you are now in the
> ballpark of affording a full-SSD volume - ditching *both* tiering and
> caching.

If you look at IOPS instead of just sequencial speed, you'll see the difference. A set of 10 drives in a RAID-6 will perhaps, maybe, give you 1kIOPS, while a single SSD might give you 50kIOPS or even more. This makes a huge impact.

> That said, LVM already provides the basic building block to provide
> tiering as you can pvmove between block devices. The difficult thing is
> how to determine which block to move, and managing them in an automated
> way.

…which was the reason I asked this question, and which should be quite clear in the original post.

Vennlig hilsen

roy
-- 
Roy Sigurd Karlsbakk
(+47) 98013356
http://blogg.karlsbakk.net/
GPG Public key: http://karlsbakk.net/roysigurdkarlsbakk.pubkey.txt
--
Hið góða skaltu í stein höggva, hið illa í snjó rita.
