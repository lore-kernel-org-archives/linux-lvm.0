Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6A05812F
	for <linux-lvm@lists.linux.dev>; Tue, 21 Nov 2023 17:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f6bxkW5x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700589398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kcSPf2h7EzO9DdFnoLEZOWjY07z5beyULT1O9uUUae0=;
	b=f6bxkW5xxaOSN08zuuNt9l0rAjlU1xcNqqUqkWogP1FdU5TVYlp0fcRme8bRGsmG1Lf9fO
	RCyu4y9c1Ar1sTl8vcusyx9XBWHYMvtlGK6kXgZ7dYTpInAfJAML+p08qTHYiHbGFpUC1F
	hCLf+epISjhDYMKbHr6JK7p9cOnUQgo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-a7XPbI13PgKTpNvtiz0XWQ-1; Tue, 21 Nov 2023 12:56:35 -0500
X-MC-Unique: a7XPbI13PgKTpNvtiz0XWQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1738B8007B3;
	Tue, 21 Nov 2023 17:56:35 +0000 (UTC)
Received: from redhat.com (unknown [10.22.33.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 96117492BE0;
	Tue, 21 Nov 2023 17:56:34 +0000 (UTC)
Date: Tue, 21 Nov 2023 11:56:33 -0600
From: David Teigland <teigland@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Cc: Heming Zhao <heming.zhao@suse.com>,
	"zkabelac@redhat.com" <zkabelac@redhat.com>,
	"bmarzins@redhat.com" <bmarzins@redhat.com>,
	"linux-lvm@lists.linux.dev" <linux-lvm@lists.linux.dev>,
	Glass Su <glass.su@suse.com>, "hare@suse.de" <hare@suse.de>
Subject: Re: discuss about commit 3b0f9ce: filter-mpath: get wwids from sysfs
 vpd_pg83
Message-ID: <ZVzvUR-_zSTC4sOk@redhat.com>
References: <74b83545-abe7-432c-ae19-814b289a6ff0@suse.com>
 <6c7699678ceebca58c56aaa769c2a7b9a6092883.camel@suse.com>
 <5a9061d0f7e287993b127641cc11d7a15d442803.camel@suse.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <5a9061d0f7e287993b127641cc11d7a15d442803.camel@suse.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> PS: Here's a related remark about 17a3585 ("pvscan: use alternate
> device names from DEVLINKS to check filter"). I can see why this was
> necessary, but I don't understand why this is found to be necessary
> _now_; the same issue should have always existed if "pvscan" is running
> during a "change" event for any given device. The solution of 17a3585
> "worked" for us, but it looks only semi-ok to me. Other udev rules may
> modify the DEVLINKS list after pvscan had been running. A correct
> solution must make sure that pvscan runs after all udev rules. IOW,
> pvscan should be triggered in a udev RUN= statement rather then
> IMPORT=. This would probably require a new systemd service, because
> it's not just "pvscan" alone. But the result would be more robust
> then what we currently have.

To be sure we're talking about the same new udev rule, the context is
69-dm-lvm.rules, which does IMPORT from:

  pvscan --cache --listvg --checkcomplete --vgonline \
         --autoactivation event --udevoutput --journal=output /dev/foo

That pvscan prints LVM_VG_NAME_COMPLETE='vgname', which is then passed to
the actual activation command, executed through systemd-run:

  vgchange -aay --autoactivation event $LVM_VG_NAME_COMPLETE

In our environments, this new autoactivation method coincides with default
system.devices.  So, we don't usually see this autoactivation method
combined with the regex filter, and commit 17a3585 doesn't come into play.
However, when the devices file is disabled and users have regex filters
containing /dev/disk/ symlinks, then commit 17a3585 is necessary.
(Avoiding this difficulty is another advantage of system.devices.)

As for the udev rule specifics, the RUN vs IMPORT discussion occured
previously here:
https://listman.redhat.com/archives/linux-lvm/2021-October/026001.html

The answer was that RUN doesn't allow pvscan to provide vgname
(LVM_VG_NAME_COMPLETE) to vgchange.

Dave

