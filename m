Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB31F43ACA
	for <linux-lvm@lists.linux.dev>; Wed, 15 Nov 2023 21:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bqwTtcQm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700082160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MIgAauhlaUx7yRCKshBlc0cO8nKBAME46Hz24jAu37Y=;
	b=bqwTtcQmEiRslSF8SCo3VtxIMbzg78Q3c1Yfik7eox9K64FWNGsxeXfGlrMj1YFqecH6lT
	ejeJVnJfAeaJqJIAeB6Z9zsBnact+OZiFU2z1AGLrV9MpgaEFwds8EpWCixVDo900ubvE1
	3nhBNp/brTq3vp5MOA0ML83+/muII34=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-TrLRjmcpOQqdlHB9TasXtw-1; Wed, 15 Nov 2023 16:02:39 -0500
X-MC-Unique: TrLRjmcpOQqdlHB9TasXtw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A295185A781;
	Wed, 15 Nov 2023 21:02:38 +0000 (UTC)
Received: from redhat.com (unknown [10.22.33.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AC5F492BE0;
	Wed, 15 Nov 2023 21:02:38 +0000 (UTC)
Date: Wed, 15 Nov 2023 15:02:36 -0600
From: David Teigland <teigland@redhat.com>
To: Peter Rajnoha <prajnoha@redhat.com>
Cc: Martin Wilck <martin.wilck@suse.com>,
	Heming Zhao <heming.zhao@suse.com>,
	"zkabelac@redhat.com" <zkabelac@redhat.com>,
	"bmarzins@redhat.com" <bmarzins@redhat.com>,
	"linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>,
	Glass Su <glass.su@suse.com>, "hare@suse.de" <hare@suse.de>
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Message-ID: <ZVUx7KjZKGqSuWxo@redhat.com>
References: <74b83545-abe7-432c-ae19-814b289a6ff0@suse.com>
 <6c7699678ceebca58c56aaa769c2a7b9a6092883.camel@suse.com>
 <23d98f61-f9e1-494a-be3c-df9531f4f70b@redhat.com>
 <ZVJtCxq7XeCg_G-g@redhat.com>
 <177c4b2f-3b4b-44e0-9391-3df007cafe36@redhat.com>
 <ZVOgmGx-EIpMF54F@redhat.com>
 <194d20b7-e3b0-43d6-95e1-1a7d56eab506@redhat.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <194d20b7-e3b0-43d6-95e1-1a7d56eab506@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 15, 2023 at 09:51:19AM +0100, Peter Rajnoha wrote:
> Sure, if we already have that in the devices file, we don't need to
> rerun the filters again and again. But I think that for the very first
> check we do when inserting new entry to the devices file, we should
> really be using information that is *shared* by the other subsystem that
> owns it. In case of multipath, we shouldn't be reading any of their
> config or trying to reimplement subset of their logic (the config can
> change format, the logic can change, new features can be added, various
> settings can be applied which we omit in our own internal simplified
> version of the logic).
> 
> If I would need to compare the situation to something, imagine that some
> subsystem, MD for example, would be parsing our system.devices file to
> check if it can or can not access certain device. Then checking
> multipath config, then other config and so on... So that way we would
> have each subsystem checking other subsystems by reimplementing these
> checks again and again (with the risk of not even being correct).
> 
> We should be using dedicated APIs or udev to share the information among
> various subsystems. Or, if nothing else, even calling out to the
> subsystem's binary if it doesn't provide the API yet.
> 
> I don't see an issue with the devices file as such, I see the issue in
> the way we gather information, reimplementing the logic that is simply
> not in our domain.
> 
> I think that's also what Martin and Heming have in mind.

I'm not sure if you're talking about things in practice or in principle.
This is a situation where those two don't entirely line up.

In practice, you can already do what's requested with:
  external_device_info_source="udev"
  multipath_wwid_files=""

I've suggested another way to do that which could be more explicit, and
gives more control over exactly what info is used for multipath, e.g.

  multipath_info_sources = [ "option1", "option2", "option3" ]

where options in the list are used in order, and can reference any number
of methods... udev, sysfs, wwids file, some new multipath lib, etc.

The context of using system.devices or not also makes a difference in
these choices, and I haven't thought through that entirely yet.  Perhaps
different defaults should apply when system.devices is in use (i.e. that
multipath_info_sources list may want to depend on using system.devices.)

In principle, the multipath wwids option is an unfortunate, temporary
workaround we tried to avoid.  Principles sometimes give way to real world
problems like systems not booting.  Ideally, a multipath lib API would
have been available to check the wwids (which didn't involve udev.)
There are a couple threads from 2021 about that, initially in

https://listman.redhat.com/archives/lvm-devel/2021-January/022915.html

I didn't have a complete understanding of the mess we were in during that
thread, but it prompted me to begin sorting it all out.  I think it's sane
now, but fine-grained control over what info is used where could be added.
And, system.devices may now let us make some different choices.

Dave

