Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB125364DC
	for <linux-lvm@lists.linux.dev>; Thu, 16 Nov 2023 17:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HsPR74v6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700155626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K8TshY5iCMcvTWG0Xcb0AggsdOZ8ft8vu2kkAsRK9GQ=;
	b=HsPR74v6UN61advCdIYb1/NmFay8TGDtaj4bbm734uiP7YPSSLUBrj+wlOb+vYpu88AjEt
	DMyIkE25XTXaBzJ/SB7h0i5NTeVmj06yy48dQjV5a1x8qopeCPVpQSqx00skri1dzpPwhQ
	3oyOlAA/ol85/qHJD8t2339MLeEnX1k=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-407-YlMnemdXN9ylUu00lGdEaA-1; Thu,
 16 Nov 2023 12:27:03 -0500
X-MC-Unique: YlMnemdXN9ylUu00lGdEaA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90D503C13503;
	Thu, 16 Nov 2023 17:27:02 +0000 (UTC)
Received: from redhat.com (unknown [10.22.33.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 161232026D4C;
	Thu, 16 Nov 2023 17:27:02 +0000 (UTC)
Date: Thu, 16 Nov 2023 11:27:00 -0600
From: David Teigland <teigland@redhat.com>
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: Martin Wilck <martin.wilck@suse.com>,
	Heming Zhao <heming.zhao@suse.com>,
	"bmarzins@redhat.com" <bmarzins@redhat.com>,
	Glass Su <glass.su@suse.com>, "hare@suse.de" <hare@suse.de>,
	"prajnoha@redhat.com" <prajnoha@redhat.com>,
	"linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Message-ID: <ZVZQ5Gbj9KAeX7Dc@redhat.com>
References: <ZVJtCxq7XeCg_G-g@redhat.com>
 <177c4b2f-3b4b-44e0-9391-3df007cafe36@redhat.com>
 <ZVOgmGx-EIpMF54F@redhat.com>
 <194d20b7-e3b0-43d6-95e1-1a7d56eab506@redhat.com>
 <037a0ba9-76fc-469c-ac96-11981391903b@suse.com>
 <ZVUYAJyEe5fNh4SN@redhat.com>
 <e64bbbc8-1716-4739-a68c-2f92563a9c8d@redhat.com>
 <ZVYw9eNTj7Ir6V31@redhat.com>
 <4da245517088a3bb7d8f850c0903d2d100e14b14.camel@suse.com>
 <7c71b1f8-bf51-43f9-a824-39c1ed70e8b9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <7c71b1f8-bf51-43f9-a824-39c1ed70e8b9@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Nov 16, 2023 at 04:48:06PM +0100, Zdenek Kabelac wrote:
> Dne 16. 11. 23 v 16:40 Martin Wilck napsal(a):
> > The problem I see with using system.devices by default is that it
> > requires installer support, as discussed previously.

Yes

> Yep - it needs to be fully understood and supported by distro - so changing
> default may cause significant troubles - and took us quite some time to
> figure out various details in RHEL 

Yes, as mentioned earlier, "images" are a unique case that's not entirely
solved yet.

> issues to solve. So even if we would flip default - configure process should
> be giving some major message notification about such change and how to
> easily 'switch' to previous 'fillter' logic.   So 'dstro' maintainer then
> just adds  configure option and keeps it in older state until distro gets
> ready for such changes.

I pity the distro maintainer who has to figure out all the lvm configure
options... I can hardly figure them out myself.  If lvm wanted to be
helpful, we'd provide pre-defined sets of recommended configure options
for various distros.

Dave

