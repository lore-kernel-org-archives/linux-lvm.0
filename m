Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 412A9EE38A
	for <linux-lvm@redhat.com>; Sat,  5 Sep 2020 11:47:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5AD8811E76
	for <linux-lvm@redhat.com>; Sat,  5 Sep 2020 11:47:26 +0000 (UTC)
MIME-Version: 1.0
Date: Sat, 05 Sep 2020 13:47:15 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <79061390.1069833.1599071934227.JavaMail.zimbra@karlsbakk.net>
References: <79061390.1069833.1599071934227.JavaMail.zimbra@karlsbakk.net>
Message-ID: <53661d4eefb635710b51cf9bfee894ef@assyoma.it>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Roy Sigurd Karlsbakk <roy@karlsbakk.net>, =?UTF-8?Q?H=C3=A5kon?= <hawken@thehawken.org>

Il 2020-09-02 20:38 Roy Sigurd Karlsbakk ha scritto:
> Hi all
> 
> I just wonder how it could be possible some day, some year, to make
> lvm use tiering. I guess this has been debated numerous times before
> and I found this lvmts project, but it hasn't been updated for eight
> years or so.

Hi, having developed and supported file-level form of tiered storage in 
response to a specific customer request, I have the feeling that tiered 
storage (both file and block based) is not so useful as it seems. Let me 
explain why I feel so...

The key difference between caching and tiering is that the former does 
not increase total available space, while the latter provides as much 
space as available in each storage tier. For example, 1 TB SSD + 10 TB 
HDD can be combined for a 11 TB tiered volume.

Tiering is useful when the faster volume provides a significant portion 
of the total aggregated sum - which is often not the case. In the 
example above, the SSD only provides a 10% space increase over plain 
caching. You can argue that one can simple enlarge the performane tier, 
for example using a 4 TB SSD + 10 TB HDD, but you are now in the 
ballpark of affording a full-SSD volume - ditching *both* tiering and 
caching.

That said, LVM already provides the basic building block to provide 
tiering as you can pvmove between block devices. The difficult thing is 
how to determine which block to move, and managing them in an automated 
way.

Regards.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
