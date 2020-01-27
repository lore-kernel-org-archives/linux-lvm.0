Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D42591000DB0
	for <linux-lvm@redhat.com>; Mon, 27 Jan 2020 16:50:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 528AC805A9A
	for <linux-lvm@redhat.com>; Mon, 27 Jan 2020 16:50:08 +0000 (UTC)
Received: from wiki.gathman.org (mail.gathman.org [IPv6:2001:470:8:809::1010])
	(authenticated bits=0)
	by mail.gathman.org (8.14.7/8.14.7) with ESMTP id 00RGcAXi025399
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 27 Jan 2020 11:38:13 -0500
Date: Mon, 27 Jan 2020 11:38:10 -0500 (EST)
From: Stuart D Gathman <stuart@gathman.org>
In-Reply-To: <31a152c7-6497-aaee-2fe9-996f3a522ed5@meduniwien.ac.at>
Message-ID: <alpine.LRH.2.21.2001271135130.25220@mail.gathman.org>
References: <31a152c7-6497-aaee-2fe9-996f3a522ed5@meduniwien.ac.at>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] pvmove --abort
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

On Mon, 27 Jan 2020, Matthias Leopold wrote:

> I consciously used "pvmove --abort" for the first time now and I'm astonished 
> it doesn't behave like described in the man page. No matter if I've used 
> "--atomic" for the original command, when I interrupt the process with 
> "pvmove --abort" lvm always completely rolls back my copy operation. I would 
> expect that if I don't use "--atomic" then "--abort" will result in "segments 
> that have been moved will remain on the destination PV, while unmoved 
> segments will remain on the source PV" (from man page). Am I missing 
> something?

I'm not an LVM guru, but I think I got this one!  pvmove effectively
creates a mirror on the destination, and begins syncing the mirror.
Any writes to the LV go to *both* the source and destination.
When you abort, it simply discards the partially synced mirror.
When the sync is complete, it discards the source leg of the mirror
instead.
