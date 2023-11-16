Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599094643C
	for <linux-lvm@lists.linux.dev>; Thu, 16 Nov 2023 20:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HlqFNZup"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700166131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j003SyIphhJP9nbra0SdMVntB3O0Wxx0xu/fxF2RiRY=;
	b=HlqFNZup01On6cppFEvSj4mnh3tVSdgHX+K8fEWd9GSsBvLuPxsX2Grkk8UZkKJMqDbMsQ
	4xIWGZsrorr2acL0bF1BfypVPakViCaUD5qzclR4FgzsxLtFt1zyeZfI8ztrpwKenGPJ+S
	JUzGMjhB0uBbyzSZ/31jPe367LK530g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-437-GdFjE80gMpCqLBFTItpDWw-1; Thu, 16 Nov 2023 15:22:07 -0500
X-MC-Unique: GdFjE80gMpCqLBFTItpDWw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33FE5814088;
	Thu, 16 Nov 2023 20:22:07 +0000 (UTC)
Received: from bmarzins-01.fast.rdu2.eng.redhat.com (bmarzins-01.fast.rdu2.eng.redhat.com [10.6.23.12])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2689F2026D4C;
	Thu, 16 Nov 2023 20:22:07 +0000 (UTC)
Received: from bmarzins-01.fast.rdu2.eng.redhat.com (localhost [127.0.0.1])
	by bmarzins-01.fast.rdu2.eng.redhat.com (8.17.1/8.17.1) with ESMTPS id 3AGKM6wH162485
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Nov 2023 15:22:06 -0500
Received: (from bmarzins@localhost)
	by bmarzins-01.fast.rdu2.eng.redhat.com (8.17.1/8.17.1/Submit) id 3AGKM61A162484;
	Thu, 16 Nov 2023 15:22:06 -0500
Date: Thu, 16 Nov 2023 15:22:06 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: David Teigland <teigland@redhat.com>
Cc: Martin Wilck <martin.wilck@suse.com>, Heming Zhao <heming.zhao@suse.com>,
        "zkabelac@redhat.com" <zkabelac@redhat.com>,
        Glass Su <glass.su@suse.com>,
        "linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>,
        "hare@suse.de" <hare@suse.de>,
        "prajnoha@redhat.com" <prajnoha@redhat.com>
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Message-ID: <ZVZ57lD8uS+Ye/Vo@bmarzins-01.fast.rdu2.eng.redhat.com>
References: <6c7699678ceebca58c56aaa769c2a7b9a6092883.camel@suse.com>
 <23d98f61-f9e1-494a-be3c-df9531f4f70b@redhat.com>
 <ZVJtCxq7XeCg_G-g@redhat.com>
 <0bad121644deb8bf67329f111f0ba34ea261e988.camel@suse.com>
 <ZVOnoCjNmOYToBpt@redhat.com>
 <38458148cb14bf398aa3c6912842ddda79b81115.camel@suse.com>
 <84c0588a5b6a8142459a482c25f82bc6d15b19c3.camel@suse.com>
 <ZVPgawjni9m6vYd9@redhat.com>
 <b98eec68190ca5f615cceb041a3a7b9b3f0bebb8.camel@suse.com>
 <ZVZEq6iOhZnZy4yp@redhat.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZVZEq6iOhZnZy4yp@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 16, 2023 at 10:34:51AM -0600, David Teigland wrote:
> On Wed, Nov 15, 2023 at 07:35:49AM +0000, Martin Wilck wrote:
> > How would that addition of the multipath device come to pass?
> > By someone explicitly calling "lvmdevices" on it?
> 
> Yes, by running lvmdevices --adddev /dev/mapper/mpatha, or by running
> lvmdevices --update, which replaces a componenet device with the multipath
> device.
> 
> > 1 - someone creates a PV on a normal single-path SCSI device
> > 2 - on subsequent boot, a new path has been added (e.g. by a Fibre
> > Channel zoning change)
> > 3 - what happens before the user makes any change to system.devices?
> >     a) LVM attempts to add one of the SCSI (path) devices as PV
> >        (which might be grabbed by multipathd already)
> >     b) LVM attempts to add the multipath device automatically,
> >        somehow figuring out what happened
> >     c) neither is attempted, and the PV is missing
> 
> If a scsi device suddenly becomes a multipath component, then C.  The
> component device is ignored, the PV is missing, and lvm prints:
> 
>   WARNING: devices file is missing /dev/mapper/mpatha (253:1) using multipath component /dev/sda.
>   See lvmdevices --update for devices file update.
> 
> https://sourceware.org/git/?p=lvm2.git;a=blob;f=lib/filters/filter-mpath.c;h=854c26a7c7284c9e566dbd89ea899e554a1c8ed9;hb=HEAD#l37
> 
> Maybe there's something better we could do there.

I'm assuming the reality might be different depending on the multipath's
find_multipaths setting. The only values where multipath's behavior can
change depending on the number of paths present are "yes" and "smart".
If "smart" is set, then everything may turn out as you say, but the only
user of find_multipaths "smart" that I know of is the Anaconda installer
for RHEL and Fedora. If find_multipaths is set to "yes", then initially,
multipath won't claim the device, and LVM may well end up trying to use
it and racing with multipathd (possibility A from above).

This is pretty unavoidable if you want multipath to automatically claim
devices only once multiple paths have appeared.

-Ben

> Dave

