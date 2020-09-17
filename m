Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BEFDE115DA0
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2020 21:41:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E23485828A
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2020 21:41:34 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 17 Sep 2020 23:41:29 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <4f98430e-f6eb-b7b7-d1b0-f54ad07361de@redhat.com>
References: <3f51904f43c45f8c1259f1b050402358@assyoma.it>
	<5070f4fa-81ad-9c9a-b0a7-8d5463ea09d3@redhat.com>
	<056d2d5dd9a7846a56971ce5f4cb3537@assyoma.it>
	<4f98430e-f6eb-b7b7-d1b0-f54ad07361de@redhat.com>
Message-ID: <7725f4635181d25b6dda227b7e7a39cb@assyoma.it>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvmcache with vdo - inconsistent block size
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Il 2020-09-17 21:27 Zdenek Kabelac ha scritto:
> You've most likely found the bug and this should be likely disable
> (and enabled only with some force option).

Hi Zdenek, I am not sure about what bug I found - can you be more 
explicit?

> Problem is, when such device stack is used for XFS - where the
> 'geometry' changes, but for some other it's not a big issue (i.e.
> ext4).

Again, I am not sure about what we are speaking - generic thinlvm over 
VDO, or about the caching issue discussed before? Why this should be an 
issue for XFS vs EXT4? From RH docs, I can see VDO + thinlvm + XFS as 
being fully supported.

> So if you already hit some problem - feel free to open upstream BZ for
> this issue.

I'll do, but I first need to understand the core issue better.
Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
