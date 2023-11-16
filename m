Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5B62E636
	for <linux-lvm@lists.linux.dev>; Thu, 16 Nov 2023 17:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zx9uoRFk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700154792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3l7rVEIL+A1i7IwmphtpnW06Ak1EtCqnywpM0v1SNDc=;
	b=Zx9uoRFkJsD1Z78yChNsizf+BrfcFnXvf+l63QvGWo3Zk+EaTQiWMyvAheOoDb8rlxzlry
	M4F00VPC/m2NQm9+WHUzkKoTTmIj9IJAIS/obRGu1I2aPhnPGU22kPC8VarPjb0DQTMWGz
	vF/efcK7svXgK+8ofhwwo7cHQUvrK6k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-ZziSEYZjPvONWnhv2JBGRw-1; Thu, 16 Nov 2023 12:13:09 -0500
X-MC-Unique: ZziSEYZjPvONWnhv2JBGRw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 287B080C347;
	Thu, 16 Nov 2023 17:13:09 +0000 (UTC)
Received: from redhat.com (unknown [10.22.33.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E635C157E4;
	Thu, 16 Nov 2023 17:13:08 +0000 (UTC)
Date: Thu, 16 Nov 2023 11:13:07 -0600
From: David Teigland <teigland@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Cc: "zkabelac@redhat.com" <zkabelac@redhat.com>,
	Heming Zhao <heming.zhao@suse.com>,
	"bmarzins@redhat.com" <bmarzins@redhat.com>,
	Glass Su <glass.su@suse.com>, "hare@suse.de" <hare@suse.de>,
	"prajnoha@redhat.com" <prajnoha@redhat.com>,
	"linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Message-ID: <ZVZNoxQRKctUkhJ5@redhat.com>
References: <ZVJtCxq7XeCg_G-g@redhat.com>
 <177c4b2f-3b4b-44e0-9391-3df007cafe36@redhat.com>
 <ZVOgmGx-EIpMF54F@redhat.com>
 <194d20b7-e3b0-43d6-95e1-1a7d56eab506@redhat.com>
 <037a0ba9-76fc-469c-ac96-11981391903b@suse.com>
 <ZVUYAJyEe5fNh4SN@redhat.com>
 <e64bbbc8-1716-4739-a68c-2f92563a9c8d@redhat.com>
 <12b4acebc76db5a3d85a2a9c9c275255a848f922.camel@suse.com>
 <c1b148d3-d27e-4d94-aeff-a6bc13996005@redhat.com>
 <cd0e67fb0712b803b835a0a82d5147b5175b65be.camel@suse.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <cd0e67fb0712b803b835a0a82d5147b5175b65be.camel@suse.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Nov 16, 2023 at 03:29:42PM +0000, Martin Wilck wrote:
> On Thu, 2023-11-16 at 15:03 +0100, Zdenek Kabelac wrote:
> > 
> > Worth to be noted - existing filters are not going anywhere out - 
> > devicesfile is jiust another mechanism how to limit device set.
> > 
> > For some cases  devicesfile present a more simple way - for some
> > others - filters are clearly a better mechanism which doesn't require
> > updating files in the filesystem.
> > 
> > Both filtering systems should be equivalent and work equally well -
> > there is no plan to phase out existing filter logic.

That's just vague enough that I can both agree with it and disagree with
it at the same time :)

The devices file offers significant advantages over regex filters, which
could be described as "working better."  On the other hand, we're
obviously not making the regex filter work worse, and I'm sure it will
exist forever given how long it's been part of lvm.

> Good to know - that sounded a bit different one of David's previous
> posts in this  thread.

I like to be accurate, so to be clear, while the devices file is being
used, the regex filter cannot be used.  lvm commands will print:
"Please remove the lvm.conf filter, it is ignored with the devices file."

Dave

