Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE1A3456D
	for <linux-lvm@lists.linux.dev>; Thu, 16 Nov 2023 16:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h6XPS26w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700151116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=deSkMY0nIWGwfNblNc81lO+VYQ8K9UXAoGxNKGBVE6A=;
	b=h6XPS26weF0BcASrsvKTHUoCRSXbDGbmElWiuVKC6mWn7TqbQxEDsK2d9ZGorAjnNVAz6t
	PqccufD4SFcQUp9RzXhLQ87l2l/lNrCPSPJ7EVtWSQt39OYNdYB7S8WAmT4+xYaOLau8Mm
	W9QfJqrElonuDW8PY1Zs8NtDCcP23zo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-rXmNZl_gN_a-i7U2TWigUA-1; Thu, 16 Nov 2023 11:11:51 -0500
X-MC-Unique: rXmNZl_gN_a-i7U2TWigUA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5511093A9A9;
	Thu, 16 Nov 2023 16:11:51 +0000 (UTC)
Received: from redhat.com (unknown [10.22.33.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D31352166B28;
	Thu, 16 Nov 2023 16:11:50 +0000 (UTC)
Date: Thu, 16 Nov 2023 10:11:49 -0600
From: David Teigland <teigland@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Cc: "prajnoha@redhat.com" <prajnoha@redhat.com>,
	Heming Zhao <heming.zhao@suse.com>,
	"zkabelac@redhat.com" <zkabelac@redhat.com>,
	Glass Su <glass.su@suse.com>,
	"bmarzins@redhat.com" <bmarzins@redhat.com>,
	"hare@suse.de" <hare@suse.de>,
	"linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Message-ID: <ZVY_RUUB_DGk0Lsz@redhat.com>
References: <74b83545-abe7-432c-ae19-814b289a6ff0@suse.com>
 <6c7699678ceebca58c56aaa769c2a7b9a6092883.camel@suse.com>
 <23d98f61-f9e1-494a-be3c-df9531f4f70b@redhat.com>
 <ZVJtCxq7XeCg_G-g@redhat.com>
 <177c4b2f-3b4b-44e0-9391-3df007cafe36@redhat.com>
 <ZVOgmGx-EIpMF54F@redhat.com>
 <194d20b7-e3b0-43d6-95e1-1a7d56eab506@redhat.com>
 <ZVUx7KjZKGqSuWxo@redhat.com>
 <96926c3355266affd7fc170011d60be15d5c56b0.camel@suse.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <96926c3355266affd7fc170011d60be15d5c56b0.camel@suse.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 15, 2023 at 09:46:35PM +0000, Martin Wilck wrote:
> Ugh. That adds even more complexity without improving matters.

I have to agree.  The point was, you should be able to configure this to
work as you need it to.  If the settings we've mentioned don't work well
enough, then we can find a simpler option.

> I guess it's too late now, but I'd still be willing to try and help
> sorting out the issues that you guys were having with udev's multipath
> component detection logic.

Right, not much can be done with old releases.

> There is libmpathvalid which was created for this purpose, have you
> tried it? AFAICT it should give the answers that udev would (Ben would
> know better though).

I tried that early on and it was no help because it was touching udev
itself, which is what we were trying to avoid.

Dave

