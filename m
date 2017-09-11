Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D117560BED
	for <linux-lvm@redhat.com>; Mon, 11 Sep 2017 10:55:16 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C2B7A11A29F
	for <linux-lvm@redhat.com>; Mon, 11 Sep 2017 10:55:12 +0000 (UTC)
Received: from webmail.dds.nl (app2.dds.nl [81.21.136.118])
	by smtp2.signet.nl (Postfix) with ESMTP id B60AB40C0A24
	for <linux-lvm@redhat.com>; Mon, 11 Sep 2017 12:55:10 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon, 11 Sep 2017 12:55:11 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<0c6c96790329aec2e75505eaf544bade@assyoma.it>
	<8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
Message-ID: <7d0d218c420d7c687d1a17342da5ca00@xenhideout.nl>
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

Zdenek Kabelac schreef op 11-09-2017 12:35:

> As thin-provisioning is about 'promising the space you can deliver
> later when needed'  - it's not about hidden magic to make the space
> out-of-nowhere.
> The idea of planning to operate thin-pool on 100% fullness boundary is
> simply not going to work well - it's  not been designed for that
> use-case

I am going to rear my head again and say that a great many people would 
probably want a thin-provisioning that does exactly that ;-).

I mean you have it designed for auto-extension but there are also many 
people that do not want to auto-extend and just share available 
resources more flexibly.

For those people safety around 100% fullness boundary becomes more 
important.

I don't really think there is another solution for that.

I don't think BTRFS is really a good solution for that.

So what alternatives are there, Zdenek? LVM is really the only thing 
that feels "good" to us.

Are there structural design inhibitions that would really prevent this 
thing from ever arising?
