Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51C24175D
	for <linux-lvm@lists.linux.dev>; Tue, 14 Nov 2023 17:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I/mCkU/J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699982168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QfZpjlsoHF3yI9KodSFUDlyAj4rQj64BcDj9jc3JXy4=;
	b=I/mCkU/Jf69tUGmHvkgTTpdai0+x6Y0cbPzrPA/ZA0671sYKFnZ+esahGkoyIWInwchwSi
	gAsvpRjIfyx1gDRaoJkYupjbHQ7B35X+JIDS/+gAGBFXk/3trct1zCSji4LF/zbsEHebt1
	Sbe1SWCP+nJIHVwQENJj/3hkXPDZlio=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-263-xngetTDZP_W0EMpBp0OR9w-1; Tue,
 14 Nov 2023 12:16:07 -0500
X-MC-Unique: xngetTDZP_W0EMpBp0OR9w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14FE31C0651B;
	Tue, 14 Nov 2023 17:16:07 +0000 (UTC)
Received: from redhat.com (unknown [10.22.33.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EDE52026D4C;
	Tue, 14 Nov 2023 17:16:06 +0000 (UTC)
Date: Tue, 14 Nov 2023 11:16:05 -0600
From: David Teigland <teigland@redhat.com>
To: Heming Zhao <heming.zhao@suse.com>
Cc: Martin Wilck <martin.wilck@suse.com>,
	"prajnoha@redhat.com" <prajnoha@redhat.com>,
	"zkabelac@redhat.com" <zkabelac@redhat.com>,
	"bmarzins@redhat.com" <bmarzins@redhat.com>,
	Glass Su <glass.su@suse.com>, "hare@suse.de" <hare@suse.de>,
	"linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Message-ID: <ZVOrVenHY2fowRoE@redhat.com>
References: <74b83545-abe7-432c-ae19-814b289a6ff0@suse.com>
 <6c7699678ceebca58c56aaa769c2a7b9a6092883.camel@suse.com>
 <23d98f61-f9e1-494a-be3c-df9531f4f70b@redhat.com>
 <ZVJtCxq7XeCg_G-g@redhat.com>
 <0bad121644deb8bf67329f111f0ba34ea261e988.camel@suse.com>
 <479fc9d6-4677-4df1-b1d8-7ce3be2bb5ae@suse.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <479fc9d6-4677-4df1-b1d8-7ce3be2bb5ae@suse.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 14, 2023 at 08:18:14PM +0800, Heming Zhao wrote:
> In my view, the system.device was introduced by fixing huge number (>1K)
> devices booting timeout issue, which we also discussed 2 or 3 years ago.

It does help in that case.  It's also easier to use than creating filters.
It also largely solves the problem of "duplicate PVs" which appear if a
device is cloned/snapshotted/copied, where lvm can't otherwise know which
one is correct.  And the subject of this email is an advantage,
eliminating the problems of multipath/md component detection.

But, I'd say the primary advantage of system.devices is preventing
unexpected/accidental use of PVs that are attached to a system, but not
meant to be used by the system.  It seems more common these days for a LUN
to be visible to a host that should not be used by the host.  This happens
frequently with LUNs passed to VM's, in which case the host should not be
seeing or using that LUN.  In the worst case, the host may actually
autoactivate LVs from a LUN that belongs to a VM, which is also activating
and using those LVs.

> > if external_device_info_source=udev did what the name says, and a new
> > mode ("external_device_info_source=hybrid", say) was introduced for the
> > current behavior.
> 
> Yes, hybird is more suitable option value. Obviously, the current mpio filter
> behavior is not compatible with the previous one. the udev is not enough
> to describe.

As I mentioned in the previous mail, external_device_info_source does not
only apply to multipath, so it's not quite so simple.  I'm pretty sure
that a new setting will be necessary, not just a new value, and perhaps
multipath_wwids_file will work for that already?

Dave

