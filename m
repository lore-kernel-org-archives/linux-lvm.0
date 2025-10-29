Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0878D2F691C
	for <linux-lvm@lists.linux.dev>; Wed, 29 Oct 2025 16:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761755496; cv=none; b=gLv4whFjRK0IuVAgpARrT6kxQIgw1UuU+vv7wG9L0CjU8LhDj2p8Yk2/DlSHzgbi+J3mH1cJE6ZggBw92UEm9bmzhxioumJc5WJS4gDaCGDgDu67OeP0qUShUAfDHVEh7m5PtD0rgSxCZcpapn6IXTQ0Nr/9Ew9JQV5IsSxOJhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761755496; c=relaxed/simple;
	bh=Tw5vEbrXWUB8SboVr/dUVdOqU8bkAxaparS/ZqBpR6Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GWledwbASF7HScVSA5r/NJ01E/zpsbBPO+sos0g+JhWelkDO7dAM2Dgj2KTHMNpqKJct9L2qXBu1XY+Nd91ES64gz1i/9c0DRbT5jYYm8JUyRQjPcks34ck4BL+HG5sa7ZnAJ66UQLDyhEp21yGoTRUdsNb/f3/Ok8puq7O5qrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h0p+QDCx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h0p+QDCx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761755494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1T52Vj5IIAdBYMNDfCC4go6XkTYm9qfscMzwG6wwCuU=;
	b=h0p+QDCxXKOZOoO/1KGSmP/kc5hBBV6g7rs+/WgonIN9FaolhWesV0JqxfBPJrjL+KRCVe
	v1ssiyY9CmmMB19fjnPPGX1BrrW31vCDqNhqYRlWMrnAZwa7/+bmrMnxt/xQZuPKDE/0OC
	RKXVT5BUCt05+6uvGI/tHmigyuwOPYs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-433-VrIc2NguM8WEFqbFBmCdqQ-1; Wed,
 29 Oct 2025 12:31:32 -0400
X-MC-Unique: VrIc2NguM8WEFqbFBmCdqQ-1
X-Mimecast-MFC-AGG-ID: VrIc2NguM8WEFqbFBmCdqQ_1761755489
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 18891196F74D;
	Wed, 29 Oct 2025 16:31:28 +0000 (UTC)
Received: from [10.45.225.163] (unknown [10.45.225.163])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F0BFB19560AD;
	Wed, 29 Oct 2025 16:31:20 +0000 (UTC)
Date: Wed, 29 Oct 2025 17:31:13 +0100 (CET)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
    Askar Safin <safinaskar@gmail.com>, linux-mm@kvack.org, 
    linux-pm@vger.kernel.org, linux-block@vger.kernel.org, 
    linux-crypto@vger.kernel.org, linux-lvm@lists.linux.dev, 
    lvm-devel@lists.linux.dev, linux-raid@vger.kernel.org, 
    DellClientKernel <Dell.Client.Kernel@dell.com>, dm-devel@lists.linux.dev, 
    linux-btrfs@vger.kernel.org, Nhat Pham <nphamcs@gmail.com>, 
    Kairui Song <ryncsn@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
    =?ISO-8859-15?Q?Rodolfo_Garc=EDa_Pe=F1as?= <kix@kix.es>, 
    Eric Biggers <ebiggers@kernel.org>, 
    Lennart Poettering <mzxreary@0pointer.de>, 
    Christian Brauner <brauner@kernel.org>, 
    Linus Torvalds <torvalds@linux-foundation.org>, 
    Milan Broz <milan@mazyland.cz>
Subject: Re: [PATCH] pm-hibernate: flush block device cache when
 hibernating
In-Reply-To: <aQIm1bfwKlwaak52@infradead.org>
Message-ID: <355486cd-6c52-df82-7636-a8259995b522@redhat.com>
References: <20251023112920.133897-1-safinaskar@gmail.com> <4cd2d217-f97d-4923-b852-4f8746456704@mazyland.cz> <03e58462-5045-e12f-9af6-be2aaf19f32c@redhat.com> <CAJZ5v0gcEjZPVtKrysS=ek7kHpH3afinwY-apKm3Yd4PmKDHdA@mail.gmail.com>
 <aQIm1bfwKlwaak52@infradead.org>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12



On Wed, 29 Oct 2025, Christoph Hellwig wrote:

> On Wed, Oct 29, 2025 at 02:31:05PM +0100, Rafael J. Wysocki wrote:
> > > This commit fixes the suspend code so that it issues flushes before
> > > writing the header and after writing the header.
> > 
> > Hmm, shouldn't it flush every time it does a sync write, and not just
> > in these two cases?
> 
> It certainly should not use the PREFLUSH flag that flushes before
> writing, as the cache will be dirty again after that.
> 
> I'd expect a single blkdev_issue_flush after all writing is done,
> under the assumption that the swsusp swap writing doesn't have
> transaction integrity for individual writes anyway.

I think that we should use two flushes - one before writing the header and 
the other after writing the header. Otherwise, it could be possible that 
the header is written and some of the data is not written, if the system 
loses power during hibernation.

Mikulas

