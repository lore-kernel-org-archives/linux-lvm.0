Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61BD374CE
	for <linux-lvm@lists.linux.dev>; Fri, 17 Nov 2023 20:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HiGyZv7W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700252214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VLA4AgF0D14taOEtynM9yEdNov4TbB7PJO1+J7fhGII=;
	b=HiGyZv7WJnOWlsttNbyDC/WtATT1TX0OHWjr7hZ0nRPCCBTa75d+JYndJ4nMFt5KQRdoRI
	liKpV1AGzXEa+81SYx9VRWJ+/U4nxfuwyIbyHXigv6XMQjy8H/qwruVLd9PFoJKEIL5zP+
	UNpTbHdkN15oFkSGkfDzBMlRlaANR9Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-WyyHuxSxMpC09naLILy3og-1; Fri, 17 Nov 2023 15:16:51 -0500
X-MC-Unique: WyyHuxSxMpC09naLILy3og-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C301A811E7E;
	Fri, 17 Nov 2023 20:16:50 +0000 (UTC)
Received: from redhat.com (unknown [10.22.33.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A02E1C060AE;
	Fri, 17 Nov 2023 20:16:50 +0000 (UTC)
Date: Fri, 17 Nov 2023 14:16:48 -0600
From: David Teigland <teigland@redhat.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Zdenek Kabelac <zkabelac@redhat.com>,
	Heming Zhao <heming.zhao@suse.com>,
	Peter Rajnoha <prajnoha@redhat.com>,
	Martin Wilck <martin.wilck@suse.com>,
	"bmarzins@redhat.com" <bmarzins@redhat.com>,
	"linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>,
	Glass Su <glass.su@suse.com>, "hare@suse.de" <hare@suse.de>
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Message-ID: <ZVfKMHFtaG8UyvwG@redhat.com>
References: <ZVJtCxq7XeCg_G-g@redhat.com>
 <177c4b2f-3b4b-44e0-9391-3df007cafe36@redhat.com>
 <ZVOgmGx-EIpMF54F@redhat.com>
 <194d20b7-e3b0-43d6-95e1-1a7d56eab506@redhat.com>
 <037a0ba9-76fc-469c-ac96-11981391903b@suse.com>
 <ZVUYAJyEe5fNh4SN@redhat.com>
 <e64bbbc8-1716-4739-a68c-2f92563a9c8d@redhat.com>
 <ZVbGObxAvSsYqvvo@itl-email>
 <ZVeF_vUYxaRLLJbv@redhat.com>
 <ZVfGLbjio7PEWG/L@itl-email>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZVfGLbjio7PEWG/L@itl-email>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 17, 2023 at 02:57:35PM -0500, Demi Marie Obenour wrote:
> > Yes, the devices file is intended to be a default feature of lvm since the
> > commit above.
> 
> Could LVM issue a deprecation warning if DEFAULT_USE_DEVICES_FILE is set
> to 0 or system.devices is not set at runtime?

No, deprecated implies we're planning to remove it, which we probably
never will.

Dave

