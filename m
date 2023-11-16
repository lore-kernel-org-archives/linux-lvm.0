Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A213D4314F
	for <linux-lvm@lists.linux.dev>; Thu, 16 Nov 2023 16:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eGsi9Uwx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700152497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PWdMxgsEAsHtnnJbbei9+JEG3JqeggrwQe00xwkoKCw=;
	b=eGsi9Uwx3bQFZVY+FZOwFXHzccw/6xZZGjNCKl9FXNgw9iC8OOoD8g+nYyMmwXk+h1LoYy
	EP9CjlcrcJ9XXH0sj7VV3HS1/zxFLUX1bILOEgN199ANM1NqXhUzEBPQZp7c6IhQ8HBn/Q
	kbj4rC5rODRuIJ2Zmhq6kTchqJHK3jo=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-649-JNGE_URzPcqqtkU7sJ_ZnA-1; Thu,
 16 Nov 2023 11:34:54 -0500
X-MC-Unique: JNGE_URzPcqqtkU7sJ_ZnA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BEBB31C07580;
	Thu, 16 Nov 2023 16:34:53 +0000 (UTC)
Received: from redhat.com (unknown [10.22.33.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 449CB2166B27;
	Thu, 16 Nov 2023 16:34:53 +0000 (UTC)
Date: Thu, 16 Nov 2023 10:34:51 -0600
From: David Teigland <teigland@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Cc: Heming Zhao <heming.zhao@suse.com>,
	"zkabelac@redhat.com" <zkabelac@redhat.com>,
	Glass Su <glass.su@suse.com>,
	"linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>,
	"hare@suse.de" <hare@suse.de>,
	"bmarzins@redhat.com" <bmarzins@redhat.com>,
	"prajnoha@redhat.com" <prajnoha@redhat.com>
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Message-ID: <ZVZEq6iOhZnZy4yp@redhat.com>
References: <74b83545-abe7-432c-ae19-814b289a6ff0@suse.com>
 <6c7699678ceebca58c56aaa769c2a7b9a6092883.camel@suse.com>
 <23d98f61-f9e1-494a-be3c-df9531f4f70b@redhat.com>
 <ZVJtCxq7XeCg_G-g@redhat.com>
 <0bad121644deb8bf67329f111f0ba34ea261e988.camel@suse.com>
 <ZVOnoCjNmOYToBpt@redhat.com>
 <38458148cb14bf398aa3c6912842ddda79b81115.camel@suse.com>
 <84c0588a5b6a8142459a482c25f82bc6d15b19c3.camel@suse.com>
 <ZVPgawjni9m6vYd9@redhat.com>
 <b98eec68190ca5f615cceb041a3a7b9b3f0bebb8.camel@suse.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <b98eec68190ca5f615cceb041a3a7b9b3f0bebb8.camel@suse.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 15, 2023 at 07:35:49AM +0000, Martin Wilck wrote:
> How would that addition of the multipath device come to pass?
> By someone explicitly calling "lvmdevices" on it?

Yes, by running lvmdevices --adddev /dev/mapper/mpatha, or by running
lvmdevices --update, which replaces a componenet device with the multipath
device.

> 1 - someone creates a PV on a normal single-path SCSI device
> 2 - on subsequent boot, a new path has been added (e.g. by a Fibre
> Channel zoning change)
> 3 - what happens before the user makes any change to system.devices?
>     a) LVM attempts to add one of the SCSI (path) devices as PV
>        (which might be grabbed by multipathd already)
>     b) LVM attempts to add the multipath device automatically,
>        somehow figuring out what happened
>     c) neither is attempted, and the PV is missing

If a scsi device suddenly becomes a multipath component, then C.  The
component device is ignored, the PV is missing, and lvm prints:

  WARNING: devices file is missing /dev/mapper/mpatha (253:1) using multipath component /dev/sda.
  See lvmdevices --update for devices file update.

https://sourceware.org/git/?p=lvm2.git;a=blob;f=lib/filters/filter-mpath.c;h=854c26a7c7284c9e566dbd89ea899e554a1c8ed9;hb=HEAD#l37

Maybe there's something better we could do there.
Dave

