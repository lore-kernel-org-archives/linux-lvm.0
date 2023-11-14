Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD90433065
	for <linux-lvm@lists.linux.dev>; Tue, 14 Nov 2023 21:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VgA3LvXe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699995761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N9YgXt0yN4jWnDVTuQBZ8mpTJ3WW0kaaJEm+ZRuAUqk=;
	b=VgA3LvXekseRvUoekNdGxKbbYB9sAt5npjfw0qBspGzvbAUXcf+JuRVMqqZk3SksF1gedB
	1Fne3BGkCnf8DAnHKUHXEAV7KNGncBzZuPUXzVGvEGlQj9+vtjB2FnBWoGjZgFK2n4bujh
	CFSMEgi1TwJZTIde69ciBQmAD+3+rfI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-550-sD8yGJWNOiGpKRtdliSaUw-1; Tue,
 14 Nov 2023 16:02:38 -0500
X-MC-Unique: sD8yGJWNOiGpKRtdliSaUw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8A5D3C02796;
	Tue, 14 Nov 2023 21:02:37 +0000 (UTC)
Received: from redhat.com (unknown [10.22.33.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60D4E1C060AE;
	Tue, 14 Nov 2023 21:02:37 +0000 (UTC)
Date: Tue, 14 Nov 2023 15:02:35 -0600
From: David Teigland <teigland@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Cc: Heming Zhao <heming.zhao@suse.com>,
	"zkabelac@redhat.com" <zkabelac@redhat.com>,
	Glass Su <glass.su@suse.com>,
	"bmarzins@redhat.com" <bmarzins@redhat.com>,
	"hare@suse.de" <hare@suse.de>,
	"prajnoha@redhat.com" <prajnoha@redhat.com>,
	"linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Message-ID: <ZVPgawjni9m6vYd9@redhat.com>
References: <74b83545-abe7-432c-ae19-814b289a6ff0@suse.com>
 <6c7699678ceebca58c56aaa769c2a7b9a6092883.camel@suse.com>
 <23d98f61-f9e1-494a-be3c-df9531f4f70b@redhat.com>
 <ZVJtCxq7XeCg_G-g@redhat.com>
 <0bad121644deb8bf67329f111f0ba34ea261e988.camel@suse.com>
 <ZVOnoCjNmOYToBpt@redhat.com>
 <38458148cb14bf398aa3c6912842ddda79b81115.camel@suse.com>
 <84c0588a5b6a8142459a482c25f82bc6d15b19c3.camel@suse.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <84c0588a5b6a8142459a482c25f82bc6d15b19c3.camel@suse.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 14, 2023 at 05:58:52PM +0000, Martin Wilck wrote:
>     "mpath_uuid is used for dm multipath devices, reported by sysfs."
> 
> So users are supposed to use "mpath_uuid" if they want to use multipath
> devices as PVs? What if the user simply uses "sys_wwid" or "sys_serial"
> for a multipath device? Will LVM perform any kind of multipath
> detection, and if yes, how?

LVM will automatically, and only, allow mpath_uuid for multipath devices.

There is a special case that we look for in which a device is used by
itself originally, and included in system.devices with its wwid.  Later,
multipath is set up on that device.  When the multipath device is added to
system.devices, the component device is automatically removed.

Dave

