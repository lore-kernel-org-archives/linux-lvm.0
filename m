Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF9B2AF09
	for <linux-lvm@lists.linux.dev>; Tue, 14 Nov 2023 17:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IM79bS6c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699981221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DTB2kwGsdlhI5biwZnMQAqMvV+uBvU9hU59FVjCKIQQ=;
	b=IM79bS6cPDLYgkatdoDCGundiU+V+0CjsHZQGDYDJ9Ka0TTfjqGVdqqdw9jv96UPg8h5h1
	GO6vbbazYEHbxPa0x65beJFZdD55xdO07oNt9+Nft70HKKBezG0/piQZPW8f4Ki+95ZlS9
	cXmq7rgHb6J+oWLHnTKxoi1Qg66fDfs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-j_1btReuNdeqh5DOa0VaEw-1; Tue, 14 Nov 2023 12:00:18 -0500
X-MC-Unique: j_1btReuNdeqh5DOa0VaEw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 076FD101A529;
	Tue, 14 Nov 2023 17:00:18 +0000 (UTC)
Received: from redhat.com (unknown [10.22.33.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 838422026D66;
	Tue, 14 Nov 2023 17:00:17 +0000 (UTC)
Date: Tue, 14 Nov 2023 11:00:16 -0600
From: David Teigland <teigland@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Cc: Heming Zhao <heming.zhao@suse.com>,
	"prajnoha@redhat.com" <prajnoha@redhat.com>,
	"zkabelac@redhat.com" <zkabelac@redhat.com>,
	"bmarzins@redhat.com" <bmarzins@redhat.com>,
	Glass Su <glass.su@suse.com>, "hare@suse.de" <hare@suse.de>,
	"linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Message-ID: <ZVOnoCjNmOYToBpt@redhat.com>
References: <74b83545-abe7-432c-ae19-814b289a6ff0@suse.com>
 <6c7699678ceebca58c56aaa769c2a7b9a6092883.camel@suse.com>
 <23d98f61-f9e1-494a-be3c-df9531f4f70b@redhat.com>
 <ZVJtCxq7XeCg_G-g@redhat.com>
 <0bad121644deb8bf67329f111f0ba34ea261e988.camel@suse.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <0bad121644deb8bf67329f111f0ba34ea261e988.camel@suse.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 14, 2023 at 10:44:02AM +0000, Martin Wilck wrote:
> I haven't looked into "system.devices" so far. Is there a high-level
> description of this feature available somewhere? A link would be
> appreciated. On (open)SUSE, afaik, system.device is not used (Heming,
> correct me if I am wrong).

https://man7.org/linux/man-pages/man8/lvmdevices.8.html

If that's too low-level let me know and I'll look at writing something
more conceptual and introductory.

> > - To make filter-mpath use udev info, and prevent lvm from using
> > wwids, you can set external_device_info_source=udev and
> > multipath_wwids_file="".
> 
> Good to know, but that's kind of counter-intuitive. I'd prefer
> if external_device_info_source=udev did what the name says, and a new
> mode ("external_device_info_source=hybrid", say) was introduced for the
> current behavior.

I'd also thought about adding a new option for external_device_info_source
that would mean "udev info only", rather than "both native and udev info."

The complication is that external_device_info_source applies to a few
different kinds of device info, not just multipath, and I doubt we can
apply only udev info to all those cases.  This means adding another config
option... not much different from just using multipath_wwids_file="".

> Can a distribution set multipath_wwids_file="" by default without
> undesired side effects?

Yes, it just causes lvm to skip the use of /etc/multipath/wwids for
checking if a device is a multipath component.

Dave

