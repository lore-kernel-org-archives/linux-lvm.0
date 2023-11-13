Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3753322F09
	for <linux-lvm@lists.linux.dev>; Mon, 13 Nov 2023 18:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jDkMb+wD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699900690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xVjZN84Pyh1xsfg8WROg8MdD2dDh7PFDNmMdsoEv0n4=;
	b=jDkMb+wDT1K78LhY+5eATTkaHTNUBLVIg/3JOAMumRQu2Y+LvTrX/YmA+GiX6uGqcKN4vV
	dNbIoXogPY+Q0iokYW7MNAg0CMYycTeMSn2hMQJ/6708QdvRfEslo/w6nYu3wMCB0KU0U5
	7qC2+zl5iBzV7PL+xjLxu5lBeAOkRMA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-64-mn04CFk7PoO5-4MN1WBV7w-1; Mon,
 13 Nov 2023 13:38:05 -0500
X-MC-Unique: mn04CFk7PoO5-4MN1WBV7w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76D0029AA2CB;
	Mon, 13 Nov 2023 18:38:05 +0000 (UTC)
Received: from redhat.com (unknown [10.22.33.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EFAD15031;
	Mon, 13 Nov 2023 18:38:04 +0000 (UTC)
Date: Mon, 13 Nov 2023 12:38:03 -0600
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
Message-ID: <ZVJtCxq7XeCg_G-g@redhat.com>
References: <74b83545-abe7-432c-ae19-814b289a6ff0@suse.com>
 <6c7699678ceebca58c56aaa769c2a7b9a6092883.camel@suse.com>
 <23d98f61-f9e1-494a-be3c-df9531f4f70b@redhat.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <23d98f61-f9e1-494a-be3c-df9531f4f70b@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 13, 2023 at 02:52:39PM +0100, Peter Rajnoha wrote:
> On 11/13/23 12:52, Martin Wilck wrote:
> > I can't stress enough that this is *the only mechanism* that works
> > correctly. udev serves as central hub to retrieve device properties
> > from, and this is how it ought to be.
> 
> Indeed, that was exactly one of the primary reasons the
> 'external_device_info_source="udev"' was added. Reimplementing other
> subsystem's logic is wrong because there's always some intrinsic logic
> there that may be omitted. Sooner or later, such approach will fail.
> 
> I agree with you here.
> 
> If not sharing information through udev due to various kinds of hatred
> about this part of the system, then alternatively, at least, calling a
> multipath library function from LVM to do the job.

Hi, a number of things haven't been mentioned or noticed:

- In general, it's old versions of lvm that we're discussing here.
Current lvm uses system.devices by default, where none of this is
relevant.  We can just turn off a number of filters when system.devices is
in use, including filter-mpath and filter-md.  It may still be interesting
to look at improvements, but the context for that is older stable,
released versions.

- In RHEL8 (no system.devices by default, and some older systemd/udev),
lvm can't touch udev without causing timeouts booting with many devices.
Nothing I tried apart from reading wwids would help.  Boot timeouts were a
big support burden, and the motivation for the changes.  (All of this
added motivation for system.devices.)

- I tried many things before reading wwids, including asking for a
multipath lib API for reading the wwids.  The provided API that I tried
also used udev, so it was no better.  I'd still prefer to use an API to
check a wwid and avoid reading /etc/multipath/wwids directly.  Reading
wwids looked like the least worst practical solution.  I consider it a
temporary hack/workaround until system.devices eliminates the issue.

- When making the changes to avoid udev by default, I made a subtle change
to the meaning of external_device_info_source=udev.  I made that info
supplementary to the native info rather than an alternative to the native
info.  The idea was: why not use all the info we have available?  However,
for filter-mpath, the supplementary approach will be a problem if reading
wwids gives a false positive.

- To make filter-mpath use udev info, and prevent lvm from using wwids,
you can set external_device_info_source=udev and multipath_wwids_file="".
I think this will be an effective way to avoid any false positive
problems from native detection.

Dave

