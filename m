Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 50DF06EC83
	for <linux-lvm@redhat.com>; Mon, 11 Sep 2017 12:45:47 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 22C6D629DC
	for <linux-lvm@redhat.com>; Mon, 11 Sep 2017 12:45:46 +0000 (UTC)
Received: from webmail.dds.nl (app2.dds.nl [81.21.136.118])
	by smtp2.signet.nl (Postfix) with ESMTP id 7802340BCD53
	for <linux-lvm@redhat.com>; Mon, 11 Sep 2017 14:45:44 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon, 11 Sep 2017 14:45:44 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <2cea88d3e483b3db671cc8dd446d66d0@xenhideout.nl>
References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<0c6c96790329aec2e75505eaf544bade@assyoma.it>
	<8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
	<7d0d218c420d7c687d1a17342da5ca00@xenhideout.nl>
	<6e9535b6-218c-3f66-2048-88e1fcd21329@redhat.com>
	<2cea88d3e483b3db671cc8dd446d66d0@xenhideout.nl>
Message-ID: <d99180248b60be70108296bd9ac8539d@xenhideout.nl>
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
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
To: linux-lvm@redhat.com

Xen schreef op 11-09-2017 14:06:

> But system volumes already have reserved space filesystem level.
> 
> But do they also have this space reserved in actuality? I doubt it.
> Not on the LVM level.
> 
> So it is only to mirror that filesystem feature.
> 
> Now you could do something on the filesystem level to ensure that
> those blocks are already allocated on LVM level, that would be good
> too.

This made no sense, sorry.

No system should really run main system volume on LVM thin (or at least 
there no great need for it) so the typical failure case would be:

- data volume fills up
- entire system crashes

THAT is the only problem LVM has today.

It's not just that the thin pool is going to be unreliable

But that it also causes a kernel panic in due time. Usually within 10-20 
seconds.
