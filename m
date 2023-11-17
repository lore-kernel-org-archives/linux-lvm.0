Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7343716A
	for <linux-lvm@lists.linux.dev>; Fri, 17 Nov 2023 15:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MAyI/D09"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700234757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bekVMvA8ZmEBX6+BkWTdMygURqZ4BwFcYoUd3F3l1DE=;
	b=MAyI/D09a+/GYQCI7rZrMxtJPYTEhTLBNTO4L70jfQj9k/lczWbAKER4flHxKW+sbPqgwj
	0Gw9kbsR5d4gborWwHP593VxjWnRKK/IWYsIn+8C811Nln7Q9BiRJUYHSrX2vfuB91AT2D
	qwyo9WKYWqEcgzGzOvS4naVl7V2re5A=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-619-pF7NKdPyNC2Pt8QgTynwHA-1; Fri,
 17 Nov 2023 10:25:52 -0500
X-MC-Unique: pF7NKdPyNC2Pt8QgTynwHA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 787F91C06ED7;
	Fri, 17 Nov 2023 15:25:52 +0000 (UTC)
Received: from redhat.com (unknown [10.22.33.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D8EB61121307;
	Fri, 17 Nov 2023 15:25:51 +0000 (UTC)
Date: Fri, 17 Nov 2023 09:25:50 -0600
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
Message-ID: <ZVeF_vUYxaRLLJbv@redhat.com>
References: <6c7699678ceebca58c56aaa769c2a7b9a6092883.camel@suse.com>
 <23d98f61-f9e1-494a-be3c-df9531f4f70b@redhat.com>
 <ZVJtCxq7XeCg_G-g@redhat.com>
 <177c4b2f-3b4b-44e0-9391-3df007cafe36@redhat.com>
 <ZVOgmGx-EIpMF54F@redhat.com>
 <194d20b7-e3b0-43d6-95e1-1a7d56eab506@redhat.com>
 <037a0ba9-76fc-469c-ac96-11981391903b@suse.com>
 <ZVUYAJyEe5fNh4SN@redhat.com>
 <e64bbbc8-1716-4739-a68c-2f92563a9c8d@redhat.com>
 <ZVbGObxAvSsYqvvo@itl-email>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZVbGObxAvSsYqvvo@itl-email>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Nov 16, 2023 at 08:47:22PM -0500, Demi Marie Obenour wrote:
> > > commit 6c22392a3f903d6c086f7cc94978bdf8b072da6e
> > > Author: David Teigland <teigland@redhat.com>
> > > Date:   Tue Mar 16 09:52:13 2021 -0500
> > > 
> > >      config: change default use_devicesfile to 1
> > > 
> > > diff --git a/lib/config/defaults.h b/lib/config/defaults.h
> > > index 66eece53aa33..a7a2a06df654 100644
> > > --- a/lib/config/defaults.h
> > > +++ b/lib/config/defaults.h
> > > @@ -322,7 +322,7 @@
> > >   #define DEFAULT_MD_COMPONENT_CHECKS "auto"
> > > -#define DEFAULT_USE_DEVICES_FILE 0
> > > +#define DEFAULT_USE_DEVICES_FILE 1
> > >   #define DEFAULT_DEVICES_FILE "system.devices"
> > > 
> > > 
> > > Later commits that removed DEFAULT_USE_DEVICES_FILE, and tried to replace
> > > it with a configure option, was a failed attempt at building that lvm
> > > source for RHEL8.  It's caused no end of problems and I plan to revert it
> > > and restore define DEFAULT_USE_DEVICES_FILE 1.
> > 
> > 
> > There is no problem with configuring DEFAULT_USE_DEVICES_FILE with
> > 'configure --with-default-use-devices-file= 0/1' and thus no need to change
> > anything here.
> > 
> > Current upstream has set this default value as 0  (in configure.ac)
> > 
> > RHEL builds use this setting as 1.  (Possibly even Fedora nowadays).
> > 
> > The major problem with turning this  to 1 is the distribution must be
> > 'ready' with such relatively invasive change as it changes also requirements
> > on how the boot image is created  (devicesfile must be copied to ramdisk).
> > 
> > So Suse  may try to set this setting  to 1  and see what all breaks.
> > 
> > 
> > Zdenek
> 
> Does this mean that distributions *should* set this to 1 and update
> their installers?

Yes, the devices file is intended to be a default feature of lvm since the
commit above.

> This would have saved Qubes OS a security bulletin (LVM was scanning
> VM-controlled block devices) and might make LVM faster (since it would
> no longer need to scan every device on the system).

These are both advantages of using it.

Dave

